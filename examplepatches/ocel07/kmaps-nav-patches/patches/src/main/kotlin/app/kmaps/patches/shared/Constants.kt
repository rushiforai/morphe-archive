package app.kmaps.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

object Constants {
    // APKMirror publishes NAVER Map as an APKM bundle (base + ABI + density splits).
    val COMPATIBILITY_NAVER_MAP = Compatibility(
        name = "NAVER Map",
        packageName = "com.nhn.android.nmap",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x03C75A,
        // NAVER signing certificate (CN=sungho park, O=nhn)
        signatures = setOf("0b8b8523bb4aeffa346e4bdd4fbf7d193450569aa14aaad4adfd94a3f7b227bb"),
        targets = listOf(
            AppTarget(version = "6.12.2.4"),
            AppTarget(version = "6.11.2.2"),
            AppTarget(version = "6.10.0.16"),
        ),
    )

    // KakaoMap has not been published on APKMirror since 2024: current versions come from APKPure as XAPK
    // (base + ABI + density splits). 5.17.8 was a single universal APK on APKMirror.
    val COMPATIBILITY_KAKAO_MAP = Compatibility(
        name = "KakaoMap",
        packageName = "net.daum.android.map",
        apkFileType = ApkFileType.XAPK,
        appIconColor = 0xFFCD00,
        // Kakao rotated its signing key (APK Signature Scheme v3.1 lineage):
        // CN=Jaewook Kim (until 5.x, and still for Android 12 and older) -> OU=kakaoteam, O=kakao (Android 13+)
        signatures = setOf(
            "d90a5438321e50a1aeac40a1152d37f2599ec8fa418acaf426e295a9f262c68c",
            "2b06cc3d47782d7c497c07f17cb5f859cd6bbcb66829f3e67b96b7a44820d2ce",
        ),
        targets = listOf(
            AppTarget(version = "6.32.0", description = "APKPure XAPK (not on APKMirror)"),
            AppTarget(version = "5.17.8", description = "APKMirror universal APK"),
        ),
    )
}
