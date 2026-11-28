@file:Suppress("DEPRECATION")

package mxplayer.hdr10plus

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.rawResourcePatch
import java.io.File
import java.security.MessageDigest

private const val PACKAGE_NAME = "com.mxtech.videoplayer.pro"
private const val VERSION_NAME = "1.93.4"
private const val VERSION_CODE = 2001002584
private const val OFFICIAL_CERT_SHA256 = "0d9b4c778672e753d45aba4f10df31e1d10bf75b1245469131ef01b82f0f91b6"

private const val BH_PATH = "lib/arm64-v8a/libmx-bh.so"
private const val DECODER_PATH = "lib/arm64-v8a/libmxmcdec.21.so"
private const val VP_PATH = "lib/arm64-v8a/libmxvp.so"
private const val HOOK_PATH = "lib/arm64-v8a/libhdr10fix.so"
private const val HOOK_RESOURCE = "/native/libhdr10fix.so"

private const val STOCK_BH_SHA256 = "9ac4c0ffc83236b21edc16a4a37265b1d8ae28673701173cabd338eaa6d960a8"
private const val PATCHED_BH_SHA256 = "a747ae22de403d23054b31824713049ae351e8ca3013a7044cc69d14360495fe"
private const val STOCK_DECODER_SHA256 = "fc7bf9043037c899191803939bb2f71fb730a1d3f15c7297dc33203b16fb9b0a"
private const val PATCHED_DECODER_SHA256 = "5eace04d29d864a7d2338bf23478c5d07f1467fba73f19063fb5545cb5c81a88"
private const val STOCK_VP_SHA256 = "5bd6a24235ca0220a2a9b770daa8d76d42c24fb339cca554e3acf7eb82221c34"
private const val HOOK_SHA256 = "357c95a8f7d7d21675f65fbbec86c0648c278c6b1fcf577cb611aa5e2fcad120"

private val MX_PLAYER_PRO_1934 = Compatibility(
    packageName = PACKAGE_NAME,
    name = "MX Player Pro",
    apkFileType = ApkFileType.APK_REQUIRED,
    signatures = setOf(OFFICIAL_CERT_SHA256),
    targets = listOf(AppTarget(VERSION_NAME, VERSION_CODE)),
)

private data class BytePatch(val offset: Int, val expected: ByteArray, val replacement: ByteArray)

private fun hex(value: String): ByteArray {
    require(value.length % 2 == 0)
    return ByteArray(value.length / 2) { index ->
        value.substring(index * 2, index * 2 + 2).toInt(16).toByte()
    }
}

private fun sha256(file: File): String {
    val digest = MessageDigest.getInstance("SHA-256")
    file.inputStream().buffered().use { input ->
        val buffer = ByteArray(128 * 1024)
        while (true) {
            val count = input.read(buffer)
            if (count < 0) break
            digest.update(buffer, 0, count)
        }
    }
    return digest.digest().joinToString("") { "%02x".format(it) }
}

private fun requireHash(file: File, expected: String, label: String) {
    val actual = sha256(file)
    check(actual == expected) {
        "$label hash mismatch. Expected $expected, found $actual. This patch only supports the verified MX Player Pro 1.93.4 build."
    }
}

private fun patchFileExact(
    file: File,
    stockHash: String,
    patchedHash: String,
    label: String,
    patches: List<BytePatch>,
) {
    when (val currentHash = sha256(file)) {
        patchedHash -> return
        stockHash -> Unit
        else -> error("$label hash mismatch. Expected stock $stockHash (or already-patched $patchedHash), found $currentHash.")
    }

    val bytes = file.readBytes()
    for (patch in patches) {
        check(patch.expected.size == patch.replacement.size)
        check(patch.offset >= 0 && patch.offset + patch.expected.size <= bytes.size) {
            "$label patch offset 0x${patch.offset.toString(16)} is outside the file."
        }
        val actual = bytes.copyOfRange(patch.offset, patch.offset + patch.expected.size)
        check(actual.contentEquals(patch.expected)) {
            "$label bytes at 0x${patch.offset.toString(16)} do not match the verified stock build."
        }
        patch.replacement.copyInto(bytes, patch.offset)
    }

    file.writeBytes(bytes)
    requireHash(file, patchedHash, "$label after patching")
}

