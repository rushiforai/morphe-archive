package app.sqzass.patches.all.spoofing

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.sqzass.patches.shared.patchMatchingMethods
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import java.util.logging.Logger
import org.w3c.dom.Element

private val logger = Logger.getLogger("SpoofInstallLocationPatch")

private val INSTALL_LOCATION_TYPES = setOf(
    "Landroid/content/pm/ApplicationInfo;",
    "Landroid/content/pm/PackageInfo;",
)

// Options are declared at file scope so the named resource patch can register them
// for the Manager while the unnamed internal bytecode patch reads the same instances.
private val setManifestOption = booleanOption(
    key = "setManifestInstallLocation",
    default = true,
    title = "Set Manifest Install Location",
    description = "Sets android:installLocation to internalOnly on the application tag.",
)
private val spoofReadsOption = booleanOption(
    key = "spoofFieldReads",
    default = true,
    title = "Spoof Install Location Reads",
    description = "Force ApplicationInfo and PackageInfo installLocation field reads to report internal storage (0).",
)

private fun isInstallLocationRead(instruction: Instruction): Boolean {
    val reference = (instruction as? ReferenceInstruction)?.reference as? FieldReference ?: return false
    return reference.name == "installLocation" &&
        reference.type == "I" &&
        reference.definingClass in INSTALL_LOCATION_TYPES
}

// Internal patch that is not shown in Morphe Manager or the CLI patch list,
// but is required for the field-reading half of the install location spoof.
@Suppress("unused")
private val spoofInstallLocationInternalPatch = bytecodePatch {
    execute {
        if (spoofReadsOption.value != true) {
            logger.info("Install location field spoofing is off.")
            return@execute
        }

        val patched = patchMatchingMethods(
            isCandidate = { method -> method.implementation?.instructions?.any(::isInstallLocationRead) == true },
        ) { instructions ->
            var count = 0
            for (index in instructions.indices) {
                val instruction = instructions[index]
                if (isInstallLocationRead(instruction) && instruction is TwoRegisterInstruction) {
                    replaceInstruction(index, "const/4 v${instruction.registerA}, 0x0")
                    count++
                }
            }
            count
        }

        logger.info("Forced internal install location at $patched field reads.")
    }
}

@Suppress("unused")
val spoofInstallLocationPatch = resourcePatch(
    name = "Spoof install location",
    description = "Reports internal storage as the install location, matching the Play Store default.",
    default = false,
) {
    category("Spoofing")

    setManifestOption()
    spoofReadsOption()

    dependsOn(spoofInstallLocationInternalPatch)

    execute {
        if (setManifestOption.value != true) {
            logger.info("Manifest install location change is off.")
            return@execute
        }

        document("AndroidManifest.xml").use { document ->
            document.documentElement.setAttribute("android:installLocation", "internalOnly")
            logger.info("Set android:installLocation to internalOnly.")
        }
    }
}