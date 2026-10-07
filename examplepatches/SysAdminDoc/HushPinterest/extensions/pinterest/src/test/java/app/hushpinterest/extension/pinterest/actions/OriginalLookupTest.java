/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.actions;

import static app.hushpinterest.extension.pinterest.actions.MediaHostForTests.ORIGINALS;
import static app.hushpinterest.extension.pinterest.actions.MediaHostForTests.STAND_IN;
import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.net.SocketTimeoutException;
import java.util.ArrayList;
import java.util.List;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class OriginalLookupTest {
    private final PinMedia.Source standIn = new PinMedia.Source(STAND_IN, "image/jpeg", ".jpg");
    private MediaHostForTests host;

    @Before public void install() { host = MediaHostForTests.install(); }

    @After public void restore() { host.close(); }

    @Test public void theFirstOriginalTheMediaHostHasWinsAndEveryQuestionIsAHeadWithoutRedirects() {
        host.answer(ORIGINALS + ".png", 200, "image/png");
        PinMedia.Source found = OriginalLookup.find(standIn, null);
        assertEquals(ORIGINALS + ".png", found.url);
        assertEquals("image/png", found.mime);
        assertEquals(".png", found.suffix);
        assertEquals(List.of(ORIGINALS + ".jpg", ORIGINALS + ".png"), addresses());
        for (MediaHostForTests.Head head : host.asked) {
            assertEquals("HEAD", head.method());
            assertFalse(head.followsRedirects());
            assertEquals(5000, head.connectTimeout());
            assertTrue(head.disconnected);
        }
    }

    @Test public void anAnswerThatIsntTheNamedImageTypeOrIsARedirectDoesNotCount() {
        host.answer(ORIGINALS + ".jpg", 200, "text/html")
                .answer(ORIGINALS + ".png", 302, "image/png")
                .answer(ORIGINALS + ".gif", 200, "image/png");
        assertSame(standIn, OriginalLookup.find(standIn, null));
        assertEquals(List.of(ORIGINALS + ".jpg", ORIGINALS + ".png", ORIGINALS + ".gif", ORIGINALS + ".webp"), addresses());
        host.asked.clear();
        host.answer(ORIGINALS + ".webp", 200, "Image/WebP; charset=binary");
        assertEquals(ORIGINALS + ".webp", OriginalLookup.find(standIn, null).url);
    }

    @Test public void anUnreachableHostStopsAtTheFirstFailureAndKeepsTheStandIn() {
        host.fail(ORIGINALS + ".jpg", new SocketTimeoutException("slow"))
                .answer(ORIGINALS + ".png", 200, "image/png");
        assertSame(standIn, OriginalLookup.find(standIn, null));
        assertEquals(List.of(ORIGINALS + ".jpg"), addresses());
    }

    @Test public void aTypeAlreadyChosenOnlyAsksForThatType() {
        host.answer(ORIGINALS + ".png", 200, "image/png");
        assertSame(standIn, OriginalLookup.find(standIn, ".jpg"));
        assertEquals(List.of(ORIGINALS + ".jpg"), addresses());
        host.answer(ORIGINALS + ".jpg", 200, "image/jpeg");
        assertEquals(ORIGINALS + ".jpg", OriginalLookup.find(standIn, ".jpg").url);
    }

    @Test public void anAddressWithoutTheHashPathIsNeverAskedAbout() {
        for (String url : new String[]{"https://i.pinimg.com/736x/preview.jpg",
                "https://i.pinimg.com/originals/0b/b2/5b/0bb25b05de960e1fee5da5e9c4e8f12e.jpg",
                "https://i.pinimg.com/150x150/0b/b2/5b/0bb25b05de960e1fee5da5e9c4e8f12e.jpg",
                "https://i.pinimg.com/736x/aa/b2/5b/0bb25b05de960e1fee5da5e9c4e8f12e.jpg",
                "https://i.pinimg.com/736x/0b/b2/5b/0bb25b05de960e1fee5da5e9c4e8f12e.jpg?x=1",
                "https://i.pinimg.com/736x/0b/b2/5b/0BB25B05DE960E1FEE5DA5E9C4E8F12E.jpg",
                "https://example.com/736x/0b/b2/5b/0bb25b05de960e1fee5da5e9c4e8f12e.jpg"}) {
            PinMedia.Source source = new PinMedia.Source(url, "image/jpeg", ".jpg");
            assertTrue(url, PinMedia.originals(source).isEmpty());
            assertSame(url, source, OriginalLookup.find(source, null));
        }
        assertTrue(host.asked.isEmpty());
    }

    private List<String> addresses() {
        List<String> found = new ArrayList<>();
        for (MediaHostForTests.Head head : host.asked) found.add(head.address());
        return found;
    }
}
