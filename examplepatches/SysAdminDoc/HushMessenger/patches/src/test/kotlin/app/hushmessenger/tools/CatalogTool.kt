package app.hushmessenger.tools

import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.loadPatchesFromJar
import java.io.File
import java.io.StringReader
import java.security.MessageDigest
import java.util.Properties
import java.util.jar.JarFile
import javax.xml.parsers.DocumentBuilderFactory
import kotlinx.serialization.json.*
import org.w3c.dom.Element
import org.xml.sax.InputSource

/** Local tooling only. This class is excluded from the distributed bundle. */
object CatalogTool {
    private const val CONTROL_KEYS = 28

    private fun dependency(patch: Patch<*>, ancestors: Set<Patch<*>> = emptySet()): JsonObject {
        require(patch !in ancestors) { "Cyclic patch dependency" }
        require(!patch.name.isNullOrBlank() || !patch.description.isNullOrBlank()) {
            "Hidden dependencies need stable descriptions for the public catalog"
        }
        return JsonObject(linkedMapOf(
            "type" to JsonPrimitive(patch.javaClass.simpleName),
            "name" to JsonPrimitive(patch.name),
            "description" to JsonPrimitive(patch.description),
            "dependencies" to JsonArray(patch.dependencies.map { dependency(it, ancestors + patch) }.sortedBy { it.toString() }),
        ))
    }

    fun catalog(version: String, patches: Set<Patch<*>>): JsonObject = JsonObject(linkedMapOf(
        "NOTE" to JsonPrimitive("Generated locally from the built MPP with :patches:generatePatchCatalog. Do not edit by hand."),
        "version" to JsonPrimitive(version),
        "patches" to JsonArray(patches.sortedBy { it.name }.map { patch ->
            require(patch.name != null && patch.options.isEmpty()) { "Unnamed patches or options need explicit catalog support" }
            JsonObject(linkedMapOf(
                "name" to JsonPrimitive(patch.name),
                "description" to JsonPrimitive(patch.description),
                "default" to JsonPrimitive(patch.default),
                "category" to JsonPrimitive(patch.category),
                "dependencies" to JsonArray(patch.dependencies.map { dependency(it) }.sortedBy { it.toString() }),
                "compatiblePackages" to (patch.compatibility?.let { compatible -> JsonArray(compatible.map { app ->
                    JsonObject(linkedMapOf(
                        "packageName" to JsonPrimitive(app.packageName),
                        "name" to JsonPrimitive(app.name),
                        "description" to JsonPrimitive(app.description),
                        "apkFileType" to JsonPrimitive(app.apkFileType?.name),
                        "appIconColor" to JsonPrimitive(app.appIconColor?.let { "#%06X".format(it) }),
                        "signatures" to (app.signatures?.let { JsonArray(it.sorted().map(::JsonPrimitive)) } ?: JsonNull),
                        "targets" to JsonArray(app.targets.map { target -> JsonObject(linkedMapOf(
                            "version" to JsonPrimitive(target.version),
                            "versionCodes" to (target.versionCodes?.let { codes ->
                                JsonObject(codes.entries.sortedBy { it.key.name }.associate { it.key.name to JsonPrimitive(it.value) })
                            } ?: JsonNull),
                            "isExperimental" to JsonPrimitive(target.isExperimental),
                            "minSdk" to JsonPrimitive(target.minSdk),
                            "description" to JsonPrimitive(target.description),
                        )) }),
                    ))
                }) } ?: JsonNull),
                "options" to JsonArray(emptyList()),
            ))
        }),
    ))

