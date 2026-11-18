package app.template.patches.gardenscapes

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.security.MessageDigest
import java.util.Base64

/** Exact-build native patch: never apply offsets to an unrecognized library. */
internal object GardenscapesElfRepair {
    private const val LIBRARY_SHA256 = "3a15c3c170c21a12b5f0253a9421b6bc41707f4e34285acbbcae8afde4851c5c"
    private const val SEGMENT_ADDRESS = 0x79a0000L
    private const val HOOK_ADDRESS = 0x79a1000L
    private const val GET_STARS = 0x3c15ad8
    private const val INVALID_CERTIFICATE_MESSAGE_CALL = 0x3c25570

    fun apply(original: ByteArray, payload: ByteArray): ByteArray {
        val digest = MessageDigest.getInstance("SHA-256").digest(original)
            .joinToString("") { "%02x".format(it) }
        require(digest == LIBRARY_SHA256) { "Unrecognized Gardenscapes arm64 libgame.so. Use the original 9.9.0 build; modified libraries are not supported." }
        require(payload.isNotEmpty() && payload.size < 0x3000) { "Invalid repair payload" }
        val source = ByteBuffer.wrap(original).order(ByteOrder.LITTLE_ENDIAN)
        require(source.getShort(18).toInt() == 183 && source.getShort(54).toInt() == 56)
        require(source.getInt(GET_STARS) == 0xf81e0ffe.toInt()) { "Garden star-balance getter prologue changed" }
        require(source.getInt(INVALID_CERTIFICATE_MESSAGE_CALL) == 0x97ffffc0.toInt()) {
            "Invalid-certificate message call changed"
        }
        val oldHeaders = source.getLong(32).toInt()
        val count = source.getShort(56).toInt()
        require(count == 9)
        val newOffset = (original.size + 0x3fff) and -0x4000
        val output = original.copyOf(newOffset + 0x1000 + payload.size)
        val target = ByteBuffer.wrap(output).order(ByteOrder.LITTLE_ENDIAN)
        var foundPhdr = false
        for (i in 0 until count) {
            val old = oldHeaders + i * 56
            val new = newOffset + i * 56
            original.copyInto(output, new, old, old + 56)
            when (source.getInt(old)) {
                1 -> require(source.getLong(old + 16) + source.getLong(old + 40) <= SEGMENT_ADDRESS)
                6 -> {
                    foundPhdr = true
                    target.putLong(new + 8, newOffset.toLong())
                    target.putLong(new + 16, SEGMENT_ADDRESS)
                    target.putLong(new + 24, SEGMENT_ADDRESS)
                    target.putLong(new + 32, (count + 1) * 56L)
                    target.putLong(new + 40, (count + 1) * 56L)
                }
            }
        }
        require(foundPhdr)
        val load = newOffset + count * 56
        target.putInt(load, 1) // PT_LOAD, read/execute only; never writable code.
        target.putInt(load + 4, 5)
        target.putLong(load + 8, newOffset.toLong())
        target.putLong(load + 16, SEGMENT_ADDRESS)
        target.putLong(load + 24, SEGMENT_ADDRESS)
        target.putLong(load + 32, 0x1000L + payload.size)
        target.putLong(load + 40, 0x1000L + payload.size)
        target.putLong(load + 48, 0x4000)
        payload.copyInto(output, newOffset + 0x1000)
        target.putLong(32, newOffset.toLong())
        target.putShort(56, (count + 1).toShort())
        val displacement = HOOK_ADDRESS - GET_STARS
        require(displacement % 4 == 0L && displacement in -(1L shl 27) until (1L shl 27))
        target.putInt(GET_STARS, 0x14000000 or ((displacement / 4).toInt() and 0x03ffffff))
        // Re-signing the repaired APK triggers this local installation dialog.
        // Skip only the call to AndroidUtils::ShowInvalidCertificateMessage().
        // Certificate evaluation and account/server restriction paths stay intact.
        target.putInt(INVALID_CERTIFICATE_MESSAGE_CALL, 0xd503201f.toInt()) // NOP
        return output
    }
}

@Suppress("unused")
val repairGardenscapesNegativeStarsPatch = rawResourcePatch(
    name = "Repair negative stars once",
    description = "Repairs a negative saved star balance to 2 when the garden reads it, once per installation, and skips the local unofficial-install dialog. No level completion needed. Gardenscapes 9.9.0 ARM64 only. Experimental.",
    default = true,
) {
    dependsOn(playGamesDiagnostics)
    compatibleWith(Compatibility(
        name = "Gardenscapes", packageName = "com.playrix.gardenscapes",
        apkFileType = ApkFileType.XAPK, appIconColor = 0x58A433,
        targets = listOf(AppTarget(version = "9.9.0", isExperimental = true)),
    ))
    execute {
        val library = get("lib/arm64-v8a/libgame.so")
        if (!library.isFile) throw PatchException("Gardenscapes repair requires the ARM64 native library from the full XAPK.")
        val encoded = GardenscapesElfRepair::class.java.getResourceAsStream("/gardenscapes/repair-arm64.b64")
            ?.bufferedReader()?.use { it.readText().trim() }
            ?: throw PatchException("Gardenscapes repair payload is missing from the patch bundle.")
        val repaired = GardenscapesElfRepair.apply(library.readBytes(), Base64.getDecoder().decode(encoded))
        library.writeBytes(repaired)
    }
}
