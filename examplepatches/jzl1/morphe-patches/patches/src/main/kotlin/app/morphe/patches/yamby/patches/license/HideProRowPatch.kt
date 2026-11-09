package lab.yamby.patches.license

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import lab.yamby.patches.shared.COMPATIBILITY_YAMBY

/**
 * Removes the `Yamby Pro` row from Settings.
 *
 * `C2191` case 5 renders the `Pro` section header and the single `Yamby Pro`
 * row. Returning before the header removes the empty section and its only
 * row, while leaving every other Settings item untouched.
 */
@Suppress("unused")
val hideProRowPatch = bytecodePatch(
    name = "Hide Pro row",
    description = "Removes the Yamby Pro row from Settings. Pro features remain " +
        "unlocked by the Unlock Pro patch.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YAMBY)
    dependsOn(unlockProPatch)

    execute {
        val method = SettingsProEntryFingerprint.method
        val proHeaderIndex = method.indexOfString("Pro")
        if (proHeaderIndex < 0) {
            throw PatchException("Could not find the Pro section header in C2191.")
        }
        method.addInstructions(
            proHeaderIndex,
            """
                sget-object p1, Ljg/ۥ۠ۗ۠۟۫;->ۥۖۗ۬۠ۤۜ:Ljg/ۥ۠ۗ۠۟۫;
                return-object p1
            """.trimIndent(),
        )
    }
}

/** Index of the first exact string constant [value], or -1. */
private fun MutableMethod.indexOfString(value: String): Int {
    val instructions = implementation?.instructions ?: return -1
    instructions.forEachIndexed { index, instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? StringReference
        if (reference?.string == value) return index
    }
    return -1
}