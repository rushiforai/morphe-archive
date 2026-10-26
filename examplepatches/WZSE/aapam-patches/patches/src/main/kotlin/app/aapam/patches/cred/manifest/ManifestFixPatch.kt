package app.aapam.patches.cred.manifest

import app.aapam.patches.cred.shared.Constants
import app.morphe.patcher.patch.rawResourcePatch
import java.io.File
import java.nio.charset.StandardCharsets

@Suppress("unused")
val manifestFixPatch = rawResourcePatch {
    compatibleWith(Constants.COMPATIBILITY_CRED)


    execute {
        val baseFile = this["AndroidManifest.xml"]
        val apkDir = baseFile.parentFile ?: baseFile
        val candidates = listOf(
            apkDir.resolve("AndroidManifest.xml.bin"),
            apkDir.resolve("AndroidManifest.xml"),
            baseFile
        )
        val file = candidates.firstOrNull { it.exists() }

        if (file != null && file.exists()) {
            try {
                val bytes = file.readBytes()
                var modified = false

                fun replaceBytes(search: String, replace: String) {
                    if (search.length != replace.length) return
                    for (charset in listOf(StandardCharsets.UTF_16LE, StandardCharsets.UTF_8)) {
                        val searchBytes = search.toByteArray(charset)
                        val replaceBytes = replace.toByteArray(charset)

                        for (i in 0..(bytes.size - searchBytes.size)) {
                            var match = true
                            for (j in searchBytes.indices) {
                                if (bytes[i + j] != searchBytes[j]) {
                                    match = false
                                    break
                                }
                            }
                            if (match) {
                                for (j in replaceBytes.indices) {
                                    bytes[i + j] = replaceBytes[j]
                                }
                                modified = true
                            }
                        }
                    }
                }

                replaceBytes("android.permission.QUERY_ALL_PACKAGES", "android.permission.DUMMY_ALL_PACKAGES")
                replaceBytes("isolatedProcess", "disabledProcess")
                replaceBytes("useAppZygote", "dontUseZygot")

                if (modified) {
                    file.writeBytes(bytes)

                    val binManifest = apkDir.resolve("AndroidManifest.xml.bin")
                    binManifest.writeBytes(bytes)

                    val plainManifest = apkDir.resolve("AndroidManifest.xml")
                    plainManifest.writeBytes(bytes)

                    // Write to root/AndroidManifest.xml so that ArsclibResourceCoder
                    // detects it as a modified binary resource under root/ and includes
                    // it in otherResourcesDir, which apkzlib adds to the final APK.
                    val rootManifest = apkDir.resolve("root/AndroidManifest.xml")
                    rootManifest.parentFile?.mkdirs()
                    rootManifest.writeBytes(bytes)
                }
            } catch (_: Exception) {
            }
        }
    }
}


