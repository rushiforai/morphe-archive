// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.extension.syncforreddit;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

import org.junit.Test;

public class OtherDiscussionsTest {
    @Test
    public void searchesForTheEncodedLink() {
        assertEquals(
                "search######url:https%3A%2F%2Fwww.kyivpost.com%2Fpost%2F89012",
                OtherDiscussions.asSearch("seen###https%3A%2F%2Fwww.kyivpost.com%2Fpost%2F89012"));
    }

    @Test
    public void keepsTheLinksCaseAndEncoding() {
        assertEquals(
                "search######url:https%3A%2F%2Fi.imgur.com%2FAbC1234.png%3Fa%3D1%26b%3D2",
                OtherDiscussions.asSearch("Seen###https%3A%2F%2Fi.imgur.com%2FAbC1234.png%3Fa%3D1%26b%3D2"));
    }

    @Test
    public void makesASearchKeyWithNoSubreddit() {
        // The app reads a search key as search###<subreddit>###<query>.
        assertArrayEquals(
                new String[] {"search", "", "url:https%3A%2F%2Fexample.com%2F"},
                OtherDiscussions.asSearch("seen###https%3A%2F%2Fexample.com%2F").split("###"));
    }

    @Test
    public void passesEscapesThroughUntouched() {
        // URLEncoder output: a fragment (%23), a literal plus (%2B), a percent sign (%25) and a space (+).
        String link = "https%3A%2F%2Fexample.com%2Fa%2Bb%3Fq%3D50%25+off%23top";
        assertEquals("search######url:" + link, OtherDiscussions.asSearch("seen###" + link));
    }

    @Test
    public void leavesOtherListingsAlone() {
        assertEquals("frontpage", OtherDiscussions.asSearch("frontpage"));
        assertEquals("seen", OtherDiscussions.asSearch("seen"));
        assertEquals("search###pics###cats", OtherDiscussions.asSearch("search###pics###cats"));
        assertEquals("r/seen###x", OtherDiscussions.asSearch("r/seen###x"));
        assertEquals("seen###", OtherDiscussions.asSearch("seen###"));
        assertNull(OtherDiscussions.asSearch(null));
    }
}
