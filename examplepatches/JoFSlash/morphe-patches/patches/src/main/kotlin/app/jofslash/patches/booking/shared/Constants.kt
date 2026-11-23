package app.jofslash.patches.booking.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    const val PACKAGE_NAME = "com.booking"

    /**
     * SHA-1 of Booking.com's original signing certificate (from the Play/APKMirror base.apk).
     * MicroG-RE knows the app by this certificate and only then treats it as the real app that
     * may use the Google account, even though the patched build is re-signed by a different key.
     */
    const val SIGNATURE = "9c9fbe258a146be83a4a0f1cb64be96a13790324"

    val COMPATIBILITY_BOOKING = Compatibility(
        name = "Booking.com",
        packageName = PACKAGE_NAME,
        // APKMirror ships Booking.com as a bundle (APKM).
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x003B95,
        targets = listOf(
            AppTarget(version = "71.1"),
            AppTarget(version = null, isExperimental = true),
        )
    )
}
