/*
 * Copyright (C) 2026 lavinhoque33.
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-19.
 * Written by lavinhoque33, 2026-11-19.
 */

package app.morphe.extension.shared.spoof;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

import com.google.protobuf.CodedOutputStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.io.ByteArrayOutputStream;
import java.nio.ByteBuffer;
import java.util.List;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 28)
public class MwebTransportTest {
    private static final String URL = "https://r1.googlevideo.com/videoplayback?sabr=1&c=MWEB&id=web-stream";
    private static final int WEBSITE_SIGNATURE_TIMESTAMP = 20_777;

    @Test
    public void capturesOnlyWebsiteSabrSessionsAndPreservesTheSignedQuery() throws Exception {
        byte[] proof = new byte[60];
        byte[] body = join(field(5, new byte[]{3}), field(19, join(field(1, new byte[]{8, 2}), field(2, proof))));
        var session = MwebSiteSession.Session.parse(URL + "&rn=5&sig=test%2Bvalue", body, WEBSITE_SIGNATURE_TIMESTAMP);
        assertNotNull(session);
        assertEquals(URL + "&sig=test%2Bvalue", session.serverAbrStreamingUrl());
        assertEquals("web-stream", session.streamId());
        assertEquals(WEBSITE_SIGNATURE_TIMESTAMP, session.signatureTimestamp());
        assertArrayEquals(proof, session.poToken());
        assertFalse(session.toString().contains("web-stream"));
        assertNull(MwebSiteSession.Session.parse(URL.replace("googlevideo.com", "googlevideo.com.example.org"),
                body, WEBSITE_SIGNATURE_TIMESTAMP));
        assertNull(MwebSiteSession.Session.parse(URL.replace("c=MWEB", "c=TVHTML5"),
                body, WEBSITE_SIGNATURE_TIMESTAMP));
        assertNull(MwebSiteSession.Session.parse(URL,
                field(19, join(field(1, new byte[]{8, 2}), field(2, new byte[15]))), WEBSITE_SIGNATURE_TIMESTAMP));
    }

    @Test
    public void replacementDropsAppIdentityAndCarriesOnlyTheWebSessionFields() throws Exception {
        byte[] nativeContext = join(field(1, new byte[]{1}), field(2, new byte[]{2}),
                field(3, new byte[]{3}), field(5, new byte[]{4}));
        byte[] nativeBody = join(field(4, new byte[]{4}), field(5, new byte[]{5}), field(19, nativeContext));
        byte[] webBody = SabrRequestBody.replaceClientInfo(nativeBody, new byte[]{6}, new byte[]{7},
                new SabrContexts.ToSend(List.of(new byte[]{8}), List.of(13)), new byte[]{9});
        byte[] webContext = SabrRequestBody.readMessageField(webBody, 19);
        assertArrayEquals(new byte[]{9}, SabrRequestBody.readMessageField(webBody, 5));
        assertArrayEquals(new byte[]{4}, SabrRequestBody.readMessageField(webBody, 4));
        assertArrayEquals(new byte[]{6}, SabrRequestBody.readMessageField(webContext, 1));
        assertArrayEquals(new byte[]{7}, SabrRequestBody.readMessageField(webContext, 2));
        assertArrayEquals(new byte[]{3}, SabrRequestBody.readMessageField(webContext, 3));
        assertArrayEquals(new byte[]{8}, SabrRequestBody.readMessageField(webContext, 5));
    }

    @Test
    public void seekPartMutationKeepsNativeBufferPositionAndLeavesOtherPartsIntact() {
        byte[] response = {45, 2, 24, 11, 45, 2, 24, 25, 21, 1, 2};
        ByteBuffer chunk = ByteBuffer.wrap(response);
        SabrResponseReader reader = new SabrResponseReader(null, 45, (bytes, offset, size) -> bytes.get(offset + 1) == 11);
        reader.read(chunk);
        assertEquals(0, chunk.position());
        assertArrayEquals(new byte[]{127, 2, 24, 11, 45, 2, 24, 25, 21, 1, 2}, response);
    }

    private static byte[] field(int number, byte[] value) throws Exception {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        CodedOutputStream code = CodedOutputStream.newInstance(bytes);
        code.writeByteArray(number, value);
        code.flush();
        return bytes.toByteArray();
    }

    private static byte[] join(byte[]... parts) throws Exception {
        ByteArrayOutputStream bytes = new ByteArrayOutputStream();
        for (byte[] part : parts) bytes.write(part);
        return bytes.toByteArray();
    }
}
