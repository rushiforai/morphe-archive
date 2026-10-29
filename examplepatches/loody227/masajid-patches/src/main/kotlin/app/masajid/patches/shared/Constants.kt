package app.masajid.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

object Constants {
    /**
     * "مساجد Masajid" — sa.gov.moia.beneficiaryapp.
     *
     * The app ships as a split bundle (base + ar + en + xxhdpi + arm64_v8a) and is
     * protected by PairIP, custom Java root/bootloader/mock checks, and Play Integrity.
     */
    val COMPATIBILITY_MASAJID = Compatibility(
        name = "Masajid",
        packageName = "sa.gov.moia.beneficiaryapp",
        apkFileType = ApkFileType.APK,
        appIconColor = 0x0B6E4F,
        targets = listOf(
            AppTarget(
                version = "1.0.1",
                versionCodes = mapOf(SupportedAbi.ARM64_V8A to 29),
            ),
        ),
    )
}
