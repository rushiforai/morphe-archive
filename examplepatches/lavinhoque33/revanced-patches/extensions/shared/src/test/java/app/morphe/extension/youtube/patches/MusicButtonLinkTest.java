/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-13.
 */
package app.morphe.extension.youtube.patches;

import static org.junit.Assert.*;

import com.google.protobuf.CodedOutputStream;
import java.io.ByteArrayOutputStream;
import java.util.Base64;
import org.junit.Test;

public class MusicButtonLinkTest {
    private static byte[] message(String videoId) throws Exception {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        CodedOutputStream output = CodedOutputStream.newInstance(bytes);
        output.writeString(1, "\uffff");
        output.writeString(2, videoId);
        output.flush();
        return bytes.toByteArray();
    }

    @Test public void decodesNestedPaddedAndUnpaddedAlphabets() throws Exception {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        CodedOutputStream output = CodedOutputStream.newInstance(bytes);
        output.writeByteArray(7, message("aB0_12-xyzQ"));
        output.flush();
        byte[] proto = bytes.toByteArray();
        String expected = "aB0_12-xyzQ";
        // Real IDs are exactly eleven characters.
        assertEquals(11, expected.length());
        assertEquals(expected, OverrideYouTubeMusicButtonsPatch.decodeVideoId(
                Base64.getEncoder().encodeToString(proto)));
        assertEquals(expected, OverrideYouTubeMusicButtonsPatch.decodeVideoId(
                Base64.getUrlEncoder().withoutPadding().encodeToString(proto)));
    }

    @Test public void rejectsMalformedPayloadsAndInvalidVideoIds() throws Exception {
        assertNull(OverrideYouTubeMusicButtonsPatch.decodeVideoId("%%%"));
        assertNull(OverrideYouTubeMusicButtonsPatch.decodeVideoId(""));
        assertNull(OverrideYouTubeMusicButtonsPatch.decodeVideoId(Base64.getEncoder().encodeToString(new byte[]{0})));
        for (String invalid : new String[]{"short", "123456789012", "1234567890!"}) {
            assertNull(OverrideYouTubeMusicButtonsPatch.decodeVideoId(
                    Base64.getEncoder().encodeToString(message(invalid))));
        }
    }
}
