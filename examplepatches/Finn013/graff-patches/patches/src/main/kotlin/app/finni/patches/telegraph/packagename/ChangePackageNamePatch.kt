package app.finni.patches.telegraph.packagename

import app.finni.patches.telegraph.shared.Constants.COMPATIBILITY_TELEGRAPH_PLUS
import app.finni.patches.telegraph.shared.Constants.GRAFF_PACKAGE
import app.finni.patches.telegraph.shared.Constants.ORIGINAL_PACKAGE
import app.finni.patches.telegraph.signature.disableSignatureCheckPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.packageMetadata
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.util.Base64
import java.util.logging.Logger

private fun smaliEscape(value: String) = buildString {
    value.forEach { c ->
        when {
            c == '"' -> append("\\\"")
            c == '\\' -> append("\\\\")
            c == '\n' -> append("\\n")
            c == '\r' -> append("\\r")
            c == '\t' -> append("\\t")
            c.code < 0x20 || c.code > 0x7e -> append("\\u%04x".format(c.code))
            else -> append(c)
        }
    }
}

@Suppress("unused")
val changePackageNamePatch = patch(
    name = "Change package name",
    description = "Changes the package to ir.finni.graff (configurable) so Graff installs next to the " +
        "original Telegraph Plus. Rewrites the manifest (providers, permissions) and package strings in code. " +
        "A renamed app is a separate app: it has its own login and data.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TELEGRAPH_PLUS)
    dependsOn(disableSignatureCheckPatch)

    val newPackageOption by stringOption(
        key = "packageName",
        default = GRAFF_PACKAGE,
        values = mapOf("ir.finni.graff" to GRAFF_PACKAGE),
        title = "Package name",
        description = "New package name. Must differ from every other installed app.",
        required = true,
    ) { it != null && it.matches(Regex("^[a-z][a-z0-9_]*(\\.[a-z][a-z0-9_]*)+$")) }

    execute {
        val oldPackage = packageMetadata.packageName.takeIf { it.isNotBlank() } ?: ORIGINAL_PACKAGE
        val newPackage = newPackageOption!!
        val logger = Logger.getLogger(this::class.java.name)
        if (oldPackage == newPackage) return@execute

        // 1. Code: every string constant that contains the package name
        //    (FileProvider authorities, intent actions, contact MIME types, p2021 package checks).
        val oldBase64 = Base64.getEncoder().encodeToString(oldPackage.toByteArray())
        val newBase64 = Base64.getEncoder().encodeToString(newPackage.toByteArray())
        var strings = 0
        listOf(oldPackage, oldBase64).forEach { needle ->
            Fingerprint(
                filters = listOf(string(needle, StringComparisonType.CONTAINS)),
            ).matchAllOrNull()?.forEach { match ->
                val method = match.method
                val instructions = method.implementation!!.instructions
                for (index in instructions.indices.reversed()) {
                    val reference = (instructions[index] as? ReferenceInstruction)?.reference as? StringReference
                        ?: continue
                    val value = reference.string
                    if (!value.contains(oldPackage) && !value.contains(oldBase64)) continue
                    val newValue = value.replace(oldPackage, newPackage).replace(oldBase64, newBase64)
                    val register = method.getInstruction<OneRegisterInstruction>(index).registerA
                    method.replaceInstruction(index, "const-string v$register, \"${smaliEscape(newValue)}\"")
                    strings++
                }
            }
        }
        logger.info("Package name: replaced $strings string constants")

        // 2. Manifest: package attribute and every attribute value that contains the package name.
        var attributes = 0
        resourceXml("AndroidManifest.xml").use { manifest ->
            manifest.root.setAttribute("package", newPackage)
            manifest.root.elements().forEach { element ->
                element.attributeNames.forEach { name ->
                    val value = element.attribute(name) ?: return@forEach
                    if (value.contains(oldPackage)) {
                        element.setAttribute(name, value.replace(oldPackage, newPackage))
                        attributes++
                    }
                }
            }
        }
        logger.info("Package name: replaced $attributes manifest attributes")
    }
}
