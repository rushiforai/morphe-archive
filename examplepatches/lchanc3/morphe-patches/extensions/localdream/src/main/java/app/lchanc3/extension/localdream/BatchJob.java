package app.lchanc3.extension.localdream;

import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.media.ExifInterface;
import android.media.MediaScannerConnection;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.os.Handler;
import android.os.Looper;
import android.os.PowerManager;
import android.provider.MediaStore;
import android.provider.OpenableColumns;
import android.util.Log;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

/**
 * One batch: the picked images, what has become of each, and the thread that
 * upscales them one after another.
 *
 * It outlives the screen showing it, so turning the screen dark or a stray
 * recreation does not lose finished work. There is only ever one; picking a
 * new batch throws the old one away.
 */
final class BatchJob {

    static final int QUEUED = 0;
    static final int RUNNING = 1;
    static final int DONE = 2;
    static final int FAILED = 3;
    static final int CANCELLED = 4;

    /** What the app's upscale screen does, on the backend it starts. */
    private static final String BACKEND = "http://localhost:8081";
    private static final int NATIVE_SCALE = 4;
    static final int[] SCALES = {2, 3, NATIVE_SCALE};
    /**
     * How long the wake lock is held for one step, renewed at every picture:
     * longer than the backend is given for one, so it only runs out if the
     * batch never lets go of it.
     */
    private static final long WAKE_LOCK_TIMEOUT_MS = 35 * 60_000;

    /** The upscale screen's own choice, which the batch starts from and writes back to. */
    private static final String PREFS = "upscaler_prefs";
    private static final String PREF_UPSCALER = "upscaler_standalone_selected_upscaler";
    private static final String PREF_SCALE = "upscaler_standalone_upscale_scale";

    static final class Item {
        final int index;
        final Uri source;
        volatile String name;
        volatile int state = QUEUED;
        volatile int sourceWidth;
        volatile int sourceHeight;
        volatile File output;
        volatile int outputWidth;
        volatile int outputHeight;
        volatile int scale;
        volatile String error;
        volatile long startedAt;
        volatile long durationMs;
        volatile boolean saved;

        Item(int index, Uri source) {
            this.index = index;
            this.source = source;
        }

        boolean isPng() {
            File file = output;
            return file != null && file.getName().endsWith(".png");
        }
    }

    interface Listener {
        void onBatchChanged();
    }

    private static BatchJob current;

    final Context context;
    final List<Item> items;
    private final File directory;
    private final Handler main = new Handler(Looper.getMainLooper());
    private final List<Listener> listeners = new CopyOnWriteArrayList<>();

    volatile String upscalerId;
    volatile int scale;
    volatile boolean running;
    volatile boolean waitingForBackend;
    volatile String problem;

    private volatile boolean stopRequested;
    private volatile Thread worker;
    private volatile HttpURLConnection connection;
    private PowerManager.WakeLock wakeLock;

    static synchronized BatchJob current() {
        return current;
    }

    /** A new batch for [uris], throwing away the one before. */
    static synchronized BatchJob create(Context context, List<Uri> uris) {
        // Whatever an earlier process left behind. The batch being replaced
        // clears its own once its thread has let go of it.
        File root = new File(context.getCacheDir(), "batch_upscale");
        File[] leftovers = root.listFiles();
        if (leftovers != null) {
            for (File leftover : leftovers) {
                if (current == null || !leftover.equals(current.directory)) delete(leftover);
            }
        }
        if (current != null) {
            current.discard();
        }
        current = new BatchJob(context.getApplicationContext(), uris, root);
        return current;
    }

    static synchronized void discardCurrent() {
        if (current != null) {
            current.discard();
            current = null;
        }
    }

