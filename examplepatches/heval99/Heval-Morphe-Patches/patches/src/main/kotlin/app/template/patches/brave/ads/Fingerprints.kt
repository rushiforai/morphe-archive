package app.template.patches.brave.ads

import app.morphe.patcher.Fingerprint

internal const val NTP_BACKGROUND_IMAGES_BRIDGE_CLASS =
    "Lorg/chromium/chrome/browser/ntp_background_images/NTPBackgroundImagesBridge;"
internal const val WALLPAPER_CLASS = "Lorg/chromium/chrome/browser/ntp_background_images/model/Wallpaper;"

// The @CalledByNative sponsored-image factory: createBrandedWallpaper up to 1.97, renamed
// createNewTabTakeoverWallpaper in 1.98 (same parameters). Matched by shape, not name: the only
// method on the bridge that returns a Wallpaper (createWallpaper returns a BackgroundImage).
internal object SponsoredWallpaperFingerprint : Fingerprint(
    definingClass = NTP_BACKGROUND_IMAGES_BRIDGE_CLASS,
    returnType = WALLPAPER_CLASS,
    parameters = listOf(
        "Ljava/lang/String;", "I", "I", "Ljava/lang/String;", "Ljava/lang/String;", "Z",
        "Ljava/lang/String;", "Ljava/lang/String;", "Z", "I",
    ),
)
