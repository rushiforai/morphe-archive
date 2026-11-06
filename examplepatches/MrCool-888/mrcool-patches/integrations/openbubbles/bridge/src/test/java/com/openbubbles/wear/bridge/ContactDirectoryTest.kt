package com.openbubbles.wear.bridge

import android.Manifest
import android.app.Application
import android.content.ContentProvider
import android.content.ContentValues
import android.content.Context
import android.database.Cursor
import android.database.MatrixCursor
import android.net.Uri
import android.provider.ContactsContract
import com.openbubbles.wear.protocol.*
import org.junit.Assert.*
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.Robolectric
import org.robolectric.RobolectricTestRunner
import org.robolectric.RuntimeEnvironment
import org.robolectric.Shadows.shadowOf
import org.robolectric.annotation.Config
import org.robolectric.shadows.ShadowContentResolver

@RunWith(RobolectricTestRunner::class)
@Config(sdk = [32], application = Application::class)
class ContactDirectoryTest {
    private lateinit var context: Context
    private lateinit var provider: FakeContactsProvider

    @Before fun setup() {
        context = RuntimeEnvironment.getApplication()
        shadowOf(context as Application).grantPermissions(Manifest.permission.READ_CONTACTS)
        provider = Robolectric.buildContentProvider(FakeContactsProvider::class.java).create().get()
        ShadowContentResolver.registerProviderInternal(ContactsContract.AUTHORITY, provider)
    }

    private fun request(query: String = "", offset: Int = 0) = ContactsRequest(requestId = "request", query = query, offset = offset)
    private fun phone(id: String, name: String, address: String) = arrayOf(id, name,
        ContactsContract.CommonDataKinds.Phone.CONTENT_ITEM_TYPE, address)
    private fun email(id: String, name: String, address: String) = arrayOf(id, name,
        ContactsContract.CommonDataKinds.Email.CONTENT_ITEM_TYPE, address)

    @Test fun deniedPermissionReturnsNoContactsAndDoesNotQueryProvider() {
        shadowOf(context as Application).denyPermissions(Manifest.permission.READ_CONTACTS)
        val page = ContactDirectory.load(context, request())
        assertFalse(page.contactsAccess)
        assertTrue(page.contacts.isEmpty())
        assertEquals(0, provider.calls)
    }

    @Test fun oneContactKeepsDistinctNumbersAndEmailsWithoutChoosingForTheUser() {
        provider.rows = listOf(phone("1", "Alex", "+1 (555) 123-4567"), phone("1", "Alex", "+15551234567"),
            email("1", "Alex", "ALEX@EXAMPLE.COM"))
        val page = ContactDirectory.load(context, request())
        assertTrue(page.contactsAccess)
        assertEquals(listOf("+15551234567", "alex@example.com"), page.contacts.single().addresses.map { it.address })
        assertEquals("Alex", page.contacts.single().name)
        assertNull(page.contacts.single().avatarId)
        assertNull(page.nextOffset)
    }

    @Test fun paginationAdvancesByContactsNotAddressRows() {
        provider.rows = (0..44).flatMap { listOf(phone("$it", "Name %03d".format(it), "+1555%07d".format(it)),
            email("$it", "Name %03d".format(it), "person$it@example.com")) }
        val first = ContactDirectory.load(context, request())
        assertEquals(40, first.contacts.size)
        assertEquals(40, first.nextOffset)
        val last = ContactDirectory.load(context, request(offset = first.nextOffset!!))
        assertEquals(5, last.contacts.size)
        assertNull(last.nextOffset)
        assertTrue(first.contacts.map { it.id }.intersect(last.contacts.map { it.id }.toSet()).isEmpty())
    }

    @Test fun queryIsParameterizedAndBounded() {
        ContactDirectory.load(context, request("O'Neil"))
        assertFalse(provider.selection!!.contains("O'Neil"))
        assertTrue(provider.args!!.contains("%O'Neil%"))
        ContactDirectory.load(context, request("x".repeat(100)))
        assertEquals(82, provider.args!!.last().length)
    }

    @Test fun invalidAddressesAreNotOfferedAndNamelessContactsUseTheirAddress() {
        provider.rows = listOf(phone("1", "No address", "invalid"), email("2", "", "valid@example.com"))
        val page = ContactDirectory.load(context, request())
        assertEquals("valid@example.com", page.contacts.single().name)
    }

    @Test fun revocationDuringReadReturnsARevokedPage() {
        provider.denied = true
        val page = ContactDirectory.load(context, request())
        assertFalse(page.contactsAccess)
        assertTrue(page.contacts.isEmpty())
        assertNotNull(page.error)
    }

    @Test fun transportBudgetTrimsPageWithoutSkippingTheRemainder() {
        val entries = List(40) { index -> WatchContact("$index", "Name $index", List(10) {
            ContactAddress("a".repeat(220) + "$index-$it@example.com", "Email")
        }) }
        val page = ContactDirectory.page(ContactsPage(requestId = "r", offset = 80, contactsAccess = true), entries, false)
        assertTrue(Wire.encodeBytes(page).size <= 60_000)
        assertTrue(page.contacts.size in 1..39)
        assertEquals(80 + page.contacts.size, page.nextOffset)
    }
}

class FakeContactsProvider : ContentProvider() {
    var rows: List<Array<String>> = emptyList()
    var calls = 0
    var selection: String? = null
    var args: Array<out String>? = null
    var denied = false
    override fun onCreate() = true
    override fun query(uri: Uri, projection: Array<out String>?, selection: String?, selectionArgs: Array<out String>?, sortOrder: String?): Cursor {
        calls++
        if (denied) throw SecurityException("revoked")
        this.selection = selection
        args = selectionArgs
        return MatrixCursor(projection).apply { rows.forEach { addRow(it) } }
    }
    override fun getType(uri: Uri): String? = null
    override fun insert(uri: Uri, values: ContentValues?): Uri? = null
    override fun delete(uri: Uri, selection: String?, selectionArgs: Array<out String>?) = 0
    override fun update(uri: Uri, values: ContentValues?, selection: String?, selectionArgs: Array<out String>?) = 0
}
