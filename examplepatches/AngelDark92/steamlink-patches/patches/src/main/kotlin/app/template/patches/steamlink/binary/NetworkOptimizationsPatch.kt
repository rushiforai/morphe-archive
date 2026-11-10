package app.template.patches.steamlink.binary

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import app.template.patches.shared.Constants.COMPATIBILITIES_STEAM_LINK
import app.template.patches.shared.PatchCategories
import app.template.patches.shared.buildLabel
import java.security.MessageDigest

// Streaming-transport edits on the exact Android-XR Steam Link bases.
//
// E1: SVLFECRXFrame::CheckRetry abort block. The stock code logs the missing-packet
//     abort, sets the deferred abort latch and branches to the abort exit. The
//     replacement keeps the log, NOPs the latch and zeroing stores, and branches to
//     the normal send path so the accumulated retransmit request is sent.
// E2: SVLFEC::InternalAcceptFrameFromRX reorder bound, widened from 6 to 12 frames.
// E3: SVLDataLinkTransferUDP::Restart SO_SNDBUF, raised from 128 KiB to 1 MiB.
//     2.0.20/5001712 and 2.0.20/5001812 already request 24 MiB, so they keep stock.
// E4: CAndroidVideoDecoder::BHandleOutputBuffer AMediaCodec_flush call, NOP'd so a
//     momentarily starving decoder keeps its buffered frames.
//
// Every window is byte-exact and unique on its exact base. Windows are checked before
// any write; a wrong size or unknown bytes fail closed.

private data class Edit(
    val offset: Int,
    val stockHex: String,
    val replacementHex: String,
    val label: String,
) {
    val stock: ByteArray = stockHex.hex()
    val replacement: ByteArray = replacementHex.hex()
}

private data class NetworkLayout(
    val version: String,
    val versionCode: Int,
    val sceneSize: Int,
    val sceneEdits: List<Edit>,
    val mainSize: Int,
    val mainEdit: Edit,
    // Optional SHA-256 pin of libmain.so (stock or already-patched). Empty means size plus windows only.
    val mainSha256: Set<String> = emptySet(),
)

private fun String.hex(): ByteArray {
    require(length % 2 == 0) { "Odd hex length" }
    return ByteArray(length / 2) { index ->
        substring(index * 2, index * 2 + 2).toInt(16).toByte()
    }
}

