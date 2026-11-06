package com.openbubbles.wear.bridge

import android.Manifest
import android.content.Context
import android.content.pm.PackageManager
import android.net.Uri
import android.provider.ContactsContract
import com.openbubbles.wear.protocol.ContactAddress
import com.openbubbles.wear.protocol.ContactsPage
import com.openbubbles.wear.protocol.ContactsRequest
import com.openbubbles.wear.protocol.Protocol
import com.openbubbles.wear.protocol.WatchContact
import com.openbubbles.wear.protocol.Wire

/** OpenBubbles' Android contact source is the system address book, not its private database. */
object ContactDirectory {
    const val PAGE_SIZE = 40
    const val MAX_OFFSET = 5000
    private const val MAX_ADDRESSES = 10
    private const val MAX_PAGE_BYTES = 60_000

    fun hasAccess(context: Context): Boolean =
        context.checkSelfPermission(Manifest.permission.READ_CONTACTS) == PackageManager.PERMISSION_GRANTED

    fun load(context: Context, request: ContactsRequest): ContactsPage {
        val query = request.query.trim().take(80)
        val offset = request.offset.coerceIn(0, MAX_OFFSET)
        val base = ContactsPage(requestId = request.requestId, query = query, offset = offset,
            contactsAccess = hasAccess(context))
        if (!base.contactsAccess) return base.copy(error = "Allow Contacts in the phone bridge to browse the address book used by OpenBubbles.")
        return try {
            val phone = ContactsContract.CommonDataKinds.Phone.CONTENT_ITEM_TYPE
            val email = ContactsContract.CommonDataKinds.Email.CONTENT_ITEM_TYPE
            val selection = buildString {
                append("${ContactsContract.Data.MIMETYPE} IN (?, ?)")
                if (query.isNotEmpty()) append(" AND (${ContactsContract.Data.DISPLAY_NAME_PRIMARY} LIKE ? OR ${ContactsContract.Data.DATA1} LIKE ?)")
            }
            val args = if (query.isEmpty()) arrayOf(phone, email)
                else arrayOf(phone, email, "%$query%", "%$query%")
            val contacts = linkedMapOf<String, WatchContact>()
            val cursor = context.contentResolver.query(
                ContactsContract.Data.CONTENT_URI,
                arrayOf(ContactsContract.Data.CONTACT_ID, ContactsContract.Data.DISPLAY_NAME_PRIMARY,
                    ContactsContract.Data.MIMETYPE, ContactsContract.Data.DATA1),
                selection, args,
                "${ContactsContract.Data.DISPLAY_NAME_PRIMARY} COLLATE LOCALIZED ASC, ${ContactsContract.Data.CONTACT_ID} ASC"
            ) ?: return base.copy(error = "Android did not return a contact list. Try again or check Contacts permission.")
            cursor.use {
                while (it.moveToNext()) {
                    val address = Protocol.normalizeAddress(it.getString(3))?.takeIf { value -> value.length <= 254 } ?: continue
                    val id = "contact-${it.getString(0)}"
                    if (id !in contacts && contacts.size >= offset + PAGE_SIZE + 1) break
                    val old = contacts[id] ?: WatchContact(id, it.getString(1)?.trim()?.take(160)?.ifBlank { address } ?: address)
                    val addresses = (old.addresses + ContactAddress(address,
                        if (it.getString(2) == email) "Email" else "Phone"))
                        .distinctBy { entry -> entry.address }.take(MAX_ADDRESSES)
                    contacts[id] = old.copy(addresses = addresses)
                }
            }
            val selected = contacts.values.drop(offset).take(PAGE_SIZE).map { contact ->
                val rawId = contact.id.removePrefix("contact-")
                val photo = Uri.withAppendedPath(
                    Uri.withAppendedPath(ContactsContract.Contacts.CONTENT_URI, rawId),
                    ContactsContract.Contacts.Photo.CONTENT_DIRECTORY
                )
                contact.copy(avatarId = AvatarCache.cache(context, photo))
            }
            page(base, selected, contacts.size > offset + PAGE_SIZE)
        } catch (_: SecurityException) {
            base.copy(contactsAccess = false, error = "Android denied contact access. Check Contacts permission in the phone bridge and try again.")
        } catch (_: Exception) {
            base.copy(error = "Could not read Android contacts. Check Contacts permission and try again.")
        }
    }

    internal fun page(base: ContactsPage, entries: List<WatchContact>, hasMore: Boolean): ContactsPage {
        var kept = entries
        fun result() = base.copy(contacts = kept,
            nextOffset = (base.offset + kept.size).takeIf { kept.isNotEmpty() && (hasMore || kept.size < entries.size) && it < MAX_OFFSET })
        while (kept.size > 1 && Wire.encodeBytes(result()).size > MAX_PAGE_BYTES) kept = kept.dropLast(1)
        return result()
    }
}
