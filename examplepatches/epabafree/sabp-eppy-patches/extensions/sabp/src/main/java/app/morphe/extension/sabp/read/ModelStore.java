package app.morphe.extension.sabp.read;

import android.content.Context;
import android.net.ConnectivityManager;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import app.morphe.extension.sabp.EppyDiag;

/**
 * The speech model, downloaded once (only after the user agrees) from whisper.cpp's model page
 * on Hugging Face and kept in the app's private storage. Downloads resume where they stopped.
 */
public final class ModelStore {
    public static final class Model {
        public final String id, label;
        public final long bytes; // approximate, for display and a sanity check

        Model(String id, String label, long bytes) {
            this.id = id;
            this.label = label;
            this.bytes = bytes;
        }

        public String url() {
            return "https://huggingface.co/ggerganov/whisper.cpp/resolve/main/ggml-" + id + ".bin";
        }

        public String sizeLabel() {
            return Math.round(bytes / 1_000_000.0) + " MB";
        }
    }

    public static final Model BASE = new Model("base.en-q5_1", "Standard (English)", 59_700_000L);
    public static final Model TINY = new Model("tiny.en-q5_1", "Small and faster (English, less accurate)", 32_200_000L);
    public static final Model[] MODELS = {BASE, TINY};

    public interface Progress {
        /** Called on the download thread; return false to cancel. */
        boolean onProgress(long done, long total);
    }

    private ModelStore() {
    }

    public static Model byId(String id) {
        for (Model m : MODELS) if (m.id.equals(id)) return m;
        return BASE;
    }

    static File dir(Context c) {
        File d = new File(c.getFilesDir(), "eppy_whisper");
        d.mkdirs();
        return d;
    }

    public static File file(Context c, Model m) {
        return new File(dir(c), "ggml-" + m.id + ".bin");
    }

    public static boolean installed(Context c, Model m) {
        File f = file(c, m);
        return f.isFile() && f.length() > m.bytes / 2;
    }

    public static boolean metered(Context c) {
        try {
            ConnectivityManager cm = (ConnectivityManager) c.getSystemService(Context.CONNECTIVITY_SERVICE);
            return cm != null && cm.isActiveNetworkMetered();
        } catch (Throwable t) {
            return true;
        }
    }

    public static void delete(Context c, Model m) {
        file(c, m).delete();
        new File(dir(c), "ggml-" + m.id + ".bin.part").delete();
    }

    /** Blocking download with resume. Returns null on success, else a reason. */
    public static String download(Context c, Model m, Progress p) {
        File part = new File(dir(c), "ggml-" + m.id + ".bin.part");
        for (int attempt = 0; attempt < 3; attempt++) {
            HttpURLConnection con = null;
            try {
                long have = part.isFile() ? part.length() : 0;
                URL url = new URL(m.url());
                for (int hop = 0; ; hop++) { // follow redirects (Hugging Face → CDN), including https→https hosts
                    con = (HttpURLConnection) url.openConnection();
                    con.setInstanceFollowRedirects(false);
                    con.setConnectTimeout(20_000);
                    con.setReadTimeout(30_000);
                    con.setRequestProperty("User-Agent", "eppy");
                    if (have > 0) con.setRequestProperty("Range", "bytes=" + have + "-");
                    int code = con.getResponseCode();
                    if (code >= 300 && code < 400 && hop < 5) {
                        String loc = con.getHeaderField("Location");
                        con.disconnect();
                        if (loc == null) return "The download server didn't answer properly";
                        url = new URL(url, loc);
                        continue;
                    }
                    break;
                }
                int code = con.getResponseCode();
                if (code == 416) { // already complete
                    break;
                }
                if (code != 200 && code != 206) return "Download failed (HTTP " + code + ")";
                boolean append = code == 206;
                if (!append) have = 0;
                long total = have + Math.max(0, con.getContentLengthLong());
                try (InputStream in = con.getInputStream(); FileOutputStream out = new FileOutputStream(part, append)) {
                    byte[] buf = new byte[64 * 1024];
                    int r;
                    long done = have, lastReport = 0;
                    while ((r = in.read(buf)) > 0) {
                        out.write(buf, 0, r);
                        done += r;
                        if (done - lastReport > 512 * 1024) {
                            lastReport = done;
                            if (p != null && !p.onProgress(done, total)) return "Cancelled";
                        }
                    }
                }
                break;
            } catch (Throwable t) {
                EppyDiag.error("model", "download attempt " + attempt + ": " + t);
                if (attempt == 2) return "Couldn't download the speech model. Check the connection and try again; it continues where it stopped.";
                try {
                    Thread.sleep(3000L * (attempt + 1));
                } catch (InterruptedException e) {
                    return "Cancelled";
                }
            } finally {
                if (con != null) con.disconnect();
            }
        }
        if (part.length() < m.bytes / 2) return "The downloaded model looks incomplete. Try again.";
        File f = file(c, m);
        f.delete();
        if (!part.renameTo(f)) return "Couldn't save the speech model";
        EppyDiag.log("model", m.id + " installed, " + f.length() + " bytes");
        return null;
    }
}
