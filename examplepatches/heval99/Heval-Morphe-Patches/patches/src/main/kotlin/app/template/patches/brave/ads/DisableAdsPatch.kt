package app.template.patches.brave.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_BRAVE_EXPERIMENTAL
import app.template.patches.shared.addInstructionsChecked

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Hides sponsored new tab images and the Brave Rewards ads popup.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_BRAVE_EXPERIMENTAL)

    execute {
        // ── 1. Sponsored new tab images: never build the branded wallpaper ─────────────────
        //
        //  Native picks the image and hands it to Java through this @CalledByNative factory.
        //  With null the NTP callback falls back to the bundled background image, and the
        //  rich-media takeover, logo click-through and takeover infobar (all keyed off a
        //  Wallpaper instance) never appear. Regular Brave wallpapers use createWallpaper.
        //  1.98 renamed the factory createNewTabTakeoverWallpaper, so it is matched by shape.
        //  p0 (a dead String parameter) carries the null.
        SponsoredWallpaperFingerprint.method.addInstructionsChecked(
            0,
            """
                const/4 p0, 0x0
                return-object p0
            """,
        )

        // ── 2. Rewards ads signup popup (shown at new tab counts 0, 20 and 40) ─────────────
        Fingerprint(
            definingClass = "Lorg/chromium/chrome/browser/dialogs/BraveAdsSignupDialog;",
            returnType = "Z",
            parameters = emptyList(),
            strings = listOf("should_show_onboarding_dialog_view_counter"),
        ).method.returnEarly(false)
    }
}
