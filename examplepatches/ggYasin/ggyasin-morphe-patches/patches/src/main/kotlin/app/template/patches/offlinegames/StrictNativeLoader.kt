package app.template.patches.offlinegames

import app.morphe.patcher.patch.PatchException
import java.io.File
import java.security.MessageDigest

/** Disable libmain's basename dlopen fallback on both verified Unity builds.
 * On explicit-path failure, return through the normal epilogue with the output
 * handle still null. The Java finishLoad gate then reports failure; do not enter
 * libmain's FatalError path or silently resolve an installed library by name.
 */
internal fun makeNativeLoaderStrict(file: File, abi: String) {
    val (size, hash, edit) = when (abi) {
        "arm64-v8a" -> Triple(6728,
            "e6ee684092c38dd1f604c572506ada33238dd94fb0ac0220b06d4d82ead2cf31",
            NativeEdit("libmain explicit-load failure", 0xD54, "21 00 80 52", "1e 00 00 14"))
        "armeabi-v7a" -> Triple(8588,
            "ab65bef5c126f6e03face43d2785f6a324959c88a6f21df155d19c848ed8ed31",
            NativeEdit("libmain explicit-load failure", 0xBD8, "30 46", "32 e0"))
        else -> throw PatchException("Unsupported native loader ABI: $abi")
    }
    val bytes = file.readBytes()
    if (bytes.size != size) throw PatchException("Unsupported $abi libmain.so size")
    val actual = bytes.copyOfRange(edit.offset, edit.offset + edit.original.size)
    if (!actual.contentEquals(edit.original) && !actual.contentEquals(edit.replacement)) {
        throw PatchException("Unknown $abi libmain.so loader instructions")
    }
    val normalized = bytes.copyOf()
    edit.original.copyInto(normalized, edit.offset)
    val digest = MessageDigest.getInstance("SHA-256").digest(normalized)
        .joinToString("") { "%02x".format(it.toInt() and 0xff) }
    if (digest != hash) throw PatchException("Unknown modifications in $abi libmain.so")
    edit.replacement.copyInto(bytes, edit.offset)
    file.writeBytes(bytes)
    check(file.readBytes().contentEquals(bytes)) { "Native loader read-back failed" }
}
