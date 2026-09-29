package util

import app.morphe.patcher.patch.PatchException
import app.template.patches.steamlink.androidxr.patchControllerPoseCadence
import app.template.patches.steamlink.binary.*
import java.io.File
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.security.MessageDigest

/** Read-only production-helper audit on independently hash-pinned decoded inputs.
 * Expected sites come from the exact-base disassembly, not production layout tables.
 * No APK packaging, device interaction, or runtime acceptance is established here.
 */
object LegacyAddedNativeAudit {
    private data class Base(
        val version: String, val code: String, val size: Int, val hash: String,
        val names: IntArray, val gates: List<IntArray>, val permission: Int, val microphone: Int,
        val hook: Int, val stores: IntArray, val cave: Int,
        val mapFile: Long, val mapVa: Long, val mapSize: Long, val alignment: Long,
        val cadence: List<IntArray>,
    )

    private val bases = listOf(
        Base("2.0.20", "5001812", 2220872,
            "eebf7eabfb299ab7b9e5bba1612d4a32b27c51f451efc2bd206ba6fc6ac5205a",
            intArrayOf(0x99862, 0xa1985),
            listOf(intArrayOf(0xffc5c, 0xffc64), intArrayOf(0x10dc70), intArrayOf(0x1166c4, 0x1166cc, 0x116780)),
            0x142c84, 0xf4484, 0x101648,
            intArrayOf(0x101674, 0x101690, 0x101770, 0x101774, 0x101780),
            0x21dad0, 0x21d000, 0xc65000, 0xae4, 0x1000,
            listOf(
                intArrayOf(0xf6324, 0xf6314, 0xf636c, 0xf6380, 0xf63a8, 0xf638c),
                intArrayOf(0xf6424, 0xf6414, 0xf646c, 0xf6480, 0xf64a8, 0xf648c),
                intArrayOf(0xf64ec, 0xf64dc, 0xf6534, 0xf6544, 0xf6570, 0xf6578))),
        Base("2.0.21", "5001968", 2234048,
            "596b5680aa6c217daf5c151de517b1ad61b3999c6fd864ff59a718136ca40192",
            intArrayOf(0x9334f, 0x9b7ab),
            listOf(intArrayOf(0xfbc04, 0xfbc0c), intArrayOf(0x109bf0), intArrayOf(0x112644, 0x11264c, 0x112700)),
            0x13ec7c, 0xefdb4, 0xfd5f0,
            intArrayOf(0xfd6ac, 0xfd658, 0xfd6e0, 0xfd6e4, 0xfd6e8),
            0x220e88, 0x220000, 0xc70000, 0xe9c, 0x4000,
            listOf(
                intArrayOf(0xf2180, 0xf2170, 0xf21c8, 0xf21dc, 0xf2204, 0xf21e8),
                intArrayOf(0xf2284, 0xf2274, 0xf22cc, 0xf22e0, 0xf2308, 0xf22ec),
                intArrayOf(0xf234c, 0xf233c, 0xf2394, 0xf23a4, 0xf23d0, 0xf23d8))),
    )
    private val presets = linkedMapOf("voice-communication" to 7, "voice-recognition" to 6,
        "unprocessed" to 9, "voice-performance" to 10)
    private val delays = listOf(0L, 1L, 60L, 100L, 1000L, 4000L)
    private val modes = listOf("stock-4x", "half-2x", "display-1x")

    @JvmStatic
    fun main(args: Array<String>) {
        require(args.size == 1) { "Usage: LegacyAddedNativeAudit <repository-root>" }
        val root = File(args.single()).canonicalFile
        for (base in bases) {
            val dir = File(root, "decoded-apk-android-steamlinkvr-release-base-${base.version}-${base.code}")
            val file = File(dir, "lib/arm64-v8a/libvrlink_scene.so")
            check(file.isFile) { "BLOCKED missing exact decoded input: $file" }
            val metadata = File(dir, "apktool.yml").readText()
            for ((key, value) in listOf("versionName" to base.version, "versionCode" to base.code)) {
                check(Regex("(?m)^\\s*$key: ['\"]?${Regex.escape(value)}['\"]?\\s*$").containsMatchIn(metadata)) {
                    "Wrong $key for ${base.code}"
                }
            }
            val stock = file.readBytes()
            check(stock.size == base.size && hash(stock) == base.hash) { "Wrong pristine scene: $file" }
            audit(base, stock)
            check(file.readBytes().contentEquals(stock)) { "Read-only audit changed source file" }
            println("PASS ${base.version}/${base.code}: names + 3 gate groups + permission; 4 microphone presets/16 transitions; " +
                "6 HMD offsets/36 transitions; 3 cadence modes/9 transitions; 24 native orders with cadence before/after; " +
                "exact byte diffs, idempotence, wrong pairs, corrupt-site rejection, input immutability")
        }
        println("Scope: 2 real hash-pinned decoded scene libraries; production native helpers only. No Morphe APK, Android linker, headset, or SteamVR proof.")
    }

