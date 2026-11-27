package app.template.extension.zalo.media;

import android.content.Context;
import android.graphics.Bitmap;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;

import app.template.extension.zalo.buglog.NezumiLog;
import app.template.extension.zalo.buglog.Patch;
import app.template.extension.zalo.shared.ZaloEnv;

/**
 * Photos of a post for the "Tải ảnh về máy" / "Download photo" row of the post "..." sheet, saved to Pictures/Zalo.
 *
 * Reflection is pinned to 26.11.01 (same model the video row reads):
 * ze9.b = content type, ze9.n = mf9;
 * types 2 (single photo) / 3 (multi photo): mf9.h = ArrayList of ItemAlbumMobile, URL = ItemAlbumMobile.i ("origin");
 * type 23 (album, photo/video/mixed): mf9.M = ArrayList of xu, xu.a == 0 is a photo, xu.b = zu (extends yu), URL = yu.c ("origin");
 * mf9.m = "more_photo" (> 0: the feed payload holds fewer photos than the post).
 * The origin URL is what the native viewer "Tải về" saves (hg1.b -> ItemAlbumMobile.i). Stickers, link previews,
 * banners, promo lists, profile intro and memory posts are other content types and are never read.
 */
final class PostPhotoSave {
    private PostPhotoSave() { }

    private static final String TAG = "PostPhotoSave";

    /** Photo URLs (origin, http(s), deduped, display order) plus the post's "more_photo" count. */
    static final class Photos {
        final List<String> urls = new ArrayList<>();
        int contentType;
        int morePhotos;
        int candidates; // photo entries seen before URL filtering
    }

    /** Never throws; returns an empty result (with a log line) when the post has no usable photo. */
    static Photos find(Object post, Object media, String where) {
        Photos photos = new Photos();
        try {
            photos.contentType = post.getClass().getField("b").getInt(post); // ze9.b
            photos.morePhotos = media.getClass().getField("m").getInt(media); // mf9.m "more_photo"
            Set<String> seen = new LinkedHashSet<>();
            int type = photos.contentType;
            if (type == 2 || type == 3) {
                Object list = media.getClass().getField("h").get(media); // mf9.h (ArrayList<ItemAlbumMobile>)
                if (list instanceof List) {
                    for (Object item : (List<?>) list) {
                        if (item == null) continue;
                        photos.candidates++;
                        add(photos, seen, item.getClass().getField("i").get(item)); // ItemAlbumMobile.i "origin"
                    }
                }
            } else if (type == 23) {
                Object album = media.getClass().getField("M").get(media); // mf9.M (ArrayList<xu>)
                if (album instanceof List) {
                    for (Object entry : (List<?>) album) {
                        if (entry == null) continue;
                        if (entry.getClass().getField("a").getInt(entry) != 0) continue; // xu.a == 0: photo
                        photos.candidates++;
                        Object item = entry.getClass().getField("b").get(entry); // xu.b (zu extends yu)
                        if (item == null) continue;
                        add(photos, seen, item.getClass().getField("c").get(item)); // yu.c "origin"
                    }
                }
            }
            if (photos.urls.isEmpty()) {
                if (photos.candidates == 0) {
                    NezumiLog.d(Patch.SAVE_MEDIA, TAG, "post menu (" + where + "): no photo row, post has no photo (content type " + type + ")");
                } else {
                    NezumiLog.w(Patch.SAVE_MEDIA, TAG, "post menu (" + where + "): no photo row, " + photos.candidates
                        + " photo(s) without http origin URL (content type " + type + ")");
                }
            }
        } catch (Throwable failure) {
            photos.urls.clear();
            NezumiLog.w(Patch.SAVE_MEDIA, TAG, "post menu (" + where + "): no photo row, photo lookup failed", failure);
        }
        return photos;
    }

    private static void add(Photos photos, Set<String> seen, Object value) {
        if (!(value instanceof String)) return;
        String url = ((String) value).trim();
        if (!url.startsWith("http://") && !url.startsWith("https://")) return;
        if (seen.add(url)) photos.urls.add(url);
    }

