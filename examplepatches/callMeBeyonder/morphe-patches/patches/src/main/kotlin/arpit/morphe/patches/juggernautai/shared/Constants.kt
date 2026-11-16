package arpit.morphe.patches.juggernautai.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    val COMPATIBILITY_JUGGERNAUTAI = Compatibility(
        name = "JuggernautAI",
        packageName = "com.jtsstrength.juggernautai",
        // APKCube distributes JuggernautAI as an APKS split container (base APK plus
        // ABI and density splits); the base APK alone is not installable.
        apkFileType = ApkFileType.APKS,
        // Charcoal of the adaptive launcher icon background (color/ic_launcher_background).
        appIconColor = 0x111316,
        targets = listOf(
            AppTarget(
                // Version as reported by the APKS manifest (versionCode 915 = 0x393).
                version = "3.1.0"
            )
        )
    )
}
