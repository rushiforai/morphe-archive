package app.template.patches.steamlink.identity

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.template.patches.shared.Constants.COMPATIBILITIES_STEAM_LINK_LEGACY
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction31c
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import org.w3c.dom.Element
import org.w3c.dom.NodeList
import java.io.File
import java.util.Locale

private fun NodeList.asSequence(): Sequence<org.w3c.dom.Node> = sequence {
    for (i in 0 until length) yield(item(i))
}

private val PACKAGE_NAME_REGEX = Regex("^[a-z]\\w*(\\.[a-z]\\w*)+$")
internal const val CHANGE_PACKAGE_IDS_XML_FALLBACK =
    """<?xml version="1.0" encoding="utf-8"?><resources/>"""

internal fun ensureChangePackageIdsXml(file: File) {
    if (file.exists()) return
    file.parentFile!!.mkdirs()
    file.writeText(CHANGE_PACKAGE_IDS_XML_FALLBACK)
}

private fun toPackageSuffixSegment(input: String): String {
    val normalized = input.lowercase(Locale.ROOT)
        .trim()
        .replace(Regex("\\s+"), "_")
        .replace(Regex("[^a-z0-9_]"), "_")
        .replace(Regex("_{2,}"), "_")
        .trim('_')
    return when {
        normalized.isEmpty() -> "gxr"
        normalized.first().isDigit() -> "x_$normalized"
        else -> normalized
    }
}

internal fun resolveRenamedPackage(original: String, selected: String): Pair<String, String?> {
    val useExplicitPackageName = selected != "Default" && selected.matches(PACKAGE_NAME_REGEX)
    val suffixInput = if (!useExplicitPackageName && selected != "Default") selected.trim() else null
    val newName = when {
        selected == "Default" -> "$original.gxr"
        useExplicitPackageName -> selected
        else -> "$original.${toPackageSuffixSegment(selected)}"
    }
    if (newName == original) throw PatchException("New package name equals original: $original")
    return newName to suffixInput
}

private fun Element.isLauncherActivity(): Boolean {
    val filters = getElementsByTagName("intent-filter")
    for (i in 0 until filters.length) {
        val filter = filters.item(i) as? Element ?: continue
        val hasMain = filter.getElementsByTagName("action").asSequence()
            .filterIsInstance<Element>()
            .any { it.getAttribute("android:name") == "android.intent.action.MAIN" }
        val hasLauncher = filter.getElementsByTagName("category").asSequence()
            .filterIsInstance<Element>()
            .any { it.getAttribute("android:name") == "android.intent.category.LAUNCHER" }
        if (hasMain && hasLauncher) return true
    }
    return false
}

private val changePackageNameOption = stringOption(
    key = "packageName",
    default = "Default",
    values = mapOf("Default" to "Default"),
    title = "Package name",
    description = "Accepts either a full Java package name (for example, com.valvesoftware.steamlinkvr.galaxyxr) or a display suffix (for example, Galaxy XR). Suffix input appends to app name and generates a package suffix automatically.",
    required = true,
) {
    it == "Default" || (it != null && it.isNotBlank())
}

private val changePackageNameBytecodePatch = bytecodePatch {
    val packageName by changePackageNameOption()

    execute {
        val original = packageMetadata.packageName
        val (newName) = resolveRenamedPackage(original, packageName!!)
        val startVrLink = mutableClassDefBy("Lcom/valvesoftware/steamlink/SteamLink;").methods
            .first { it.name == "startVRLink" && it.parameterTypes.singleOrNull() == "Ljava/lang/String;" }
        val matches = startVrLink.implementation!!.instructions.mapIndexedNotNull { index, instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference as? StringReference
            index.takeIf { reference?.string == original }
        }
        if (matches.isEmpty()) {
            if (packageMetadata.versionName == "2.0.20" && packageMetadata.versionCode == "5001740") {
                throw PatchException("Steam Link 5001740 VR-launch package string was not found")
            }
            return@execute
        }
        if (matches.size != 1) {
            throw PatchException("Expected one Steam Link VR-launch package string, found ${matches.size}")
        }

        val index = matches.single()
        val instruction = startVrLink.implementation!!.instructions[index]
        val register = (instruction as OneRegisterInstruction).registerA
        val reference = ImmutableStringReference(newName)
        val replacement = when (instruction.opcode) {
            Opcode.CONST_STRING -> BuilderInstruction21c(Opcode.CONST_STRING, register, reference)
            Opcode.CONST_STRING_JUMBO ->
                BuilderInstruction31c(Opcode.CONST_STRING_JUMBO, register, reference)
            else -> throw PatchException("Unexpected package string opcode: ${instruction.opcode}")
        }
        startVrLink.replaceInstruction(index, replacement)
    }
}

@Suppress("unused")
val changePackageNamePatch = resourcePatch(
    name = "Change package name",
    description = "Renames the manifest package and Steam Link's internal VR-launch component so the patched app can coexist with the original installation.",
    default = false,
) {
    compatibleWith(*COMPATIBILITIES_STEAM_LINK_LEGACY.toTypedArray())
    dependsOn(changePackageNameBytecodePatch)

    val packageName by changePackageNameOption()

    execute {
        // Morphe's package-renaming resource processor opens ids.xml unconditionally. Steam Link
        // 2.0.20/5001712 has no ID resources, so supply a valid empty document before compilation.
        ensureChangePackageIdsXml(get("res/values/ids.xml"))
    }

    finalize {
        val original = packageMetadata.packageName
        val (newName, suffixInput) = resolveRenamedPackage(original, packageName!!)

        document("AndroidManifest.xml").use { document ->
            // AndroidManifest.xml: manifest@package attribute (top-level package identifier)
            document.documentElement.setAttribute("package", newName)

            // Update custom permissions declared by this package.
            document.getElementsByTagName("permission").asSequence()
                .filterIsInstance<Element>()
                .forEach { el ->
                    val name = el.getAttribute("android:name")
                    if (name.startsWith("$original.")) {
                        el.setAttribute("android:name", name.replaceFirst(original, newName))
                    }
                }

            // Update uses-permission entries for custom permissions.
            document.getElementsByTagName("uses-permission").asSequence()
                .filterIsInstance<Element>()
                .forEach { el ->
                    val name = el.getAttribute("android:name")
                    if (name.startsWith("$original.")) {
                        el.setAttribute("android:name", name.replaceFirst(original, newName))
                    }
                }

            // Update content provider authorities.
            document.getElementsByTagName("provider").asSequence()
                .filterIsInstance<Element>()
                .forEach { el ->
                    val authorities = el.getAttribute("android:authorities")
                    if (authorities.contains(original)) {
                        el.setAttribute("android:authorities", authorities.replace(original, newName))
                    }
                }

            if (!suffixInput.isNullOrBlank()) {
                val displayName = "Steam Link $suffixInput"
                val app = document.documentElement.getElementsByTagName("application").item(0) as? Element
                app?.setAttribute("android:label", displayName)

                app?.getElementsByTagName("activity")?.asSequence()
                    ?.filterIsInstance<Element>()
                    ?.filter { it.isLauncherActivity() }
                    ?.forEach { it.setAttribute("android:label", displayName) }
            }
        }
    }
}
