package app.zeekradapt.patches.dhu

import app.morphe.patcher.patch.Compatibility

private const val NAME = "DHU adapter"

private const val DESCRIPTION = "Adapts the app to an automotive head unit (Zeekr DHU) with a high resolution " +
    "screen that reports a low density: readable single-DPI scaling, floating back/settings button and " +
    "the opt-in compatibility fixes of zeekr-adapt. Uses Pine framework hooks installed from " +
    "android:appComponentFactory before Application.onCreate."

/**
 * Any app. Only Category 1 (Display / UI) is on by default, like patch_apk.sh without flags.
 */
@Suppress("unused")
val dhuAdapterUniversalPatch = dhuAdapterPatch(
    name = "$NAME (any app)",
    description = "$DESCRIPTION Only Display / UI is on by default, enable the other categories as needed. " +
        "Do not combine with the app specific \"$NAME\" patch.",
    compatibility = null,
)

/**
 * Navigation / car-aware app: full automotive de-mask (blank/white screen fix).
 * patch_apk.sh: --automotive-fix
 */
@Suppress("unused")
val dhuAdapterWazePatch = dhuAdapterPatch(
    name = NAME,
    description = "$DESCRIPTION Preset: automotive de-mask (isAutomotiveOS → false, blank screen fix).",
    compatibility = Compatibility(
        name = "Waze",
        packageName = "com.waze",
        appIconColor = 0x33CCFF,
    ),
    preset = DhuPreset(automotiveFix = true),
)

/**
 * Music app with a SIM-gated online check, MediaCenter.
 * patch_apk.sh: --root-bypass --emulator-bypass --network-bypass --sim-ready --media-bridge
 */
@Suppress("unused")
val dhuAdapterAppleMusicPatch = dhuAdapterPatch(
    name = NAME,
    description = "$DESCRIPTION Preset: root, emulator, network and SIM gate bypass, Zeekr MediaCenter.",
    compatibility = Compatibility(
        name = "Apple Music",
        packageName = "com.apple.android.music",
        appIconColor = 0xFA2D48,
    ),
    preset = DhuPreset(
        rootBypass = true,
        emulatorBypass = true,
        networkBypass = true,
        simReady = true,
        mediaBridge = true,
    ),
)

/**
 * Music app whose server checks the app signature, MediaCenter.
 * patch_apk.sh: --media-bridge --copy-sign
 */
@Suppress("unused")
val dhuAdapterSpotifyPatch = dhuAdapterPatch(
    name = NAME,
    description = "$DESCRIPTION Preset: Zeekr MediaCenter, original signature for the app's self-check.",
    compatibility = Compatibility(
        name = "Spotify",
        packageName = "com.spotify.music",
        appIconColor = 0x1ED760,
    ),
    preset = DhuPreset(mediaBridge = true, copySign = true),
)

/**
 * Media app, MediaCenter (patch_apk.sh --help: "media apps only (Spotify/Apple Music/YT Music)").
 * patch_apk.sh: --media-bridge
 */
@Suppress("unused")
val dhuAdapterYouTubeMusicPatch = dhuAdapterPatch(
    name = NAME,
    description = "$DESCRIPTION Preset: Zeekr MediaCenter.",
    compatibility = Compatibility(
        name = "YouTube Music",
        packageName = "com.google.android.apps.youtube.music",
        appIconColor = 0xFF0000,
    ),
    preset = DhuPreset(mediaBridge = true),
)

/**
 * Messaging app: defaults only (Display). SIM ready must stay off, it breaks phone number registration.
 */
@Suppress("unused")
val dhuAdapterTelegramPatch = dhuAdapterPatch(
    name = NAME,
    description = "$DESCRIPTION Preset: Display / UI only.",
    compatibility = Compatibility(
        name = "Telegram",
        packageName = "org.telegram.messenger",
        appIconColor = 0x2AABEE,
    ),
)
