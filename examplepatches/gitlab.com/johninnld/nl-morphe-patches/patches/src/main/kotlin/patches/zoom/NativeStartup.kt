package patches.zoom

import app.morphe.patcher.patch.resourcePatch
import java.security.MessageDigest

private const val LOADER = "lib/arm64-v8a/libzLoader.so"
private const val LOADER_SIZE = 216824
private const val LOADER_SHA256 = "5d786d3078128958dad193c97581cc3aaf1b8d67591f14bd9197994e3761a2b6"
internal const val SIGNING_CHECK_OFFSET = 0x17508
private val originalEntry = byteArrayOf(0xff.toByte(), 0x43, 0x02, 0xd1.toByte(), 0xfd.toByte(), 0x7b, 0x06, 0xa9.toByte())
private val allowCertificate = byteArrayOf(0x20, 0x00, 0x80.toByte(), 0x52, 0xc0.toByte(), 0x03, 0x5f, 0xd6.toByte())

/**
 * The pinned ELF's executable PT_LOAD maps file offset zero to virtual zero.
 * At 0x17508 the local predicate compares the APK certificate MD5 with four
 * decoded fingerprints. Its sole resolved caller is initMainboardImpl, which
 * sends SIGKILL to itself on rejection. Return true at that predicate's entry;
 * preserve the native mainboard, crash handler, account and network code.
 */
internal fun patchNativeStartup(input: ByteArray): ByteArray {
    check(input.size == LOADER_SIZE) { "Unsupported Zoom native loader size" }
    val digest = MessageDigest.getInstance("SHA-256").digest(input)
        .joinToString("") { "%02x".format(it.toInt() and 0xff) }
    check(digest == LOADER_SHA256) { "Unsupported Zoom native loader hash or patch already applied" }
    check(input.copyOfRange(SIGNING_CHECK_OFFSET, SIGNING_CHECK_OFFSET + originalEntry.size)
        .contentEquals(originalEntry)) { "Zoom native certificate predicate changed" }
    return input.copyOf().also { allowCertificate.copyInto(it, SIGNING_CHECK_OFFSET) }
}

internal val nativeStartupCompatibility = resourcePatch {
    dependsOn(originalInput)
    execute {
        val loaders = listApkEntries("lib").filter { it.endsWith("/libzLoader.so") }.toSet()
        check(loaders == setOf(LOADER)) { "Select the complete original ARM64 Zoom split archive" }
        val file = get(LOADER)
        file.writeBytes(patchNativeStartup(file.readBytes()))
    }
}
