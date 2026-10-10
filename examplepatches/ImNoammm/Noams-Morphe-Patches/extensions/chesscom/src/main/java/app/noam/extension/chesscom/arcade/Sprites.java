package app.noam.extension.chesscom.arcade;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.RectF;
import android.os.SystemClock;
import android.util.DisplayMetrics;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import app.noam.extension.chesscom.Utils;

/**
 * The website's Arcade sprite sheets. They aren't shipped with the patch: the app fetches them from
 * chess.com on first use and caches them. A sheet is a row of square frames played at 24 fps.
 */
final class Sprites {
    private static final String SOURCE = "https://www.chess.com/bundles/web/images/webgl_data/two-d/arcade/";
    private static final String CACHE = "morphe-arcade-1";
    private static final float FPS = 24f;
    private static final long RETRY_MS = 60_000;

    /** Accent colours of the website's Arcade renderer. */
    static final String WHITE = "#38DCFF";
    static final String BLACK = "#FF5252";

    static final class Sheet {
        final String name;
        /** Fills the sheet's {{color}} placeholder, or null. */
        final String color;
        /** One stretched image rather than a row of frames. */
        final boolean single;
        volatile Bitmap bitmap;
        private final Rect source = new Rect();

        Sheet(String name, String color, boolean single) {
            this.name = name;
            this.color = color;
            this.single = single;
        }

        int frames() {
            Bitmap b = bitmap;
            if (b == null || single) return 1;
            return Math.max(1, (int) Math.ceil(b.getWidth() / (float) b.getHeight()));
        }

        long duration() {
            return Math.round(frames() * 1000 / FPS);
        }

        static int frameAt(long elapsed) {
            return elapsed <= 0 ? 0 : (int) (elapsed * FPS / 1000);
        }

        /** Draws {@code frame} into {@code target}; false while the sheet is not ready. */
        boolean draw(Canvas canvas, int frame, RectF target, Paint paint) {
            Bitmap b = bitmap;
            if (b == null) return false;
            if (single) {
                canvas.drawBitmap(b, null, target, paint);
                return true;
            }
            int size = b.getHeight();
            int left = Math.min(frame, frames() - 1) * size;
            source.set(left, 0, Math.min(left + size, b.getWidth()), size);
            canvas.drawBitmap(b, source, target, paint);
            return true;
        }

        String fileName(float scale) {
            String tint = color == null ? "" : "-" + color.substring(1).toLowerCase(Locale.ROOT);
            return name + tint + "@" + scale + ".png";
        }
    }

    static final Sheet TRAIL_WHITE = new Sheet("piece-trail", WHITE, true);
    static final Sheet TRAIL_BLACK = new Sheet("piece-trail", BLACK, true);
    static final Sheet GRAB_WHITE = new Sheet("piece-grab", WHITE, false);
    static final Sheet GRAB_BLACK = new Sheet("piece-grab", BLACK, false);
    static final Sheet RELEASE_WHITE = new Sheet("piece-release", WHITE, false);
    static final Sheet RELEASE_BLACK = new Sheet("piece-release", BLACK, false);
    static final Sheet SQUARE_FILL_WHITE = new Sheet("square-fill", WHITE, false);
    static final Sheet SQUARE_FILL_BLACK = new Sheet("square-fill", BLACK, false);
    static final Sheet CAPTURE = new Sheet("piece-capture", null, false);
    static final Sheet KING_CHECK = new Sheet("king-check", null, false);
    static final Sheet MOVE_HINT_SHOW = new Sheet("move-hint-show", null, false);
    static final Sheet MOVE_HINT_HIDE = new Sheet("move-hint-hide", null, false);
    static final Sheet MOVE_HINT_OVER = new Sheet("move-hint-over", null, false);
    static final Sheet MOVE_HINT_OUT = new Sheet("move-hint-out", null, false);
    static final Sheet CAPTURE_HINT_SHOW = new Sheet("capture-hint-show", null, false);
    static final Sheet CAPTURE_HINT_HIDE = new Sheet("capture-hint-hide", null, false);
    static final Sheet CAPTURE_HINT_OVER = new Sheet("capture-hint-over", null, false);
    static final Sheet CAPTURE_HINT_OUT = new Sheet("capture-hint-out", null, false);

