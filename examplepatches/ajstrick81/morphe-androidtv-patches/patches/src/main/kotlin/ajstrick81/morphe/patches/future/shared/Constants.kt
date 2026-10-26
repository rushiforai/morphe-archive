package ajstrick81.morphe.patches.future.shared

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY = Compatibility(
        name = "Fawesome Movies & TV (Android TV)",
        packageName = "com.future.moviesByFawesomeAndroidTV",
        appIconColor = 0xFFB300,
        targets = listOf(AppTarget("19.7"))
    )

    // The update-prompt seam (Disable update prompt) survives across the 19.7 → 20.1
    // rewrite, so that patch declares its own compatibility spanning both. The ad seams
    // (Skip ads) do NOT survive 20.1's R8 obfuscation, so Skip ads stays on COMPATIBILITY
    // (19.7 only) rather than falsely advertising 20.1 support.
    val UPDATE_COMPATIBILITY = Compatibility(
        name = "Fawesome Movies & TV (Android TV)",
        packageName = "com.future.moviesByFawesomeAndroidTV",
        appIconColor = 0xFFB300,
        targets = listOf(AppTarget("19.7"), AppTarget("20.1"))
    )
}
