package app.template.patches.example

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_MOVISTAR

// Full Dalvik descriptor for the extension class without the trailing ';' so it can be
// combined with the method suffix in the inline Smali instruction.
private const val EXTENSION_CLASS = "Lapp/template/extension/extension/ExamplePatch"

@Suppress("unused")
val blockAdsPatch = bytecodePatch(
    name = "Block Ads",
    description = "Blocks advertisements and promo clips.",
    default = true
) {
    compatibleWith(COMPATIBILITY_MOVISTAR)

    extendWith("extensions/extension.mpe")

    execute {
    InitializePlayerFingerprint.method.addInstructionsWithLabels(
        0,
        """
            invoke-static {p5}, $EXTENSION_CLASS;->shouldBlockAndSkip(Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :continue
            return-void
            :continue
            nop
        """
    )
}
}

