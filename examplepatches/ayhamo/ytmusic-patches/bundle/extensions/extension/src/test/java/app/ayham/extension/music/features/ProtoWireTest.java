package app.ayham.extension.music.features;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class ProtoWireTest {

    @Test
    public void readsHandEncodedMessage() {
        // field 1 varint 150, field 2 string "testing", field 3 fixed32, field 4 fixed64
        byte[] bytes = {
                0x08, (byte) 0x96, 0x01,
                0x12, 0x07, 't', 'e', 's', 't', 'i', 'n', 'g',
                0x1d, 1, 2, 3, 4,
                0x21, 1, 2, 3, 4, 5, 6, 7, 8,
        };
        ProtoWire p = new ProtoWire(bytes);
        assertEquals(150, p.varint(1, -1));
        assertEquals("testing", p.string(2));
        assertEquals(5, p.first(3).wireType);
        assertEquals(1, p.first(4).wireType);
        // unknown fields are kept byte for byte
        assertArrayEquals(bytes, p.toBytes());
    }

    @Test
    public void nestedMessagesAndEdits() {
        ProtoWire inner = new ProtoWire().setVarint(1, 251).setString(5, "audio/webm");
        ProtoWire outer = new ProtoWire().setString(1, "videoId").addMessage(3, inner).addMessage(3, new ProtoWire().setVarint(1, 140));
        ProtoWire back = new ProtoWire(outer.toBytes());
        assertEquals("videoId", back.string(1));
        assertEquals(2, back.all(3).size());
        assertEquals(251, back.message(3).varint(1, 0));
        assertEquals("audio/webm", back.message(3).string(5));
        assertEquals(140, new ProtoWire(back.all(3).get(1).data).varint(1, 0));

        back.setVarint(1, 7); // a string field becomes a varint: replaced, not appended
        assertEquals(7, back.varint(1, 0));
        assertEquals(1, back.all(1).size());
        back.remove(3);
        assertFalse(back.has(3));
        assertTrue(back.message(99).fields.isEmpty());
        assertEquals("", back.string(99));
        assertEquals(-5, back.varint(99, -5));
    }

    @Test
    public void largeAndNegativeVarintsRoundTrip() {
        long[] values = {0, 1, 127, 128, 300, Integer.MAX_VALUE, 1L << 40, Long.MAX_VALUE, -1, Long.MIN_VALUE};
        for (long v : values) {
            ProtoWire p = new ProtoWire().setVarint(536870911, v); // the largest field number
            ProtoWire back = new ProtoWire(p.toBytes());
            assertEquals(v, back.varint(536870911, 42));
        }
    }

    @Test(expected = IllegalArgumentException.class)
    public void lengthPastTheEndIsRejected() {
        new ProtoWire(new byte[]{0x12, 0x10, 'a'});
    }

    @Test(expected = IllegalArgumentException.class)
    public void groupWireTypeIsRejected() {
        new ProtoWire(new byte[]{0x0b});
    }
}
