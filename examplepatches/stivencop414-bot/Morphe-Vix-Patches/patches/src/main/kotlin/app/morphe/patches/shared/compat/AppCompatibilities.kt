package app.morphe.patches.shared.compat

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal object AppCompatibilities {
    const val VIX_NAME = "ViX"
    const val VIX_PACKAGE = "com.univision.prendetv"
    const val VIX_COLOR = 0xFF6B00
    const val VIX_SIGNER_SHA256 = "eb6f3b76c6110bb945f88530ff5742634e48223c382931c319daceb431fe666d"
    const val VIX_4521_VERSION_CODE = 7902

    fun vix(): Array<Compatibility> = arrayOf(
        Compatibility(
            name = VIX_NAME,
            packageName = VIX_PACKAGE,
            appIconColor = VIX_COLOR,
            signatures = setOf(VIX_SIGNER_SHA256),
            targets = listOf(
                AppTarget(version = "4.52.1_mobile", versionCode = VIX_4521_VERSION_CODE),
            ),
        ),
    )

    fun ditu(): Array<Compatibility> = arrayOf(
        Compatibility(
            name = "Ditu",
            packageName = "com.caracol.streaming",
            apkFileType = ApkFileType.XAPK,
            appIconColor = 0xFF6600,
            signatures = setOf("6cc4605aa7b9ee71a34e0f8125a9050330563d795e87ae54b5c792868c188895"),
            targets = listOf(AppTarget(version = "2.8.1", versionCode = 4731)),
        ),
    )

    const val MEITU_NAME = "Meitu"
    const val MEITU_PACKAGE = "com.mt.mtxx.mtxx"
    const val MEITU_COLOR = 0xF01C48
    const val MEITU_SIGNER_SHA256 = "7b1a6d25e5e8711a6e79283df10c648b47a420c4e5413c2c51351a8ca508de25"

    fun meitu(): Array<Compatibility> = arrayOf(
        Compatibility(
            name = MEITU_NAME,
            packageName = MEITU_PACKAGE,
            apkFileType = ApkFileType.APKM,
            appIconColor = MEITU_COLOR,
            signatures = setOf(MEITU_SIGNER_SHA256),
            targets = listOf(
                AppTarget(version = "12.23.3", versionCode = 122303),
            ),
        ),
    )
}
