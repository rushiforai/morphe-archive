package app.venus.patches

import java.io.File
import java.io.RandomAccessFile
import java.security.MessageDigest
import java.nio.ByteBuffer
import java.nio.ByteOrder

/** Exact, inspected HBC98 functions. No eval, runtime hook, remote loader or settings dependency. */
internal object HbcPrivacy {
    const val ORIGINAL_SHA256 = "bf13d2dfd752b7802d7edd9e4c8b0d950f20bde5a98634c5256cc6ff42b02d90"
    data class Target(val id: Int, val name: String, val offset: Int, val size: Int,
                      val header: String, val sha256: String, val promise: Boolean, val expandedHeaderHash: String)
    fun digest(bytes: ByteArray, algorithm: String = "SHA-256") =
        MessageDigest.getInstance(algorithm).digest(bytes).joinToString("") { "%02x".format(it) }
    fun hex(value: String) = value.chunked(2).map { it.toInt(16).toByte() }.toByteArray()
    fun verifyOriginal(bytes: ByteArray) {
        require(digest(bytes) == ORIGINAL_SHA256) {
            "Unsupported Discord JavaScript bundle; use the original 348.10 - Stable APKM"
        }
    }
    /** Same check, streamed: never holds the 55 MB bundle in memory on the patching device. */
    fun verifyOriginal(file: File) {
        require(streamDigest(file, "SHA-256", file.length()) == ORIGINAL_SHA256) {
            "Unsupported Discord JavaScript bundle; use the original 348.10 - Stable APKM"
        }
    }
    private fun streamDigest(file: File, algorithm: String, length: Long): String {
        val digest = MessageDigest.getInstance(algorithm)
        file.inputStream().use { input ->
            val buffer = ByteArray(1 shl 20)
            var left = length
            while (left > 0) {
                val read = input.read(buffer, 0, minOf(buffer.size.toLong(), left).toInt())
                if (read < 0) break
                digest.update(buffer, 0, read)
                left -= read
            }
        }
        return digest.digest().joinToString("") { "%02x".format(it) }
    }

