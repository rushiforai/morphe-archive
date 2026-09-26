package app.ckzombies.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    const val PACKAGE_NAME = "com.glu.android.zombsniper"

    /**
     * Glu's own build of v3.1.0 (versionCode 310), signed `CN=Glu Mobile`. A repack of the same
     * version whose native libraries differ from Glu's is refused by the hash check, whatever its
     * version name says.
     */
    val COMPATIBILITY_CK_ZOMBIES = Compatibility(
        name = "CK Zombies",
        packageName = PACKAGE_NAME,
        apkFileType = ApkFileType.APK,
        appIconColor = 0x006020,
        targets = listOf(
            AppTarget(version = "3.1.0"),
        ),
    )
}
