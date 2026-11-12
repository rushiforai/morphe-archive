package app.spicetify.extension.spotify.extensions;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.io.IOException;
import org.junit.Test;

public class WireTest {
    @Test
    public void writerAndReaderRoundTripANestedMessage() throws IOException {
        Wire.Writer inner = new Wire.Writer();
        inner.varint(1, 150);
        inner.varint(2, 1);
        inner.string(3, "hello");
        inner.bytes(4, new byte[] {1, 2, 3});

        Wire.Writer outer = new Wire.Writer();
        outer.string(1, "outer");
        outer.message(2, inner);

        Wire.Reader reader = new Wire.Reader(outer.toByteArray());

        assertTrue(reader.next());
        assertEquals(1, reader.field());
        assertEquals("outer", reader.string());

        assertTrue(reader.next());
        assertEquals(2, reader.field());
        assertEquals(2, reader.type());
        Wire.Reader nested = reader.message();

        assertTrue(nested.next());
        assertEquals(1, nested.field());
        assertEquals(150L, nested.varint());

        assertTrue(nested.next());
        assertEquals(2, nested.field());
        assertEquals(1L, nested.varint());

        assertTrue(nested.next());
        assertEquals(3, nested.field());
        assertEquals("hello", nested.string());

        assertTrue(nested.next());
        assertEquals(4, nested.field());
        assertArrayEquals(new byte[] {1, 2, 3}, nested.bytes());

        assertFalse(nested.next());
        assertFalse(reader.next());
    }

    @Test
    public void readerSkipsWireTypes1And5() throws IOException {
        byte[] data = {
            (byte) 9, 1, 2, 3, 4, 5, 6, 7, 8, // field 1, fixed64 (type 1): 8 bytes
            (byte) 21, 10, 20, 30, 40, // field 2, fixed32 (type 5): 4 bytes
            (byte) 24, 42, // field 3, varint (type 0): 42
        };
        Wire.Reader reader = new Wire.Reader(data);

        assertTrue(reader.next());
        assertEquals(1, reader.field());
        assertEquals(1, reader.type());
        reader.skip();

        assertTrue(reader.next());
        assertEquals(2, reader.field());
        assertEquals(5, reader.type());
        reader.skip();

        assertTrue(reader.next());
        assertEquals(3, reader.field());
        assertEquals(0, reader.type());
        assertEquals(42L, reader.varint());

        assertFalse(reader.next());
    }

    @Test
    public void skipThrowsOnGroupWireTypes3And4() {
        assertThrowsIOException(new byte[] {(byte) 0x0B}); // field 1, type 3 (start group)
        assertThrowsIOException(new byte[] {(byte) 0x0C}); // field 1, type 4 (end group)
    }

    private static void assertThrowsIOException(byte[] data) {
        try {
            Wire.Reader reader = new Wire.Reader(data);
            reader.next();
            reader.skip();
            fail("expected IOException");
        } catch (IOException expected) {
            // expected
        }
    }

    @Test
    public void truncatedVarintThrows() {
        assertVarintThrows(new byte[] {(byte) 0x08, (byte) 0x80}); // field 1 tag, then a continuation byte with nothing after
    }

    @Test
    public void tenVarintBytesThatAllContinueThrow() {
        byte[] data = new byte[12];
        data[0] = 0x08; // field 1, varint
        for (int i = 1; i <= 10; i++) data[i] = (byte) 0x80;
        data[11] = 0x01;
        assertVarintThrows(data);
    }

    @Test
    public void aLengthPastTheEndThrows() throws IOException {
        Wire.Reader reader = new Wire.Reader(new byte[] {0x12, 0x05, 'a'}); // field 2 declares 5 bytes and carries 1
        assertTrue(reader.next());
        try {
            reader.bytes();
            fail("expected IOException");
        } catch (IOException expected) {
            // expected
        }
    }

    @Test
    public void aDeclaredLengthNearIntegerMaxValueThrowsInsteadOfOverflowing() throws IOException {
        // field 1 = 5, so pos is already nonzero when the oversized field is checked, then field 2
        // with only the length prefix of Integer.MAX_VALUE: allocating the payload would defeat the point.
        byte[] data = {0x08, 0x05, 0x12, (byte) 0xFF, (byte) 0xFF, (byte) 0xFF, (byte) 0xFF, 0x07};

        Wire.Reader reader = new Wire.Reader(data);
        assertTrue(reader.next());
        reader.varint();
        assertTrue(reader.next());
        assertEquals(2, reader.field());
        try {
            reader.bytes();
            fail("expected IOException");
        } catch (IOException expected) {
            // expected
        }
    }

    private static void assertVarintThrows(byte[] data) {
        try {
            Wire.Reader reader = new Wire.Reader(data);
            reader.next();
            reader.varint();
            fail("expected IOException");
        } catch (IOException expected) {
            // expected
        }
    }
}