    private static final Sheet[] ALL = {
        TRAIL_WHITE, TRAIL_BLACK, GRAB_WHITE, GRAB_BLACK, RELEASE_WHITE, RELEASE_BLACK,
        SQUARE_FILL_WHITE, SQUARE_FILL_BLACK, CAPTURE, KING_CHECK,
        MOVE_HINT_SHOW, MOVE_HINT_HIDE, MOVE_HINT_OVER, MOVE_HINT_OUT,
        CAPTURE_HINT_SHOW, CAPTURE_HINT_HIDE, CAPTURE_HINT_OVER, CAPTURE_HINT_OUT,
    };

    private static boolean loading;
    private static long lastAttempt;

    private Sprites() {}

    static Sheet trail(boolean white) {
        return white ? TRAIL_WHITE : TRAIL_BLACK;
    }

    static Sheet grab(boolean white) {
        return white ? GRAB_WHITE : GRAB_BLACK;
    }

    static Sheet release(boolean white) {
        return white ? RELEASE_WHITE : RELEASE_BLACK;
    }

    static Sheet squareFill(boolean white) {
        return white ? SQUARE_FILL_WHITE : SQUARE_FILL_BLACK;
    }

    /** Loads the sheets that are not ready yet, off the main thread. */
    static synchronized void prepare() {
        if (loading) return;
        boolean missing = false;
        for (Sheet sheet : ALL) missing |= sheet.bitmap == null;
        if (!missing) return;
        long now = SystemClock.elapsedRealtime();
        if (lastAttempt != 0 && now - lastAttempt < RETRY_MS) return;
        lastAttempt = now;
        loading = true;
        Thread thread = new Thread(Sprites::loadAll, "MorpheArcadeSprites");
        thread.setPriority(Thread.MIN_PRIORITY);
        thread.start();
    }

    private static void loadAll() {
        try {
            Context context = Utils.context();
            if (context == null) return;
            float scale = scale(context);
            File directory = new File(context.getFilesDir(), CACHE);
            if (!directory.isDirectory() && !directory.mkdirs()) return;
            Map<String, String> sources = new HashMap<>();
            for (Sheet sheet : ALL) {
                if (sheet.bitmap != null) continue;
                try {
                    sheet.bitmap = load(sheet, directory, scale, sources);
                } catch (Throwable throwable) {
                    Utils.logError("Arcade sprite " + sheet.name + " is not available", throwable);
                }
            }
        } finally {
            synchronized (Sprites.class) {
                loading = false;
            }
        }
    }

    private static Bitmap load(Sheet sheet, File directory, float scale, Map<String, String> sources) throws Exception {
        File file = new File(directory, sheet.fileName(scale));
        if (file.isFile()) {
            Bitmap cached = BitmapFactory.decodeFile(file.getPath());
            if (cached != null) return cached;
        }
        String svg = sources.get(sheet.name);
        if (svg == null) {
            svg = download(SOURCE + sheet.name + ".svg");
            sources.put(sheet.name, svg);
        }
        if (sheet.color != null) svg = svg.replace("{{color}}", sheet.color);
        Bitmap bitmap = SvgRaster.render(svg, scale);
        File partial = new File(directory, file.getName() + ".part");
        try (FileOutputStream out = new FileOutputStream(partial)) {
            bitmap.compress(Bitmap.CompressFormat.PNG, 100, out);
        }
        if (!partial.renameTo(file)) partial.delete();
        return bitmap;
    }

    private static String download(String address) throws Exception {
        HttpURLConnection connection = (HttpURLConnection) new URL(address).openConnection();
        connection.setConnectTimeout(10_000);
        connection.setReadTimeout(15_000);
        try {
            if (connection.getResponseCode() != HttpURLConnection.HTTP_OK) {
                throw new IllegalStateException("HTTP " + connection.getResponseCode() + " for " + address);
            }
            try (InputStream in = connection.getInputStream()) {
                ByteArrayOutputStream out = new ByteArrayOutputStream();
                byte[] buffer = new byte[16 * 1024];
                for (int read; (read = in.read(buffer)) != -1; ) out.write(buffer, 0, read);
                return out.toString("UTF-8");
            }
        } finally {
            connection.disconnect();
        }
    }

    /** Frames are drawn about a square in size; render them near that size, in quarter steps. */
    private static float scale(Context context) {
        DisplayMetrics metrics = context.getResources().getDisplayMetrics();
        float square = Math.min(metrics.widthPixels, metrics.heightPixels) / 8f;
        float scale = Math.round(square / 128f * 4) / 4f;
        return Math.max(1f, Math.min(1.5f, scale));
    }
}