    fun validateDefinitions(patchSource: String, uiSource: String, manifest: String, names: Set<String>) {
        val declarations = (Regex("""controlPatch\("([a-z_]+)",\s*"([^"]+)"""").findAll(patchSource)
            .map { it.groupValues[1] to it.groupValues[2] } +
            // Standalone patches that use recordControl directly instead of controlPatch:
            sequenceOf("material_you" to "Material You theme", "anonymous_stories" to "View stories anonymously",
                "save_stories" to "Save any story")).toList()
        val uiKeys = Regex("""^\s*\{"([a-z_]+)",""", RegexOption.MULTILINE).findAll(uiSource)
            .map { it.groupValues[1] }.toList()
        val factory = DocumentBuilderFactory.newInstance().apply {
            setFeature("http://apache.org/xml/features/disallow-doctype-decl", true)
        }
        val nodes = factory.newDocumentBuilder().parse(InputSource(StringReader(manifest))).getElementsByTagName("meta-data")
        val manifestKeys = (0 until nodes.length).map { nodes.item(it) as Element }
            .filter { it.getAttribute("android:name").startsWith("hush.feature.") }.map {
                require(it.getAttribute("android:value") == "true") { "Feature declarations must be true" }
                it.getAttribute("android:name").removePrefix("hush.feature.")
            }
        val keys = declarations.map { it.first }
        require(keys.size == CONTROL_KEYS && keys.distinct().size == keys.size) { "Expected $CONTROL_KEYS distinct patch control keys" }
        require(uiKeys.size == keys.size && uiKeys.toSet() == keys.toSet()) { "Extension control keys differ from patches" }
        require(manifestKeys.size == keys.size && manifestKeys.toSet() == keys.toSet()) { "Manifest capabilities differ from patches" }
        require(declarations.map { it.second }.toSet().size == CONTROL_KEYS &&
            names == declarations.map { it.second }.toSet() + "Install beside Meta apps" + "Open settings from menu" + "Restore screens on re-signed builds") { "Built patch names differ from control declarations" }
    }

    @JvmStatic fun main(args: Array<String>) {
        require(args.size == 3 && args[0] in setOf("generate", "check")) { "Expected generate|check, MPP path and repository root" }
        require(runCatching { Class.forName("app.hushmessenger.patches.MessengerTarget") }.isFailure) {
            "Loose patch classes are on the tool classpath; refusing to bypass the built MPP"
        }
        val bundle = File(args[1])
        val root = File(args[2])
        val properties = Properties().apply { root.resolve("gradle.properties").reader().use(::load) }
        val version = JarFile(bundle).use { jar ->
            require(jar.getEntry("classes.dex") != null && jar.getEntry("extensions/messenger.mpe") != null) { "Incomplete Android bundle" }
            jar.manifest.mainAttributes.getValue("Version")
        }
        require(version == properties.getProperty("version")) { "Bundle version differs from source" }
        val patches = loadPatchesFromJar(setOf(bundle))
        val patchNames = patches.map { requireNotNull(it.name) }.toSet()
        require(patches.size == 31 && patchNames.size == 31) { "Expected 31 distinct visible patches but found ${patches.size} (names: ${patchNames.joinToString()})" }
        validateDefinitions(
            root.resolve("patches/src/main/kotlin/app/hushmessenger/patches/controls/MessengerControlsPatch.kt").readText(),
            root.resolve("extensions/messenger/src/main/java/app/hushmessenger/extension/SettingsActivity.java").readText(),
            root.resolve("extensions/messenger/src/main/AndroidManifest.xml").readText(), patchNames,
        )
        val document = catalog(version, patches)
        val output = Json { prettyPrint = true }.encodeToString(JsonObject.serializer(), document) + "\n"
        val report = root.resolve("patches/build/reports/catalog-evidence.json")
        report.parentFile.mkdirs()
        val digest = MessageDigest.getInstance("SHA-256").digest(bundle.readBytes()).joinToString("") { "%02x".format(it) }
        report.writeText(JsonObject(linkedMapOf("bundle" to JsonPrimitive(bundle.name), "sha256" to JsonPrimitive(digest), "catalog" to document)).toString() + "\n")
        val published = root.resolve("patches-list.json")
        if (args[0] == "generate") published.writeText(output)
        else require(published.isFile && Json.parseToJsonElement(published.readText()) == document) {
            "Public catalog differs from the built MPP; run :patches:generatePatchCatalog"
        }
        println("Catalog ${args[0]} passed: ${patches.size} patches, $CONTROL_KEYS control keys, built bundle $version")
    }
}
