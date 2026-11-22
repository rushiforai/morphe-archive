package app.voidhack.extension.applemusic.library;

import org.junit.Test;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Map;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertThrows;

public class DaapCodecTest {
    @Test public void readsTrackFromIndependentDaapWireFixture() throws Exception {
        byte[] response = hex("61646273000000346d73747400000004000000c86d6c636c00000020"
                + "6d6c6974000000186d696964000000040000002a6d696e6d0000000454455354");

        DaapCodec.Node track = DaapCodec.root(response, "adbs").required("mlcl").required("mlit");

        assertEquals(42, track.required("miid").unsigned32());
        assertEquals("TEST", track.required("minm").text());
    }

    @Test public void readsEveryTrackFromLargeCloudLibraryResponse() throws Exception {
        int trackCount = 3200;
        int extraFields = 92;
        int trackLength = (1 + extraFields) * 12;
        int listLength = trackCount * (8 + trackLength);
        ByteBuffer response = ByteBuffer.allocate(16 + listLength);
        header(response, "adbs", 8 + listLength);
        header(response, "mlcl", listLength);
        for (int id = 1; id <= trackCount; id++) {
            header(response, "mlit", trackLength);
            header(response, "miid", 4).putInt(id);
            for (int field = 0; field < extraFields; field++) {
                response.putInt(0x7a7a6161 + (field / 26 << 8) + field % 26).putInt(4).putInt(0);
            }
        }

        List<DaapCodec.Node> tracks = DaapCodec.root(response.array(), "adbs").required("mlcl").children();

        assertEquals(trackCount, tracks.size());
        for (int i = 0; i < tracks.size(); i++) {
            assertEquals(i + 1, tracks.get(i).readTrackFields().required("miid").unsigned32());
        }
    }

    @Test public void rejectsTruncatedMetadataWhenReadingACloudLibraryTrack() {
        byte[] response = hex("61646273000000186d6c636c000000106d6c6974000000086d69696400000004");

        assertThrows(IOException.class,
                () -> DaapCodec.root(response, "adbs").required("mlcl").required("mlit").required("miid"));
    }

    @Test public void metadataUpdateUsesUtf8ByteLengthsAndNetworkByteOrder() throws Exception {
        Map<String, byte[]> fields = Map.of("minm", DaapCodec.utf8("星"));

        byte[] actual = DaapCodec.edit(42, 7, 9, fields);

        assertArrayEquals(hex("6d656273000000486d696b6400000001026d7573720000000400000007"
                + "6d73746300000004000000096d6c636c0000001f6d6c697400000017"
                + "6d696964000000040000002a6d696e6d00000003e6989f"), actual);
    }

    @Test public void rejectsTruncatedAndOverflowingWireLengths() {
        for (String fixture : new String[]{"61646273000000", "61646273ffffffff",
                "61646273000000096162636400000000", "616462730000000100"}) {
            assertThrows(IOException.class, () -> DaapCodec.root(hex(fixture), "adbs"));
        }
    }

    @Test public void rejectsDeeplyNestedServerResponse() {
        byte[] body = new byte[24 * 8];
        ByteBuffer buffer = ByteBuffer.wrap(body);
        for (int i = 0; i < 24; i++) buffer.putInt(0x6d6c636c).putInt((23 - i) * 8);

        IOException error = assertThrows(IOException.class, () -> DaapCodec.root(body, "mlcl"));

        assertEquals("DAAP nesting is too deep", error.getMessage());
    }

    @Test public void rejectsAmbiguousDuplicateTrackIdentifiers() throws Exception {
        byte[] body = hex("6d6c6974000000186d696964000000040000002a6d696964000000040000002b");
        DaapCodec.Node track = DaapCodec.root(body, "mlit");

        assertThrows(IOException.class, () -> track.required("miid"));
    }

    @Test public void rejectsMalformedUtf8InsteadOfSilentlyChangingMetadata() throws Exception {
        DaapCodec.Node text = DaapCodec.root(hex("6d696e6d00000002c328"), "minm");

        assertThrows(IOException.class, text::text);
        assertThrows(IOException.class, () -> DaapCodec.utf8("\ud800"));
    }

    @Test public void rejectsIdentifiersThatWouldBeTruncatedByTheWireFormat() {
        for (long id : new long[]{-1, 0x100000000L}) {
            assertThrows(IOException.class, () -> DaapCodec.edit(id, 7, 9, Map.of("minm", new byte[]{65})));
        }
    }

    private static ByteBuffer header(ByteBuffer buffer, String code, int length) {
        return buffer.put(code.getBytes(StandardCharsets.US_ASCII)).putInt(length);
    }

    private static byte[] hex(String value) {
        byte[] bytes = new byte[value.length() / 2];
        for (int i = 0; i < bytes.length; i++) bytes[i] = (byte) Integer.parseInt(value.substring(i * 2, i * 2 + 2), 16);
        return bytes;
    }
}