    // HBC98 opcodes (Hermes 250829098 BytecodeList.def) and the pinned bundle's string IDs.
    const val OP_NEW_OBJECT = 4; const val OP_GET_GLOBAL = 61; const val OP_GET_BY_ID = 69; const val OP_TRY_GET_BY_ID = 72
    const val OP_CALL1 = 108; const val OP_CALL2 = 110; const val OP_RET = 118
    const val OP_LOAD_UNDEFINED = 147; const val OP_LOAD_FALSE = 150
    /** String table IDs of "Promise" and "resolve" in the pinned 348.10 bundle. */
    const val PROMISE_ID = 30; const val RESOLVE_ID = 34208
    private fun bytes(vararg values: Int) = ByteArray(values.size) { values[it].toByte() }
    // GetGlobalObject r6; TryGetById r7,r6,cache0,Promise; GetById r8,r7,cache1,resolve; Call1 r6,r8,r7; Ret r6.
    // r6+ are GC-visible pointer-capable registers in all inspected Promise targets;
    // r0..r5 can be reserved number/non-pointer registers in Hermes V1.
    // Keep the Promise contract of track()/drain()/send(); do not return undefined to .then() callers.
    val resolvedPromise = bytes(OP_GET_GLOBAL, 6, OP_TRY_GET_BY_ID, 7, 6, 0, PROMISE_ID and 255, PROMISE_ID ushr 8,
        OP_GET_BY_ID, 8, 7, 1, RESOLVE_ID and 255, RESOLVE_ID ushr 8, OP_CALL1, 6, 8, 7, OP_RET, 6)
    // Match Sentry's own empty-envelope branch: Promise.resolve({}), not an undefined response.
    // NewObject is opcode 4. 1.3.6 and earlier wrote 9 (NewFastArray), which made the rest of the stub misdecode.
    val resolvedEmptyObject = bytes(OP_GET_GLOBAL, 6, OP_TRY_GET_BY_ID, 7, 6, 0, PROMISE_ID and 255, PROMISE_ID ushr 8,
        OP_GET_BY_ID, 8, 7, 1, RESOLVE_ID and 255, RESOLVE_ID ushr 8, OP_NEW_OBJECT, 9, OP_CALL2, 6, 8, 7, 9, OP_RET, 6)
    fun stub(target: Target) = if (target.name == "shouldCollectMetrics") bytes(OP_LOAD_FALSE, 6, OP_RET, 6) else if (!target.promise)
        if (target.name == "startRecordingAnalyticsEvents") bytes(OP_LOAD_UNDEFINED, 1, OP_RET, 1) else returnUndefined
    else
        if (target.name == "send") resolvedEmptyObject else resolvedPromise
    val returnUndefined = bytes(OP_LOAD_UNDEFINED, 6, OP_RET, 6) // LoadConstUndefined r6; Ret r6.
    val analytics = listOf(
        Target(34538, "increment", 29512836, 96, "b8f60b0000c0000000000020", "cd9704862684ca16d09d926f5509b43cdffebb26be1255a4e4f4f185103bf4c3", false, "38266003196ff693d96b3f785ba4b59565d83db194b3998bf8a18488b188ef8a"),
        Target(34539, "distribution", 29512932, 114, "e4f60b0000c0000000000020", "dc444ea70a2ea6173d69f86147fd8df3d6ed6d0cb5ad2099f1fe25f0c97f823a", false, "f56ab0d287b3fb40a4c1f128ee1dd361c310e2858ea7cbcb73642fff8aad3fda"),
        Target(34540, "_flush", 29513046, 183, "10f70b0000c0000000000020", "fc89cd95532940cebef4c4dc8bb4154dc60a01a80734316d6c6345e8a6e1f335", false, "5987e7ea557c2424dcd66b2b998c6a488563c27085bdedd1268b5f4e8cbd7570"),
        Target(23150, "track", 28215915, 288, "d459040000c0000000000020", "451a7cb11d18cb6efef048b7f19f64567ef263b8a66f1ddc3ea45508d4bd0986", true, "ea2f2efff586f65c269b92d2f94b55a6a211f578f87d46ec114a3393b806bffc"),
        Target(82662, "track", 42435219, 544, "30402c0000c0000000000020", "b31cabeef5d72dc04157eb6e52f34c4d9187660433a6de8199c32f635fd442f4", true, "be54d0db7af9c03aa36468444ba42f22a7418eb3a10ed9f18d9f3119a5b039dd"),
        Target(82666, "drainEventsQueue", 42435919, 249, "dc402c0000c0000000000020", "e0db703ba3d77ee37f81f6bdba380a209ed43ce3e01fa5510848a0d6df752f8d", true, "f30ab74fe812b5e9dabd6c1b3f2729d241eb0e8ae6d851a8d822c0f47e281d38"),
        Target(82667, "submitEventsImmediately", 42436168, 251, "08412c0000c0000000000020", "12080c495df0902b5c8eb286c1e5d5330e7aa84674f5ba2ef62e264350d04bae", true, "8ac5a5ccd08c5d49251be4391b6da32b339533874bade997fc2dc6d16bc2d518"),
        Target(82668, "flushQueuedEvents", 42436419, 267, "34412c0000c0000000000020", "affb23bf3145a6b7604370b7d71f521726fda62fae3319271c05f8a4c0621b59", true, "a2cbe15880dd0e45b6547eea0652759fda9b845d1f4be96c88920d5fdfc82a4f"),
        Target(82669, "sendTelemetryEvent", 42436686, 347, "60412c0000c0000000000020", "0e72d1011e06dfd9f2c28c21b0acc735bbc683812494951fd9d2f8375587ade2", true, "8c58cfd90c11e0dc6aed1828d6dd858dec15a0d950b6d26036a252f92ff2f1d9"),
        Target(82665, "scheduleDrain", 42435763, 156, "b0402c0000c0000000000020", "3bc990ea806d7a0ff5d6e28fcbdc65f831b39c656a163cc98ed63683e479c551", false, "1111b69d32ee2232d81feaa45176381ae20e3fefb160f96601a78c17d67eabdf"),
        Target(23153, "startRecordingAnalyticsEvents", 28216239, 13, "545a040000c0000000000020", "645fedb3791434b0327d0906ba36e9092b6011627c08db439b28a0b7415f2037", false, "c3ccf2cac54d5a8008257f1bd1f14bd42bb345fd425836633eee0155ea271bf2"),
    )
    val telemetry = listOf(
        Target(19593, "shouldCollectMetrics", 27748438, 86, "40e7010000c0000000000020", "459f168035d1e23d3855acfb74e6c29853452e00b09a6b8e4b2df77bc07abee5", false, "3be2051df9658ef026e58cf783164590526e7ccb847ad6cb18ef620ca80471af"),
        Target(78572, "installWebsocketTelemetryHook", 41954992, 183, "e098290000c0000000000020", "3f1cdb8080c8b0259347e412d215b4e537eef1d2ae9d4c8b5d00b7e776224ba7", false, "c582d19a8321db3cde4ee2bf4bd7a6f8479215bc68755586bebfa23d7d2966d4"),
        Target(25121, "append", 28547339, 88, "60ac050000c0000000000020", "f7fe93698371e95e5cc721b4c480113b2337672e7d6f7405d52e268525989190", false, "4175511b62b31f1d2839b05202ec7bb4201a8aefd0ba086dbf41b9d09e98762a"),
        Target(25124, "append", 28547489, 52, "e4ac050000c0000000000020", "9a62a2e29a189159da35896e07cafa5f3f0147e3b06806ab93b09b1484b0c041", false, "c378c90a6b5e84242dec790c77048ead0c1fd52011e5a1eedc6120dcb3723d8a"),
    )
    val crash = listOf(
        Target(80849, "send", 42230438, 180, "cc142b0000c0000000000020", "e0850de5dce10088b3cd01f78249a8cd0314ec9c63c23b9b6364353f174ccbdc", true, "0caaa867dd1ae4d866279411f921afe4db5ac6d79cdd88f1017bb2539f0d60f8"),
        Target(111344, "send", 44533008, 181, "240c3f0000c0000000000020", "26eee6da7104655803cc039e945019112f253f50a30978fa591cc4c531ac0cd9", true, "bd3e709dc7aaecc9e1775437b3f223881a553a0a2d132ea433504eb1c776c18f"),
    )

