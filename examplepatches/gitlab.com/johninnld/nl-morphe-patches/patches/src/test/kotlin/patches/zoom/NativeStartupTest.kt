package patches.zoom

import org.junit.Assert.*
import org.junit.Assume.assumeNotNull
import org.junit.Test
import java.io.File
import java.util.zip.ZipFile

class NativeStartupTest {
    private fun original(): ByteArray {
        val base = System.getenv("ZOOM_ORIGINAL_APK")
        assumeNotNull(base)
        val split = File(base!!).parentFile.resolve("split_config.arm64_v8a.apk")
        return ZipFile(split).use { zip ->
            zip.getInputStream(zip.getEntry("lib/arm64-v8a/libzLoader.so")).use { it.readBytes() }
        }
    }

    @Test fun onlyNativeCertificatePredicateEntryChanges() {
        val input = original()
        val preserved = input.copyOf()
        val output = patchNativeStartup(input)
        assertArrayEquals(preserved, input)
        assertEquals(input.size, output.size)
        assertArrayEquals(byteArrayOf(0x20, 0, 0x80.toByte(), 0x52, 0xc0.toByte(), 3, 0x5f, 0xd6.toByte()),
            output.copyOfRange(SIGNING_CHECK_OFFSET, SIGNING_CHECK_OFFSET + 8))
        assertArrayEquals(input.copyOfRange(0, SIGNING_CHECK_OFFSET), output.copyOfRange(0, SIGNING_CHECK_OFFSET))
        assertArrayEquals(input.copyOfRange(SIGNING_CHECK_OFFSET + 8, input.size),
            output.copyOfRange(SIGNING_CHECK_OFFSET + 8, output.size))
        assertThrows(IllegalStateException::class.java) { patchNativeStartup(output) }
    }

    @Test fun changedImageAndTruncatedInputAreRejectedWithoutMutation() {
        val changed = original().also { it[it.lastIndex] = (it.last().toInt() xor 1).toByte() }
        val preserved = changed.copyOf()
        assertThrows(IllegalStateException::class.java) { patchNativeStartup(changed) }
        assertArrayEquals(preserved, changed)
        assertThrows(IllegalStateException::class.java) { patchNativeStartup(changed.copyOf(64)) }
    }
}
