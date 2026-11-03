package dev.utaa.linimal.patches.shared

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi

object Constants {
    const val PATCH_STATUS_ASSET_PATH = "assets/linimal/patch-status.json"
    const val PATCH_STATUS_SCHEMA_VERSION = 1

    /**
     * reference APKM の公式署名証明書の SHA-1。区切りなしの大文字 16 進で、Firebase Installations が
     * `X-Android-Cert` に載せる形式と同じです。
     *
     * v3 lineage の root（SDK 24–32 の signer、`reference/line-26.16.0-arm64-v8a.json` の
     * `signature.lineage[0].certificateSha256`）と同じ証明書から、APKM に対する
     * `apksigner verify --print-certs` の SHA-1 digest を写します。公開鍵の識別子であり秘密情報ではありません。
     * 空のあいだは push 通知の復旧 patch が LINE を書き換えず、機能は利用不可として記録されます。
     */
    const val LINE_ORIGINAL_CERTIFICATE_SHA1 = "89396DC419292473972813922867E6973D6F5C50"

    val LINE_COMPATIBILITY = Compatibility(
        name = "LINE",
        packageName = "jp.naver.line.android",
        apkFileType = ApkFileType.APKM_REQUIRED,
        targets = listOf(
            AppTarget(
                version = "26.16.0",
                versionCodes = mapOf(SupportedAbi.ARM64_V8A to 261600106),
            ),
        ),
    )
}
