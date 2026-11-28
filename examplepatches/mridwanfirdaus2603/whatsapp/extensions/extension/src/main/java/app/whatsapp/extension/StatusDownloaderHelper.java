package app.whatsapp.extension;

import android.Manifest;
import android.app.Activity;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.provider.MediaStore;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageButton;
import android.widget.Toast;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

/**
 * Runtime helper for WhatsAppStatusDownloader.
 *
 * Attaches a native-looking download action in WhatsApp's StatusPlaybackActivity
 * and saves eligible, non-View-Once Status image/video media to local storage.
 */
final class StatusDownloaderHelper {

    private static final String DOWNLOAD_BTN_TAG = "morphe_status_download_btn";
    private static final String SUBDIR_STATUS = "WhatsApp Clean Experience/Status";
    private static volatile WeakReference<Object> activeStatusFragmentRef = new WeakReference<>(null);

    private StatusDownloaderHelper() {
    }

    static void onStatusFragmentResume(Object fragment) {
        if (fragment != null) {
            activeStatusFragmentRef = new WeakReference<>(fragment);
        }
    }

    static void onStatusPlaybackResume(final Activity activity) {
        if (activity == null) return;
        final View decor = activity.getWindow() != null ? activity.getWindow().getDecorView() : null;
        if (decor == null) return;

        decor.post(() -> attachOrUpdateButton(activity, decor, 0));
    }

    private static void attachOrUpdateButton(final Activity activity, final View decor, final int attempt) {
        try {
            View existing = decor.findViewWithTag(DOWNLOAD_BTN_TAG);
            if (!PatchSettingsExtension.isStatusDownloaderEnabled()) {
                if (existing != null) existing.setVisibility(View.GONE);
                return;
            }
            if (existing != null) {
                existing.setVisibility(View.VISIBLE);
                return;
            }

            View contentRoot = activity.findViewById(android.R.id.content);
            if (!(contentRoot instanceof ViewGroup)) {
                if (attempt < 5) {
                    decor.postDelayed(() -> attachOrUpdateButton(activity, decor, attempt + 1), 150);
                }
                return;
            }

            ViewGroup rootGroup = (ViewGroup) contentRoot;
            ImageButton btn = new ImageButton(activity);
            btn.setTag(DOWNLOAD_BTN_TAG);
            btn.setContentDescription("Simpan Status");
            btn.setImageDrawable(new DownloadArrowDrawable(0xFFFFFFFF));

            int size = dpToPx(activity, 40);
            GradientDrawable bg = new GradientDrawable();
            bg.setShape(GradientDrawable.OVAL);
            bg.setColor(0x66000000);
            btn.setBackground(bg);

            FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(size, size);
            lp.gravity = Gravity.TOP | Gravity.END;
            lp.topMargin = dpToPx(activity, 44);
            lp.rightMargin = dpToPx(activity, 56);
            btn.setLayoutParams(lp);

            btn.setOnClickListener(v -> saveCurrentStatus(activity));
            rootGroup.addView(btn);
        } catch (Throwable ignored) {
        }
    }

    private static void saveCurrentStatus(final Activity activity) {
        if (!PatchSettingsExtension.isStatusDownloaderEnabled()) return;

        // Check legacy storage permission on Android 8-9
        if (Build.VERSION.SDK_INT < 29) {
            if (activity.checkSelfPermission(Manifest.permission.WRITE_EXTERNAL_STORAGE)
                    != PackageManager.PERMISSION_GRANTED) {
                activity.requestPermissions(
                        new String[]{Manifest.permission.WRITE_EXTERNAL_STORAGE}, 9401);
                Toast.makeText(activity,
                        "Izinkan akses penyimpanan lalu ketuk Simpan lagi.",
                        Toast.LENGTH_SHORT).show();
                return;
            }
        }

        final File mediaFile = resolveCurrentStatusMediaFile(activity);
        if (mediaFile == null || !mediaFile.isFile() || mediaFile.length() <= 0) {
            Toast.makeText(activity,
                    "Media status belum tersedia atau bukan media yang dapat disimpan.",
                    Toast.LENGTH_SHORT).show();
            return;
        }

        new Thread(() -> {
            try {
                String result = copyStatusToDownloads(activity, mediaFile);
                activity.runOnUiThread(() -> Toast.makeText(activity, result, Toast.LENGTH_LONG).show());
            } catch (Throwable t) {
                activity.runOnUiThread(() -> Toast.makeText(activity,
                        "Gagal menyimpan status: " + t.getMessage(),
                        Toast.LENGTH_SHORT).show());
            }
        }).start();
    }

