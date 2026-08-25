package app.aimal.patches.streaming

import app.morphe.patcher.Fingerprint

/**
 * Injection points, verified against HBO Max 7.9.0.84 (com.wbd.stream) and
 * Disney+ 26.14.1+rc2-2026.08.20 (com.disney.disneyplus).
 */

private const val EXO_PLAYER_INTERFACE = "Landroidx/media3/exoplayer/ExoPlayer;"

/**
 * HBO Max's Application, which extends android.app.Application directly and
 * declares its own onCreate. Hooking here rather than an Activity means the
 * extension is initialised before any screen exists.
 *
 * The class name is not obfuscated - it is named in the app manifest, so it
 * cannot be.
 */
internal object HboMaxApplicationFingerprint : Fingerprint(
    definingClass = "Lcom/wbd/stream/MainApplication;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf(),
)

/**
 * Disney+ hooks the main Activity instead: its Application class
 * (DominguezMobileApplication) inherits onCreate from an obfuscated base and
 * does not declare one of its own, so there is no method there to hook.
 *
 * `p0` is the Activity, which is a Context, and attachBaseContext has already
 * run by the time onCreate is entered - so the context is usable at index 0.
 */
internal object DisneyPlusMainActivityFingerprint : Fingerprint(
    definingClass = "Lcom/bamtechmedia/dominguez/main/MainActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

/**
 * Every constructor of every class implementing media3's ExoPlayer interface.
 *
 * This is the one hook that has to work in both apps, and neither app gives it
 * a stable name: HBO Max keeps `androidx.media3.exoplayer.ExoPlayerImpl` but
 * obfuscates its superclass, while Disney+ renames the implementation to
 * `w6.g0` and keeps the superclass name instead. What both preserve is the
 * *interface* type, because media3's own ProGuard rules keep it - so the
 * interface is what this matches on.
 *
 * Matching by interface rather than by class also means the delegating players
 * both apps wrap around the real one are matched too. That is deliberate:
 * whichever instance the app actually drives is the last one constructed, and
 * every one of them accepts setPlaybackSpeed because they all implement
 * ExoPlayer.
 */
internal object ExoPlayerConstructorFingerprint : Fingerprint(
    name = "<init>",
    returnType = "V",
    custom = { _, classDef -> EXO_PLAYER_INTERFACE in classDef.interfaces },
)
