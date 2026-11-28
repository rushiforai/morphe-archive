package dev.rikunode.futatabi

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch

/** Reject unsupported APK layouts before modifying any resources or bytecode. */
internal val arm64TargetGuard = rawResourcePatch {
    execute {
        val entries = listApkEntries("lib/")
        val path = "lib/arm64-v8a/libapp.so"
        if (path !in entries) {
            val reason = if ("lib/armeabi-v7a/libapp.so" in entries)
                "armeabi-v7a (32-bit) は非対応です。"
            else "ARM64のlibapp.soが見つかりません（ABIまたは分割APKを確認してください）。"
            throw PatchException("futatabi: " + reason + " ふたったー3.1.1 (versionCode 65) のarm64-v8a (64-bit) APK専用です。")
        }
        val header = ByteArray(20)
        if (get(path).length() < header.size) throw PatchException("futatabi: libapp.so が破損しています。")
        java.io.DataInputStream(get(path).inputStream()).use { it.readFully(header) }
        if (header.size != 20 || !header.copyOfRange(0, 4).contentEquals(byteArrayOf(0x7f, 0x45, 0x4c, 0x46)) ||
            header[4] != 2.toByte() || header[5] != 1.toByte() ||
            header[18] != 0xb7.toByte() || header[19] != 0.toByte())
            throw PatchException("futatabi: 対象外のELFです。ふたったー3.1.1 (versionCode 65) のarm64-v8a (64-bit) APK専用です。")
    }
}
