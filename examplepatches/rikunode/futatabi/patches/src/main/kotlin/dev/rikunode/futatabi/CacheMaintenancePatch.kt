package dev.rikunode.futatabi

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.resourcePatch
import java.security.MessageDigest
import org.w3c.dom.Element

// No Dart instructions are changed. Gate the native maintenance against the
// exact stock/known combined AOT layouts whose cache behavior was inspected.
internal val cacheTargetGuard = rawResourcePatch {
    execute {
        val bytes = get("lib/arm64-v8a/libapp.so").readBytes()
        val digest = MessageDigest.getInstance("SHA-256").digest(bytes)
            .joinToString("") { "%02x".format(it) }
        val supported = setOf(
            "dd542fe3af5f266096e07f823da3880d3a6e7c771aa80afe6324137e63c5041a",
            "f46c85060c997990099d8a6848d119680346bccd84371d7e34c45ac66e18a5b0",
            LOGIN_ONLY_LIBAPP_SHA256,
            "a076ce46ff02e598d1e8c183ef8306ce447ec1f5117e2198bcad379bd07ec5d7",
            REPLY_ONLY_LIBAPP_SHA256, REPLY_BANNER_LIBAPP_SHA256,
            REPLY_LOGIN_LIBAPP_SHA256, REPLY_ALL_LIBAPP_SHA256,
        )
        if (digest !in supported) throw PatchException("futatabi: unsupported cache AOT hash")
        val sites = mapOf(
            0x76eba4 to "1e7d80d2fe4100a9",
            0x76ebc0 to "c2000094707f4091",
            0x76f12c to "20f002b8707f4091",
            0x76f1a0 to "22b001b83f7000f8",
            0x7686b0 to "25000094e10300aa",
            0x8db014 to "22000094e10300aa",
            0x991bc4 to "fd79bfa9fd030faa",
        )
        for ((at, hex) in sites) {
            val expected = hex.chunked(2).map { it.toInt(16).toByte() }.toByteArray()
            if (!bytes.copyOfRange(at, at + expected.size).contentEquals(expected))
                throw PatchException("futatabi: unsupported cache instruction at ${at.toString(16)}")
        }
    }
}

private val cacheManifestPatch = resourcePatch {
    dependsOn(cacheTargetGuard)
    execute {
        document("AndroidManifest.xml").use { doc ->
            val manifest = doc.documentElement
            val app = manifest.getElementsByTagName("application").item(0) as? Element
                ?: throw PatchException("futatabi: cache application missing")
            if (app.getAttribute("android:name") != "android.app.Application")
                throw PatchException("futatabi: unexpected application initialization")
            val all = manifest.getElementsByTagName("*")
            for (i in 0 until all.length) {
                val element = all.item(i) as? Element ?: continue
                if (element.getAttribute("android:process").isNotEmpty() ||
                    element.getAttribute("android:multiprocess") == "true")
                    throw PatchException("futatabi: cache cleanup requires single-process target")
            }
            val provider = doc.createElement("provider")
            provider.setAttribute("android:name", "dev.rikunode.futatabi.bridge.CacheMaintenanceProvider")
            provider.setAttribute("android:authorities", manifest.getAttribute("package") + ".futatabi.cache")
            provider.setAttribute("android:exported", "false")
            provider.setAttribute("android:initOrder", "102")
            app.appendChild(provider)
        }
    }
}

@Suppress("unused")
val cacheMaintenancePatch = bytecodePatch(
    name = "Manage viewing cache",
    description = "Diagnose and safely trim known Flutter viewing cache files at cold start (1 GiB soft budget, Android 8+). Never clear settings or upload files.",
    default = true,
) {
    compatibleWith(Compatibility(
        name = "futatter", packageName = "com.Nanasaki.ftutter", apkFileType = ApkFileType.APK,
        targets = listOf(AppTarget(version = "3.1.1", versionCodes = mapOf(app.morphe.patcher.patch.SupportedAbi.ARM64_V8A to 65))),
    ))
    dependsOn(cacheManifestPatch)
    extendWith("extensions/futatter.mpe")
    execute {}
}