    private fun audit(b: Base, stock: ByteArray) {
        fun names(x: ByteArray) = patchNativePermissionNames(x, b.version, b.code)
        val gateFunctions = listOf(::patchHmdInitializationGates, ::patchLobbyPermissionStateGate, ::patchStreamXrGates)
        fun permission(x: ByteArray) = patchPermissionPrompt(x, b.version, b.code)
        fun mic(x: ByteArray, preset: String) = patchNativeMicrophonePreset(x, preset, b.version, b.code)
        fun hmd(x: ByteArray, delay: Long) = patchVisualDelay(x, delay, b.version, b.code)
        fun cadence(x: ByteArray, mode: String) = patchControllerPoseCadence(x, mode, b.version, b.code)
        fun gates(x: ByteArray): ByteArray = gateFunctions.fold(names(x)) { bytes, fn -> fn(bytes, b.version, b.code) }

        checkExact(stock, names(stock), expectedNames(stock, b), "permission names")
        check(names(names(stock)).contentEquals(names(stock)))
        b.names.forEach { badSite(stock, it, ::names) }
        gateFunctions.forEachIndexed { index, fn ->
            val expected = stock.copyOf().apply { b.gates[index].forEach { putWord(it, 0xd503201f.toInt()) } }
            val actual = fn(stock, b.version, b.code)
            checkExact(stock, actual, expected, "gates $index")
            check(fn(actual, b.version, b.code).contentEquals(actual))
            b.gates[index].forEach { site -> badSite(stock, site) { fn(it, b.version, b.code) } }
        }
        val expectedPermission = stock.copyOf().apply { hex("20008052c0035fd6").copyInto(this, b.permission) }
        checkExact(stock, permission(stock), expectedPermission, "permission function")
        check(permission(expectedPermission).contentEquals(expectedPermission))
        badSite(stock, b.permission, ::permission)

        for ((preset, value) in presets) {
            val expected = stock.copyOf().apply { putWord(b.microphone, 0x52800001 or (value shl 5)) }
            val actual = mic(stock, preset)
            checkExact(stock, actual, expected, "microphone $preset", allowNoChange = value == 7)
            check(mic(actual, preset).contentEquals(actual))
            for ((next, nextValue) in presets) {
                check(mic(actual, next).contentEquals(stock.copyOf().apply {
                    putWord(b.microphone, 0x52800001 or (nextValue shl 5))
                })) { "Microphone transition $preset->$next" }
            }
        }
        badSite(stock, b.microphone) { mic(it, "voice-recognition") }
        badSite(stock, b.microphone - 4) { mic(it, "voice-recognition") }
        for (delay in delays) {
            val actual = hmd(stock, delay)
            checkExact(stock, actual, expectedHmd(stock, b, delay), "HMD $delay")
            check(hmd(actual, delay).contentEquals(actual))
            for (next in delays) check(hmd(actual, next).contentEquals(expectedHmd(stock, b, next))) {
                "HMD transition $delay->$next"
            }
        }
        (listOf(b.hook) + b.stores.toList()).forEach { site -> badSite(stock, site) { hmd(it, 60) } }
        val hmdPatched = hmd(stock, 60)
        badSite(hmdPatched, b.cave + 12) { hmd(it, 100) }
        badSite(hmdPatched, 0x200 + 4) { hmd(it, 100) }
        listOf(-1L, 4001L).forEach { invalid -> fails(stock) { hmd(it, invalid) } }
        check(patchVisualDelay(stock, 60).contentEquals(stock)) { "New HMD base inferred by size" }

        for (mode in modes) {
            val actual = cadence(stock, mode)
            checkExact(stock, actual, expectedCadence(stock, b, mode), "cadence $mode", mode == "stock-4x")
            check(cadence(actual, mode).contentEquals(actual))
            for (next in modes) check(cadence(actual, next).contentEquals(expectedCadence(stock, b, next))) {
                "Cadence transition $mode->$next"
            }
        }
        b.cadence.flattenInts().forEach { site -> badSite(stock, site) { cadence(it, "half-2x") } }
        check(patchControllerPoseCadence(stock, "half-2x").contentEquals(stock)) { "New cadence base inferred by size" }

        for ((wrongVersion, wrongCode) in listOf("9.9.9" to b.code, b.version to "0")) {
            check(patchNativePermissionNames(stock, wrongVersion, wrongCode).contentEquals(stock))
            gateFunctions.forEach { check(it(stock, wrongVersion, wrongCode).contentEquals(stock)) }
            check(patchPermissionPrompt(stock, wrongVersion, wrongCode).contentEquals(stock))
            check(patchNativeMicrophonePreset(stock, "voice-recognition", wrongVersion, wrongCode).contentEquals(stock))
            check(patchVisualDelay(stock, 60, wrongVersion, wrongCode).contentEquals(stock))
            check(patchControllerPoseCadence(stock, "half-2x", wrongVersion, wrongCode).contentEquals(stock))
        }
        val truncated = stock.copyOf(stock.size - 1)
        fails(truncated, ::names)
        gateFunctions.forEach { fn -> fails(truncated) { fn(it, b.version, b.code) } }
        fails(truncated, ::permission)
        fails(truncated) { mic(it, "voice-recognition") }
        fails(truncated) { hmd(it, 60) }
        fails(truncated) { cadence(it, "half-2x") }

        // A same-size library with a modified, non-owned instruction in any guarded
        // function must fail before each independently selected native mutation.
        val nonOwnedSites = if (b.code == "5001812") {
            intArrayOf(0x142c8c, 0xf6278, 0x10dab0, 0xff804, 0x1015ec, 0x116480, 0xf418c)
        } else {
            intArrayOf(0x13ec84, 0xf20cc, 0x109a30, 0xfb7ac, 0xfd594, 0x112400, 0xefabc)
        }
        nonOwnedSites.forEach { site ->
            badSite(stock, site, ::names)
            gateFunctions.forEach { fn -> badSite(stock, site) { fn(it, b.version, b.code) } }
            badSite(stock, site, ::permission)
            badSite(stock, site) { mic(it, "voice-recognition") }
            badSite(stock, site) { hmd(it, 60) }
            badSite(stock, site) { cadence(it, "half-2x") }
        }

        val operations: List<(ByteArray) -> ByteArray> = listOf(::gates, ::permission,
            { mic(it, "voice-recognition") }, { hmd(it, 60) })
        val expected = expectedCadence(expectedHmd(expectedPermission.copyOf().apply {
            expectedNames(this, b).copyInto(this)
            b.gates.forEach { sites -> sites.forEach { putWord(it, 0xd503201f.toInt()) } }
            putWord(b.microphone, 0x528000c1)
        }, b, 60), b, "half-2x")
        val orders = permutations(listOf(0, 1, 2, 3))
        check(orders.size == 24)
        for (order in orders) {
            val lastCadence = cadence(order.fold(stock) { bytes, i -> operations[i](bytes) }, "half-2x")
            val firstCadence = order.fold(cadence(stock, "half-2x")) { bytes, i -> operations[i](bytes) }
            checkExact(stock, lastCadence, expected, "combined $order")
            check(firstCadence.contentEquals(expected)) { "Cadence order dependence $order" }
            check(order.reversed().fold(lastCadence) { bytes, i -> operations[i](bytes) }.contentEquals(expected)) {
                "Combined reapplication $order"
            }
        }
        check(hash(stock) == b.hash) { "Production helper mutated its input array" }
    }

