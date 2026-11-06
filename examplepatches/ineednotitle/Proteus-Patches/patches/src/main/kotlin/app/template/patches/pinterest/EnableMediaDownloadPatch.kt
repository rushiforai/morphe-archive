package app.template.patches.pinterest

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.PINTEREST_COMPATIBILITY

/**
 * Pinterest hides the Download action for most Pins: every Pin model carries
 * the server flag "is_eligible_for_image_download", and the pin-detail menu
 * builder (which reads pin.L5() in 14.41.0) only offers download when that
 * flag is true. This patch makes that image-download accessor report TRUE.
 * This patch alone does not change the download action to select video. The
 * separate experimental video patch adds that behavior. The accessor was identified
 * in Pinterest 14.41.0 (vc 14418020).
 */
@Suppress("unused")
val enableMediaDownloadPatch = bytecodePatch(
    name = "Enable media downloads",
    description = "Enables the pin-level image download eligibility flag. " +
        "Use the separate experimental video download patch for supported video Pins.",
    default = true,
) {
    compatibleWith(PINTEREST_COMPATIBILITY)

    execute {
        Fingerprint(
            definingClass = "Lcom/pinterest/api/model/pe;",
            name = "L5",
            returnType = "Ljava/lang/Boolean;",
            parameters = emptyList(),
        ).method.addInstructions(
            0,
            """
                sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                return-object v0
            """.trimIndent(),
        )
    }
}
