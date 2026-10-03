/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.download;

import static org.junit.Assert.*;
import android.content.Context;
import android.os.Looper;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.shadows.ShadowToast;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 37})
public class CommentPhotoDownloadTest {
    private Context context;

    @Before public void prepare() {
        context = RuntimeEnvironment.getApplication();
        ShadowToast.reset();
    }

    private static CommentPhotoDownload.Images images(Object expected, List<?> candidates) {
        return new CommentPhotoDownload.Images() {
            public Object versions(Object media) { assertSame(expected, media); return media; }
            public List<?> candidates(Object versions) { return candidates; }
            public String url(Object candidate) { return (String) candidate; }
            public int width(Object candidate) { return 1440; }
            public int height(Object candidate) { return 1080; }
        };
    }

    @Test public void onlySuppliedMetaPhotoAddressesAreCopiedVerbatim() {
        List<String> urls = new ArrayList<>(Arrays.asList(
                "https://scontent.cdninstagram.com/p.jpg?se=keep%2Bexact",
                "file:///data/user/0/com.instagram.android/cache/pending.jpg",
                "content://media/external/images/pending",
                "https://media.giphy.com/p.gif",
                "http://scontent.fbcdn.net/p.jpg",
                "https://scontent.fbcdn.net/a.gif?still=1",
                "https://scontent.fbcdn.net/A.GIF",
                "https://scontent.fbcdn.net/a.mp4",
                "https://scontent.fbcdn.net/a.m4v",
                "https://scontent.fbcdn.net/a.webm",
                "https://scontent.fbcdn.net/a.m3u8",
                "https://scontent.fbcdn.net/a.mpd",
                "https://127.0.0.1/p.jpg",
                "https://user@scontent.fbcdn.net/p.jpg",
                "https://scontent.fbcdn.net:8443/p.jpg",
                "",
                null,
                "https://scontent-lax3-1.xx.fbcdn.net/v/p.webp"));
        List<MediaSave.Rendition> snapshot = CommentPhotoDownload.snapshot(urls, images(urls, urls));
        assertEquals(2, snapshot.size());
        assertEquals(urls.get(0), snapshot.get(0).url);
        assertEquals("https://scontent-lax3-1.xx.fbcdn.net/v/p.webp", snapshot.get(1).url);
        assertEquals(1440, snapshot.get(0).width);
        assertEquals(1080, snapshot.get(0).height);
        urls.clear();
        assertEquals(2, snapshot.size());
        assertThrows(UnsupportedOperationException.class, snapshot::clear);
    }

    @Test public void missingModelsGetNoImageFallback() {
        assertTrue(CommentPhotoDownload.snapshot(null).isEmpty());
        assertTrue("the unpatched bridges find nothing", CommentPhotoDownload.snapshot(new Object()).isEmpty());
        Object media = new Object();
        assertTrue(CommentPhotoDownload.snapshot(media, images(media, null)).isEmpty());
        assertTrue(CommentPhotoDownload.snapshot(media, images(media, Collections.emptyList())).isEmpty());
        CommentPhotoDownload.Images noVersions = new CommentPhotoDownload.Images() {
            public Object versions(Object m) { return null; }
            public List<?> candidates(Object versions) { throw new AssertionError("no versions to read"); }
            public String url(Object candidate) { throw new AssertionError(); }
            public int width(Object candidate) { throw new AssertionError(); }
            public int height(Object candidate) { throw new AssertionError(); }
        };
        assertTrue(CommentPhotoDownload.snapshot(media, noVersions).isEmpty());
    }

    @Test public void copyIsDetachedAndUnmodifiable() {
        List<MediaSave.Rendition> source = new ArrayList<>(Collections.singletonList(
                new MediaSave.Rendition("https://scontent.cdninstagram.com/p.jpg", 640, 480, 0)));
        List<MediaSave.Rendition> copy = CommentPhotoDownload.copy(source);
        source.clear();
        assertEquals(1, copy.size());
        assertThrows(UnsupportedOperationException.class, () -> copy.add(null));
    }

    @Test public void aSaveThatCannotStartSaysSoAndNeverThrows() {
        CommentPhotoDownload.save(context, Collections.emptyList());
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertEquals("Download failed", String.valueOf(ShadowToast.getTextOfLatestToast()));
        ShadowToast.reset();
        CommentPhotoDownload.save(null, Collections.emptyList());
        CommentPhotoDownload.failed(null);
        Shadows.shadowOf(Looper.getMainLooper()).idle();
        assertNull(ShadowToast.getTextOfLatestToast());
    }
}
