package local.roborock

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile
import java.security.MessageDigest

private const val BUNDLE_PATH = "assets/plugin/features/feature_login_page/feature_login_page/index.android.bundle"
private const val LIBRARY_PATH = "lib/arm64-v8a/librrcodec.so"
private const val LOGIN_ROW = "type:t.type},t.type)})]})"
private const val PATCHED_LOGIN_ROW = "type:t.type},t.type)}),(0,r(d[8]).jsx)(r(90001).Button,{style:(O||h.some(function(t){return t.support}))&&{marginLeft:24}},\"local-server\")]})"
private const val BUNDLE_START = "__r(48);\n__r(0);"
private val NOP = byteArrayOf(0x1f, 0x20, 0x03, 0xd5.toByte())
internal data class AppFingerprint(
    val version: String,
    val bundleSha256: String,
    val librarySha256: String,
    val dependencies: String,
    val signatureChecks: Map<Int, ByteArray>,
)

internal val appFingerprints = listOf(
    AppFingerprint(
        "4.76.08",
        "5b0b4f7c18a015ed3b1926b141d637f611a33ee4d56e51395b90dee064facef2",
        "3e2b5077afe18db6eac23e5d5989f88d21bd00c04caa0ee8b1b5e0d53a7b3c66",
        "152,1,628,556,435",
        mapOf(0x4914c to byteArrayOf(0x8d.toByte(), 0x05, 0x00, 0x94.toByte())),
    ),
)

internal fun originalAppFingerprint(): AppFingerprint {
    val bundleHash = sha256(resourceFile(BUNDLE_PATH).readBytes())
    return appFingerprints.singleOrNull { it.bundleSha256 == bundleHash }
        ?: error("Unsupported login bundle. Use an original supported Roborock APK.")
}

private class BundledResources

private fun sha256(bytes: ByteArray): String = MessageDigest.getInstance("SHA-256")
    .digest(bytes).joinToString("") { "%02x".format(it.toInt() and 0xff) }

private fun replaceOnce(text: String, target: String, replacement: String): String {
    val index = text.indexOf(target)
    check(index >= 0 && text.indexOf(target, index + target.length) < 0) {
        "Expected exactly one login bundle anchor: $target"
    }
    return text.replaceRange(index, index + target.length, replacement)
}

val localServerPatch = patch(
    name = "Local server login",
    description = "Lets Roborock log in to your own Roborock Local Server instead of Roborock's cloud. " +
        "Adds a server button to the login screen, where you enter the server's HTTPS address, email and PIN. " +
        "Also turns off the app's signature check, which would otherwise close the re-signed app on launch. " +
        "Needs a Roborock Local Server: github.com/Python-roborock/local_roborock_server.",
    default = true,
) {
    dependsOn(savedServerUrlPatch)
    compatibleWith(
        Compatibility(
            name = "Roborock",
            packageName = "com.roborock.smart",
            apkFileType = ApkFileType.APK,
            appIconColor = 0xB52032,
            targets = listOf(
                AppTarget(version = "4.76.08", versionCodes = mapOf(SupportedAbi.ARM64_V8A to 100944)),
            ),
        ),
    )

    execute {
        val bundleFile = resourceFile(BUNDLE_PATH)
        val libraryFile = resourceFile(LIBRARY_PATH)
        val originalBundle = bundleFile.readBytes()
        val library = libraryFile.readBytes()
        val fingerprint = originalAppFingerprint()
        check(sha256(library) == fingerprint.librarySha256) { "Unsupported native library. Refusing to patch unknown signature-check offsets." }

        val source = checkNotNull(BundledResources::class.java.getResourceAsStream("/local-server.runtime.js")) {
            "The patch bundle is missing local-server.runtime.js"
        }.bufferedReader().use { it.readText() }
        val module = """
            __d(function(g,r,i,a,module,exports,d){
            function require(name){
                var index={"react":0,"react-native":1,"auth":2,"storage":3,"theme":4}[name];
                if(index===undefined)throw new Error("Unsupported local login dependency");
                return r(d[index]);
            }
            $source
            },90001,[${fingerprint.dependencies}]);
        """.trimIndent()

        var bundle = replaceOnce(
            originalBundle.toString(Charsets.UTF_8),
            LOGIN_ROW,
            PATCHED_LOGIN_ROW,
        )
        check(!Regex("""},90001(?:,|\))""").containsMatchIn(bundle)) { "Local server module ID is already in use" }
        bundle = replaceOnce(bundle, BUNDLE_START, "$module\n$BUNDLE_START")

        fingerprint.signatureChecks.forEach { (offset, expected) ->
            check(library.copyOfRange(offset, offset + expected.size).contentEquals(expected)) {
                "Unexpected instruction at native offset 0x${offset.toString(16)}"
            }
            NOP.copyInto(library, offset)
        }
        bundleFile.writeText(bundle)
        libraryFile.writeBytes(library)
    }
}
