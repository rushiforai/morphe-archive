package com.openbubbles.wear.protocol

import org.junit.Test
import org.junit.Assert.*

class ContactsProtocolTest {
    @Test fun contactRequestRoundTripsSearchAndOffset() {
        val request = ContactsRequest(requestId = "request", query = "Alex", offset = 40)
        assertEquals(request, Wire.decodeBytes<ContactsRequest>(Wire.encodeBytes(request)))
    }

    @Test fun contactPageRoundTripsMultipleAddressesAndContinuation() {
        val page = ContactsPage(requestId = "request", contacts = listOf(WatchContact("1", "Alex",
            listOf(ContactAddress("+15551234567", "Phone"), ContactAddress("alex@example.com", "Email")))),
            nextOffset = 40, contactsAccess = true)
        assertEquals(page, Wire.decodeBytes<ContactsPage>(Wire.encodeBytes(page)))
    }

    @Test fun olderMetadataLeavesContactsPermissionUnknown() {
        val pong = Wire.decode<PongPayload>("{\"version\":3,\"phoneName\":\"Phone\"}")!!
        assertNull(pong.contactsAccess)
        assertEquals(3, pong.version)
    }
}