    private BatchJob(Context context, List<Uri> uris, File root) {
        this.context = context;
        List<Item> items = new ArrayList<>();
        for (int i = 0; i < uris.size(); i++) {
            items.add(new Item(i, uris.get(i)));
        }
        this.items = Collections.unmodifiableList(items);
        this.directory = new File(root, String.valueOf(System.currentTimeMillis()));
        directory.mkdirs();

        List<String> upscalers = downloadedUpscalers(context);
        String preferred = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE).getString(PREF_UPSCALER, null);
        upscalerId = upscalers.contains(preferred) ? preferred : upscalers.isEmpty() ? null : upscalers.get(0);
        int preferredScale = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE).getInt(PREF_SCALE, NATIVE_SCALE);
        scale = NATIVE_SCALE;
        for (int option : SCALES) {
            if (option == preferredScale) scale = option;
        }

        new Thread(() -> {
            for (Item item : this.items) {
                item.name = displayName(context, item.source);
            }
            changed();
        }, "BatchUpscaleNames").start();
    }

    void addListener(Listener listener) {
        listeners.add(listener);
    }

    void removeListener(Listener listener) {
        listeners.remove(listener);
    }

    private void changed() {
        main.post(() -> {
            for (Listener listener : listeners) {
                listener.onBatchChanged();
            }
        });
    }

    int count(int state) {
        int count = 0;
        for (Item item : items) {
            if (item.state == state) count++;
        }
        return count;
    }

    int unsavedCount() {
        int count = 0;
        for (Item item : items) {
            if (item.state == DONE && !item.saved) count++;
        }
        return count;
    }

    // ---------------------------------------------------------------- running

    /** Upscales every image not done yet, again for the ones that failed or were stopped. */
    synchronized void start() {
        if (running || upscalerId == null) return;
        context.getSharedPreferences(PREFS, Context.MODE_PRIVATE).edit()
            .putString(PREF_UPSCALER, upscalerId)
            .putInt(PREF_SCALE, scale)
            .apply();
        for (Item item : items) {
            if (item.state == FAILED || item.state == CANCELLED) {
                item.state = QUEUED;
                item.error = null;
            }
        }
        problem = null;
        stopRequested = false;
        running = true;
        Thread thread = new Thread(this::work, "BatchUpscale");
        worker = thread;
        thread.start();
        changed();
    }

    void stop() {
        stopRequested = true;
        HttpURLConnection connection = this.connection;
        if (connection != null) {
            // Unblocks a read that is waiting for the backend.
            new Thread(connection::disconnect).start();
        }
        Thread worker = this.worker;
        if (worker != null) worker.interrupt();
    }

    private void discard() {
        stop();
        listeners.clear();
        File directory = this.directory;
        new Thread(() -> {
            Thread worker = this.worker;
            if (worker != null) {
                try {
                    worker.join(10_000);
                } catch (InterruptedException ignored) {
                }
            }
            delete(directory);
        }, "BatchUpscaleCleanup").start();
    }

    private void work() {
        try {
            keepAwake();
            if (!waitForBackend()) {
                if (!stopRequested) problem = Strings.get(context).backendNotRunning;
                return;
            }
            for (Item item : items) {
                if (stopRequested) break;
                if (item.state != QUEUED) continue;
                keepAwake();
                process(item);
            }
        } finally {
            letSleep();
            for (Item item : items) {
                if (item.state == QUEUED || item.state == RUNNING) item.state = CANCELLED;
            }
            waitingForBackend = false;
            running = false;
            worker = null;
            changed();
        }
    }

    /**
     * Keeps the CPU running, for the backend as well as this thread, so the
     * batch goes on with the screen off. Renews the timeout when already held.
     */
    private void keepAwake() {
        try {
            if (wakeLock == null) {
                PowerManager power = (PowerManager) context.getSystemService(Context.POWER_SERVICE);
                wakeLock = power.newWakeLock(PowerManager.PARTIAL_WAKE_LOCK, "LocalDream:BatchUpscale");
                wakeLock.setReferenceCounted(false);
            }
            wakeLock.acquire(WAKE_LOCK_TIMEOUT_MS);
        } catch (Throwable ex) {
            // Without the permission the batch still runs while the screen is on.
            Log.w(BatchUpscalePatch.LOG_TAG, "Could not hold a wake lock", ex);
        }
    }

    private void letSleep() {
        try {
            if (wakeLock != null && wakeLock.isHeld()) wakeLock.release();
        } catch (Throwable ex) {
            Log.w(BatchUpscalePatch.LOG_TAG, "Could not release the wake lock", ex);
        }
    }

    /**
     * The upscale screen starts the backend when it opens and it takes a moment
     * to listen, so a batch picked straight away has to wait for it.
     */
    private boolean waitForBackend() {
        for (int attempt = 0; attempt < 60 && !stopRequested; attempt++) {
            try {
                HttpURLConnection health = (HttpURLConnection) new URL(BACKEND + "/health").openConnection();
                health.setConnectTimeout(2000);
                health.setReadTimeout(2000);
                try {
                    if (health.getResponseCode() == 200) {
                        waitingForBackend = false;
                        return true;
                    }
                } finally {
                    health.disconnect();
                }
            } catch (IOException ignored) {
            }
            if (!waitingForBackend) {
                waitingForBackend = true;
                changed();
            }
            try {
                Thread.sleep(1000);
            } catch (InterruptedException e) {
                return false;
            }
        }
        waitingForBackend = false;
        return false;
    }

    private void process(Item item) {
        int scale = this.scale;
        String upscalerId = this.upscalerId;
        item.state = RUNNING;
        item.scale = scale;
        item.startedAt = System.currentTimeMillis();
        changed();

        try {
            File weights = upscalerFile(context, upscalerId);
            if (!weights.isFile()) throw new IOException("Upscaler model file not found: " + weights);

            Bitmap bitmap = decodeUpright(context.getContentResolver(), item.source);
            int width = bitmap.getWidth();
            int height = bitmap.getHeight();
            item.sourceWidth = width;
            item.sourceHeight = height;
            changed();

            // The backend takes raw RGB. Row by row, so there is never a second
            // copy of the whole image as ints next to the bitmap.
            byte[] rgb = new byte[width * height * 3];
            byte[] alpha = bitmap.hasAlpha() ? new byte[width * height] : null;
            boolean transparent = false;
            int[] row = new int[width];
            for (int y = 0; y < height; y++) {
                bitmap.getPixels(row, 0, width, 0, y, width, 1);
                int offset = y * width;
                for (int x = 0; x < width; x++) {
                    int pixel = row[x];
                    int i = (offset + x) * 3;
                    rgb[i] = (byte) (pixel >> 16);
                    rgb[i + 1] = (byte) (pixel >> 8);
                    rgb[i + 2] = (byte) pixel;
                    if (alpha != null) {
                        int a = pixel >>> 24;
                        alpha[offset + x] = (byte) a;
                        if (a != 0xFF) transparent = true;
                    }
                }
            }
            bitmap.recycle();
            if (!transparent) alpha = null;

            HttpURLConnection upscale = (HttpURLConnection) new URL(BACKEND + "/upscale").openConnection();
            connection = upscale;
            try {
                upscale.setRequestMethod("POST");
                upscale.setDoOutput(true);
                upscale.setConnectTimeout(30_000);
                // A large image on a slow chip takes minutes; the app's own
                // client waits five, which is not always enough.
                upscale.setReadTimeout(30 * 60_000);
                upscale.setFixedLengthStreamingMode(rgb.length);
                upscale.setRequestProperty("Content-Type", "application/octet-stream");
                upscale.setRequestProperty("X-Image-Width", String.valueOf(width));
                upscale.setRequestProperty("X-Image-Height", String.valueOf(height));
                upscale.setRequestProperty("X-Upscaler-Path", weights.getAbsolutePath());
                try (OutputStream out = upscale.getOutputStream()) {
                    out.write(rgb);
                }
                rgb = null;

                int code = upscale.getResponseCode();
                if (code / 100 != 2) {
                    String body = "";
                    InputStream error = upscale.getErrorStream();
                    if (error != null) {
                        try (InputStream in = error) {
                            body = new String(readAll(in), "UTF-8");
                        }
                    }
                    throw new IOException("HTTP " + code + (body.isEmpty() ? "" : ": " + body));
                }

                File output = new File(directory, item.index + (alpha != null ? ".png" : ".jpg"));
                if (scale == NATIVE_SCALE && alpha == null) {
                    // The backend's JPEG is the result as it is: kept byte for
                    // byte, with no decoding a picture this size at all.
                    try (InputStream in = upscale.getInputStream(); OutputStream out = new FileOutputStream(output)) {
                        copy(in, out);
                    }
                } else {
                    byte[] jpeg;
                    try (InputStream in = upscale.getInputStream()) {
                        jpeg = readAll(in);
                    }
                    Bitmap result = decodeAtScale(jpeg, width, height, scale);
                    jpeg = null;
                    if (alpha != null) {
                        result = applyAlpha(result, alpha, width, height);
                    }
                    try (OutputStream out = new FileOutputStream(output)) {
                        if (alpha != null) {
                            result.compress(Bitmap.CompressFormat.PNG, 100, out);
                        } else {
                            result.compress(Bitmap.CompressFormat.JPEG, 95, out);
                        }
                    }
                    result.recycle();
                }

                BitmapFactory.Options bounds = new BitmapFactory.Options();
                bounds.inJustDecodeBounds = true;
                BitmapFactory.decodeFile(output.getAbsolutePath(), bounds);
                if (bounds.outWidth <= 0) throw new IOException("The backend returned no image");
                item.outputWidth = bounds.outWidth;
                item.outputHeight = bounds.outHeight;
                item.output = output;
                item.saved = false;
                item.durationMs = System.currentTimeMillis() - item.startedAt;
                item.state = DONE;
            } finally {
                connection = null;
                upscale.disconnect();
            }
        } catch (Throwable ex) {
            if (stopRequested) {
                item.state = CANCELLED;
            } else {
                Log.e(BatchUpscalePatch.LOG_TAG, "Could not upscale " + item.source, ex);
                String message = ex.getMessage();
                item.error = message == null || message.isEmpty() ? ex.getClass().getSimpleName() : message;
                item.state = FAILED;
            }
        }
        changed();
    }

    /**
     * The backend always answers at its native 4x; a smaller scale is the
     * result shrunk to that many times the source, like the upscale screen does.
     */
    private static Bitmap decodeAtScale(byte[] jpeg, int sourceWidth, int sourceHeight, int scale) throws IOException {
        BitmapFactory.Options bounds = new BitmapFactory.Options();
        bounds.inJustDecodeBounds = true;
        BitmapFactory.decodeByteArray(jpeg, 0, jpeg.length, bounds);
        int width = bounds.outWidth;
        int height = bounds.outHeight;
        if (width <= 0) throw new IOException("Could not decode the backend's image");

        int targetWidth = scale == NATIVE_SCALE ? width : sourceWidth * scale;
        int targetHeight = scale == NATIVE_SCALE ? height : sourceHeight * scale;

        // Halving while decoding is cheaper and sharper than shrinking afterwards.
        int sample = 1;
        while (width / (sample * 2) >= targetWidth && height / (sample * 2) >= targetHeight) {
            sample *= 2;
        }
        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inSampleSize = sample;
        options.inPreferredConfig = Bitmap.Config.ARGB_8888;
        Bitmap bitmap = BitmapFactory.decodeByteArray(jpeg, 0, jpeg.length, options);
        if (bitmap == null) throw new IOException("Could not decode the backend's image");
        if (bitmap.getWidth() != targetWidth || bitmap.getHeight() != targetHeight) {
            Bitmap scaled = Bitmap.createScaledBitmap(bitmap, targetWidth, targetHeight, true);
            if (scaled != bitmap) bitmap.recycle();
            bitmap = scaled;
        }
        return bitmap;
    }

    /** The upscalers are RGB only; a transparent source gets its own alpha back, scaled up. */
    private static Bitmap applyAlpha(Bitmap rgb, byte[] alpha, int width, int height) {
        Bitmap sourceAlpha = Bitmap.createBitmap(width, height, Bitmap.Config.ALPHA_8);
        byte[] buffer = alpha;
        int rowBytes = sourceAlpha.getRowBytes();
        if (rowBytes != width) {
            buffer = new byte[rowBytes * height];
            for (int y = 0; y < height; y++) {
                System.arraycopy(alpha, y * width, buffer, y * rowBytes, width);
            }
        }
        sourceAlpha.copyPixelsFromBuffer(ByteBuffer.wrap(buffer));
        Bitmap scaledAlpha = sourceAlpha.getWidth() == rgb.getWidth() && sourceAlpha.getHeight() == rgb.getHeight()
            ? sourceAlpha
            : Bitmap.createScaledBitmap(sourceAlpha, rgb.getWidth(), rgb.getHeight(), true);

        Bitmap rgba = rgb.isMutable() && rgb.getConfig() == Bitmap.Config.ARGB_8888
            ? rgb
            : rgb.copy(Bitmap.Config.ARGB_8888, true);
        rgba.setHasAlpha(true);
        Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG | Paint.FILTER_BITMAP_FLAG);
        paint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.DST_IN));
        new Canvas(rgba).drawBitmap(scaledAlpha, 0f, 0f, paint);

        if (scaledAlpha != sourceAlpha) scaledAlpha.recycle();
        sourceAlpha.recycle();
        if (rgba != rgb) rgb.recycle();
        return rgba;
    }

    // ---------------------------------------------------------------- images

    /**
     * The picture the way a gallery shows it. The upscale screen ignores the
     * EXIF rotation, so a portrait photo would come back lying on its side,
     * with no EXIF left to turn it upright again.
     */
    static Bitmap decodeUpright(ContentResolver resolver, Uri uri) throws IOException {
        int orientation = orientation(resolver, uri);
        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inPreferredConfig = Bitmap.Config.ARGB_8888;
        Bitmap bitmap;
        try (InputStream in = resolver.openInputStream(uri)) {
            bitmap = BitmapFactory.decodeStream(in, null, options);
        }
        if (bitmap == null) throw new IOException("Could not decode " + uri);
        return rotate(bitmap, orientation);
    }

    /** A small copy of the picture, upright, no side much longer than [maxSide]. */
    static Bitmap decodeSampled(ContentResolver resolver, Uri uri, int maxSide) throws IOException {
        BitmapFactory.Options bounds = new BitmapFactory.Options();
        bounds.inJustDecodeBounds = true;
        try (InputStream in = resolver.openInputStream(uri)) {
            BitmapFactory.decodeStream(in, null, bounds);
        }
        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inSampleSize = sampleFor(bounds.outWidth, bounds.outHeight, maxSide);
        Bitmap bitmap;
        try (InputStream in = resolver.openInputStream(uri)) {
            bitmap = BitmapFactory.decodeStream(in, null, options);
        }
        if (bitmap == null) throw new IOException("Could not decode " + uri);
        return rotate(bitmap, orientation(resolver, uri));
    }

    static Bitmap decodeSampled(File file, int maxSide) throws IOException {
        BitmapFactory.Options bounds = new BitmapFactory.Options();
        bounds.inJustDecodeBounds = true;
        BitmapFactory.decodeFile(file.getAbsolutePath(), bounds);
        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inSampleSize = sampleFor(bounds.outWidth, bounds.outHeight, maxSide);
        Bitmap bitmap = BitmapFactory.decodeFile(file.getAbsolutePath(), options);
        if (bitmap == null) throw new IOException("Could not decode " + file);
        return bitmap;
    }

    static int sampleFor(int width, int height, int maxSide) {
        int sample = 1;
        while (Math.max(width, height) / sample > maxSide) {
            sample *= 2;
        }
        return sample;
    }

    /** Width and height of the picture the way a gallery shows it, without decoding it. */
    static int[] uprightSize(ContentResolver resolver, Uri uri) throws IOException {
        BitmapFactory.Options bounds = new BitmapFactory.Options();
        bounds.inJustDecodeBounds = true;
        try (InputStream in = resolver.openInputStream(uri)) {
            BitmapFactory.decodeStream(in, null, bounds);
        }
        switch (orientation(resolver, uri)) {
            case ExifInterface.ORIENTATION_TRANSPOSE:
            case ExifInterface.ORIENTATION_ROTATE_90:
            case ExifInterface.ORIENTATION_TRANSVERSE:
            case ExifInterface.ORIENTATION_ROTATE_270:
                return new int[]{bounds.outHeight, bounds.outWidth};
            default:
                return new int[]{bounds.outWidth, bounds.outHeight};
        }
    }

    private static int orientation(ContentResolver resolver, Uri uri) {
        try (InputStream in = resolver.openInputStream(uri)) {
            if (in == null) return ExifInterface.ORIENTATION_NORMAL;
            return new ExifInterface(in).getAttributeInt(ExifInterface.TAG_ORIENTATION, ExifInterface.ORIENTATION_NORMAL);
        } catch (Throwable ex) {
            return ExifInterface.ORIENTATION_NORMAL;
        }
    }

    private static Bitmap rotate(Bitmap bitmap, int orientation) {
        Matrix matrix = new Matrix();
        switch (orientation) {
            case ExifInterface.ORIENTATION_FLIP_HORIZONTAL: matrix.setScale(-1, 1); break;
            case ExifInterface.ORIENTATION_ROTATE_180: matrix.setRotate(180); break;
            case ExifInterface.ORIENTATION_FLIP_VERTICAL: matrix.setScale(1, -1); break;
            case ExifInterface.ORIENTATION_TRANSPOSE: matrix.setRotate(90); matrix.postScale(-1, 1); break;
            case ExifInterface.ORIENTATION_ROTATE_90: matrix.setRotate(90); break;
            case ExifInterface.ORIENTATION_TRANSVERSE: matrix.setRotate(-90); matrix.postScale(-1, 1); break;
            case ExifInterface.ORIENTATION_ROTATE_270: matrix.setRotate(-90); break;
            default: return bitmap;
        }
        Bitmap rotated = Bitmap.createBitmap(bitmap, 0, 0, bitmap.getWidth(), bitmap.getHeight(), matrix, true);
        if (rotated != bitmap) bitmap.recycle();
        return rotated;
    }

    private static String displayName(Context context, Uri uri) {
        try (Cursor cursor = context.getContentResolver()
            .query(uri, new String[]{OpenableColumns.DISPLAY_NAME}, null, null, null)) {
            if (cursor != null && cursor.moveToFirst()) {
                String name = cursor.getString(0);
                if (name != null && !name.isEmpty()) return name;
            }
        } catch (Throwable ignored) {
        }
        String last = uri.getLastPathSegment();
        return last != null ? last : "image";
    }

    // ---------------------------------------------------------------- saving

    /** Copies a finished result into Pictures/LocalDream, where the app saves its own. */
    void save(Item item) throws IOException {
        File output = item.output;
        if (item.state != DONE || output == null) throw new IOException("Not upscaled yet");

        String name = item.name != null ? item.name : "image";
        int dot = name.lastIndexOf('.');
        if (dot > 0) name = name.substring(0, dot);
        name = name.replaceAll("[\\\\/:*?\"<>|]", "_");
        String extension = item.isPng() ? "png" : "jpg";
        String mime = item.isPng() ? "image/png" : "image/jpeg";
        String fileName = name + "_x" + item.scale + "." + extension;

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            ContentResolver resolver = context.getContentResolver();
            ContentValues values = new ContentValues();
            values.put(MediaStore.Images.Media.DISPLAY_NAME, fileName);
            values.put(MediaStore.Images.Media.MIME_TYPE, mime);
            values.put(MediaStore.Images.Media.RELATIVE_PATH, Environment.DIRECTORY_PICTURES + "/LocalDream");
            values.put(MediaStore.Images.Media.IS_PENDING, 1);
            Uri uri = resolver.insert(MediaStore.Images.Media.EXTERNAL_CONTENT_URI, values);
            if (uri == null) throw new IOException("Failed to create MediaStore entry");
            try {
                try (InputStream in = new FileInputStream(output); OutputStream out = resolver.openOutputStream(uri)) {
                    if (out == null) throw new IOException("Failed to open output stream");
                    copy(in, out);
                }
                values.clear();
                values.put(MediaStore.Images.Media.IS_PENDING, 0);
                resolver.update(uri, values, null, null);
            } catch (IOException ex) {
                resolver.delete(uri, null, null);
                throw ex;
            }
        } else {
            File pictures = new File(
                Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_PICTURES), "LocalDream");
            pictures.mkdirs();
            File target = new File(pictures, fileName);
            for (int n = 1; target.exists(); n++) {
                target = new File(pictures, name + "_x" + item.scale + " (" + n + ")." + extension);
            }
            try (InputStream in = new FileInputStream(output); OutputStream out = new FileOutputStream(target)) {
                copy(in, out);
            }
            MediaScannerConnection.scanFile(context, new String[]{target.toString()}, new String[]{mime}, null);
        }
        item.saved = true;
        changed();
    }

    // ---------------------------------------------------------------- app state

    /** The upscalers downloaded on this phone, the app's two first. */
    static List<String> downloadedUpscalers(Context context) {
        List<String> ids = new ArrayList<>();
        for (String id : new String[]{"upscaler_anime", "upscaler_realistic"}) {
            if (upscalerFile(context, id).length() > 0) ids.add(id);
        }
        File[] models = new File(context.getFilesDir(), "models").listFiles();
        if (models != null) {
            List<String> others = new ArrayList<>();
            for (File model : models) {
                String id = model.getName();
                if (id.startsWith("upscaler_") && !ids.contains(id) && upscalerFile(context, id).length() > 0) {
                    others.add(id);
                }
            }
            Collections.sort(others);
            ids.addAll(others);
        }
        return ids;
    }

    static File upscalerFile(Context context, String id) {
        return new File(new File(new File(context.getFilesDir(), "models"), id), "upscaler.bin");
    }

    /** The name the app gives the upscaler, from its own strings. */
    static String upscalerName(Context context, String id) {
        try {
            int res = context.getResources().getIdentifier(id, "string", context.getPackageName());
            if (res != 0) return context.getString(res);
        } catch (Throwable ignored) {
        }
        return id;
    }

    /** Whether the app upscales on another device, which the batch cannot. */
    static boolean isConnectedDeviceMode(Context context) {
        return context.getSharedPreferences("app_prefs", Context.MODE_PRIVATE).getString("remote_host", null) != null;
    }

    // ---------------------------------------------------------------- io

    private static void copy(InputStream in, OutputStream out) throws IOException {
        byte[] buffer = new byte[256 * 1024];
        int read;
        while ((read = in.read(buffer)) != -1) {
            out.write(buffer, 0, read);
        }
    }

    private static byte[] readAll(InputStream in) throws IOException {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        copy(in, out);
        return out.toByteArray();
    }

    private static void delete(File file) {
        File[] children = file.listFiles();
        if (children != null) {
            for (File child : children) delete(child);
        }
        file.delete();
    }
}