private val NETWORK_LAYOUTS = listOf(
    NetworkLayout("2.0.20", 5001712, 2_221_072, listOf(
        Edit(0x15f2e0,
            "60faffb0610a40b900301391a5a60294682261f929008052f4031f2a0941313989000014e9ff9f5234008052",
            "60faffb0610a40b900301391a5a602941f2003d51f2003d51f2003d51f2003d557000014e9ff9f5234008052",
            "E1 retransmit-abort fallback"),
        Edit(0x15fff4,
            "e9038b1aff0200f93f190071562107b9",
            "e9038b1aff0200f93f310071562107b9",
            "E2 backtrack window"),
    ), 14_296_520, Edit(0xa22f9c,
        "002440f9ec250c943400001442c7ffb0",
        "002440f91f2003d53400001442c7ffb0",
        "E4 decoder flush removal")),
    NetworkLayout("2.0.20", 5001812, 2_220_872, listOf(
        Edit(0x15f440,
            "60faffb0610a40b90008109121a60294682261f929008052f4031f2a0941313989000014e9ff9f5234008052",
            "60faffb0610a40b90008109121a602941f2003d51f2003d51f2003d51f2003d557000014e9ff9f5234008052",
            "E1 retransmit-abort fallback"),
        Edit(0x160154,
            "e9038b1aff0200f93f190071562107b9",
            "e9038b1aff0200f93f310071562107b9",
            "E2 backtrack window"),
    ), 14_243_496, Edit(0x78a9ac,
        "002440f934230c9434000014e2dbffd0",
        "002440f91f2003d534000014e2dbffd0",
        "E4 decoder flush removal")),
    NetworkLayout("2.0.21", 5001968, 2_234_048, listOf(
        Edit(0x15b4fc,
            "40fafff0610a40b9005c1d91f6c00294682261f929008052f4031f2a0941313989000014e9ff9f5234008052",
            "40fafff0610a40b9005c1d91f6c002941f2003d51f2003d51f2003d51f2003d557000014e9ff9f5234008052",
            "E1 retransmit-abort fallback"),
        Edit(0x15c268,
            "e9038b1aff0200f93f190071562107b9",
            "e9038b1aff0200f93f310071562107b9",
            "E2 backtrack window"),
        Edit(0x168988,
            "4800a052808a40b9e81b00b9e3630091",
            "0802a052808a40b9e81b00b9e3630091",
            "E3 UDP send buffer"),
    ), 15_533_936, Edit(0x8b5c4c,
        "002840f998360c942000805297ffff17",
        "002840f91f2003d52000805297ffff17",
        "E4 decoder flush removal")),
    NetworkLayout("2.0.22", 5002244, 2_251_920, listOf(
        Edit(0x15e678,
            "40faffb0610a40b900980d91f7c50294682261f929008052f4031f2a0941313986000014e9ff9f5234008052",
            "40faffb0610a40b900980d91f7c502941f2003d51f2003d51f2003d51f2003d554000014e9ff9f5234008052",
            "E1 retransmit-abort fallback"),
        Edit(0x15f400,
            "e9038b1aff0200f93f190071562107b9",
            "e9038b1aff0200f93f310071562107b9",
            "E2 backtrack window"),
        Edit(0x16ce74,
            "4800a052808a40b9e80b00b9e3230091",
            "0802a052808a40b9e80b00b9e3230091",
            "E3 UDP send buffer"),
    ), 15_737_032, Edit(0x8d7318,
        "002c40f94d360c942000805297ffff17",
        "002c40f91f2003d52000805297ffff17",
        "E4 decoder flush removal")),
    NetworkLayout("2.0.23", 5002363, 2_292_008, listOf(
        Edit(0x166b60,
            "00fafff0610a40b900541891d9ca0294682261f929008052f4031f2a0941313986000014e9ff9f5234008052",
            "00fafff0610a40b900541891d9ca02941f2003d51f2003d51f2003d51f2003d554000014e9ff9f5234008052",
            "E1 retransmit-abort fallback"),
        Edit(0x167904,
            "f8038b1aff0200f91f1b0071562107b9",
            "f8038b1aff0200f91f330071562107b9",
            "E2 backtrack window"),
        Edit(0x17575c,
            "4800a052809a40b9e80b00b9e3230091",
            "0802a052809a40b9e80b00b9e3230091",
            "E3 UDP send buffer"),
    ), 15_826_584, Edit(0x8ec5c0,
        "003040f9ff360c942000805297ffff17",
        "003040f91f2003d52000805297ffff17",
        "E4 decoder flush removal")),
    NetworkLayout("2.0.24", 5002395, 2_301_432, listOf(
        Edit(0x1682a0,
            "00faffd0610a40b900dc0a91e1cd0294682261f929008052f4031f2a0941313986000014e9ff9f5234008052",
            "00faffd0610a40b900dc0a91e1cd02941f2003d51f2003d51f2003d51f2003d557000014e9ff9f5234008052",
            "E1 retransmit-abort fallback"),
        Edit(0x169044,
            "f8038b1aff0200f91f1b0071562107b9",
            "f8038b1aff0200f91f330071562107b9",
            "E2 backtrack window"),
        Edit(0x1772cc,
            "4800a052809a40b9e80b00b9e3230091",
            "0802a052809a40b9e80b00b9e3230091",
            "E3 UDP send buffer"),
    ), 15_929_432, Edit(0x903634,
        "003040f99e3c0c942000805297ffff17",
        "003040f91f2003d52000805297ffff17",
        "E4 decoder flush removal")),
    // 2.0.24/5002527: same four mechanisms, re-derived from this build's own decode.
    //  E1 0x1696a8: retransmit-list overflow abort (cmp w20,#0x1ff -> log -> latch -> exit 0x1698e0).
    //     The send-path join `ldr w10,[x19,#8]` sits at 0x169824, 0x15c bytes after the abort
    //     branch (0x1696c8), the same distance as 5002395 (0x1682c0 -> 0x16841c): imm26 0x57.
    //  E2 0x16a448: reorder bound `cmp w24,#6` after `csel w24,wzr,w11,eq` (6 -> 12).
    //  E3 0x179950: `mov w8,#0x20000` feeding setsockopt(fd,SOL_SOCKET=1,SO_SNDBUF=7) (-> 1 MiB).
    //  E4 0x940410: the AMediaCodec_flush BL (PLT 0xc50690, GOT 0xcca718). Of its two callers
    //     0x93e870 is the teardown path; 0x940414 is in BHandleOutputBuffer's
    //     `ldr x0,[x0,#0x60]; bl; mov w0,#1; b` shape, the same shape as 5002244/5002363/5002395.
    // libmain.so is written by this patch only, so it is also pinned by SHA-256. The scene library
    // is shared with other recommended patches in any order, so it is pinned by size and windows.
    NetworkLayout("2.0.24", 5002527, 2_333_472, listOf(
        Edit(0x1696a8,
            "00fafff0610a40b900741d915fe70294682261f929008052f4031f2a0941313986000014e9ff9f5234008052",
            "00fafff0610a40b900741d915fe702941f2003d51f2003d51f2003d51f2003d557000014e9ff9f5234008052",
            "E1 retransmit-abort fallback"),
        Edit(0x16a448,
            "f8038b1aff0200f91f1b0071562107b9",
            "f8038b1aff0200f91f330071562107b9",
            "E2 backtrack window"),
        Edit(0x179950,
            "4800a052809a40b9e80b00b9e3230091",
            "0802a052809a40b9e80b00b9e3230091",
            "E3 UDP send buffer"),
    ), 16_211_704, Edit(0x940410,
        "003040f99f400c942000805296ffff17",
        "003040f91f2003d52000805296ffff17",
        "E4 decoder flush removal"),
        mainSha256 = setOf(
            "ceddfaf39c3fba0b760ce5afea53ea9a5743502aa770e7d600f8109d67bf8e58", // stock
            "34ff572255a3b4dc28603c937bb5b3d9f5eb65f5d2e28c244e18722e72bdd816", // patched
        )),
)

