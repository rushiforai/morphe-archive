// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.extension.syncforreddit.tenor;

import java.net.URI;
import org.json.JSONObject;
import org.junit.Test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

public final class TenorPreviewsTest {
    private static final URI PAGE = URI.create("https://tenor.com/view/example-gif-123");

    private static String preview(String content) {
        return TenorPreviews.imageFromHtml("<meta property='og:image' content='" + content + "'>", PAGE);
    }

    @Test
    public void parsesBothAbsoluteAndSchemeRelativePublicImageMetadata() {
        assertEquals("https://media1.tenor.com/m/example.gif", preview("https://media1.tenor.com/m/example.gif"));
        assertEquals("https://media.tenor.com/m/example.gif", preview("//media.tenor.com/m/example.gif"));
        assertNull(TenorPreviews.imageFromHtml("<title>GIF with no preview</title>", PAGE));
    }

    @Test
    public void rejectsOtherHostsProtocolsPortsAndPaths() {
        for (String invalid : new String[] {"https://media1.tenor.com.example.org/m/no.gif",
                "http://media1.tenor.com/m/no.gif", "https://media1.tenor.com:8443/m/no.gif",
                "https://name@media1.tenor.com/m/no.gif", "https://media1.tenor.com/no.gif"}) {
            assertNull(invalid, preview(invalid));
        }
    }

    @Test
    public void postSkipsSensitiveAndAlreadyProvidedThumbnails() {
        JSONObject post = new JSONObject().put("url", PAGE.toString());
        assertNotNull(TenorPreviews.postModel(post, null));
        assertEquals("existing", TenorPreviews.postModel(post, "existing"));
        assertNull(TenorPreviews.postModel(post.put("over_18", true), null));
        assertNull(TenorPreviews.postModel(post.put("over_18", false).put("spoiler", true), null));
        assertNull(TenorPreviews.postModel(post.put("spoiler", false).put("thumbnail", "nsfw"), null));
    }
}
