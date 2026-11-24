package patches.shared

import org.junit.Assert.*
import org.junit.Test
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.nio.file.Files
import java.security.MessageDigest

class RovioPaidShopTest {
    private fun original(): ByteArray {
        val b = ByteBuffer.allocate(1024).order(ByteOrder.LITTLE_ENDIAN)
        b.putInt(0, 0x464c457f); b.putShort(4, 0x0102); b.putShort(18, 183)
        b.putLong(32, 64); b.putLong(40, 768); b.putShort(54, 56); b.putShort(56, 3)
        b.putShort(58, 64); b.putShort(60, 2)
        fun segment(i: Int, flags: Int, offset: Long, address: Long, size: Long) {
            val p = 64 + i * 56
            b.putInt(p, 1); b.putInt(p + 4, flags); b.putLong(p + 8, offset)
            b.putLong(p + 16, address); b.putLong(p + 32, size); b.putLong(p + 40, size)
            b.putLong(p + 48, 0x4000)
        }
        segment(0, 4, 0, 0, 256); segment(1, 5, 256, 256, 256)
        segment(2, 6, 512, 0x4200, 256)
        b.putLong(768 + 24, 256); b.putLong(832 + 24, 512)
        b.putInt(288, 0xf81d0ffe.toInt())
        for (i in 512 until 768) b.put(i, i.toByte())
        return b.array()
    }
    private fun plan(bytes: ByteArray) = PaidShopPlan(
        MessageDigest.getInstance("SHA-256").digest(bytes).joinToString("") { "%02x".format(it.toInt() and 255) },
        512, 512, "1f2003d5", listOf(PaidShopEdit("shop route", 288, "fe0f1df8000000000000000000000000", "01000014")),
    )
    @Test fun insertedCodePreservesVirtualDataAddressesAndMovesFileTables() {
        val file = Files.createTempFile("rovio-paid-shop", ".so").toFile()
        try {
            val original = original(); file.writeBytes(original); applyPaidShopPlan(file, plan(original))
            val changed = file.readBytes(); val b = ByteBuffer.wrap(changed).order(ByteOrder.LITTLE_ENDIAN)
            assertEquals(original.size + 0x4000, changed.size)
            assertEquals(768L + 0x4000, b.getLong(40))
            assertEquals(512L + 0x4000, b.getLong(64 + 2 * 56 + 8))
            assertEquals(0x4200L, b.getLong(64 + 2 * 56 + 16))
            assertEquals(260L, b.getLong(64 + 56 + 32))
            assertEquals(260L, b.getLong(64 + 56 + 40))
            assertEquals(256L, b.getLong(768 + 0x4000 + 24))
            assertEquals(512L + 0x4000, b.getLong(832 + 0x4000 + 24))
            assertArrayEquals(original.copyOfRange(512, 768), changed.copyOfRange(512 + 0x4000, 768 + 0x4000))
            assertArrayEquals(byteArrayOf(0x1f, 0x20, 3, 0xd5.toByte()), changed.copyOfRange(512, 516))
            assertArrayEquals(byteArrayOf(1, 0, 0, 0x14), changed.copyOfRange(288, 292))
            assertArrayEquals(original.copyOfRange(292, 304), changed.copyOfRange(292, 304))
        } finally { file.delete() }
    }
    @Test fun changedEntryIsRejectedWithoutModifyingTheOriginal() {
        val file = Files.createTempFile("rovio-paid-shop-guard", ".so").toFile()
        try {
            val original = original(); file.writeBytes(original)
            val wrong = plan(original).copy(edits = listOf(PaidShopEdit("changed", 288, "ffffffff", "01000014")))
            assertThrows(IllegalStateException::class.java) { applyPaidShopPlan(file, wrong) }
            assertArrayEquals(original, file.readBytes())
        } finally { file.delete() }
    }
}
