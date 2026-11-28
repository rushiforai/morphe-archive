package app.morphe.extension.sabp

import ak.alizandro.smartaudiobookplayer.BookDataBackup
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.ByteArrayInputStream
import java.io.ByteArrayOutputStream
import java.io.InvalidClassException
import java.io.ObjectOutputStream

/** The other device's position: reading SABP's position.sabp.dat and deciding whether to offer it. */
class OtherDevicePositionTest {
    private fun bytes(o: Any) = ByteArrayOutputStream().also { ObjectOutputStream(it).use { s -> s.writeObject(o) } }.toByteArray()

    private fun there(file: String, sec: Int, at: Long) = OtherDevicePosition(file, sec, at)

    @Test
    fun readsSabpsBackup() {
        val p = OtherDevicePosition.parse(ByteArrayInputStream(bytes(BookDataBackup("Part 2.m4b", 3725, 1_700_000_000_000L))))!!
        assertEquals("Part 2.m4b", p.fileName)
        assertEquals(3725, p.seconds)
        assertEquals(1_700_000_000_000L, p.lastPlayed)
    }

    @Test
    fun noFileNameMeansNothingToOffer() {
        assertNull(OtherDevicePosition.parse(ByteArrayInputStream(bytes(BookDataBackup(null, 10, 5L)))))
    }

    @Test
    fun refusesAnythingButSabpsClassesAndPlainValues() {
        try {
            OtherDevicePosition.parse(ByteArrayInputStream(bytes(java.util.HashMap<String, String>())))
            throw AssertionError("a HashMap was deserialised")
        } catch (e: InvalidClassException) {
            // expected
        }
        assertTrue(OtherDevicePosition.allowed("ak.alizandro.smartaudiobookplayer.EqualizerLevels"))
        assertTrue(OtherDevicePosition.allowed("[S"))
        assertFalse(OtherDevicePosition.allowed("java.util.HashMap"))
        assertFalse(OtherDevicePosition.allowed("[Ljava.lang.Object;"))
    }

    @Test
    fun offersOnlyTheOtherDevicesPositionElsewhere() {
        val saved = 1_000L // this device's last save of the file
        fun cmp(t: OtherDevicePosition?, savedHere: Long? = saved) = OtherDevicePosition.compare("a.mp3", 100, savedHere, t)
        assertEquals("written here", OtherDevicePosition.MINE, cmp(there("a.mp3", 900, saved)))
        assertEquals("within 30 s", OtherDevicePosition.SAME_PLACE, cmp(there("a.mp3", 130, 2_000)))
        assertEquals("31 s on", OtherDevicePosition.OFFER, cmp(there("a.mp3", 131, 2_000)))
        assertEquals("31 s back", OtherDevicePosition.OFFER, cmp(there("a.mp3", 69, 2_000)))
        assertEquals("another file", OtherDevicePosition.OFFER, cmp(there("b.mp3", 100, 2_000)))
        // The other device's clock may be behind: who wrote it decides, not which stamp is bigger.
        assertEquals("other device, earlier clock", OtherDevicePosition.OFFER, cmp(there("a.mp3", 900, 500)))
        assertEquals("no save recorded yet: the place decides", OtherDevicePosition.OFFER, cmp(there("a.mp3", 900, 500), null))
        assertEquals("no file", OtherDevicePosition.NONE, cmp(null))
    }

    @Test
    fun readsThePcsPositionFile() {
        fun pc(json: String) = OtherDevicePosition.parsePc(ByteArrayInputStream(json.toByteArray()))
        val p = pc("""{"v":1,"file":"Part 2.m4b","seconds":3725,"lastPlayed":1700000000000}""")!!
        assertEquals("Part 2.m4b", p.fileName)
        assertEquals(3725, p.seconds)
        assertEquals("PC", p.device)
        assertNull("unknown version", pc("""{"v":2,"file":"a.mp3","seconds":1,"lastPlayed":5}"""))
        assertNull("no file", pc("""{"v":1,"seconds":1,"lastPlayed":5}"""))
    }

    @Test
    fun picksTheMostRecentlyPlayedOtherPosition() {
        val saved = 1_000L // this device's last save of position.sabp.dat
        val mine = there("a.mp3", 10, saved)
        val tablet = there("a.mp3", 20, 3_000)
        fun pc(at: Long) = OtherDevicePosition("a.mp3", 30, at, "PC")
        assertEquals("PC newer than the tablet", 30, OtherDevicePosition.pick(tablet, pc(4_000), saved)!!.seconds)
        assertEquals("tablet newer than the PC", 20, OtherDevicePosition.pick(tablet, pc(2_000), saved)!!.seconds)
        assertEquals("only the PC played since this device saved", 30, OtherDevicePosition.pick(mine, pc(2_000), saved)!!.seconds)
        assertEquals("PC older than this device's save: this device's own", OtherDevicePosition.MINE,
            OtherDevicePosition.compare("a.mp3", 10, saved, OtherDevicePosition.pick(mine, pc(500), saved)))
        assertEquals("no SABP file", 30, OtherDevicePosition.pick(null, pc(2_000), null)!!.seconds)
        assertNull("nothing", OtherDevicePosition.pick(null, null, null))
    }
}
