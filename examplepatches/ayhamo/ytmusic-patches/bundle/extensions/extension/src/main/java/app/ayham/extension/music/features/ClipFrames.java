package app.ayham.extension.music.features;

import android.media.Image;
import android.media.MediaCodec;
import android.media.MediaExtractor;
import android.media.MediaFormat;

import java.io.File;
import java.nio.ByteBuffer;
import java.util.List;

/**
 * Reads a small video file's frames as ClipJudge grids (Prism's ClipDecode): each decoded frame's
 * brightness plane, averaged down to 32 x 18 cells, with its time in the video (ms).
 */
final class ClipFrames {
    private ClipFrames() {
    }

    static void read(File file, List<int[]> frames, List<Long> times) throws Exception {
        MediaExtractor ex = new MediaExtractor();
        MediaCodec codec = null;
        try {
            ex.setDataSource(file.getAbsolutePath());
            int ti = -1;
            for (int i = 0; i < ex.getTrackCount(); i++)
                if (ex.getTrackFormat(i).getString(MediaFormat.KEY_MIME).startsWith("video/")) ti = i;
            if (ti < 0) return;
            ex.selectTrack(ti);
            MediaFormat fmt = ex.getTrackFormat(ti);
            codec = MediaCodec.createDecoderByType(fmt.getString(MediaFormat.KEY_MIME));
            codec.configure(fmt, null, null, 0);
            codec.start();
            MediaCodec.BufferInfo info = new MediaCodec.BufferInfo();
            boolean inDone = false;
            long deadline = System.currentTimeMillis() + 15_000;
            while (System.currentTimeMillis() < deadline) {
                if (!inDone) {
                    int in = codec.dequeueInputBuffer(5000);
                    if (in >= 0) {
                        ByteBuffer b = codec.getInputBuffer(in);
                        int n = b == null ? -1 : ex.readSampleData(b, 0);
                        if (n < 0) {
                            codec.queueInputBuffer(in, 0, 0, 0, MediaCodec.BUFFER_FLAG_END_OF_STREAM);
                            inDone = true;
                        } else {
                            codec.queueInputBuffer(in, 0, n, ex.getSampleTime(), 0);
                            ex.advance();
                        }
                    }
                }
                int o = codec.dequeueOutputBuffer(info, 5000);
                if (o < 0) continue;
                if ((info.flags & MediaCodec.BUFFER_FLAG_END_OF_STREAM) != 0) {
                    codec.releaseOutputBuffer(o, false);
                    break;
                }
                Image img = codec.getOutputImage(o);
                if (img != null) {
                    frames.add(grid(img));
                    times.add(info.presentationTimeUs / 1000);
                    img.close();
                }
                codec.releaseOutputBuffer(o, false);
            }
        } finally {
            ex.release();
            if (codec != null) {
                try {
                    codec.stop();
                } catch (Throwable ignored) {
                }
                codec.release();
            }
        }
    }

    /** The brightness plane averaged to ClipJudge's grid (every other pixel each way is enough). */
    private static int[] grid(Image img) {
        Image.Plane y = img.getPlanes()[0];
        ByteBuffer buf = y.getBuffer();
        int rs = y.getRowStride(), ps = y.getPixelStride();
        android.graphics.Rect crop = img.getCropRect();
        int w = crop.width(), h = crop.height();
        int[] out = new int[ClipJudge.W * ClipJudge.H];
        for (int cy = 0; cy < ClipJudge.H; cy++)
            for (int cx = 0; cx < ClipJudge.W; cx++) {
                int ya = crop.top + cy * h / ClipJudge.H, yb = crop.top + Math.max(cy * h / ClipJudge.H + 1, (cy + 1) * h / ClipJudge.H);
                int xa = crop.left + cx * w / ClipJudge.W, xb = crop.left + Math.max(cx * w / ClipJudge.W + 1, (cx + 1) * w / ClipJudge.W);
                long sum = 0;
                int n = 0;
                for (int yy = ya; yy < yb; yy += 2)
                    for (int xx = xa; xx < xb; xx += 2, n++) sum += buf.get(yy * rs + xx * ps) & 0xFF;
                out[cy * ClipJudge.W + cx] = n > 0 ? (int) (sum / n) : 0;
            }
        return out;
    }
}
