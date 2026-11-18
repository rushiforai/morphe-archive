// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.extension.rifisfun;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

public class MediaLinksTest {
    @Test
    public void unwrapsRedditImages() {
        assertEquals("https://i.redd.it/abc123.jpeg",
                MediaLinks.unwrap("https://www.reddit.com/media?url=https%3A%2F%2Fi.redd.it%2Fabc123.jpeg"));
        assertEquals("https://preview.redd.it/abc.png?width=640&s=0f1e",
                MediaLinks.unwrap("https://reddit.com/media/?url=https%3A%2F%2Fpreview.redd.it%2Fabc.png%3Fwidth%3D640%26s%3D0f1e"));
        assertEquals("https://external-preview.redd.it/x.jpg",
                MediaLinks.unwrap("https://new.reddit.com/media?foo=1&url=https%3A%2F%2Fexternal-preview.redd.it%2Fx.jpg"));
    }

    @Test
    public void leavesOtherHostsWrapped() {
        String[] kept = {
            "https://www.reddit.com/media?url=https%3A%2F%2Fevil.example.com%2Fx.jpg",
            "https://www.reddit.com/media?url=https%3A%2F%2Fi.redd.it.example.com%2Fx.jpg",
            "https://www.reddit.com/media?url=http%3A%2F%2Fi.redd.it%2Fx.jpg",
            "https://www.reddit.com/media?url=javascript%3Aalert(1)",
            "https://www.reddit.com/media?url=%E0%A4%A",
            "https://www.reddit.com/media",
            "https://example.com/media?url=https%3A%2F%2Fi.redd.it%2Fx.jpg",
            "https://www.reddit.com/r/pics/media?url=https%3A%2F%2Fi.redd.it%2Fx.jpg",
            "https://i.redd.it/x.jpg",
            "not a url",
        };
        for (String url : kept) assertEquals(url, MediaLinks.unwrap(url));
        assertEquals(null, MediaLinks.unwrap(null));
    }
}
