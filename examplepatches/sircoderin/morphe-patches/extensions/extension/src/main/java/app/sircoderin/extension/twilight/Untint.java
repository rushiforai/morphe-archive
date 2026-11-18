package app.sircoderin.extension.twilight;

import android.content.ContentResolver;
import android.content.Context;
import android.database.ContentObserver;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.ColorSpace;
import android.graphics.Paint;
import android.media.MediaScannerConnection;
import android.os.Environment;
import android.os.Handler;
import android.os.HandlerThread;
import android.provider.MediaStore;
import android.util.Log;
import android.view.View;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;

/**
 * Removes Twilight's screen tint from system screenshots, in place, right after they are saved.
 * Entry points are called from patched Twilight code and never throw.
 */
@SuppressWarnings("unused")
@android.annotation.SuppressLint("NewApi") // Twilight requires API 32
public final class Untint {
    static final String TAG = "TwilightUntint";

    private static final long DEBOUNCE_MS = 500;
    private static final long WINDOW_BEFORE_MS = 2500;
    private static final long WINDOW_AFTER_MS = 500;
    private static final long MAX_PIXELS = 40_000_000L;
    private static final int SAMPLES = 20_000;
    private static final int MAX_PROCESSED = 256;

    private static final Object LOCK = new Object();
    private static HandlerThread thread;
    private static Handler handler;
    private static ContentObserver observer;
    private static Context appContext;
    private static boolean loggedNoPermission;
    private static final LinkedHashSet<Long> PROCESSED = new LinkedHashSet<>();

    private Untint() {}

    // ---- Hooks called from patched TwilightView.onDraw ----

    public static void beginFrame(View view) {
        try {
            TintRecorder.beginFrame(view);
        } catch (Throwable t) {
            Log.w(TAG, "beginFrame failed", t);
        }
    }

    public static void drawColor(Canvas canvas, int color) {
        try {
            TintRecorder.onDrawColor(color);
        } catch (Throwable t) {
            Log.w(TAG, "drawColor record failed", t);
        }
        canvas.drawColor(color);
    }

    public static void drawRect(Canvas canvas, float l, float t, float r, float b, Paint paint) {
        try {
            TintRecorder.onDrawRect(l, t, r, b, paint);
        } catch (Throwable e) {
            Log.w(TAG, "drawRect record failed", e);
        }
        canvas.drawRect(l, t, r, b, paint);
    }

    /** Inserted before any other draw call in onDraw: the frame is no longer a plain tint. */
    public static void markTextured() {
        try {
            TintRecorder.onOtherDraw();
        } catch (Throwable t) {
            Log.w(TAG, "markTextured failed", t);
        }
    }

    // ---- Lifecycle, called from patched AbstractTwilightService ----

    public static void start(Context context) {
        try {
            synchronized (LOCK) {
                if (observer != null) return;
                appContext = context.getApplicationContext() != null ? context.getApplicationContext() : context;
                thread = new HandlerThread("TwilightUntint");
                thread.start();
                handler = new Handler(thread.getLooper());
                observer = new ContentObserver(handler) {
                    @Override
                    public void onChange(boolean selfChange) {
                        scheduleScan();
                    }
                };
                // Registered even without "All files access": the permission is re-checked on each
                // change, so granting it later works without restarting the service.
                appContext.getContentResolver().registerContentObserver(
                        MediaStore.Images.Media.EXTERNAL_CONTENT_URI, true, observer);
            }
            if (!Environment.isExternalStorageManager()) {
                logNoPermissionOnce();
            }
        } catch (Throwable t) {
            Log.w(TAG, "start failed", t);
        }
    }

    public static void stop() {
        try {
            synchronized (LOCK) {
                if (observer != null && appContext != null) {
                    appContext.getContentResolver().unregisterContentObserver(observer);
                }
                observer = null;
                if (thread != null) {
                    thread.quitSafely();
                }
                thread = null;
                handler = null;
            }
        } catch (Throwable t) {
            Log.w(TAG, "stop failed", t);
        }
    }

    private static void logNoPermissionOnce() {
        if (!loggedNoPermission) {
            loggedNoPermission = true;
            Log.i(TAG, "All files access not granted; screenshots will not be untinted until it is");
        }
    }

    // ---- Screenshot detection ----

    private static void scheduleScan() {
        Handler h;
        synchronized (LOCK) {
            h = handler;
        }
        if (h == null) return;
        h.removeCallbacks(SCAN);
        h.postDelayed(SCAN, DEBOUNCE_MS);
    }

