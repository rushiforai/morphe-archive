package semicoloncolonel.mobilestream.patches.appletv.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import semicoloncolonel.mobilestream.patches.appletv.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.blockPlayReviewSheetPatch

// Apple TV phone app 3.0.0. The app shows its own "Enjoying Apple TV?" dialog
// with a "Leave a Review" button, not Google Play's review sheet. Whether it
// may show comes from Apple's StoreReviewConfiguration, whose
// isStoreReviewEnabled flag is checked first. Every StoreReviewConfiguration
// the app builds now has that flag off, so the dialog is never shown.
//
// The Android TV app shares the package name but not this code, so this patch
// does nothing there. Its own Hide rating prompt (Android TV) patch covers it.

internal object StoreReviewConfigurationToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    strings = listOf("StoreReviewConfiguration(isStoreReviewEnabled="),
)

@Suppress("unused")
val hideRatingPromptPatch = bytecodePatch(
    name = "Hide rating prompt",
    description = "Stops the \"Enjoying Apple TV?\" review prompt.",
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY)

    // Also stops Google Play's review sheet, where the app calls it by name.
    dependsOn(blockPlayReviewSheetPatch)

    execute {
        val config = StoreReviewConfigurationToStringFingerprint.classDefOrNull ?: return@execute
        val enabled = config.fields.singleOrNull {
            it.type == "Ljava/lang/Boolean;" && (it.accessFlags and 0x8) == 0
        } ?: throw PatchException("Apple TV review flag not found")
        val field = "${config.type}->${enabled.name}:Ljava/lang/Boolean;"

        mutableClassDefBy(config.type).methods.filter { it.name == "<init>" }.forEach { init ->
            if (init.parameterTypes.isEmpty()) return@forEach
            if (init.implementation!!.registerCount > 16) throw PatchException("Apple TV review flag: unexpected registers")
            // p1 is no longer needed at the return, so it holds the flag.
            init.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_VOID }
                .map { it.index }
                .reversed()
                .forEach { index ->
                    init.addInstructions(
                        index,
                        """
                            sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
                            iput-object p1, p0, $field
                        """,
                    )
                }
        }
    }
}