private fun ByteArray.matchesAt(offset: Int, pattern: ByteArray): Boolean =
    offset >= 0 && offset + pattern.size <= size &&
        pattern.indices.all { this[offset + it] == pattern[it] }

private fun sha256(bytes: ByteArray): String =
    MessageDigest.getInstance("SHA-256").digest(bytes).joinToString("") { "%02x".format(it) }

private fun layoutFor(versionName: String, versionCode: String): NetworkLayout? =
    NETWORK_LAYOUTS.singleOrNull {
        it.version == versionName && it.versionCode.toString() == versionCode
    }

// Idempotent, fail-closed window write: an already-patched window is left alone, a stock
// window must match byte-exactly and be unique in the file, anything else aborts with the
// current file's size and hash so a drifted base is diagnosable from the error alone.
private fun replaceExact(bytes: ByteArray, edit: Edit): ByteArray {
    if (edit.stock.size != edit.replacement.size) {
        throw PatchException("${edit.label} stock/replacement lengths differ")
    }
    if (bytes.matchesAt(edit.offset, edit.replacement)) return bytes.copyOf()
    if (!bytes.matchesAt(edit.offset, edit.stock)) {
        throw PatchException(
            "${edit.label} did not match at 0x${edit.offset.toString(16)} " +
                "(size=${bytes.size}, sha256=${sha256(bytes)})",
        )
    }
    var occurrences = 0
    outer@ for (i in 0..bytes.size - edit.stock.size) {
        for (j in edit.stock.indices) {
            if (bytes[i + j] != edit.stock[j]) continue@outer
        }
        occurrences++
    }
    if (occurrences != 1) {
        throw PatchException("ambiguous ${edit.label} stock window: $occurrences occurrences")
    }
    return bytes.copyOf().apply { edit.replacement.copyInto(this, edit.offset) }
}

