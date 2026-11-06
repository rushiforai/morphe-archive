package app.revanced.patches.kakaotalk.misc.integrity

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import app.revanced.patches.kakaotalk.misc.integrity.fingerprints.InstallSourceFingerprint
import app.revanced.patches.kakaotalk.shared.Constants.COMPATIBILITY_KAKAO

private const val PLAY_STORE_PACKAGE_NAME = "com.android.vending"

@Suppress("unused")
val spoofInstallerPackageNamePatch = bytecodePatch(
    name = "Spoof installer package name",
    description = "サイドロードしたインストールであることが露呈するのを防ぐため、整合性レポートではインストール元をGoogle Playとして報告します。",
) {
    compatibleWith(COMPATIBILITY_KAKAO)

    execute {
        InstallSourceFingerprint.method.returnEarly(PLAY_STORE_PACKAGE_NAME)
    }
}