    /**
     * Downloads each photo sequentially on one worker thread into Pictures/Zalo. Each photo is fetched into a temp
     * file first so its format (and file extension) is known before the MediaStore entry is created.
     */
    static void save(final List<String> urls) {
        final int total = urls == null ? 0 : urls.size();
        final Context context = ZaloEnv.appContext(Patch.SAVE_MEDIA);
        if (context == null || total == 0) {
            NezumiLog.w(Patch.SAVE_MEDIA, TAG, "savePhotos: " + (context == null ? "no app context" : "no photos"));
            ZaloVideoSave.toast(failedText());
            return;
        }
        ZaloVideoSave.toast(total == 1
            ? ZaloVideoSave.text("Đang tải ảnh…", "Downloading photo…")
            : ZaloVideoSave.text("Đang tải " + total + " ảnh…", "Downloading " + total + " photos…"));
        final List<String> batch = new ArrayList<>(urls);
        Thread worker = new Thread(new Runnable() {
            @Override public void run() {
                String stamp = new SimpleDateFormat("yyyyMMdd_HHmmss", Locale.US).format(new Date());
                int saved = 0;
                for (int i = 0; i < total; i++) {
                    String base = "Zalo_" + stamp + (total == 1 ? "" : "_" + (i + 1));
                    if (saveOne(context, base, batch.get(i), (i + 1) + "/" + total)) saved++;
                }
                NezumiLog.i(Patch.SAVE_MEDIA, TAG, "savePhotos: saved " + saved + "/" + total);
                if (saved == total) {
                    ZaloVideoSave.toast(total == 1
                        ? ZaloVideoSave.text("Đã tải ảnh vào Thư viện", "Photo saved to Gallery")
                        : ZaloVideoSave.text("Đã tải " + total + " ảnh vào Thư viện", total + " photos saved to Gallery"));
                } else if (saved == 0) {
                    ZaloVideoSave.toast(failedText());
                } else {
                    ZaloVideoSave.toast(ZaloVideoSave.text("Đã tải " + saved + "/" + total + " ảnh vào Thư viện",
                        saved + " of " + total + " photos saved to Gallery"));
                }
            }
        }, "nezumi-save-photo");
        worker.start();
    }

    static String failedText() {
        return ZaloVideoSave.text("Tải ảnh thất bại", "Photo download failed");
    }

    /** One photo: download to a temp file, sniff the format, copy into MediaStore. Never throws. */
    private static boolean saveOne(Context context, String base, String url, String label) {
        File temp = null;
        try {
            temp = File.createTempFile("nezumi_photo", ".tmp", context.getCacheDir());
            try (OutputStream out = new FileOutputStream(temp)) {
                ZaloVideoSave.download(url, out);
            }
            String[] format = sniff(temp);
            if ("image/jxl".equals(format[0])) {
                // Zalo serves feed photos as JPEG XL, which Android galleries cannot open: decode with Zalo's own
                // JXL decoder and re-encode as JPEG (same as the app's own rwr JXL -> JPEG conversion).
                final Bitmap bitmap = decodeJxl(temp);
                String name = base + ".jpg";
                try {
                    MediaStoreWriter.saveImage(context, name, "image/jpeg", new MediaStoreWriter.Source() {
                        @Override public void writeTo(OutputStream out) throws IOException {
                            if (!bitmap.compress(Bitmap.CompressFormat.JPEG, JPEG_QUALITY, out)) {
                                throw new IOException("JPEG encode failed");
                            }
                        }
                    });
                } finally {
                    bitmap.recycle();
                }
                NezumiLog.i(Patch.SAVE_MEDIA, TAG, "save photo " + label + ": JPEG XL (" + temp.length() + " bytes) converted, saved as " + name);
                return true;
            }
            String name = base + "." + format[1];
            final File source = temp;
            MediaStoreWriter.saveImage(context, name, format[0], new MediaStoreWriter.Source() {
                @Override public void writeTo(OutputStream out) throws IOException {
                    try (InputStream in = new FileInputStream(source)) {
                        byte[] buffer = new byte[64 * 1024];
                        int read;
                        while ((read = in.read(buffer)) != -1) out.write(buffer, 0, read);
                    }
                }
            });
            NezumiLog.i(Patch.SAVE_MEDIA, TAG, "save photo " + label + ": saved as " + name + " (" + format[0] + ", " + temp.length() + " bytes)");
            return true;
        } catch (Throwable failure) {
            NezumiLog.e(Patch.SAVE_MEDIA, TAG, "save photo " + label + ": failed", failure);
            return false;
        } finally {
            //noinspection ResultOfMethodCallIgnored
            if (temp != null) temp.delete();
        }
    }

