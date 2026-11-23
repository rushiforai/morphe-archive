package app.ckzorigins.patches.mono

import app.ckzorigins.patches.shared.applyEdits
import app.ckzorigins.patches.shared.toHex
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

class DllEditsTest {
    @Test
    fun `ammo bodies and rva partition the 194 ranges`() {
        assertEquals(10, DllEdits.AMMO.size)
        assertEquals(174, DllEdits.CURRENCY_BODIES.size)
        assertEquals(10, DllEdits.CURRENCY_RVA.size)
        assertEquals(6, DllEdits.HOSTS.size)
        assertEquals(1, DllEdits.FIRSTPASS_HOSTS.size)
        assertEquals(4, DllEdits.TAPJOY.size)
        assertEquals(1, DllEdits.AMMO_REFILL_POPUP.size)
        assertEquals(3, DllEdits.HUD_RELOAD.size)
        assertEquals(
            "assets/bin/Data/Managed/Assembly-CSharp-firstpass.dll",
            DllEdits.FIRSTPASS_PATH,
        )
        assertEquals(
            194,
            DllEdits.AMMO.size + DllEdits.CURRENCY_BODIES.size + DllEdits.CURRENCY_RVA.size,
        )
    }

    @Test
    fun `hosts skip ntp and s3 http then load bundled asset bundles`() {
        assertEquals(
            listOf(0x15C5, 0x2938, 0x3BE74, 0x3BF25, 0x43A35, 0xBB3D),
            DllEdits.HOSTS.map { it.offset },
        )
        assertTrue(DllEdits.HOSTS.none { it.offset == 0xBBF8 })
        assertEquals("027b2a0000043a18000000", DllEdits.HOSTS[0].old.toHex())
        assertEquals("02177d2b0000042a000000", DllEdits.HOSTS[0].new.toHex())
        assertEquals("167d7e000004", DllEdits.HOSTS[1].old.toHex())
        assertEquals("187d7e000004", DllEdits.HOSTS[1].new.toHex())
        assertEquals("160a", DllEdits.HOSTS[2].old.toHex())
        assertEquals("162a", DllEdits.HOSTS[2].new.toHex())
        assertEquals("02", DllEdits.HOSTS[3].old.toHex())
        assertEquals("2a", DllEdits.HOSTS[3].new.toHex())
        assertEquals("0a", DllEdits.HOSTS[4].old.toHex())
        assertEquals("2a", DllEdits.HOSTS[4].new.toHex())
        assertEquals("2817", DllEdits.HOSTS[5].old.toHex())
        assertEquals("162a", DllEdits.HOSTS[5].new.toHex())
        val data = ByteArray(DllEdits.HOSTS.maxOf { it.offset + it.old.size })
        for (edit in DllEdits.HOSTS) {
            edit.old.copyInto(data, edit.offset)
        }
        val patched = data.applyEdits(DllEdits.HOSTS)
        for (edit in DllEdits.HOSTS) {
            assertTrue(
                patched.copyOfRange(edit.offset, edit.offset + edit.new.size).contentEquals(edit.new),
            )
        }
    }

    @Test
    fun `firstpass hosts skip the glu games network www to m glu com`() {
        assertEquals(listOf(0x7E01), DllEdits.FIRSTPASS_HOSTS.map { it.offset })
        assertEquals("7e46010004390d000000", DllEdits.FIRSTPASS_HOSTS[0].old.toHex())
        assertEquals("162a0000000000000000", DllEdits.FIRSTPASS_HOSTS[0].new.toHex())
        assertEquals("16", DllEdits.FIRSTPASS_HOSTS[0].new.toHex().substring(0, 2))
        assertEquals("2a", DllEdits.FIRSTPASS_HOSTS[0].new.toHex().substring(2, 4))
        val data = ByteArray(DllEdits.FIRSTPASS_HOSTS.maxOf { it.offset + it.old.size })
        for (edit in DllEdits.FIRSTPASS_HOSTS) {
            edit.old.copyInto(data, edit.offset)
        }
        val patched = data.applyEdits(DllEdits.FIRSTPASS_HOSTS)
        for (edit in DllEdits.FIRSTPASS_HOSTS) {
            assertTrue(
                patched.copyOfRange(edit.offset, edit.offset + edit.new.size).contentEquals(edit.new),
            )
        }
    }

    @Test
    fun `tapjoy hides the get free credits button and skips the offerwall`() {
        assertEquals(listOf(0x473CD, 0x8F27D, 0x90438, 0x8F5B8), DllEdits.TAPJOY.map { it.offset })
        assertEquals("28", DllEdits.TAPJOY[0].old.toHex())
        assertEquals("2a", DllEdits.TAPJOY[0].new.toHex())
        assertEquals(27, DllEdits.TAPJOY[1].old.size)
        assertEquals(76, DllEdits.TAPJOY[2].old.size)
        assertEquals(76, DllEdits.TAPJOY[2].new.size)
        assertEquals(61, DllEdits.TAPJOY[3].old.size)
        assertEquals(61, DllEdits.TAPJOY[3].new.size)
        assertTrue(
            DllEdits.TAPJOY[3].new.toHex().startsWith("027b781300046f8f01000a166fea02000a2a"),
        )
        assertTrue(
            DllEdits.TAPJOY[2].new.toHex().startsWith(
                "027b751300046f8f01000a166fea02000a027b77130004",
            ),
        )
        val data = ByteArray(DllEdits.TAPJOY.maxOf { it.offset + it.old.size })
        for (edit in DllEdits.TAPJOY) {
            edit.old.copyInto(data, edit.offset)
        }
        val patched = data.applyEdits(DllEdits.TAPJOY)
        for (edit in DllEdits.TAPJOY) {
            assertTrue(
                patched.copyOfRange(edit.offset, edit.offset + edit.new.size).contentEquals(edit.new),
            )
        }
    }

