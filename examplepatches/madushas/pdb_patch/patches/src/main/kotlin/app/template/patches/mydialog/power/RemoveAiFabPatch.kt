package app.template.patches.mydialog.power

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import app.template.patches.shared.Constants.MYDIALOG_COMPATIBILITY
import java.io.FileNotFoundException
import java.security.MessageDigest

private const val BUNDLE = "assets/index.android.bundle"
private val HERMES_MAGIC = byteArrayOf(
    0xC6.toByte(), 0x1F, 0xBC.toByte(), 0x03, 0xC1.toByte(), 0x03, 0x19, 0x1F,
)

/**
 * Two display tweaks, both done as same-length byte edits inside the Hermes
 * bundle (strings are (offset,length)-addressed and stored back-to-back, so a
 * replacement must be exactly as long as the pattern; the SHA-1 trailer is
 * recomputed afterwards — Hermes v96 keeps a 20-byte trailer):
 *
 * 1. "fabItems" (unique, 8 bytes) -> "fabItem0": every `localConfig.fabItems`
 *    lookup in the JS resolves undefined, so the server-driven AI overlay FAB
 *    ("Help center" / "Request status" / "Chat with Dia") never renders. The
 *    FAB is pure JS (zero native consumers — verified by code recon), so this
 *    is the complete removal. "fabImage" (unique, 8 bytes) -> "fabImag0" as
 *    belt-and-braces for the icon id.
 * 2. "Device ID" (unique, 9 bytes, the side-menu footer row label)
 *    -> "ID ⚡5.4" (9 bytes UTF-8): the footer now reads
 *    "ID ⚡<patch-version>: <device id>", surfacing the installed patch
 *    release. The app-version row is deliberately NOT touched — its values
 *    (config.appVersion/appBuildNo) feed every API request body, and
 *    polluting them risks server-side format checks. Bump the label text on
 *    each patch release.
 */
@Suppress("unused")
val myDialogRemoveAiFabPatch = rawResourcePatch(
    name = "Remove AI assistant FAB (+ footer patch id)",
    description = "Removes the server-driven AI overlay FAB from every screen " +
        "and surfaces the Morphe patch version on the side-menu footer " +
        "(\"ID ⚡<version>\" next to the device id).",
    default = true,
) {
    compatibleWith(MYDIALOG_COMPATIBILITY)

    execute {
        val file = get(BUNDLE, true)
        if (!file.exists()) throw FileNotFoundException("Hermes bundle missing at $BUNDLE")

        var bytes = file.readBytes()
        if (!bytes.copyOfRange(0, HERMES_MAGIC.size).contentEquals(HERMES_MAGIC)) {
            throw PatchException("Not a Hermes bytecode bundle: $BUNDLE")
        }
        val version = (bytes[8].toInt() and 0xFF) or
            ((bytes[9].toInt() and 0xFF) shl 8) or
            ((bytes[10].toInt() and 0xFF) shl 16) or
            ((bytes[11].toInt() and 0xFF) shl 24)

        fun replaceUnique(pattern: String, replacement: String) {
            val p = pattern.toByteArray(Charsets.UTF_8)
            val r = replacement.toByteArray(Charsets.UTF_8)
            if (p.size != r.size) throw PatchException("size mismatch: $pattern")
            var at = bytes.indexOf(p)
            if (at < 0) throw PatchException("pattern not found: $pattern")
            if (bytes.indexOf(p, at + 1) >= 0) throw PatchException("pattern not unique: $pattern")
            p.forEachIndexed { i, b -> bytes[at + i] = r[i] }
        }

        replaceUnique("fabItems", "fabItem0")
        replaceUnique("fabImage", "fabImag0")
        replaceUnique("Device ID", "ID ⚡5.4")

        if (version > 74) {
            val content = bytes.dropLast(20).toByteArray()
            bytes = content + MessageDigest.getInstance("SHA-1").digest(content)
        }
        file.writeBytes(bytes)
    }
}

private fun ByteArray.indexOf(pattern: ByteArray, from: Int = 0): Int {
    var i = from
    outer@ while (i <= size - pattern.size) {
        for (j in pattern.indices) {
            if (this[i + j] != pattern[j]) {
                i++; continue@outer
            }
        }
        return i
    }
    return -1
}
