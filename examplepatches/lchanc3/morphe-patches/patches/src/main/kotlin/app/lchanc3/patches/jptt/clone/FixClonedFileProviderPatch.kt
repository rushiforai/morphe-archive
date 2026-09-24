package app.lchanc3.patches.jptt.clone

import app.lchanc3.patches.jptt.shared.Constants.COMPATIBILITY_JPTT
import app.lchanc3.patches.jptt.shared.Constants.EXTENSION_FILE_PROVIDER_CLASS
import app.lchanc3.patches.jptt.shared.extensionHookPatch
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

@Suppress("unused")
val fixClonedFileProviderPatch = bytecodePatch(
    name = "Fix photo upload in clones",
    description = "Fixes taking a photo to upload when the Clone app patch has renamed " +
        "the package. Changes nothing on a normal install.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_JPTT)

    dependsOn(extensionHookPatch)

    execute {
        val method = DispatchTakePictureIntentFingerprint.method
        val authorityIndex = DispatchTakePictureIntentFingerprint.instructionMatches.first().index
        val authorityRegister =
            method.getInstruction<OneRegisterInstruction>(authorityIndex).registerA

        // p0 is the Activity the intent is built for, which is a Context.
        method.replaceInstructions(
            authorityIndex,
            """
                invoke-static { p0 }, $EXTENSION_FILE_PROVIDER_CLASS->getFileProviderAuthority(Landroid/content/Context;)Ljava/lang/String;
                move-result-object v$authorityRegister
            """,
        )
    }
}
