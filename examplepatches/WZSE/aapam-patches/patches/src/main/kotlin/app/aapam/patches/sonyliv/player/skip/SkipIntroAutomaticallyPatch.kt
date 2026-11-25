package app.aapam.patches.sonyliv.player.skip

import app.aapam.patches.sonyliv.shared.Constants.COMPATIBILITY_SONYLIV
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val skipIntroAutomaticallyPatch = bytecodePatch(
    name = "Auto skip intro and recap",
    description = "Automatically skips the intro, recap and song segments as soon as the " +
        "'Skip' button would appear, without waiting for a tap.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SONYLIV)

    execute {
        val method = SetSkipIntroVisibilityFingerprint.method
        val classDef = SetSkipIntroVisibilityFingerprint.classDef
        val buttonField = classDef.fields.first { it.type == "Landroid/widget/Button;" }
        val buttonFieldRef = "${classDef.type}->${buttonField.name}:Landroid/widget/Button;"
        val onClickMethodRef = "${classDef.type}->onClick(Landroid/view/View;)V"

        method.addInstructionsWithLabels(
            0,
            """
                if-eqz p1, :original
                iget-object v0, p0, $buttonFieldRef
                if-eqz v0, :original
                invoke-virtual { p0, v0 }, $onClickMethodRef
                return-void
                :original
                nop
            """,
        )
    }
}
