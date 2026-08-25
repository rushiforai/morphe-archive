package app.aimal.patches.crunchyroll

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val aspectRatioPatch = bytecodePatch(
    name = "Aspect ratio control",
    description = "Adds a Fit/Stretch toggle to the player.",
    default = true,
) {
    compatibleWith(CRUNCHYROLL)

    extendWith("extensions/extension.mpe")

    execute {
        // Crunchyroll's InternalPlayerViewLayout is a media3 PlayerView. Attach
        // the toggle when the view attaches to the window - that runs every
        // time the player is shown, unlike the ad-view setup method the earlier
        // version hooked, and it needs neither the controls-visibility hooks nor
        // any per-version layout fingerprint.
        //
        // p0 is the PlayerView (a View); the extension adds the chip and drives
        // setResizeMode on it by reflection.
        PlayerViewOnAttachedFingerprint.method.addInstructions(
            0,
            """
                invoke-static { p0 }, Lapp/aimal/extension/crunchyroll/AspectRatioHelper;->addAspectRatioButton(Landroid/view/View;)V
            """,
        )
    }
}
