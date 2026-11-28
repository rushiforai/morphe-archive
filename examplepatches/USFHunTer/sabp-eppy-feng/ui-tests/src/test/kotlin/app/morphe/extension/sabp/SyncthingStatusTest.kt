package app.morphe.extension.sabp

import org.json.JSONArray
import org.json.JSONObject
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Test

/** Syncthing status: its REST answers turned into paired devices and folders, and a book folder found among them. */
class SyncthingStatusTest {
    private val me = "AAAAAAA-1111111"
    private val tablet = "BBBBBBB-2222222"
    private val old = "CCCCCCC-3333333"

    private fun status() = SyncthingStatus.parse(
        me,
        JSONArray("""[{"deviceID":"$me","name":"Phone"},{"deviceID":"$tablet","name":"Tablet"},{"deviceID":"$old","name":""}]"""),
        JSONObject("""{"$tablet":{"connected":true},"$old":{"connected":false}}"""),
        JSONObject("""{"$tablet":{"lastSeen":"2026-11-26T10:00:00.5+01:00"},"$old":{"lastSeen":"1970-01-01T00:00:00Z"}}"""),
        JSONArray("""[{"id":"books","label":"Audiobooks","path":"/storage/emulated/0/Audiobooks/","devices":[{"deviceID":"$me"},{"deviceID":"$tablet"}]}]"""),
        mapOf("books" to JSONObject("""{"state":"syncing","needFiles":12,"needDeletes":0}""")),
    )

    @Test
    fun devices() {
        val s = status()
        assertEquals(listOf("Phone", "Tablet", "CCCCCCC"), s.devices.map { it.name })
        assertTrue(s.devices[0].self)
        assertTrue(s.devices[1].connected)
        assertEquals(1_795_683_600_500L, s.devices[1].lastSeen)
        assertEquals(0L, s.devices[2].lastSeen) // never seen
    }

    @Test
    fun folders() {
        val f = status().folders.single()
        assertEquals("Audiobooks", f.label)
        assertEquals(listOf(tablet), f.devices) // without this device
        assertEquals("Syncing, 12 files to go", SyncthingStatus.folderState(f))
        f.state = "idle"; f.needFiles = 0
        assertEquals("Up to date", SyncthingStatus.folderState(f))
    }

    @Test
    fun bookFolderPaths() {
        assertEquals("/storage/emulated/0/Audiobooks/Book One",
            SyncthingStatus.bookPath("content://com.android.externalstorage.documents/tree/primary%3AAudiobooks/document/primary%3AAudiobooks%2FBook%20One"))
        assertEquals("/storage/1234-ABCD/Books", SyncthingStatus.bookPath("content://com.android.externalstorage.documents/tree/1234-ABCD%3ABooks"))
        assertEquals("/sdcard/x", SyncthingStatus.bookPath("/sdcard/x"))
        assertNull(SyncthingStatus.bookPath("content://other/thing"))
    }

    @Test
    fun findsTheFolderHoldingTheBook() {
        assertTrue(SyncthingStatus.holds("/storage/emulated/0/Audiobooks/", "/storage/emulated/0/Audiobooks/Book One"))
        assertTrue(SyncthingStatus.holds("/sdcard/Audiobooks", "/storage/emulated/0/Audiobooks/Book One"))
        assertFalse(SyncthingStatus.holds("/storage/emulated/0/Audio", "/storage/emulated/0/Audiobooks/Book One"))
        val book = "content://com.android.externalstorage.documents/tree/primary%3AAudiobooks/document/primary%3AAudiobooks%2FBook%20One"
        assertEquals("books", SyncthingStatus.folderOf(status(), book)!!.id)
    }
}