    private static File resolveCurrentStatusMediaFile(Activity activity) {
        Object fragment = activeStatusFragmentRef.get();
        if (fragment != null) {
            File fromFrag = extractMediaFileFromStatusFragment(fragment);
            if (fromFrag != null) return fromFrag;
        }
        // Fallback: inspect activity fields for a status list/item
        File fromAct = extractMediaFileFromObjectGraph(activity, 2);
        return fromAct;
    }

    private static File extractMediaFileFromStatusFragment(Object fragment) {
        try {
            List<?> items = null;
            int bestIndex = 0;

            Class<?> cls = fragment.getClass();
            while (cls != null && !cls.getName().startsWith("java.")
                    && !cls.getName().startsWith("android.")
                    && !cls.getName().startsWith("androidx.")) {
                for (Field f : cls.getDeclaredFields()) {
                    if (Modifier.isStatic(f.getModifiers())) continue;
                    f.setAccessible(true);
                    Object val = f.get(fragment);
                    if (val instanceof List<?> && items == null) {
                        List<?> list = (List<?>) val;
                        if (!list.isEmpty()) items = list;
                    } else if (f.getType() == int.class && (f.getName().equals("A02") || f.getName().equals("A00"))) {
                        int idx = f.getInt(fragment);
                        if (idx >= 0) bestIndex = idx;
                    }
                }
                cls = cls.getSuperclass();
            }

            if (items != null && !items.isEmpty()) {
                int idx = Math.min(bestIndex, items.size() - 1);
                Object item = items.get(idx);
                if (item != null && !isViewOnceItem(item)) {
                    File f = extractMediaFileFromObjectGraph(item, 3);
                    if (f != null) return f;
                }
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    private static boolean isViewOnceItem(Object obj) {
        try {
            Class<?> cls = obj.getClass();
            while (cls != null && !cls.getName().startsWith("java.") && !cls.getName().startsWith("android.")) {
                for (Field f : cls.getDeclaredFields()) {
                    String name = f.getName().toLowerCase(Locale.US);
                    if (name.contains("viewonce") || name.contains("view_once")) {
                        f.setAccessible(true);
                        Object v = f.get(obj);
                        if (v instanceof Boolean && (Boolean) v) return true;
                        if (v instanceof Integer && (Integer) v == 1) return true;
                    }
                }
                cls = cls.getSuperclass();
            }
        } catch (Throwable ignored) {
        }
        return false;
    }

    private static File extractMediaFileFromObjectGraph(Object obj, int depth) {
        if (obj == null || depth < 0) return null;
        try {
            Class<?> cls = obj.getClass();
            while (cls != null && !cls.getName().startsWith("java.")
                    && !cls.getName().startsWith("android.")
                    && !cls.getName().startsWith("androidx.")) {
                for (Field f : cls.getDeclaredFields()) {
                    if (Modifier.isStatic(f.getModifiers()) || f.getType().isPrimitive()) continue;
                    f.setAccessible(true);
                    Object val = f.get(obj);
                    if (val instanceof File) {
                        File file = (File) val;
                        if (file.isFile() && file.length() > 0 && isSupportedMediaExtension(file.getName())) {
                            return file;
                        }
                    } else if (depth > 0 && val != null && !val.getClass().getName().startsWith("java.")
                            && !val.getClass().getName().startsWith("android.")) {
                        File nested = extractMediaFileFromObjectGraph(val, depth - 1);
                        if (nested != null) return nested;
                    }
                }
                cls = cls.getSuperclass();
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    private static boolean isSupportedMediaExtension(String name) {
        String lower = name.toLowerCase(Locale.US);
        return lower.endsWith(".jpg") || lower.endsWith(".jpeg") || lower.endsWith(".png")
                || lower.endsWith(".webp") || lower.endsWith(".mp4") || lower.endsWith(".3gp")
                || lower.endsWith(".mkv");
    }

    private static String getMimeType(String name) {
        String lower = name.toLowerCase(Locale.US);
        if (lower.endsWith(".png")) return "image/png";
        if (lower.endsWith(".webp")) return "image/webp";
        if (lower.endsWith(".mp4")) return "video/mp4";
        if (lower.endsWith(".3gp")) return "video/3gpp";
        if (lower.endsWith(".mkv")) return "video/x-matroska";
        return "image/jpeg";
    }

    private static String copyStatusToDownloads(Context context, File source) throws Exception {
        String ext = "jpg";
        int dot = source.getName().lastIndexOf('.');
        if (dot >= 0 && dot < source.getName().length() - 1) {
            ext = source.getName().substring(dot + 1).toLowerCase(Locale.US);
        }
        String mime = getMimeType(source.getName());
        boolean isVideo = mime.startsWith("video/");

        String stamp = new SimpleDateFormat("yyyyMMdd_HHmmss", Locale.US)
                .format(new Date(source.lastModified() > 0 ? source.lastModified() : System.currentTimeMillis()));
        String targetName = "WA_Status_" + stamp + "_" + source.length() + "." + ext;

        if (Build.VERSION.SDK_INT >= 29) {
            ContentResolver resolver = context.getContentResolver();
            Uri collection = isVideo
                    ? MediaStore.Video.Media.EXTERNAL_CONTENT_URI
                    : MediaStore.Images.Media.EXTERNAL_CONTENT_URI;

            // Duplicate check by display name & size
            try (Cursor cursor = resolver.query(
                    collection,
                    new String[]{MediaStore.MediaColumns._ID},
                    MediaStore.MediaColumns.DISPLAY_NAME + "=?",
                    new String[]{targetName},
                    null)) {
                if (cursor != null && cursor.moveToFirst()) {
                    return "Status sudah tersimpan sebelumnya (" + targetName + ")";
                }
            }

            ContentValues values = new ContentValues();
            values.put(MediaStore.MediaColumns.DISPLAY_NAME, targetName);
            values.put(MediaStore.MediaColumns.MIME_TYPE, mime);
            values.put("relative_path", (isVideo ? Environment.DIRECTORY_MOVIES : Environment.DIRECTORY_PICTURES)
                    + "/" + SUBDIR_STATUS);

            Uri itemUri = resolver.insert(collection, values);
            if (itemUri == null) {
                throw new IllegalStateException("MediaStore insert returned null");
            }
            try (InputStream in = new FileInputStream(source);
                 OutputStream out = resolver.openOutputStream(itemUri)) {
                if (out == null) throw new IllegalStateException("Cannot open output stream");
                byte[] buf = new byte[16384];
                int len;
                while ((len = in.read(buf)) > 0) {
                    out.write(buf, 0, len);
                }
            }
            return "Status disimpan: " + targetName;
        } else {
            File base = Environment.getExternalStoragePublicDirectory(
                    isVideo ? Environment.DIRECTORY_MOVIES : Environment.DIRECTORY_PICTURES);
            File destDir = new File(base, SUBDIR_STATUS);
            if (!destDir.exists() && !destDir.mkdirs()) {
                throw new IllegalStateException("Gagal membuat folder tujuan");
            }
            File destFile = new File(destDir, targetName);
            if (destFile.exists() && destFile.length() == source.length()) {
                return "Status sudah tersimpan sebelumnya (" + targetName + ")";
            }
            try (InputStream in = new FileInputStream(source);
                 OutputStream out = new FileOutputStream(destFile)) {
                byte[] buf = new byte[16384];
                int len;
                while ((len = in.read(buf)) > 0) {
                    out.write(buf, 0, len);
                }
            }
            return "Status disimpan ke " + destFile.getAbsolutePath();
        }
    }

    private static int dpToPx(Context context, int dp) {
        return (int) TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, dp, context.getResources().getDisplayMetrics());
    }

    /** Monochrome download arrow drawable matching WhatsApp Status viewer controls. */
    private static class DownloadArrowDrawable extends Drawable {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);

        DownloadArrowDrawable(int color) {
            paint.setColor(color);
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeCap(Paint.Cap.ROUND);
            paint.setStrokeJoin(Paint.Join.ROUND);
        }

        @Override
        public void draw(Canvas canvas) {
            android.graphics.Rect b = getBounds();
            float w = b.width();
            float h = b.height();
            if (w <= 0 || h <= 0) return;

            float cx = b.centerX();
            float cy = b.centerY();
            float s = Math.min(w, h) * 0.22f;
            paint.setStrokeWidth(Math.max(2f, s * 0.22f));

            // Vertical arrow shaft
            canvas.drawLine(cx, cy - s, cx, cy + s * 0.55f, paint);
            // Arrow head
            canvas.drawLine(cx, cy + s * 0.55f, cx - s * 0.6f, cy - s * 0.05f, paint);
            canvas.drawLine(cx, cy + s * 0.55f, cx + s * 0.6f, cy - s * 0.05f, paint);
            // Tray bottom bar
            canvas.drawLine(cx - s * 0.85f, cy + s, cx + s * 0.85f, cy + s, paint);
        }

        @Override
        public void setAlpha(int alpha) {
            paint.setAlpha(alpha);
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
            paint.setColorFilter(colorFilter);
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }
}
