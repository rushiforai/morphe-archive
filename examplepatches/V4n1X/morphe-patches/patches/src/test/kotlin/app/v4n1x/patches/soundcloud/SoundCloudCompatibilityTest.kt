package app.v4n1x.patches.soundcloud

import app.morphe.patcher.Patcher
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.loadPatchesFromJar
import app.v4n1x.patches.soundcloud.premium.verifyFeatureConstructor
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction11n
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import kotlinx.coroutines.flow.collect
import kotlinx.coroutines.runBlocking
import org.w3c.dom.Element
import java.io.File
import java.util.zip.ZipFile
import javax.xml.parsers.DocumentBuilderFactory

private val names = linkedMapOf(
    "analytics" to "Disable analytics",
    "consent" to "Disable consent popup",
    "premium" to "Enable SoundCloud Go+",
    "amoled" to "AMOLED dark theme",
    "monet" to "Material You dynamic theme",
)

fun main(args: Array<String>) = runBlocking {
    val input = File(args[0])
    val selection = args[1]
    check(input.isFile)
    val output = File("patches/build/soundcloud-compatibility/$selection").apply { mkdirs() }
    val apk = if (input.extension.equals("apkm", true)) {
        File(output, "base.apk").also { base ->
            ZipFile(input).use { archive ->
                archive.getInputStream(checkNotNull(archive.getEntry("base.apk"))).use { stream ->
                    base.outputStream().use { stream.copyTo(it) }
                }
            }
        }
    } else input
    val requested = when (selection) {
        "all" -> names.values.toSet()
        "default" -> names.filterKeys { it in setOf("analytics", "consent", "premium") }.values.toSet()
        else -> setOf(checkNotNull(names[selection]) { "Unknown SoundCloud patch selection: $selection" })
    }
    val bundle = File(checkNotNull(System.getProperty("soundcloudPatchBundle")))
    val patches = loadPatchesFromJar(setOf(bundle)).filter { it.name in requested }.toSet()
    check(patches.map { it.name }.toSet() == requested)
    Patcher(PatcherConfig(apkFile = apk, temporaryFilesPath = File(output, "temporary"))).use { patcher ->
        patcher += patches
        val metadata = patcher.context.packageMetadata
        check(metadata.packageName == "com.soundcloud.android")
        check(mapOf("2026.08.26-release" to "369070", "2026.09.23-release" to "374050")[metadata.versionName] == metadata.versionCode)
        patcher().collect { result ->
            check(result.exception == null) { "${result.patch.name} failed: ${result.exception}" }
            println("Executed: ${result.patch.name}")
        }
        val resourceRoot = File(output, "temporary/apk/resources")
        val decoded = resourceRoot.listFiles()?.singleOrNull { it.isDirectory }
            ?: File(output, "temporary/apk")
        if ("Disable consent popup" in requested) {
            val root = xml(File(decoded, "res/layout/fragment_ot_banner.xml"))
            check(root.getAttribute("android:layout_width") == "0dp")
            check(root.getAttribute("android:layout_height") == "0dp")
            check(root.getAttribute("android:visibility") == "gone")
        }
        if ("AMOLED dark theme" in requested) {
            val colors = xml(File(decoded, "res/values/colors.xml"))
            listOf("dark_mode_surface", "design_dark_default_color_background", "design_dark_default_color_surface").forEach {
                check(value(colors, "color", it) == "@color/blackOT") { "AMOLED color not patched: $it" }
            }
            listOf("black", "dialog_dark").forEach { check(value(colors, "color", it) == "#000000") }
            val footer = xml(File(decoded, "res/drawable/bth_footer_shape.xml"))
            check(footer.getElementsByTagName("gradient").length == 0)
            val solids = footer.getElementsByTagName("solid")
            check(solids.length >= 2)
            (0 until solids.length).forEach { check((solids.item(it) as Element).getAttribute("android:color") == "@color/blackOT") }
        }
        if ("Material You dynamic theme" in requested) {
            val colors = xml(File(decoded, "res/values-v31/colors.xml"))
            mapOf("shared_colors_special_action" to "@android:color/system_accent1_500", "progressBelow" to "@android:color/system_accent1_200",
                "dark_mode_link" to "@android:color/system_accent1_400", "light_mode_link" to "@android:color/system_accent1_600").forEach { (name, color) ->
                check(value(colors, "color", name) == color) { "Material You color not patched: $name" }
            }
            check(value(xml(File(decoded, "res/values/colors.xml")), "color", "soundcloud_orange") == "@color/shared_colors_special_action")
            val styles = xml(File(decoded, "res/values/styles.xml"))
            check(value(styles, "item", "progressAbove") == "@color/shared_colors_special_action")
            check(value(styles, "item", "progressBelow") == "@color/progressBelow")
        }
        val result = patcher.get()
        if (requested.any { it in setOf("Disable consent popup", "AMOLED dark theme", "Material You dynamic theme") }) {
            check(checkNotNull(result.resources.resourcesApk).isFile) { "Rebuilt resources missing." }
        }
        val classes = checkNotNull(result.dexFiles).flatMap { dex ->
            val file = File(output, dex.name)
            dex.stream.use { stream -> file.outputStream().use { stream.copyTo(it) } }
            file.inputStream().buffered().use { DexBackedDexFile.fromInputStream(Opcodes.getDefault(), it).classes.toList() }
        }.associateBy { it.type }
        fun clazz(type: String) = checkNotNull(classes[type]) { "Expected modified class missing: $type (silent no-op?)" }
        if ("Disable analytics" in requested) {
            val method = clazz("Lcom/soundcloud/android/analytics/base/TrackingHandler;").methods.single { it.name == "handleMessage" }
            check(method.implementation!!.instructions.first().opcode == Opcode.RETURN_VOID)
        }
        if ("Disable consent popup" in requested) {
            val provider = clazz("Lcom/soundcloud/android/privacy/consent/main/PrivacyConsentControllerModule\$Companion;")
                .methods.single { it.name == "a" && it.parameterTypes == listOf("Lcom/soundcloud/android/privacy/legislation/LegislationOperations;", "Ldagger/Lazy;") }
            val instructions = provider.implementation!!.instructions.toList()
            check(instructions[0].opcode == Opcode.SGET_OBJECT && instructions[1].opcode == Opcode.RETURN_OBJECT)
            val field = (instructions[0] as ReferenceInstruction).reference as FieldReference
            check(field.definingClass == "Lcom/soundcloud/android/privacy/consent/base/NoopPrivacyConsentController;" && field.type == field.definingClass)
        }
        if ("AMOLED dark theme" in requested) {
            val bottomBar = clazz("Lcom/soundcloud/android/ui/components/navigations/BottomTabBarRestyle;")
                .methods.single { it.name == "<init>" && it.parameterTypes == listOf("Landroid/content/Context;", "Landroid/util/AttributeSet;", "I") }
            check(bottomBar.references().filterIsInstance<MethodReference>().any { it.name == "setBackgroundColor" })
            check(bottomBar.references().filterIsInstance<FieldReference>().any { it.definingClass == "Landroid/graphics/Color;" && it.name == "BLACK" })
        }
        if ("Enable SoundCloud Go+" in requested) {
            verifyFeatureConstructor(clazz("Lcom/soundcloud/android/configuration/plans/Feature;").methods.single {
                it.name == "<init>" && it.parameterTypes == listOf("Ljava/lang/String;", "Z", "Ljava/util/List;")
            })
            val plan = clazz("Lcom/soundcloud/android/configuration/plans/UserConsumerPlan;").methods.single {
                it.name == "<init>" && it.parameterTypes == listOf("Ljava/lang/String;", "Z", "Ljava/lang/String;", "Ljava/util/List;", "Ljava/lang/String;", "Ljava/lang/String;")
            }
            check(plan.references().filterIsInstance<StringReference>().map { it.string }.containsAll(listOf("high_tier", "go-plus", "SoundCloud Go+")))
            assertEarlyField(clazz("Lcom/soundcloud/android/configuration/data/ConfigurationSettingsStorage;"),
                "Lcom/soundcloud/android/configuration/plans/Tier;", "HIGH")
            assertEarlyField(clazz("Lcom/soundcloud/android/upsell/UpsellVisibilityController;"),
                "Lcom/soundcloud/android/upsell/UpsellType\$None;", "INSTANCE")
            val placements = clazz("Lcom/soundcloud/android/ads/display/data/config/AdPlacementConfiguration;").methods.filter { it.name == "<init>" }
            check(placements.isNotEmpty())
            placements.forEach { method ->
                val first = method.implementation!!.instructions.take(3).map { it as Instruction11n }
                check(first.all { it.opcode == Opcode.CONST_4 && it.narrowLiteral == 0 })
                val parameterStart = method.implementation!!.registerCount - method.parameterTypes.size - 1
                val offset = if (method.parameterTypes.firstOrNull() == "I") 1 else 0
                check(first.map { it.registerA } == listOf(1, 2, 3).map { parameterStart + offset + it })
            }
        }
        println("SoundCloud ${metadata.versionName} (${metadata.versionCode}), selection '$selection': patch execution, resource/DEX compilation and output checks passed.")
    }
}

private fun xml(file: File): Element = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(file).documentElement

private fun value(root: Element, tag: String, name: String): String {
    val nodes = root.getElementsByTagName(tag)
    return (0 until nodes.length).map { nodes.item(it) as Element }.first { it.getAttribute("name") == name }.textContent
}

private fun Method.references() = implementation!!.instructions.mapNotNull { (it as? ReferenceInstruction)?.reference }

private fun assertEarlyField(clazz: ClassDef, fieldClass: String, name: String) {
    check(clazz.methods.any { method ->
        val instructions = method.implementation?.instructions?.toList() ?: return@any false
        val field = (instructions.firstOrNull() as? ReferenceInstruction)?.reference as? FieldReference
        field?.definingClass == fieldClass && field.name == name && instructions[1].opcode == Opcode.RETURN_OBJECT
    }) { "Expected early field return missing: $fieldClass->$name" }
}
