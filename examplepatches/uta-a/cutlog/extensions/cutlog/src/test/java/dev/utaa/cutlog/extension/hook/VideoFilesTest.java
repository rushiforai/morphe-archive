package dev.utaa.cutlog.extension.hook;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class VideoFilesTest {
    @Test
    public void keepsSizeWithoutRotation() {
        assertArrayEquals(new int[] {1280, 720}, VideoFiles.displaySize(1280, 720, 0));
        assertArrayEquals(new int[] {1280, 720}, VideoFiles.displaySize(1280, 720, 180));
    }

    /** 本体の ac0 と同じく、90 / 270 度の回転付き動画は縦横を入れ替えて表示サイズにする。 */
    @Test
    public void swapsSizeForQuarterRotation() {
        assertArrayEquals(new int[] {720, 1280}, VideoFiles.displaySize(1280, 720, 90));
        assertArrayEquals(new int[] {720, 1280}, VideoFiles.displaySize(1280, 720, 270));
        assertArrayEquals(new int[] {720, 1280}, VideoFiles.displaySize(1280, 720, -90));
    }

    @Test
    public void recognizesTemporaryFiles() {
        assertTrue(VideoFiles.isTemporary("collection_camera_1.mp4.cutlog.mp4"));
        assertTrue(VideoFiles.isTemporary("collection_camera_1.mp4.cutlog.tmp.mp4"));
        assertTrue(VideoFiles.isTemporary("collection_camera_1.mp4.cutlog.tmp"));
        assertFalse(VideoFiles.isTemporary("collection_camera_1.mp4"));
    }
}
