package app.pdalife.patches.pdalifebanner

import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

/**
 * Neutralizes libPDALIFE.so's JNI_OnLoad to prevent hook installation.
 *
 * Keeps libPDALIFE.so in the APK so System.loadLibrary("PDALIFE") still resolves and
 * native onCreate methods in MainActivity/DoNotStarveActivity don't crash with
 * UnsatisfiedLinkError.
 *
 * Patches JNI_OnLoad to return immediately without installing A64HookFunction hooks,
 * so the PDALIFE banner/toast is never set up.
 *
 * WARNING: If JNI_OnLoad also registers native methods (e.g. onCreate), neutralizing it
 * may cause UnsatisfiedLinkError when those methods are called. Test on your device.
 */
@Suppress("unused")
val neutralizePdalifeJniOnLoadPatch = rawResourcePatch(
    name = "Neutralize PDALIFE JNI_OnLoad (universal)",
    description = "Universal patch: Patches libPDALIFE.so's JNI_OnLoad to return immediately without installing hooks. Prevents PDALIFE banner/toast from being set up.",
    default = false
) {
    compatibleWith(
        Compatibility(
            name = "Slime Rancher",
            packageName = "com.playdigious.slimerancher",
            apkFileType = ApkFileType.APK,
            targets = listOf(AppTarget(version = "1.1.1103"))
        )
    )
    compatibleWith(
        Compatibility(
            name = "Subnautica",
            packageName = "com.unknownworlds.subnautica",
            apkFileType = ApkFileType.APK,
            targets = listOf(AppTarget(version = "1.22.83811"))
        )
    )
    compatibleWith(
        Compatibility(
            name = "World of Goo 2",
            packageName = "com.twodboy.wog2",
            apkFileType = ApkFileType.APK,
            targets = listOf(AppTarget(version = "1.0.29878322"))
        )
    )
    compatibleWith(
        Compatibility(
            name = "Don't Starve Pocket",
            packageName = "com.kleientertainment.doNotStarvePocket",
            apkFileType = ApkFileType.APK,
            targets = listOf(AppTarget(version = "1.19.22"))
        )
    )

    execute {
        val soFile = java.io.File("lib/arm64-v8a/libPDALIFE.so")
        if (soFile.exists()) {
            val soBytes = soFile.readBytes()
            val jniOnLoadOffset = findJniOnLoadOffset(soBytes)
            if (jniOnLoadOffset != -1) {
                // Patch first 8 bytes of JNI_OnLoad: mov w0, #0; ret (return JNI_ERR)
                soBytes[jniOnLoadOffset] = 0x52.toByte()
                soBytes[jniOnLoadOffset + 1] = 0x80.toByte()
                soBytes[jniOnLoadOffset + 2] = 0x00.toByte()
                soBytes[jniOnLoadOffset + 3] = 0x20.toByte()
                soBytes[jniOnLoadOffset + 4] = 0xc0.toByte()
                soBytes[jniOnLoadOffset + 5] = 0x03.toByte()
                soBytes[jniOnLoadOffset + 6] = 0x5f.toByte()
                soBytes[jniOnLoadOffset + 7] = 0xd6.toByte()
                soFile.writeBytes(soBytes)
            }
        }
    }
}

fun findJniOnLoadOffset(soBytes: ByteArray): Int {
    val jniOnLoadStr = "JNI_OnLoad".toByteArray()
    for (i in 0 until soBytes.size - jniOnLoadStr.size) {
        var match = true
        for (j in jniOnLoadStr.indices) {
            if (soBytes[i + j] != jniOnLoadStr[j]) {
                match = false
                break
            }
        }
        if (match) return i
    }
    return -1
}