    @Test
    fun `no two ranges overlap`() {
        val all = DllEdits.AMMO + DllEdits.CURRENCY_BODIES + DllEdits.CURRENCY_RVA +
            DllEdits.HOSTS + DllEdits.TAPJOY + DllEdits.AMMO_REFILL_POPUP + DllEdits.HUD_RELOAD
        val firstpass = DllEdits.FIRSTPASS_HOSTS.sortedBy { it.offset }
        val sorted = all.sortedBy { it.offset }
        for (i in 0 until sorted.lastIndex) {
            val a = sorted[i]
            val b = sorted[i + 1]
            assertTrue(
                a.offset + a.old.size <= b.offset,
                "0x${a.offset.toString(16)} overlaps 0x${b.offset.toString(16)}",
            )
        }
        for (i in 0 until firstpass.lastIndex) {
            val a = firstpass[i]
            val b = firstpass[i + 1]
            assertTrue(
                a.offset + a.old.size <= b.offset,
                "firstpass 0x${a.offset.toString(16)} overlaps 0x${b.offset.toString(16)}",
            )
        }
    }

    @Test
    fun `old and new of each range have the same length`() {
        for (edit in DllEdits.AMMO + DllEdits.CURRENCY_BODIES + DllEdits.CURRENCY_RVA +
            DllEdits.HOSTS + DllEdits.FIRSTPASS_HOSTS + DllEdits.TAPJOY + DllEdits.AMMO_REFILL_POPUP +
            DllEdits.HUD_RELOAD
        ) {
            assertEquals(edit.old.size, edit.new.size, "0x${edit.offset.toString(16)}")
            assertTrue(edit.old.isNotEmpty(), "0x${edit.offset.toString(16)}")
        }
    }

    @Test
    fun `applyEdits writes every range when old bytes match`() {
        val size = (DllEdits.AMMO + DllEdits.CURRENCY_BODIES + DllEdits.CURRENCY_RVA)
            .maxOf { it.offset + it.old.size }
        val data = ByteArray(size)
        for (edit in DllEdits.AMMO) {
            edit.old.copyInto(data, edit.offset)
        }
        val patched = data.applyEdits(DllEdits.AMMO)
        for (edit in DllEdits.AMMO) {
            assertTrue(
                patched.copyOfRange(edit.offset, edit.offset + edit.new.size).contentEquals(edit.new),
                "0x${edit.offset.toString(16)}",
            )
        }
    }

    @Test
    fun `applyEdits refuses a range whose old bytes do not match`() {
        val data = ByteArray(0x6A450)
        DllEdits.AMMO[0].old.copyInto(data, DllEdits.AMMO[0].offset)
        assertFailsWith<IllegalStateException> { data.applyEdits(DllEdits.AMMO) }
    }

    @Test
    fun `ammo refill popup nops ShowInfoPopup after AddConsumable`() {
        val edit = DllEdits.AMMO_REFILL_POPUP.single()
        assertEquals(0xA63D5, edit.offset)
        assertEquals("28701000067bcd170004728240017028ca0d00066f4420000626", edit.old.toHex())
        assertEquals("0000000000000000000000000000000000000000000000000000", edit.new.toHex())
        val data = ByteArray(edit.offset + edit.old.size)
        edit.old.copyInto(data, edit.offset)
        val patched = data.applyEdits(DllEdits.AMMO_REFILL_POPUP)
        assertEquals(
            edit.new.toHex(),
            patched.copyOfRange(edit.offset, edit.offset + edit.new.size).toHex(),
        )
    }

    @Test
    fun `reload hud writes cache 0 while reloading and prints that cache`() {
        assertEquals(listOf(0x9BE55, 0x9BE82, 0x9BEC2), DllEdits.HUD_RELOAD.map { it.offset })
        assertEquals(34, DllEdits.HUD_RELOAD[0].old.size)
        assertEquals(6, DllEdits.HUD_RELOAD[1].old.size)
        assertEquals(12, DllEdits.HUD_RELOAD[2].old.size)
        val data = ByteArray(DllEdits.HUD_RELOAD.maxOf { it.offset + it.old.size })
        for (edit in DllEdits.HUD_RELOAD) {
            edit.old.copyInto(data, edit.offset)
        }
        val patched = data.applyEdits(DllEdits.HUD_RELOAD)
        for (edit in DllEdits.HUD_RELOAD) {
            assertEquals(
                edit.new.toHex(),
                patched.copyOfRange(edit.offset, edit.offset + edit.new.size).toHex(),
                "0x${edit.offset.toString(16)}",
            )
        }
    }
}
