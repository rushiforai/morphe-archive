package app.lchanc3.patches.localdream.upscale

import app.morphe.patcher.Fingerprint

/**
 * The `UpscaleScreen` composable. R8 merges top level functions into shared
 * classes and renames everything, so it is found by two strings only it uses:
 * the preferences the upscaler choice lives in, and the backend log line it
 * reads the tile progress from.
 */
internal object UpscaleScreenFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("upscaler_prefs", "Processed tile "),
)