    private static final int JPEG_QUALITY = 95;
    private static final String JXL_DECODER = "com.zing.zalo.zmedia.zjxl.ZJXLDecoder";

    /**
     * Decodes a JPEG XL file with Zalo's bundled native decoder (26.11.01 names, same calls as rwr.H):
     * e(path, Options) = read info, d(handle) = error code (0 ok), c(path, 1, bitmap) = decode into bitmap.
     */
    private static Bitmap decodeJxl(File file) throws Exception {
        ClassLoader loader = PostPhotoSave.class.getClassLoader();
        Class<?> decoder = Class.forName(JXL_DECODER, true, loader);
        Class<?> optionsClass = Class.forName(JXL_DECODER + "$Options", true, loader);
        Method info = decoder.getMethod("e", String.class, optionsClass);
        Method error = decoder.getMethod("d", double.class);
        Method decode = decoder.getMethod("c", String.class, int.class, Bitmap.class);
        String path = file.getAbsolutePath();

        Object options = optionsClass.getDeclaredConstructor().newInstance();
        int code = (Integer) error.invoke(null, info.invoke(null, path, options));
        int width = optionsClass.getField("bmPreviewWidth").getInt(options);
        int height = optionsClass.getField("bmPreviewHeight").getInt(options);
        if (code != 0 || width <= 0 || height <= 0) {
            throw new IOException("JXL info failed: code=" + code + ", size=" + width + "x" + height);
        }
        Bitmap bitmap = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888);
        code = (Integer) error.invoke(null, decode.invoke(null, path, 1, bitmap));
        if (code != 0) {
            bitmap.recycle();
            throw new IOException("JXL decode failed: code=" + code);
        }
        int orientation = optionsClass.getField("bmOrientation").getInt(options);
        if (orientation != 0) NezumiLog.d(Patch.SAVE_MEDIA, TAG, "save photo: JXL orientation " + orientation + " (not applied, as in the app)");
        return bitmap;
    }

    /** {mime, extension} from the first bytes: JPEG, PNG, GIF, WebP, HEIC/HEIF, JPEG XL; anything else is treated as JPEG. */
    private static String[] sniff(File file) throws IOException {
        byte[] h = new byte[16];
        int n = 0;
        try (InputStream in = new FileInputStream(file)) {
            int read;
            while (n < h.length && (read = in.read(h, n, h.length - n)) > 0) n += read;
        }
        if (n >= 3 && (h[0] & 0xff) == 0xFF && (h[1] & 0xff) == 0xD8 && (h[2] & 0xff) == 0xFF) {
            return new String[] { "image/jpeg", "jpg" };
        }
        if (n >= 8 && (h[0] & 0xff) == 0x89 && ascii(h, 1, "PNG")) return new String[] { "image/png", "png" };
        if (n >= 6 && ascii(h, 0, "GIF8")) return new String[] { "image/gif", "gif" };
        if (n >= 12 && ascii(h, 0, "RIFF") && ascii(h, 8, "WEBP")) return new String[] { "image/webp", "webp" };
        if (n >= 12 && ascii(h, 4, "ftyp")) {
            String brand = new String(h, 8, 4, java.nio.charset.StandardCharsets.US_ASCII);
            if (brand.equals("heic") || brand.equals("heix") || brand.equals("heim") || brand.equals("heis")
                || brand.equals("hevc") || brand.equals("hevx")) {
                return new String[] { "image/heic", "heic" };
            }
            if (brand.equals("mif1") || brand.equals("msf1")) return new String[] { "image/heif", "heif" };
        }
        // JPEG XL: bare codestream FF 0A, or ISO-BMFF container 00 00 00 0C 'JXL ' 0D 0A 87 0A
        if (n >= 2 && (h[0] & 0xff) == 0xFF && (h[1] & 0xff) == 0x0A) return new String[] { "image/jxl", "jxl" };
        if (n >= 12 && h[0] == 0 && h[1] == 0 && h[2] == 0 && h[3] == 0x0C && ascii(h, 4, "JXL ")) {
            return new String[] { "image/jxl", "jxl" };
        }
        NezumiLog.w(Patch.SAVE_MEDIA, TAG, "save photo: unknown format, saving as jpeg");
        return new String[] { "image/jpeg", "jpg" };
    }

    private static boolean ascii(byte[] data, int offset, String text) {
        for (int i = 0; i < text.length(); i++) {
            if (data[offset + i] != (byte) text.charAt(i)) return false;
        }
        return true;
    }
}