    private fun expectedNames(input: ByteArray, b: Base) = input.copyOf().apply {
        "android.permission.HAND_TRACKING".toByteArray(Charsets.US_ASCII).copyOf(36).copyInto(this, b.names[0])
        "android.permission.EYE_TRACKING_FINE\u0000".toByteArray(Charsets.US_ASCII).copyInto(this, b.names[1])
    }

    private fun expectedHmd(input: ByteArray, b: Base, delay: Long) = input.copyOf().apply {
        // Independently measured ELF mapping. Assert the complete 56-byte replaced PT_NOTE header.
        putWord(0x200, 1); putWord(0x204, 5)
        listOf(b.mapFile, b.mapVa, b.mapVa, b.mapSize, b.mapSize, b.alignment)
            .forEachIndexed { index, value -> putLong(0x208 + index * 8, value) }
        val caveVa = b.mapVa + b.cave - b.mapFile
        fun branch(from: Long, to: Long) = 0x14000000 or (((to - from) / 4).toInt() and 0x3ffffff)
        putWord(b.hook, branch(b.hook.toLong(), caveVa))
        putWord(b.cave, 0xf94007e2.toInt())
        val ns = delay * 1_000_000
        putWord(b.cave + 4, 0xd2800010.toInt() or ((ns.toInt() and 65535) shl 5))
        putWord(b.cave + 8, 0xf2a00010.toInt() or (((ns ushr 16).toInt() and 65535) shl 5))
        putWord(b.cave + 12, 0x8b100042.toInt())
        putWord(b.cave + 16, branch(caveVa + 16, b.hook + 4L))
        val zeros = longArrayOf(0xf801c27f, 0xb900267f, 0xb9002a7f, 0xb9002e7f, 0xb900327f)
        b.stores.forEachIndexed { i, offset -> putWord(offset, zeros[i].toInt()) }
    }

