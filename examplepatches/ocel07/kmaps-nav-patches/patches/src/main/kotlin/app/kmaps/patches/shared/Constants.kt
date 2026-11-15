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
        targets = listOf(
            AppTarget(version = "6.11.2.2"),
            AppTarget(version = "6.10.0.16"),
        ),
    )

    // APKMirror publishes KakaoMap as a single universal APK (nodpi, arm64-v8a + armeabi-v7a).
    val COMPATIBILITY_KAKAO_MAP = Compatibility(
        name = "KakaoMap",
        packageName = "net.daum.android.map",
        apkFileType = ApkFileType.APK,
        appIconColor = 0xFFCD00,
        targets = listOf(
            AppTarget(version = "5.17.8"),
        ),
    )
}