    private static final Runnable SCAN = new Runnable() {
        @Override
        public void run() {
            try {
                scan();
            } catch (Throwable t) {
                Log.w(TAG, "scan failed", t);
            }
        }
    };

    private static void scan() {
        Context ctx = appContext;
        if (ctx == null) return;
        if (!Environment.isExternalStorageManager()) {
            logNoPermissionOnce();
            return;
        }
        long nowSec = System.currentTimeMillis() / 1000;
        List<Object[]> rows = new ArrayList<>();
        ContentResolver cr = ctx.getContentResolver();
        try (Cursor c = cr.query(
                MediaStore.Images.Media.EXTERNAL_CONTENT_URI,
                new String[] {
                        MediaStore.MediaColumns._ID, MediaStore.MediaColumns.DATA,
                        MediaStore.MediaColumns.MIME_TYPE, MediaStore.MediaColumns.DATE_TAKEN,
                        MediaStore.MediaColumns.DATE_ADDED },
                MediaStore.MediaColumns.IS_PENDING + "=0 AND " + MediaStore.MediaColumns.DATE_ADDED
                        + ">=? AND " + MediaStore.MediaColumns.RELATIVE_PATH + " LIKE ?",
                new String[] {String.valueOf(nowSec - 60), "%Screenshots%"},
                MediaStore.MediaColumns.DATE_ADDED + " ASC")) {
            if (c == null) return;
            while (c.moveToNext()) {
                rows.add(new Object[] {c.getLong(0), c.getString(1), c.getString(2), c.getLong(3), c.getLong(4)});
            }
        }
        for (Object[] r : rows) {
            long id = (Long) r[0];
            if (!markProcessed(id)) continue; // before writing, so our own write is ignored
            try {
                long taken = (Long) r[3];
                long added = (Long) r[4];
                processFile(ctx, (String) r[1], (String) r[2], taken > 0 ? taken : added * 1000);
            } catch (Throwable t) {
                Log.w(TAG, "processing screenshot " + id + " failed", t);
            }
        }
    }

    private static boolean markProcessed(long id) {
        synchronized (PROCESSED) {
            if (!PROCESSED.add(id)) return false;
            if (PROCESSED.size() > MAX_PROCESSED) {
                Iterator<Long> it = PROCESSED.iterator();
                it.next();
                it.remove();
            }
            return true;
        }
    }

    // ---- Untinting ----

