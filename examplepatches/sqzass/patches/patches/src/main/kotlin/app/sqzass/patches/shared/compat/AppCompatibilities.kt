package app.sqzass.patches.shared.compat

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

@Suppress("MemberVisibilityCanBePrivate")
internal object AppCompatibilities {
    val PROTON_VPN = Compatibility(
        name = "Proton VPN",
        packageName = "ch.protonvpn.android",
        apkFileType = ApkFileType.XAPK_REQUIRED,
        appIconColor = 0x6D4AFF,
        signatures = setOf(
            "dcc9439ec1a6c6a8d0203f3423ee42bcc8b970628e53cb73a0393f398dd5b853",
        ),
        targets = listOf(
            AppTarget(version = "5.21.9.0", versionCode = 605210900, minSdk = 26),
        ),
    )