/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.graphics.Bitmap;
import android.graphics.BitmapShader;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.drawable.Drawable;
import android.graphics.pdf.PdfRenderer;
import android.media.MediaMetadataRetriever;
import android.media.ThumbnailUtils;
import android.os.ParcelFileDescriptor;
import android.os.SystemClock;
import android.util.LruCache;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;

import androidx.annotation.Nullable;

import java.io.File;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.WeakHashMap;

import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.ui.Dim;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * File icons and thumbnails (#79). A file sent as a document gets a picture of what it is where
 * Telegram would show its generic file icon: an APK an Android-style glyph, an EXE a
 * Windows-style one, a downloaded PDF its first page and a downloaded video a frame from it. Two
 * places take it: the file's circle in a chat bubble, once the file is downloaded, and the icon in
 * Shared media &gt; Files. A file with a thumbnail from Telegram's servers keeps it, and one that
 * isn't downloaded yet keeps Telegram's own icon.
 *
 * <p>Pages and frames are made on a worker, at the size they're shown, and kept in memory; the
 * PDF renderer and the video reader are closed as soon as the one picture is made. Everything here
 * runs on the main thread except that work, and anything that goes wrong leaves Telegram's icon.
 */
public final class FileIcons {
    /** MediaActionDrawable's icon for a downloaded file, what the chat's circle shows once it's there. */
    static final int ICON_FILE = 5;
    /** The largest side a thumbnail is made at, whatever the screen asks for. */
    static final int MAX_SIZE = 512;
    /** How long a file that isn't there yet waits before it's looked for again. */
    static final long RETRY_MILLIS = 2000;
    static final int APK_COLOR = 0xFF3DDC84;
    static final int EXE_COLOR = 0xFF0078D4;
    private static final int CACHE_BYTES = 4 * 1024 * 1024;
    private static final int MAX_REMEMBERED = 256;
    private static final String SHOWN = "file icon shown";
    private static final String MADE = "file thumbnail made";
    private static final Object PDF_LOCK = new Object();

    /** The kinds of file that get a picture of their own. */
    enum Kind { APK, EXE, PDF, VIDEO }

    /** Makes a thumbnail of [file] at [size] pixels square, or answers null. Tests put their own in. */
    interface Maker {
        @Nullable Bitmap make(Kind kind, File file, int size) throws Exception;
    }

    static Maker maker = FileIcons::render;

    private static final LruCache<String, Bitmap> MADE_PICTURES = new LruCache<String, Bitmap>(CACHE_BYTES) {
        @Override protected int sizeOf(String key, Bitmap value) {
            return value.getByteCount();
        }
    };
    /** Main thread only: files that couldn't be made into a picture, which aren't tried again. */
    private static final Map<String, Boolean> FAILED = remembered();
    /** Main thread only: when a file that wasn't there may be looked for again. */
    private static final Map<String, Long> WAITING = remembered();
    /** Main thread only: what each picture being made is wanted for, run when it's done. */
    private static final Map<String, List<Runnable>> MAKING = new HashMap<>();
    /** Main thread only: what each chat message is, so a bubble isn't worked out on every frame. */
    private static final WeakHashMap<Object, Known> KNOWN = new WeakHashMap<>();

    private FileIcons() {}

    private static <V> Map<String, V> remembered() {
        return new LinkedHashMap<String, V>(16, 0.75f, true) {
            @Override protected boolean removeEldestEntry(Map.Entry<String, V> eldest) {
                return size() > MAX_REMEMBERED;
            }
        };
    }

    // ---- Kinds ---------------------------------------------------------------------------------

    /** The kind of picture a file of [name] and [mime] gets, by its name first, or null for none. */
    @Nullable
    static Kind kind(@Nullable String name, @Nullable String mime) {
        String lower = name == null ? "" : name.toLowerCase(Locale.ROOT).trim();
        int dot = lower.lastIndexOf('.');
        String extension = dot < 0 ? "" : lower.substring(dot + 1);
        switch (extension) {
            case "apk": return Kind.APK;
            case "exe": return Kind.EXE;
            case "pdf": return Kind.PDF;
            case "mp4": case "mkv": case "mov": case "avi": case "webm": case "m4v": case "3gp":
                return Kind.VIDEO;
            default: break;
        }
        String type = mime == null ? "" : mime.toLowerCase(Locale.ROOT).trim();
        switch (type) {
            case "application/vnd.android.package-archive": return Kind.APK;
            case "application/x-msdownload": case "application/x-dosexec":
            case "application/vnd.microsoft.portable-executable": return Kind.EXE;
            case "application/pdf": return Kind.PDF;
            default: return type.startsWith("video/") ? Kind.VIDEO : null;
        }
    }

    /** Whether [kind] is shown as a glyph rather than a picture made from the file. */
    static boolean glyph(Kind kind) {
        return kind == Kind.APK || kind == Kind.EXE;
    }

    // ---- Shared media > Files ------------------------------------------------------------------

    /**
     * In place of Telegram's setImageResource on a Shared media file's icon, which it calls on
     * every bind after showing the icon and its extension label. With the switch on, an APK or EXE
     * without a server thumbnail gets its glyph, and a PDF or video its picture once it's made.
     */
    public static void sharedIcon(ImageView view, int resource) {
        HookStatus.invoked(FamilyNames.SAVE_DOWNLOADS);
        boolean changed = false;
        try {
            if (Utils.settingsReady() && Settings.FILE_ICONS.get()) changed = shared(view, resource);
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.SAVE_DOWNLOADS, "file icon", t);
        }
        if (!changed) view.setImageResource(resource);
    }

    /** Whether the icon was set here. A PDF or video gets Telegram's icon until its picture is made. */
    private static boolean shared(ImageView view, int resource) {
        Object cell = view.getParent();
        Object message = sharedMessage(cell);
        Object document = message == null ? null : document(message);
        if (document == null || hasThumb(document)) return false;
        Kind kind = kind(fileName(document), mime(document));
        if (kind == null) return false;
        if (glyph(kind)) {
            view.setImageDrawable(new Glyph(kind, false));
            hideLabel(cell);
            HookStatus.counted(FamilyNames.SAVE_DOWNLOADS, SHOWN);
            return true;
        }
        String key = key(document, message, size(view));
        if (key == null) return false;
        Bitmap made = MADE_PICTURES.get(key);
        if (made != null) {
            view.setImageDrawable(new Picture(made));
            hideLabel(cell);
            return true;
        }
        view.setImageResource(resource);
        WeakReference<ImageView> shown = new WeakReference<>(view);
        request(message, kind, key, size(view), () -> {
            ImageView still = shown.get();
            Bitmap picture = MADE_PICTURES.get(key);
            if (still == null || picture == null || !Settings.FILE_ICONS.get()) return;
            Object now = still.getParent();
            // The cell may show another file by now, or the same one after Telegram set it again.
            if (sharedMessage(now) != message) return;
            still.setImageDrawable(new Picture(picture));
            hideLabel(now);
        });
        return true;
    }

    private static void hideLabel(@Nullable Object cell) {
        // Telegram shows the label again on every bind, before the icon is set.
        Object label = sharedLabel(cell);
        if (label instanceof View) ((View) label).setVisibility(View.INVISIBLE);
    }

    private static int size(View view) {
        int size = Math.max(view.getWidth(), view.getHeight());
        ViewGroup.LayoutParams params = view.getLayoutParams();
        if (size <= 0 && params != null) size = Math.max(params.width, params.height);
        return size > 0 ? size : Dim.dp(40);
    }

    // ---- Chat bubbles --------------------------------------------------------------------------

    /**
     * Right after Telegram draws a chat file's circle. When the circle shows a downloaded file
     * without a server thumbnail, an APK or EXE gets its glyph drawn over it, and a PDF or video its
     * picture, or the circle until the picture is made.
     */
    public static void bubble(Object progress, Canvas canvas) {
        HookStatus.invoked(FamilyNames.SAVE_DOWNLOADS);
        try {
            if (!Utils.settingsReady() || !Settings.FILE_ICONS.get() || progressIcon(progress) != ICON_FILE) return;
            Object cell = progressParent(progress);
            Object message = cell == null ? null : cellMessage(cell);
            RectF rect = message == null ? null : progressRect(progress);
            if (rect == null || rect.width() <= 0 || rect.height() <= 0) return;
            Known known = known(message);
            if (known.kind == null) return;
            if (glyph(known.kind)) {
                Glyph glyph = known.glyph != null ? known.glyph : (known.glyph = new Glyph(known.kind, true));
                draw(glyph, rect, canvas);
                if (!known.counted) {
                    known.counted = true;
                    HookStatus.counted(FamilyNames.SAVE_DOWNLOADS, SHOWN);
                }
                return;
            }
            int size = Math.round(Math.max(rect.width(), rect.height()));
            String key = key(known.document, message, size);
            if (key == null) return;
            Bitmap made = MADE_PICTURES.get(key);
            if (made != null) {
                draw(new Picture(made), rect, canvas);
                return;
            }
            WeakReference<Object> drawn = new WeakReference<>(cell);
            request(message, known.kind, key, size, () -> {
                Object still = drawn.get();
                if (still instanceof View) ((View) still).invalidate();
            });
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.SAVE_DOWNLOADS, "file icon in a chat", t);
        }
    }

    private static void draw(Drawable picture, RectF rect, Canvas canvas) {
        picture.setBounds(Math.round(rect.left), Math.round(rect.top), Math.round(rect.right), Math.round(rect.bottom));
        picture.draw(canvas);
    }

    /** What a chat message's file is, worked out once. */
    static final class Known {
        @Nullable final Object document;
        @Nullable final Kind kind;
        @Nullable Glyph glyph;
        boolean counted;

        Known(@Nullable Object document, @Nullable Kind kind) {
            this.document = document;
            this.kind = kind;
        }
    }

    private static Known known(Object message) {
        Known known = KNOWN.get(message);
        if (known != null) return known;
        Object document = document(message);
        Kind kind = document == null || hasThumb(document) ? null : kind(fileName(document), mime(document));
        known = new Known(document, kind);
        KNOWN.put(message, known);
        return known;
    }

    // ---- Pictures ------------------------------------------------------------------------------

    /** The cache key of [document]'s picture at [size]: its id, or for one being sent its path. */
    @Nullable
    static String key(Object document, Object message, int size) {
        long id = documentId(document);
        String where = id != 0 ? "d" + id : attachPath(message);
        if (where == null || where.isEmpty()) return null;
        return where + "|" + Math.min(size, MAX_SIZE);
    }

    /**
     * Has the picture for [key] made on a worker unless it's made, being made, failed, or waiting
     * for its file, and runs [done] on the main thread once it's in the cache.
     */
    private static void request(Object message, Kind kind, String key, int size, Runnable done) {
        if (MADE_PICTURES.get(key) != null || FAILED.containsKey(key)) return;
        List<Runnable> waiting = MAKING.get(key);
        if (waiting != null) {
            waiting.add(done);
            return;
        }
        Long until = WAITING.get(key);
        if (until != null && SystemClock.uptimeMillis() < until) return;
        List<Runnable> wanted = new ArrayList<>();
        wanted.add(done);
        MAKING.put(key, wanted);
        int side = Math.max(1, Math.min(size, MAX_SIZE));
        boolean queued = Utils.runOnBackgroundThread(() -> {
            Bitmap picture = null;
            boolean there = false;
            try {
                File file = file(message);
                there = file != null;
                if (there) picture = maker.make(kind, file, side);
            } catch (Throwable t) {
                HookStatus.threw(FamilyNames.SAVE_DOWNLOADS, "file thumbnail", t);
            }
            Bitmap result = picture;
            boolean found = there;
            Utils.runOnMainThread(() -> finished(key, found, result));
        });
        if (!queued) {
            MAKING.remove(key);
            WAITING.put(key, SystemClock.uptimeMillis() + RETRY_MILLIS);
        }
    }

    /** Main thread: what the worker made of [key]. */
    private static void finished(String key, boolean found, @Nullable Bitmap picture) {
        List<Runnable> wanted = MAKING.remove(key);
        if (!found) {
            WAITING.put(key, SystemClock.uptimeMillis() + RETRY_MILLIS);
            return;
        }
        if (picture == null) {
            FAILED.put(key, Boolean.TRUE);
            return;
        }
        MADE_PICTURES.put(key, picture);
        HookStatus.counted(FamilyNames.SAVE_DOWNLOADS, MADE);
        if (wanted == null) return;
        for (Runnable done : wanted) {
            try {
                done.run();
            } catch (Throwable t) {
                HookStatus.threw(FamilyNames.SAVE_DOWNLOADS, "file thumbnail shown", t);
            }
        }
    }

    /** Worker: the downloaded file of [message], the one it was sent from first, or null when neither is there. */
    @Nullable
    static File file(Object message) {
        String attached = attachPath(message);
        if (attached != null && !attached.isEmpty()) {
            File sent = new File(attached);
            if (sent.isFile() && sent.length() > 0) return sent;
        }
        File cached = cachePath(message);
        return cached != null && cached.isFile() && cached.length() > 0 ? cached : null;
    }

    /** Worker: the picture of [file], a PDF's first page or a video's frame, [size] pixels square. */
    @Nullable
    static Bitmap render(Kind kind, File file, int size) throws Exception {
        return kind == Kind.PDF ? firstPage(file, size) : kind == Kind.VIDEO ? frame(file, size) : null;
    }

    /** The top of [file]'s first page on white, filling a square of [size], or null for a PDF without pages. */
    @Nullable
    static Bitmap firstPage(File file, int size) throws Exception {
        ParcelFileDescriptor descriptor = ParcelFileDescriptor.open(file, ParcelFileDescriptor.MODE_READ_ONLY);
        PdfRenderer renderer = null;
        synchronized (PDF_LOCK) {
            try {
                // The renderer owns the descriptor from here and closes it with itself.
                renderer = new PdfRenderer(descriptor);
                if (renderer.getPageCount() < 1) return null;
                try (PdfRenderer.Page page = renderer.openPage(0)) {
                    int width = page.getWidth();
                    int height = page.getHeight();
                    if (width <= 0 || height <= 0) return null;
                    float scale = size / (float) Math.min(width, height);
                    Matrix place = new Matrix();
                    place.setScale(scale, scale);
                    // A tall page shows its top, a wide one its middle.
                    place.postTranslate(Math.min(0f, (size - width * scale) / 2f), 0f);
                    Bitmap page0 = Bitmap.createBitmap(size, size, Bitmap.Config.ARGB_8888);
                    page0.eraseColor(Color.WHITE);
                    page.render(page0, null, place, PdfRenderer.Page.RENDER_MODE_FOR_DISPLAY);
                    return page0;
                }
            } finally {
                if (renderer != null) {
                    renderer.close();
                } else {
                    descriptor.close();
                }
            }
        }
    }

    /** A frame from about a second into [file], cropped to a square of [size], or null when none can be read. */
    @Nullable
    static Bitmap frame(File file, int size) throws Exception {
        MediaMetadataRetriever reader = new MediaMetadataRetriever();
        try {
            reader.setDataSource(file.getAbsolutePath());
            long at = 0;
            String duration = reader.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DURATION);
            if (duration != null) {
                try {
                    at = Math.min(1_000_000L, Long.parseLong(duration.trim()) * 1000L / 2);
                } catch (NumberFormatException ignored) {
                    at = 0;
                }
            }
            Bitmap frame = reader.getScaledFrameAtTime(at, MediaMetadataRetriever.OPTION_CLOSEST_SYNC, size * 2, size * 2);
            if (frame == null) frame = reader.getFrameAtTime();
            if (frame == null) return null;
            return ThumbnailUtils.extractThumbnail(frame, size, size, ThumbnailUtils.OPTIONS_RECYCLE_INPUT);
        } finally {
            reader.release();
        }
    }

    // ---- Drawables -----------------------------------------------------------------------------

    /** A made picture, cropped to fill its bounds, with rounded corners. */
    static final class Picture extends Drawable {
        private final Bitmap bitmap;
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG | Paint.FILTER_BITMAP_FLAG);
        private final Matrix place = new Matrix();
        private final RectF area = new RectF();

        Picture(Bitmap bitmap) {
            this.bitmap = bitmap;
            paint.setShader(new BitmapShader(bitmap, Shader.TileMode.CLAMP, Shader.TileMode.CLAMP));
        }

        Bitmap bitmap() {
            return bitmap;
        }

        @Override public void draw(Canvas canvas) {
            if (getBounds().isEmpty() || bitmap.isRecycled()) return;
            area.set(getBounds());
            float scale = Math.max(area.width() / bitmap.getWidth(), area.height() / bitmap.getHeight());
            place.setScale(scale, scale);
            place.postTranslate(area.left + (area.width() - bitmap.getWidth() * scale) / 2f,
                    area.top + (area.height() - bitmap.getHeight() * scale) / 2f);
            paint.getShader().setLocalMatrix(place);
            float radius = Math.min(area.width(), area.height()) * 0.18f;
            canvas.drawRoundRect(area, radius, radius, paint);
        }

        @Override public void setAlpha(int alpha) { paint.setAlpha(alpha); }
        @Override public void setColorFilter(@Nullable ColorFilter filter) { paint.setColorFilter(filter); }
        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }

    /**
     * An APK's or EXE's glyph in white on its color: a rounded square in Shared media, a circle in a
     * chat. Drawn from paths here, sized to its bounds.
     */
    static final class Glyph extends Drawable {
        final Kind kind;
        final boolean round;
        private final Paint fill = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint mark = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path path = new Path();
        private final RectF area = new RectF();
        private final RectF part = new RectF();

        Glyph(Kind kind, boolean round) {
            this.kind = kind;
            this.round = round;
            fill.setColor(kind == Kind.APK ? APK_COLOR : EXE_COLOR);
            mark.setColor(Color.WHITE);
            mark.setStrokeCap(Paint.Cap.ROUND);
        }

        @Override public void draw(Canvas canvas) {
            if (getBounds().isEmpty()) return;
            area.set(getBounds());
            float side = Math.min(area.width(), area.height());
            float x = area.centerX();
            float y = area.centerY();
            if (round) {
                canvas.drawCircle(x, y, side / 2f, fill);
            } else {
                float radius = side * 0.18f;
                canvas.drawRoundRect(area, radius, radius, fill);
            }
            if (kind == Kind.APK) {
                android(canvas, x, y, side);
            } else {
                windows(canvas, x, y, side);
            }
        }

        /** A rounded head with two antennae and two eyes, the way Android's robot is sketched. */
        private void android(Canvas canvas, float x, float y, float side) {
            float r = side * 0.24f;
            float base = y + r * 0.45f;
            part.set(x - r, base - r, x + r, base + r);
            path.reset();
            path.arcTo(part, 180f, 180f, true);
            path.close();
            mark.setStyle(Paint.Style.FILL);
            canvas.drawPath(path, mark);
            mark.setStyle(Paint.Style.STROKE);
            mark.setStrokeWidth(side * 0.045f);
            float footX = r * 0.45f;
            float footY = base - r * 0.82f;
            canvas.drawLine(x - footX, footY, x - r * 0.72f, footY - r * 0.42f, mark);
            canvas.drawLine(x + footX, footY, x + r * 0.72f, footY - r * 0.42f, mark);
            float eye = r * 0.11f;
            canvas.drawCircle(x - r * 0.42f, base - r * 0.45f, eye, fill);
            canvas.drawCircle(x + r * 0.42f, base - r * 0.45f, eye, fill);
        }

        /** Four panes in a square with a gap between them, the way a Windows logo is sketched. */
        private void windows(Canvas canvas, float x, float y, float side) {
            float half = side * 0.22f;
            float gap = side * 0.025f;
            mark.setStyle(Paint.Style.FILL);
            canvas.drawRect(x - half, y - half, x - gap, y - gap, mark);
            canvas.drawRect(x + gap, y - half, x + half, y - gap, mark);
            canvas.drawRect(x - half, y + gap, x - gap, y + half, mark);
            canvas.drawRect(x + gap, y + gap, x + half, y + half, mark);
        }

        @Override public void setAlpha(int alpha) {
            fill.setAlpha(alpha);
            mark.setAlpha(alpha);
        }

        @Override public void setColorFilter(@Nullable ColorFilter filter) {
            fill.setColorFilter(filter);
            mark.setColorFilter(filter);
        }

        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }

    // ---- Stubs ---------------------------------------------------------------------------------
    // Bodies written when you patch: they name Telegram's obfuscated cells, messages and files.
    // Until then they read the interfaces below, which is how the tests stand in for them.

    /** A Shared media file cell as the tests make one. */
    interface SharedCell {
        @Nullable Object message();
        @Nullable Object label();
    }

    /** A chat message cell as the tests make one. */
    interface ChatCell {
        @Nullable Object message();
    }

    /** A chat file's circle as the tests make one. */
    interface Progress {
        int icon();
        @Nullable Object parent();
        @Nullable RectF rect();
    }

    /** A message as the tests make one. */
    interface Message {
        @Nullable Object document();
        @Nullable String attachPath();
        @Nullable File cachePath();
    }

    /** A document as the tests make one. */
    interface Document {
        long id();
        boolean hasThumb();
        @Nullable String fileName();
        @Nullable String mime();
    }

    /** The message a Shared media file cell shows, or null for anything else. */
    @Nullable
    public static Object sharedMessage(@Nullable Object cell) {
        return cell instanceof SharedCell ? ((SharedCell) cell).message() : null;
    }

    /** A Shared media file cell's extension label, drawn over its icon. */
    @Nullable
    public static Object sharedLabel(@Nullable Object cell) {
        return cell instanceof SharedCell ? ((SharedCell) cell).label() : null;
    }

    /** The message a chat cell shows, or null for anything else. */
    @Nullable
    public static Object cellMessage(Object cell) {
        return cell instanceof ChatCell ? ((ChatCell) cell).message() : null;
    }

    /** The icon a chat file's circle shows, -1 when it shows none. */
    public static int progressIcon(Object progress) {
        return progress instanceof Progress ? ((Progress) progress).icon() : -1;
    }

    /** The view a chat file's circle is drawn in. */
    @Nullable
    public static Object progressParent(Object progress) {
        return progress instanceof Progress ? ((Progress) progress).parent() : null;
    }

    /** Where a chat file's circle is drawn. */
    @Nullable
    public static RectF progressRect(Object progress) {
        return progress instanceof Progress ? ((Progress) progress).rect() : null;
    }

    /** The document a message holds, or null. */
    @Nullable
    public static Object document(Object message) {
        return message instanceof Message ? ((Message) message).document() : null;
    }

    /** The path a message's file was sent from, on the phone that sent it. */
    @Nullable
    public static String attachPath(Object message) {
        return message instanceof Message ? ((Message) message).attachPath() : null;
    }

    /** Worker only: where Telegram keeps a message's file once downloaded, which may wait on its file database. */
    @Nullable
    public static File cachePath(Object message) {
        return message instanceof Message ? ((Message) message).cachePath() : null;
    }

    /** A document's id on Telegram's servers, 0 for one not sent yet. */
    public static long documentId(Object document) {
        return document instanceof Document ? ((Document) document).id() : 0;
    }

    /** Whether a document has a thumbnail from Telegram's servers, the way MessageObject asks. */
    public static boolean hasThumb(Object document) {
        return document instanceof Document && ((Document) document).hasThumb();
    }

    /** A document's file name, the way Telegram shows it. */
    @Nullable
    public static String fileName(Object document) {
        return document instanceof Document ? ((Document) document).fileName() : null;
    }

    /** A document's MIME type. */
    @Nullable
    public static String mime(Object document) {
        return document instanceof Document ? ((Document) document).mime() : null;
    }

    // ---- Tests ---------------------------------------------------------------------------------

    /** Forgets every picture and what's known of each message. Main thread. */
    static void forgetForTests() {
        MADE_PICTURES.evictAll();
        FAILED.clear();
        WAITING.clear();
        MAKING.clear();
        KNOWN.clear();
        maker = FileIcons::render;
    }
}