    private fun expectedCadence(input: ByteArray, b: Base, mode: String) = input.copyOf().apply {
        b.cadence.forEachIndexed { row, sites ->
            val values = when (mode) {
                "stock-4x" -> longArrayOf(0x528000a2, 0x910023e1, 0x5280004b, 0x5280006c,
                    0xb9002fed, if (row == 2) 0xb9003fea else 0xb9003fe9)
                "half-2x" -> longArrayOf(0x52800062, 0x9100a3e1, 0x5280000b, 0x5280004c,
                    if (row == 2) 0xb9002fe9 else 0xb9002fea, 0xb9003fed)
                "display-1x" -> longArrayOf(0x52800042, 0x9100e3e1, 0x5280004b, 0x5280000c,
                    0xb9002fed, if (row == 2) 0xb9003fe9 else 0xb9003fea)
                else -> error("Unexpected audit mode")
            }
            sites.forEachIndexed { index, offset -> putWord(offset, values[index].toInt()) }
        }
    }

    private fun checkExact(input: ByteArray, actual: ByteArray, expected: ByteArray, label: String, allowNoChange: Boolean = false) {
        check(actual.size == input.size && actual.contentEquals(expected)) {
            val first = actual.indices.firstOrNull { it >= expected.size || actual[it] != expected[it] }
            "$label byte mismatch at ${first?.toString(16)}"
        }
        check(allowNoChange || !actual.contentEquals(input)) { "$label silently did nothing" }
    }
    private fun badSite(input: ByteArray, site: Int, operation: (ByteArray) -> ByteArray) {
        val corrupt = input.copyOf().apply { this[site] = (this[site].toInt() xor 0x80).toByte() }
        fails(corrupt, operation)
    }
    private fun fails(input: ByteArray, operation: (ByteArray) -> ByteArray) {
        val snapshot = input.copyOf()
        try { operation(input); error("Expected guarded rejection") } catch (_: PatchException) { }
        check(input.contentEquals(snapshot)) { "Failure partially mutated input" }
    }
    private fun permutations(items: List<Int>): List<List<Int>> = if (items.isEmpty()) listOf(emptyList()) else
        items.flatMap { first -> permutations(items - first).map { listOf(first) + it } }
    private fun List<IntArray>.flattenInts() = flatMap { it.toList() }
    private fun ByteArray.putWord(offset: Int, value: Int) { ByteBuffer.wrap(this).order(ByteOrder.LITTLE_ENDIAN).putInt(offset, value) }
    private fun ByteArray.putLong(offset: Int, value: Long) { ByteBuffer.wrap(this).order(ByteOrder.LITTLE_ENDIAN).putLong(offset, value) }
    private fun hash(bytes: ByteArray) = MessageDigest.getInstance("SHA-256").digest(bytes).joinToString("") { "%02x".format(it) }
    private fun hex(value: String) = value.chunked(2).map { it.toInt(16).toByte() }.toByteArray()
}