    fun rewrite(bytes: ByteArray, targets: List<Target>): ByteArray {
        require(bytes.size >= 148) { "Truncated Hermes asset" }
        val header = ByteBuffer.wrap(bytes).order(ByteOrder.LITTLE_ENDIAN)
        require(header.getInt(8) == 98 && header.getInt(32) == bytes.size) { "Invalid HBC98 file header" }
        val inputFooter = MessageDigest.getInstance("SHA-1").apply { update(bytes, 0, bytes.size - 20) }.digest()
        require(inputFooter.contentEquals(bytes.copyOfRange(bytes.size - 20, bytes.size))) { "Invalid HBC footer" }
        // Validate all targets before changing anything; allow previously selected *other* privacy groups.
        for (target in targets) {
            require(bytes.copyOfRange(128 + target.id * 12, 140 + target.id * 12)
                .contentEquals(hex(target.header))) { "HBC header changed: ${target.name} #${target.id}" }
            val small = 128 + target.id * 12
            val expanded = (((header.getInt(small + 4) ushr 14) and 255) shl 24) or (header.getInt(small) and 0x1ffffff)
            require(digest(bytes.copyOfRange(expanded, expanded + 40)) == target.expandedHeaderHash) {
                "HBC expanded header changed: ${target.name} #${target.id}"
            }
            require(digest(bytes.copyOfRange(target.offset, target.offset + target.size)) == target.sha256) {
                "HBC body changed: ${target.name} #${target.id}"
            }
        }
        val result = bytes.copyOf()
        for (target in targets) {
            val stub = stub(target)
            require(stub.size <= target.size)
            // Unreachable (opcode 0) padding removes the old body and leaves valid instruction boundaries.
            result.fill(0, target.offset, target.offset + target.size)
            stub.copyInto(result, target.offset)
        }
        // Same length/tables/debug maps; only selected function bodies and the mandatory footer change.
        val footer = MessageDigest.getInstance("SHA-1").apply { update(result, 0, result.size - 20) }.digest()
        footer.copyInto(result, result.size - 20)
        return result
    }
    /**
     * Identical result to [rewrite], applied in place: validates every target first, then only
     * the selected function bodies and the SHA-1 footer are written. Streams the footer hashes
     * instead of loading and copying the whole bundle once per selected privacy group.
     */
    fun apply(file: File, targets: List<Target>) {
        RandomAccessFile(file, "rw").use { raf ->
            val length = raf.length()
            require(length >= 148) { "Truncated Hermes asset" }
            fun read(offset: Long, size: Int) = ByteArray(size).also { raf.seek(offset); raf.readFully(it) }
            val header = ByteBuffer.wrap(read(0, 128)).order(ByteOrder.LITTLE_ENDIAN)
            require(header.getInt(8) == 98 && header.getInt(32).toLong() == length) { "Invalid HBC98 file header" }
            require(streamDigest(file, "SHA-1", length - 20) == read(length - 20, 20).joinToString("") { "%02x".format(it) }) {
                "Invalid HBC footer"
            }
            for (target in targets) {
                val compact = read(128L + target.id * 12L, 12)
                require(compact.contentEquals(hex(target.header))) { "HBC header changed: ${target.name} #${target.id}" }
                val words = ByteBuffer.wrap(compact).order(ByteOrder.LITTLE_ENDIAN)
                val expanded = (((words.getInt(4) ushr 14) and 255) shl 24) or (words.getInt(0) and 0x1ffffff)
                require(digest(read(expanded.toLong(), 40)) == target.expandedHeaderHash) {
                    "HBC expanded header changed: ${target.name} #${target.id}"
                }
                require(digest(read(target.offset.toLong(), target.size)) == target.sha256) {
                    "HBC body changed: ${target.name} #${target.id}"
                }
            }
            for (target in targets) {
                val stub = stub(target)
                require(stub.size <= target.size)
                val body = ByteArray(target.size)
                stub.copyInto(body)
                raf.seek(target.offset.toLong())
                raf.write(body)
            }
            // Same-process writes are visible to the streamed read; no flush to disk needed.
            val footer = hex(streamDigest(file, "SHA-1", length - 20))
            raf.seek(length - 20)
            raf.write(footer)
        }
    }
}
