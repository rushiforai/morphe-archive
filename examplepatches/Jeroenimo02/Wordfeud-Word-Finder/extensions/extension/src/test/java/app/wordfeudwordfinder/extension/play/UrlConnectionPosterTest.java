package app.wordfeudwordfinder.extension.play;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.io.IOException;
import java.util.Collections;
import org.junit.Test;

public class UrlConnectionPosterTest {

    @Test
    public void onlyWordfeudApiUrlsAreAllowed() {
        assertTrue(UrlConnectionPoster.isAllowed(MoveRequest.url(1L)));
        assertFalse(UrlConnectionPoster.isAllowed(null));
        assertFalse(UrlConnectionPoster.isAllowed("http://api.wordfeud.com/wf/game/1/move/"));
        assertFalse(UrlConnectionPoster.isAllowed("https://api.wordfeud.com.evil.example/wf/"));
        assertFalse(UrlConnectionPoster.isAllowed("https://api.wordfeud.com:444/wf/"));
        assertFalse(UrlConnectionPoster.isAllowed("https://example.com/wf/"));
        assertFalse(UrlConnectionPoster.isAllowed("https://api.wordfeud.com/other/"));
    }

    @Test
    public void refusedUrlFailsBeforeConnecting() {
        try {
            new UrlConnectionPoster().post("https://example.com/", "{}", Collections.emptyMap());
            fail("expected IOException");
        } catch (IOException e) {
            // expected
        }
    }
}
