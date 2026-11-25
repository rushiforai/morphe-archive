/*
 * Copyright (C) 2026 lavinhoque33
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-24.
 */

package app.morphe.extension.youtube.patches.general.offline;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.net.Uri;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import org.robolectric.util.ReflectionHelpers;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 34)
public class OfflineWatchProgressiveRouteTest {
    private static final int PORT = 31254;
    private static final String TOKEN_PATH = "/0123456789abcdef01234567/";
    private static final String VIDEO_ID = "f8j0cjR5PHM";
    private static final String URL = "http://127.0.0.1:" + PORT + TOKEN_PATH + VIDEO_ID;

    @Test
    public void playerInitializationDoesNotInvalidateTheActiveDownload() {
        ReflectionHelpers.setStaticField(OfflineStreamSource.class, "servingId", VIDEO_ID);
        try {
            OfflineStreamSource.onVideoLoaded("");
            assertTrue(OfflineStreamSource.isServing(VIDEO_ID));
            OfflineStreamSource.onVideoLoaded(VIDEO_ID);
            assertTrue(OfflineStreamSource.isServing(VIDEO_ID));
            OfflineStreamSource.onVideoLoaded("another-file");
            assertFalse(OfflineStreamSource.isServingAny());
        } finally {
            ReflectionHelpers.setStaticField(OfflineStreamSource.class, "servingId", null);
        }
    }

    @Test
    public void currentUrlMatchesWithOrWithoutWatchPlaybackParameters() {
        assertTrue(matches(URL));
        assertTrue(matches(URL + "?cpn=abc&range=4294968000-"));
    }

    @Test
    public void onlyTheAuthenticatedLocalFileCanSelectTheAlternateBackend() {
        assertFalse(matches(null));
        assertFalse(matches("https://r1.googlevideo.com/videoplayback?id=" + VIDEO_ID));
        assertFalse(matches(URL.replace("http:", "https:")));
        assertFalse(matches(URL.replace("127.0.0.1", "127.0.0.1.example.com")));
        assertFalse(matches(URL.replace("127.0.0.1", "other@127.0.0.1")));
        assertFalse(matches(URL.replace("31254", "31255")));
        assertFalse(matches(URL.replace(TOKEN_PATH, "/expired-token/")));
        assertFalse(matches(URL.replace(VIDEO_ID, "another-file")));
        assertFalse(matches(URL + "-suffix"));
    }

    @Test
    public void fileAndMediaStoreSourcesResolveToTheExactSavedUri() {
        Uri fileUri = Uri.parse("file:///data/user/0/app/files/long%20fixture.webm");
        Uri mediaStoreUri = Uri.parse("content://media/external/video/media/17");
        Uri authenticatedUrl = Uri.parse(URL + "?range=4294968000-");
        assertSame(fileUri, source(fileUri).resolve(authenticatedUrl, VIDEO_ID, TOKEN_PATH));
        assertSame(mediaStoreUri, source(mediaStoreUri).resolve(authenticatedUrl, VIDEO_ID, TOKEN_PATH));
    }

    @Test
    public void cannotResolveAVideoOtherThanTheActiveLocalDownload() {
        var local = source(Uri.parse("content://media/external/video/media/17"));
        assertNull(local.resolve(Uri.parse(URL), null, TOKEN_PATH));
        assertNull(local.resolve(Uri.parse(URL), "another-file", TOKEN_PATH));
        assertNull(local.resolve(Uri.parse(URL), VIDEO_ID, "/new-token/"));
        assertNull(local.resolve(Uri.parse("https://example.com/" + VIDEO_ID), VIDEO_ID, TOKEN_PATH));
        assertNull(source(Uri.parse("http://example.com/video")).resolve(Uri.parse(URL), VIDEO_ID, TOKEN_PATH));
    }

    private static OfflineStreamSource.WatchSource source(Uri localUri) {
        return new OfflineStreamSource.WatchSource(VIDEO_ID, PORT, localUri);
    }

    private static boolean matches(String url) {
        return OfflineStreamSource.matchesLoopbackSource(url == null ? null : Uri.parse(url), PORT,
                TOKEN_PATH, VIDEO_ID);
    }
}
