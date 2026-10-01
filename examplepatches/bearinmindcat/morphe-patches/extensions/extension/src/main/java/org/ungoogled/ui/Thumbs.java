package org.ungoogled.ui;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.util.LruCache;
import android.widget.ImageView;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Place photos for the You screen's rows: Maps' own photo URL for the place (the first photo its
 * place sheet showed), fetched at thumbnail size -- as Maps fetches it -- and kept in the app's
 * cache, so a place seen once shows its photo offline too.
 */
final class Thumbs {
    private static final ExecutorService POOL = Executors.newFixedThreadPool(3);
    private static final LruCache<String, Bitmap> MEMORY = new LruCache<String, Bitmap>(6 * 1024 * 1024) {
        @Override protected int sizeOf(String key, Bitmap b) { return b.getByteCount(); }
    };

    private Thumbs() {}

    /**
     * Shows [url]'s photo, [px] square, in [view] once it is here, running [shown] just before;
     * [view] keeps whatever it shows (a placeholder) until then, or for good if there is none.
     */
    static void loadInto(ImageView view, String url, int px, Runnable shown) {
        String sized = sized(url, px);
        view.setTag(sized);
        if (sized == null) return;
        Bitmap hit = MEMORY.get(sized);
        if (hit != null) { shown.run(); view.setImageBitmap(hit); return; }
        Context c = view.getContext().getApplicationContext();
        POOL.execute(() -> {
            Bitmap b = fetch(c, sized, px);
            if (b == null) return;
            MEMORY.put(sized, b);
            view.post(() -> {
                if (!sized.equals(view.getTag())) return;
                shown.run();
                view.setImageBitmap(b);
            });
        });
    }

    /**
     * Maps' photo URLs are Google's image server's: "…=w408-h306-k-no" sets the size, so ask for
     * the thumbnail's; others (Street View) are left as they are. A scheme-less "//host/…" gets https.
     */
    static String sized(String url, int px) {
        if (url == null || url.isEmpty()) return null;
        String u = url.startsWith("//") ? "https:" + url : url;
        if (!u.startsWith("http")) return null;
        if (u.contains("googleusercontent.com/")) {
            int eq = u.lastIndexOf('=');
            int slash = u.lastIndexOf('/');
            if (eq > slash) u = u.substring(0, eq);
            u += "=w" + px + "-h" + px + "-k-no-p";
        }
        return u;
    }

    private static Bitmap fetch(Context c, String url, int px) {
        File dir = new File(c.getCacheDir(), "ungoogled_thumbs");
        File file = new File(dir, hash(url) + ".jpg");
        try {
            if (file.exists()) {
                Bitmap b = BitmapFactory.decodeFile(file.getPath());
                if (b != null) return b;
            }
            HttpURLConnection con = (HttpURLConnection) new URL(url).openConnection();
            con.setConnectTimeout(8000);
            con.setReadTimeout(8000);
            con.setInstanceFollowRedirects(true);
            if (con.getResponseCode() != 200) return null;
            byte[] data;
            try (InputStream in = con.getInputStream()) {
                java.io.ByteArrayOutputStream out = new java.io.ByteArrayOutputStream();
                byte[] buf = new byte[16384];
                for (int n; (n = in.read(buf)) > 0; ) out.write(buf, 0, n);
                data = out.toByteArray();
            } finally {
                con.disconnect();
            }
            Bitmap b = decode(data, px);
            if (b == null) return null;
            dir.mkdirs();
            try (FileOutputStream out = new FileOutputStream(file)) {
                b.compress(Bitmap.CompressFormat.JPEG, 88, out);
            }
            return b;
        } catch (Throwable t) {
            return null;
        }
    }

    /** Decodes no larger than needed for a [px] square. */
    private static Bitmap decode(byte[] data, int px) {
        BitmapFactory.Options o = new BitmapFactory.Options();
        o.inJustDecodeBounds = true;
        BitmapFactory.decodeByteArray(data, 0, data.length, o);
        int sample = 1;
        while (o.outWidth / (sample * 2) >= px && o.outHeight / (sample * 2) >= px) sample *= 2;
        o = new BitmapFactory.Options();
        o.inSampleSize = sample;
        return BitmapFactory.decodeByteArray(data, 0, data.length, o);
    }

    private static String hash(String s) {
        try {
            byte[] d = MessageDigest.getInstance("SHA-1").digest(s.getBytes("UTF-8"));
            StringBuilder b = new StringBuilder();
            for (byte x : d) b.append(String.format("%02x", x));
            return b.toString();
        } catch (Throwable t) {
            return Integer.toHexString(s.hashCode());
        }
    }
}
