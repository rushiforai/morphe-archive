/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.download;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;

import android.media.MediaFormat;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

/**
 * The colors a converted picture is labeled with. The frames reach the H.264 encoder with their
 * values unchanged, so the label has to be the source's: on a phone, a BT.601 source the encoder
 * wasn't told about came out labeled BT.709 and played a shade off. The conversion itself runs on
 * the phone's codecs and is checked there.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class VideoTranscodeTest {
    @Test
    public void theEncoderTakesTheColorsTheSourceStates() {
        MediaFormat source = MediaFormat.createVideoFormat(MediaFormat.MIMETYPE_VIDEO_VP9, 1080, 1920);
        source.setInteger(MediaFormat.KEY_COLOR_STANDARD, MediaFormat.COLOR_STANDARD_BT601_NTSC);
        source.setInteger(MediaFormat.KEY_COLOR_RANGE, MediaFormat.COLOR_RANGE_LIMITED);
        source.setInteger(MediaFormat.KEY_COLOR_TRANSFER, MediaFormat.COLOR_TRANSFER_SDR_VIDEO);
        MediaFormat encode = VideoTranscode.encoderFormat(1080, 1920, 30, 2_488_320);

        VideoTranscode.keepColors(source, encode);

        assertEquals(MediaFormat.COLOR_STANDARD_BT601_NTSC, encode.getInteger(MediaFormat.KEY_COLOR_STANDARD));
        assertEquals(MediaFormat.COLOR_RANGE_LIMITED, encode.getInteger(MediaFormat.KEY_COLOR_RANGE));
        assertEquals(MediaFormat.COLOR_TRANSFER_SDR_VIDEO, encode.getInteger(MediaFormat.KEY_COLOR_TRANSFER));
        assertEquals(2_488_320, encode.getInteger(MediaFormat.KEY_BIT_RATE));
        assertEquals(MediaFormat.MIMETYPE_VIDEO_AVC, encode.getString(MediaFormat.KEY_MIME));
        assertEquals("colors color-standard 4, color-range 2, color-transfer 3", VideoTranscode.describeColors(source));
    }

    /** Only what the source states is passed on; the rest stays the encoder's own choice. */
    @Test
    public void colorsTheSourceDoesNotStateStayTheEncoders() {
        MediaFormat source = MediaFormat.createVideoFormat(MediaFormat.MIMETYPE_VIDEO_AV1, 720, 1280);
        MediaFormat encode = VideoTranscode.encoderFormat(720, 1280, 30, 1_105_920);
        VideoTranscode.keepColors(source, encode);
        assertFalse(encode.containsKey(MediaFormat.KEY_COLOR_STANDARD));
        assertFalse(encode.containsKey(MediaFormat.KEY_COLOR_RANGE));
        assertFalse(encode.containsKey(MediaFormat.KEY_COLOR_TRANSFER));
        assertEquals("no colors stated", VideoTranscode.describeColors(source));

        source.setInteger(MediaFormat.KEY_COLOR_RANGE, MediaFormat.COLOR_RANGE_FULL);
        VideoTranscode.keepColors(source, encode);
        assertEquals(MediaFormat.COLOR_RANGE_FULL, encode.getInteger(MediaFormat.KEY_COLOR_RANGE));
        assertFalse(encode.containsKey(MediaFormat.KEY_COLOR_STANDARD));
        assertFalse(encode.containsKey(MediaFormat.KEY_COLOR_TRANSFER));
    }
}