    private static void processFile(Context ctx, String path, String mime, long captureTime) throws Exception {
        long start = System.currentTimeMillis();
        if (path == null) return;
        File file = new File(path);
        if (!file.isFile()) return;

        List<TintRecorder.Entry> candidates = TintRecorder.candidates(
                captureTime - WINDOW_BEFORE_MS, captureTime + WINDOW_AFTER_MS);
        boolean anyTint = false;
        for (TintRecorder.Entry e : candidates) {
            if (e.shown && !e.textured && e.aEff() > 0) anyTint = true;
        }
        if (!anyTint) {
            Log.i(TAG, file.getName() + ": no tint recorded around capture time, left untouched");
            return;
        }

        BitmapFactory.Options bounds = new BitmapFactory.Options();
        bounds.inJustDecodeBounds = true;
        BitmapFactory.decodeFile(path, bounds);
        if (bounds.outWidth <= 0 || (long) bounds.outWidth * bounds.outHeight > MAX_PIXELS) return;

        BitmapFactory.Options opts = new BitmapFactory.Options();
        opts.inMutable = true;
        opts.inPreferredConfig = Bitmap.Config.ARGB_8888;
        Bitmap bmp = BitmapFactory.decodeFile(path, opts);
        if (bmp == null) return;
        try {
            int w = bmp.getWidth();
            int h = bmp.getHeight();
            if (bmp.getConfig() != Bitmap.Config.ARGB_8888 || bmp.getRowBytes() != w * 4) return;
            boolean png = "image/png".equals(mime);

            // Raw (not sRGB-converted) pixels: R,G,B,A bytes in the bitmap's own colour space.
            ByteBuffer buf = ByteBuffer.allocateDirect(w * h * 4);
            bmp.copyPixelsToBuffer(buf);

            ColorSpace target = bmp.getColorSpace();
            if (target == null) target = ColorSpace.get(ColorSpace.Named.SRGB);
            ColorSpace.Connector toImage = ColorSpace.connect(ColorSpace.get(ColorSpace.Named.SRGB), target);

            int[] sample = samplePixels(buf, w, h);
            if (sample == null) {
                Log.i(TAG, file.getName() + ": not opaque, left untouched");
                return;
            }
            int tol = png ? 6 : 12;
            double maxMiss = png ? 0.005 : 0.015;

            TintMath best = null;
            TintRecorder.Entry bestEntry = null;
            double bestFit = 1;
            for (TintRecorder.Entry e : candidates) {
                if (!e.shown || e.textured) continue;
                TintMath m = buildMath(e, toImage);
                if (!m.isUsable()) continue;
                double fit = m.fitFraction(sample, tol);
                if (fit < maxMiss && (best == null || m.alpha() > best.alpha())) {
                    best = m;
                    bestEntry = e;
                    bestFit = fit;
                }
            }
            if (best == null) {
                Log.i(TAG, file.getName() + ": no candidate tint fits the image, left untouched");
                return;
            }

            int[] row = new int[w];
            for (int y = 0; y < h; y++) {
                int base = y * w * 4;
                for (int x = 0; x < w; x++) {
                    int o = base + x * 4;
                    row[x] = ((buf.get(o + 3) & 0xFF) << 24) | ((buf.get(o) & 0xFF) << 16)
                            | ((buf.get(o + 1) & 0xFF) << 8) | (buf.get(o + 2) & 0xFF);
                }
                best.invert(row);
                for (int x = 0; x < w; x++) {
                    int o = base + x * 4;
                    int px = row[x];
                    buf.put(o, (byte) (px >> 16));
                    buf.put(o + 1, (byte) (px >> 8));
                    buf.put(o + 2, (byte) px);
                }
            }
            buf.rewind();
            bmp.copyPixelsFromBuffer(buf);

            File tmp = File.createTempFile("untint", png ? ".png" : ".jpg", ctx.getCacheDir());
            try {
                try (FileOutputStream out = new FileOutputStream(tmp)) {
                    if (!bmp.compress(png ? Bitmap.CompressFormat.PNG : Bitmap.CompressFormat.JPEG, png ? 100 : 95, out)) {
                        Log.w(TAG, file.getName() + ": compress failed, left untouched");
                        return;
                    }
                }
                if (tmp.length() == 0) return;
                long modified = file.lastModified();
                try (FileInputStream in = new FileInputStream(tmp); FileOutputStream out = new FileOutputStream(file)) {
                    byte[] chunk = new byte[64 * 1024];
                    int n;
                    while ((n = in.read(chunk)) > 0) out.write(chunk, 0, n);
                }
                file.setLastModified(modified);
            } finally {
                tmp.delete();
            }
            MediaScannerConnection.scanFile(ctx, new String[] {path}, new String[] {mime}, null);
            double[] p = best.premul();
            Log.i(TAG, String.format("%s: untinted A=%.3f P=(%.0f,%.0f,%.0f) [%s] fit-miss=%.2f%% in %d ms",
                    file.getName(), best.alpha(), p[0], p[1], p[2], bestEntry, bestFit * 100,
                    System.currentTimeMillis() - start));
        } finally {
            bmp.recycle();
        }
    }

    private static TintMath buildMath(TintRecorder.Entry e, ColorSpace.Connector toImage) {
        int tint = e.tint;
        float[] rgb = toImage.transform(
                ((tint >> 16) & 0xFF) / 255f, ((tint >> 8) & 0xFF) / 255f, (tint & 0xFF) / 255f);
        double f = e.premulFactor();
        double[] p = new double[3];
        for (int c = 0; c < 3; c++) {
            double v = Math.max(0, Math.min(1, rgb[c]));
            p[c] = f * v * 255.0;
        }
        return new TintMath(e.aEff(), p);
    }

    /** ~SAMPLES pixels on a grid as packed ARGB; null if any is not fully opaque. */
    private static int[] samplePixels(ByteBuffer buf, int w, int h) {
        int step = Math.max(1, (int) Math.sqrt((double) w * h / SAMPLES));
        int cols = (w + step - 1) / step;
        int rows = (h + step - 1) / step;
        int[] out = new int[cols * rows];
        int i = 0;
        for (int y = 0; y < h; y += step) {
            for (int x = 0; x < w; x += step) {
                int o = (y * w + x) * 4;
                int a = buf.get(o + 3) & 0xFF;
                if (a != 255) return null;
                out[i++] = (a << 24) | ((buf.get(o) & 0xFF) << 16) | ((buf.get(o + 1) & 0xFF) << 8) | (buf.get(o + 2) & 0xFF);
            }
        }
        return out;
    }
}
