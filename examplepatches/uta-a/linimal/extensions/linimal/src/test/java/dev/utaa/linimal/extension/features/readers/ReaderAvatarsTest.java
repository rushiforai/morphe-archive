package dev.utaa.linimal.extension.features.readers;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public final class ReaderAvatarsTest {
    @Test
    public void onlyRelativeProfilePathsAreFetched() {
        assertTrue(ReaderAvatars.isValidPath("/0hAbC-_9xyz"));
        assertTrue(ReaderAvatars.isValidPath("/0hAbC/sub.path"));
        assertFalse(ReaderAvatars.isValidPath(null));
        assertFalse(ReaderAvatars.isValidPath(""));
        assertFalse(ReaderAvatars.isValidPath("/"));
        assertFalse(ReaderAvatars.isValidPath("0hAbC"));
        assertFalse(ReaderAvatars.isValidPath("//evil.example/x"));
        assertFalse(ReaderAvatars.isValidPath("/0h@evil.example"));
        assertFalse(ReaderAvatars.isValidPath("/0h?x=1"));
        assertFalse(ReaderAvatars.isValidPath("/0h/../x"));
        assertFalse(ReaderAvatars.isValidPath("/0h:443"));
    }

    @Test
    public void previewUrlUsesTheProfileCdn() {
        assertEquals("https://profile.line-scdn.net/0hAbC/preview", ReaderAvatars.previewUrl("/0hAbC"));
    }

    @Test
    public void sampleSizeKeepsTheShorterSideAboveTheDecodeSize() {
        assertEquals(1, ReaderAvatars.sampleSize(200, 200));
        assertEquals(2, ReaderAvatars.sampleSize(640, 400));
        assertEquals(4, ReaderAvatars.sampleSize(800, 640));
        assertEquals(1, ReaderAvatars.sampleSize(0, 0));
        // 短辺が小さい細長い画像も、長辺で縮小します。
        assertEquals(8, ReaderAvatars.sampleSize(4000, 100));
        assertEquals(4, ReaderAvatars.sampleSize(100, 2000));
    }

    @Test
    public void oversizedOrBrokenImagesAreNotDecoded() {
        assertTrue(ReaderAvatars.isDecodableSize(640, 640));
        assertFalse(ReaderAvatars.isDecodableSize(0, 640));
        assertFalse(ReaderAvatars.isDecodableSize(-1, -1));
        assertFalse(ReaderAvatars.isDecodableSize(8193, 10));
    }

    @Test
    public void placeholderUsesTheFirstCharacterAndAStableColor() {
        assertEquals("A", AvatarPainter.initial(" aoi"));
        assertEquals("😀", AvatarPainter.initial("😀smile"));
        assertEquals("", AvatarPainter.initial("  "));
        assertEquals("", AvatarPainter.initial(null));
        assertEquals(AvatarPainter.placeholderColor("u_a"), AvatarPainter.placeholderColor("u_a"));
        AvatarPainter.placeholderColor(null);
    }
}
