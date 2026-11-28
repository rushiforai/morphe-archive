package dev.rikunode.futatabi

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import java.nio.file.Files
import java.nio.file.attribute.FileTime
import java.security.MessageDigest

private const val STOCK = "dd542fe3af5f266096e07f823da3880d3a6e7c771aa80afe6324137e63c5041a"
private const val BANNER_ONLY = "f46c85060c997990099d8a6848d119680346bccd84371d7e34c45ac66e18a5b0"
internal const val LOGIN_ONLY_LIBAPP_SHA256 = "e6b90f17ae6ab4d9424d12e450f66ca14ce4b203fde6c70b4b6ee99dbd563efd"
private const val BOTH = "a076ce46ff02e598d1e8c183ef8306ce447ec1f5117e2198bcad379bd07ec5d7"
private const val STOCK_SVG = "759405bbf238f8ec0386e7e1e6df6a2fc8b5d6f11fb3ba257ae5483ccc3c352e"

private fun String.hexBytes(): ByteArray = chunked(2).map { it.toInt(16).toByte() }.toByteArray()
private fun ByteArray.digest(): String = MessageDigest.getInstance("SHA-256").digest(this)
    .joinToString("") { "%02x".format(it) }

// The verified executable PT_LOAD maps these addresses directly to file offsets.
// Assembled source and call sites: docs/v04-beta8-login-button.md.
private val visibilityCode =
    "07000014687474703a2f2f3132372e302e302e313a31383736352f0099130394703b45f9be0b40f9fec100a9e00100f9642f40f9323afa97c003003601f05fb8217c0c53217801513f04007128030054027040b85ff00071c1020054003c00912104001102fdff10c30380520400403941000836040040797f1c0071a1000054020200109fb4017141000054421c0091451440389f00056bc10000540000018b6304007141feff54c0c2009102000014c0820091ef031daafd79c1a8c0035fd661696d6f67652f6d6562756b692f0000".hexBytes()
private val tapCode =
    "20f040b800801c8ba0831ff8f6d900a9e00100f961634091213845f9c2c20091645340f91f2003d51f2003d54135fb97".hexBytes()
private val loginButtonResources = rawResourcePatch {
    dependsOn(arm64TargetGuard)
    execute {
        val lib = get("lib/arm64-v8a/libapp.so")
        val svg = get("assets/flutter_assets/assets/images/ad.svg")
        if (!lib.isFile || !svg.isFile) throw PatchException("futatabi: missing verified ARM64 login button resources")
        val bytes = lib.readBytes()
        val before = bytes.digest()
        val expected = when (before) {
            STOCK -> LOGIN_ONLY_LIBAPP_SHA256
            BANNER_ONLY -> BOTH
            REPLY_ONLY_LIBAPP_SHA256 -> REPLY_LOGIN_LIBAPP_SHA256
            REPLY_BANNER_LIBAPP_SHA256 -> REPLY_ALL_LIBAPP_SHA256
            else -> throw PatchException("futatabi: unsupported ARM64 libapp.so (SHA-256 $before)")
        }
        if (svg.readBytes().digest() != STOCK_SVG) throw PatchException("futatabi: unsupported Ad icon")
        visibilityCode.copyInto(bytes, 0x86e088)
        tapCode.copyInto(bytes, 0x86dfdc)
        if (bytes.digest() != expected) throw PatchException("futatabi: login button output hash mismatch")
        val stamp = Files.getLastModifiedTime(lib.toPath())
        lib.writeBytes(bytes)
        if (Files.getLastModifiedTime(lib.toPath()) == stamp) {
            Files.setLastModifiedTime(lib.toPath(), FileTime.fromMillis(stamp.toMillis() + 2000))
        }
        svg.writeText("""<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path fill="none" stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" d="M14 4h5a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2h-5M3 12h12m-5-5 5 5-5 5"/></svg>""")
    }
}

@Suppress("unused")
val boardLoginButtonPatch = bytecodePatch(
    name = "Board login button",
    description = "Replace the catalog Ad button with login on Aimoge and Mebuki only (ARM64).",
    default = true,
) {
    compatibleWith(Compatibility(
        name = "futatter", packageName = "com.Nanasaki.ftutter", apkFileType = ApkFileType.APK,
        targets = listOf(AppTarget(version = "3.1.1", versionCodes = mapOf(app.morphe.patcher.patch.SupportedAbi.ARM64_V8A to 65))),
    ))
    dependsOn(bridgePatch, loginButtonResources)
}
