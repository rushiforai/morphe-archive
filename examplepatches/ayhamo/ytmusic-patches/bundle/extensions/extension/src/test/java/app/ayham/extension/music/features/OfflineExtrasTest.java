package app.ayham.extension.music.features;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;

import org.junit.Test;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;

public class OfflineExtrasTest {
    @Test
    public void anAnswerUpToTheCapIsRead() throws Exception {
        String json = "{\"videoDetails\":{\"title\":\"Song\"}}";
        byte[] b = json.getBytes(StandardCharsets.UTF_8);
        assertEquals(json, OfflineExtras.readCapped(new ByteArrayInputStream(b), b.length));
    }

    @Test
    public void anAnswerOverTheCapIsNotRead() {
        byte[] b = new byte[40_000];
        Arrays.fill(b, (byte) 'a');
        try {
            OfflineExtras.readCapped(new ByteArrayInputStream(b), 39_999);
            fail("read past the cap");
        } catch (IOException expected) {
        }
    }
}
