package patches.deezer

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element
import patches.shared.relinkExtensionResourceIds

/** Same authenticated dynamic-page repository and support map as phone Home/Explore. */
internal fun useNativePhonePages2703(method: MutableMethod) {
    check(method.definingClass == "LIlIllIIlllIlIIll;" && method.name == "get" && method.returnType == "Ljava/lang/Object;")
    val replacements = mapOf(
        "/channels/automotive/auto-home" to "home",
        "/channels/automotive/auto-explore" to "explore-all",
    ).map { (source, page) ->
        method.instructions.indices.single { i ->
            ((method.instructions[i] as? ReferenceInstruction)?.reference as? StringReference)?.string == source
        } to page
    }
    replacements.forEach { (index, page) ->
        val register = (method.instructions[index] as OneRegisterInstruction).registerA
        method.replaceInstruction(index, "const-string v$register, \"$page\"")
    }
}

@Suppress("unused")
val deezerApi9Media = bytecodePatch(
    name = "Android Auto API 9 media surface",
    description = "Adds Deezer's templated car browser and player for compatible Android Auto hosts. " +
        "Uses the negotiated car API level, enabling API 9 styling only on API 9 hosts. " +
        "All compatible custom hosts are allowed; Deezer's real session and queue stay authoritative.",
    default = true,
) {
    compatibleWith(deezer)
    val linker = Api9Resources()
    val resources = resourcePatch {
        dependsOn(deezerBase)
        execute {
            linker.link(this)
            document("AndroidManifest.xml").use { doc ->
                val root = doc.documentElement
                val app = doc.getElementsByTagName("application").item(0) as Element
                fun androidElement(tag: String, vararg attrs: Pair<String, String>) = doc.createElement(tag).apply {
                    attrs.forEach { (key, value) -> setAttributeNS(AUTO_ANDROID, "android:$key", value) }
                }
                root.appendChild(androidElement("uses-permission", "name" to "androidx.car.app.MEDIA_TEMPLATES"))
                app.appendChild(androidElement("meta-data", "name" to "androidx.car.app.minCarApiLevel", "value" to "8"))
                app.appendChild(androidElement("meta-data", "name" to "androidx.car.app.theme",
                    "resource" to "@style/morphe_deezer_auto_DeezerCarTheme"))
                app.appendChild(androidElement("service", "name" to "nl.johninnl.deezer.auto.DeezerCarAppService", "exported" to "true").apply {
                    appendChild(doc.createElement("intent-filter").apply {
                        appendChild(androidElement("action", "name" to "androidx.car.app.CarAppService"))
                        appendChild(androidElement("action", "name" to "androidx.car.app.media.action.SHOW_MEDIA_PLAYBACK"))
                        appendChild(androidElement("category", "name" to "androidx.car.app.category.MEDIA"))
                    })
                })
                val queries = doc.getElementsByTagName("queries").item(0) ?: doc.createElement("queries").also(root::appendChild)
                val queried = queries.childNodes.let { children -> (0 until children.length).mapNotNull {
                    (children.item(it) as? Element)?.takeIf { node -> node.tagName == "package" }
                        ?.getAttributeNS(AUTO_ANDROID, "name")
                }.toMutableSet() }
                listOf("com.google.android.projection.gearhead", "com.google.android.apps.automotive.templates.host")
                    .filter { queried.add(it) }.forEach { queries.appendChild(androidElement("package", "name" to it)) }
                val metadata = doc.getElementsByTagName("meta-data")
                val descriptor = (0 until metadata.length).map { metadata.item(it) as Element }
                    .single { it.getAttributeNS(AUTO_ANDROID, "name") == "com.google.android.gms.car.application" }
                    .getAttributeNS(AUTO_ANDROID, "resource")
                check(descriptor.startsWith("@xml/")) { "Unsupported Deezer automotive descriptor" }
                document("res/xml/${descriptor.substringAfter('/')}.xml").use { auto ->
                    val uses = auto.getElementsByTagName("uses")
                    val supported = (0 until uses.length).map { (uses.item(it) as Element).getAttribute("name") }
                    check("media" in supported) { "Deezer classic media descriptor changed" }
                    if ("template" !in supported) auto.documentElement.appendChild(auto.createElement("uses").apply { setAttribute("name", "template") })
                }
            }
        }
    }

    val guard = bytecodePatch {
        dependsOn(deezerBase)
        execute {
            check(classDefByOrNull { it.type.startsWith("Landroidx/car/app/") || it.type.startsWith("Lnl/johninnl/deezer/auto/") } == null) {
                "Deezer already contains a Car App Library; refuse to replace existing classes"
            }
        }
    }
    dependsOn(deezerBase, deezerCustomAndroidAutoHosts, deezerQueueItemSelection, guard, resources)
    val extension by lazy { api9Extension() }
    extendWith(java.util.function.Supplier { extension.bytes.inputStream() })
    execute {
        useNativePhonePages2703(exact("LIlIllIIlllIlIIll;", "get", "Ljava/lang/Object;").method)
        // Only our separately packaged classes are relinked, never original app bytecode.
        relinkExtensionResourceIds(extension.types, linker.ids)
        // Native browser admission is supplied by the shared car-host dependency.
    }
}
