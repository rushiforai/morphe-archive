package app.s.chzzk.extension;

import android.media.MediaCodec;
import android.media.MediaCrypto;
import android.media.MediaFormat;
import android.os.Build;
import android.util.Log;

public final class CodecWorkarounds {
    private static volatile boolean enabled;

    public static void configure(boolean value) {
        enabled = value;
    }

    private static boolean affectedFirmware() {
        return Build.VERSION.SDK_INT == 33 && "TB128FU".equals(Build.DEVICE)
                && Build.DISPLAY.contains("_ZUI_15.0.619_");
    }

    private static boolean affectedVideo(String codec, int width, int height, double frameRate) {
        return affectedFirmware() && "OMX.qcom.video.decoder.avc".equals(codec)
                && width == 1920 && (height == 1080 || height == 1088)
                && frameRate > 30 && frameRate <= 60;
    }

    public static boolean supportsSizeAndRate(Object info, int width, int height, double frameRate) {
        return enabled && affectedVideo(codecName(info), width, height, frameRate);
    }

    private static String codecName(Object info) {
        return null;
    }

    public static void prepare(MediaCodec codec, MediaFormat format, MediaCrypto crypto) {
        if (!enabled || crypto != null || !affectedFirmware() || !"video/avc".equals(format.getString(MediaFormat.KEY_MIME))
                || !format.containsKey(MediaFormat.KEY_FRAME_RATE)) return;
        Number rate = format.getNumber(MediaFormat.KEY_FRAME_RATE);
        if (rate != null && affectedVideo(codec.getName(), format.getInteger(MediaFormat.KEY_WIDTH),
                format.getInteger(MediaFormat.KEY_HEIGHT), rate.doubleValue())) {
            format.removeKey(MediaFormat.KEY_FRAME_RATE);
            Log.i("SChzzkCodec", "Applied TB128FU AVC decoder initialization workaround");
        }
    }
}
