package app.aidan.patches.blackjack.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

const val BLACKJACK_PACKAGE_NAME = "com.tripledot.blackjack"

val COMPATIBILITY_BLACKJACK = Compatibility(
    name = "Blackjack",
    packageName = BLACKJACK_PACKAGE_NAME,
    apkFileType = ApkFileType.APKM,
    appIconColor = 0x205B1F,
    signatures = setOf("32e1c2b4c9ab0189d3e4e1c67806e6f4fc454aa758a74ccaedda8a309aa6b205"),
    targets = listOf(AppTarget(version = "2.22.09", minSdk = 25))
)
