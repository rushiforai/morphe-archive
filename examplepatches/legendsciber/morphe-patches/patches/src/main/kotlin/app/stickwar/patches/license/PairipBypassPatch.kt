package app.stickwar.patches.license

import app.morphe.patcher.patch.rawResourcePatch
import app.stickwar.patches.shared.Constants.COMPATIBILITY_STICKWAR
import java.security.MessageDigest
import java.util.zip.Adler32

private val ENTRY_CHECKS = byteArrayOf(
    0x71, 0x10, 0x39, 0xF2.toByte(), 0x01, 0x00,
    0x71, 0x10, 0xC1.toByte(), 0xF2.toByte(), 0x01, 0x00,
)
private val ENTRY_CHECKS_NOP = ByteArray(12)

@Suppress("unused")
val stickWarPairipBypassPatch = rawResourcePatch(
    name = "Stick War Legacy License Bypass",
    description = "Skips the signature and Play Store license checks at startup so the game launches without Google Play verification.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_STICKWAR)

    execute {
        val dexFile = get("classes.dex", true)
        val bytes = dexFile.readBytes()

        var count = 0
        var at = -1
        var i = 0
        while (i <= bytes.size - ENTRY_CHECKS.size) {
            var match = true
            var j = 0
            while (j < ENTRY_CHECKS.size) {
                if (bytes[i + j] != ENTRY_CHECKS[j]) {
                    match = false
                    break
                }
                j++
            }
            if (match) {
                count++
                at = i
                if (count > 1) break
            }
            i++
        }
        require(count == 1) { "entry check site not unique: $count matches" }
        ENTRY_CHECKS_NOP.copyInto(bytes, at)

        val signature = MessageDigest.getInstance("SHA-1").digest(bytes.copyOfRange(32, bytes.size))
        signature.copyInto(bytes, 12)
        val adler = Adler32()
        adler.update(bytes, 12, bytes.size - 12)
        val checksum = adler.value
        bytes[8] = (checksum and 0xFF).toByte()
        bytes[9] = ((checksum shr 8) and 0xFF).toByte()
        bytes[10] = ((checksum shr 16) and 0xFF).toByte()
        bytes[11] = ((checksum shr 24) and 0xFF).toByte()

        dexFile.writeBytes(bytes)
    }
}
