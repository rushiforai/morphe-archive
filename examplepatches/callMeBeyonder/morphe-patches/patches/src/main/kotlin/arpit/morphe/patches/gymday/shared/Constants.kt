package arpit.morphe.patches.gymday.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    /**
     * Gym Day (Workout Planner & Log) by Anthony Nguyen.
     *
     * Shipped as a plain universal APK with all four ABIs, not a split bundle
     * (re-verified in `analysis/gymday/notes/recon.md`).
     */
    val COMPATIBILITY_GYMDAY = Compatibility(
        name = "Gym Day",
        packageName = "com.anthonyng.workoutapp",
        apkFileType = ApkFileType.APK,
        // Amber background of the adaptive launcher icon (`#fbb116`).
        appIconColor = 0xFBB116,
        targets = listOf(
            AppTarget(
                // Version as reported by the APK manifest (versionCode 124).
                version = "1.62.0"
            )
        )
    )
}