private fun installHook(destination: File) {
    val hookBytes = object {}.javaClass.getResourceAsStream(HOOK_RESOURCE)?.use { it.readBytes() }
        ?: error("Patch bundle is missing $HOOK_RESOURCE")

    val digest = MessageDigest.getInstance("SHA-256").digest(hookBytes)
        .joinToString("") { "%02x".format(it) }
    check(digest == HOOK_SHA256) {
        "Embedded libhdr10fix.so hash mismatch. Expected $HOOK_SHA256, found $digest."
    }

    destination.parentFile?.mkdirs()
    destination.writeBytes(hookBytes)
    requireHash(destination, HOOK_SHA256, "Installed libhdr10fix.so")
}

@Suppress("unused")
val bypassMxPlayerResigningProtection = rawResourcePatch(
    name = "Bypass MX Player re-signing protection",
    description = "Disables the six verified native anti-repack sabotage branches in MX Player Pro 1.93.4 so a Morphe-signed build can start normally.",
    default = true,
) {
    compatibleWith(MX_PLAYER_PRO_1934)
    category("MX Player Pro")

    execute {
        val bh = get(BH_PATH, true)
        patchFileExact(
            file = bh,
            stockHash = STOCK_BH_SHA256,
            patchedHash = PATCHED_BH_SHA256,
            label = "libmx-bh.so",
            patches = listOf(
                BytePatch(0x31d3c, hex("e00314aa"), hex("58000014")),
                BytePatch(0x31ebc, hex("e00314aa"), hex("58000014")),
                BytePatch(0x3425c, hex("e00313aa"), hex("5a000014")),
                BytePatch(0x34480, hex("e00313aa"), hex("5e000014")),
                BytePatch(0x34ce0, hex("e00313aa"), hex("58000014")),
                BytePatch(0x34e4c, hex("e00313aa"), hex("58000014")),
            ),
        )
    }
}

@Suppress("unused")
val stripHdr10PlusDynamicMetadata = rawResourcePatch(
    name = "Strip HDR10+ dynamic metadata (HW+)",
    description = "Installs the tested ARM64 buildAnnexB interposer that removes only HDR10+ ST 2094-40 SEI messages before MediaCodec while preserving HDR10 static metadata and Dolby Vision RPU.",
    default = true,
) {
    compatibleWith(MX_PLAYER_PRO_1934)
    category("MX Player Pro")
    dependsOn(bypassMxPlayerResigningProtection)

    execute {
        val vp = get(VP_PATH, true)
        requireHash(vp, STOCK_VP_SHA256, "libmxvp.so")

        val decoder = get(DECODER_PATH, true)
        patchFileExact(
            file = decoder,
            stockHash = STOCK_DECODER_SHA256,
            patchedHash = PATCHED_DECODER_SHA256,
            label = "libmxmcdec.21.so",
            patches = listOf(
                // Reuse the old SONAME string storage for "libhdr10fix.so\\0".
                BytePatch(0x201a, hex("6c69626d786d636465632e32312e736f00"), hex("6c696268647231306669782e736f006f00")),
                // First DT_NEEDED string offset: libmediandk.so -> libhdr10fix.so.
                BytePatch(0x17468, hex("a00c000000000000"), hex("4e0c000000000000")),
                // Former DT_SONAME becomes an additional DT_NEEDED entry.
                BytePatch(0x174d0, hex("0e00000000000000"), hex("0100000000000000")),
                // Its string offset now points back to libmediandk.so.
                BytePatch(0x174d8, hex("4e0c000000000000"), hex("a00c000000000000")),
            ),
        )

        val hook = get(HOOK_PATH, false)
        installHook(hook)
    }
}