internal fun applyNetworkOptimizationsScene(
    bytes: ByteArray,
    versionName: String,
    versionCode: String,
): ByteArray {
    val layout = layoutFor(versionName, versionCode)
        ?: throw PatchException("Network Optimizations has no scene layout for $versionName/$versionCode")
    if (bytes.size != layout.sceneSize) {
        throw PatchException(
            "unexpected libvrlink_scene.so size=${bytes.size} for $versionName/$versionCode; " +
                "expected ${layout.sceneSize}",
        )
    }
    return layout.sceneEdits.fold(bytes) { current, edit -> replaceExact(current, edit) }
}

internal fun applyNetworkOptimizationsMain(
    bytes: ByteArray,
    versionName: String,
    versionCode: String,
): ByteArray {
    val layout = layoutFor(versionName, versionCode)
        ?: throw PatchException("Network Optimizations has no main layout for $versionName/$versionCode")
    if (bytes.size != layout.mainSize) {
        throw PatchException(
            "unexpected libmain.so size=${bytes.size} for $versionName/$versionCode; " +
                "expected ${layout.mainSize}",
        )
    }
    requireHash(bytes, layout.mainSha256, "libmain.so", versionName, versionCode)
    return replaceExact(bytes, layout.mainEdit)
}

// A pinned layout accepts only the pinned stock or pinned patched bytes. Only this patch writes
// libmain.so, so its input is always stock or this patch's own output.
private fun requireHash(bytes: ByteArray, accepted: Set<String>, name: String, versionName: String, versionCode: String) {
    if (accepted.isEmpty()) return
    val actual = sha256(bytes)
    if (actual !in accepted) {
        throw PatchException("unexpected $name SHA-256 $actual for $versionName/$versionCode")
    }
}

// Automatic loaded-build dispatch: the patch resolves the exact layout of the APK being patched
// (package + versionName + versionCode) and applies that build's own offsets. Any other package or
// build is rejected here, so the dependency-free mutation below stays inert on it.
internal fun isNetworkOptimizationsTarget(
    packageName: String,
    versionName: String,
    versionCode: String,
): Boolean = packageName == "com.valvesoftware.steamlinkvr" &&
    layoutFor(versionName, versionCode) != null

// Exact builds that carry a verified layout, in registry order, for tests and catalogs.
internal fun networkOptimizationsBuilds(): List<Pair<String, String>> =
    NETWORK_LAYOUTS.map { it.version to it.versionCode.toString() }

private val NETWORK_COMPATIBILITIES = COMPATIBILITIES_STEAM_LINK.filter { compatibility ->
    compatibility.targets.any { target ->
        target.versionCodes?.values?.any { code ->
            isNetworkOptimizationsTarget(
                compatibility.packageName.orEmpty(), target.version.orEmpty(), code.toString())
        } == true
    }
}

// One patch for every verified base. E3 (UDP send buffer) exists only on layouts that need it, so
// each build gets exactly its own edits.
@Suppress("unused")
val networkOptimizationsPatch = rawResourcePatch(
    name = "Network Optimizations",
    description = "Keeps streaming smooth after packet loss. " +
        buildLabel(NETWORK_COMPATIBILITIES),
    default = false,
) {
    category(PatchCategories.STREAMING_AND_NETWORK)
    compatibleWith(*NETWORK_COMPATIBILITIES.toTypedArray())

    execute {
        if (!isNetworkOptimizationsTarget(packageMetadata.packageName, packageMetadata.versionName,
                packageMetadata.versionCode)) return@execute
        val scene = get("lib/arm64-v8a/libvrlink_scene.so")
        val main = get("lib/arm64-v8a/libmain.so")
        val patchedScene = applyNetworkOptimizationsScene(
            scene.readBytes(), packageMetadata.versionName, packageMetadata.versionCode)
        val patchedMain = applyNetworkOptimizationsMain(
            main.readBytes(), packageMetadata.versionName, packageMetadata.versionCode)
        scene.writeBytes(patchedScene)
        main.writeBytes(patchedMain)
    }
}