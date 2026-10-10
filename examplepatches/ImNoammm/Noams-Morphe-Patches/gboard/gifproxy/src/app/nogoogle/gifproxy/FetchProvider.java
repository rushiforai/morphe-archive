package app.nogoogle.gifproxy;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.Context;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.ParcelFileDescriptor;
import android.util.Log;

import java.io.DataOutputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.net.ConnectException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.NoRouteToHostException;
import java.net.SocketTimeoutException;
import java.net.URL;
import java.net.UnknownHostException;
import java.util.Locale;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * The only network access of the No-Google Gboard: HTTPS to fixed domains, only for the app that
 * installed this helper (the keyboard installs it, whatever key either was signed with) and for apps
 * signed with this helper's key.
 *
 * <p>{@code content://app.nogoogle.gifproxy/fetch?u=<url>} (GIF sites, at most 25 MB) opens a pipe
 * carrying the HTTP status code (4 bytes, big-endian) and then the body.
 * {@code .../download?u=<url>&from=<offset>} (model hosts, any size, resumable) carries the status,
 * the full file size (8 bytes, -1 if unknown) and the body from the offset. A transfer that breaks
 * off closes the pipe with an error.
 */
public final class FetchProvider extends ContentProvider {
    private static final String TAG = "NoGoogleGifHelper";
    // GIF sources and their media hosts: GIPHY, KLIPY, nekos.best, Wikimedia Commons, Openverse
    // (whose GIFs are kept only when hosted on Wikimedia or Flickr).
    private static final String[] GIF_HOSTS = {"giphy.com", "klipy.com", "nekos.best", "wikimedia.org",
            "openverse.org", "staticflickr.com"};
    // Model downloads: Hugging Face (and its hf.co file CDN), Mozilla's Firefox Translations models.
    private static final String[] MODEL_HOSTS = {"huggingface.co", "hf.co",
            "firefox.settings.services.mozilla.com", "firefox-settings-attachments.cdn.mozilla.net"};
    private static final long MAX_GIF_BYTES = 25 << 20;
    private static final long MAX_MODEL_BYTES = 4L << 30;
    private static final int MAX_REDIRECTS = 3;
    private static final String USER_AGENT = "GifHelper/1.0";

    private final ExecutorService pool = Executors.newFixedThreadPool(6);

    @Override
    public boolean onCreate() {
        return true;
    }

    @Override
    public ParcelFileDescriptor openFile(Uri uri, String mode) throws FileNotFoundException {
        checkCaller();
        String kind = uri.getLastPathSegment();
        boolean model = "download".equals(kind);
        if (!model && !"fetch".equals(kind)) throw new FileNotFoundException("unknown request");
        URL url = allowed(uri.getQueryParameter("u"), model ? MODEL_HOSTS : GIF_HOSTS);
        long from = model ? Math.max(0, parse(uri.getQueryParameter("from"))) : 0;
        ParcelFileDescriptor[] pipe;
        try {
            pipe = ParcelFileDescriptor.createReliablePipe();
        } catch (IOException e) {
            throw new FileNotFoundException(e.getMessage());
        }
        ParcelFileDescriptor sink = pipe[1];
        pool.execute(() -> transfer(url, sink, model, from));
        return pipe[0];
    }

    /** No network: tells the keyboard whether it may use this helper (a SecurityException if not). */
    @Override
    public Bundle call(String method, String arg, Bundle extras) {
        checkCaller();
        return "check".equals(method) ? new Bundle() : null;
    }

    /**
     * Only this app's installer of record (changing that takes the installer itself or the user's
     * consent to another install) or callers signed with this app's key.
     */
    private void checkCaller() {
        Context c = getContext();
        String caller = getCallingPackage();
        if (c == null || caller == null) throw new SecurityException("not allowed: " + caller);
        PackageManager pm = c.getPackageManager();
        if (pm.checkSignatures(caller, c.getPackageName()) == PackageManager.SIGNATURE_MATCH
                || caller.equals(installer(pm, c.getPackageName()))) {
            return;
        }
        throw new SecurityException("not allowed: " + caller);
    }

    @SuppressWarnings("deprecation")
    private static String installer(PackageManager pm, String pkg) {
        try {
            return Build.VERSION.SDK_INT >= 30 ? pm.getInstallSourceInfo(pkg).getInstallingPackageName()
                    : pm.getInstallerPackageName(pkg);
        } catch (PackageManager.NameNotFoundException e) {
            return null;
        }
    }

    /** HTTPS on the default port, to one of the given domains or their subdomains. */
    static URL allowed(String target, String[] hosts) throws FileNotFoundException {
        if (target != null) {
            try {
                URL url = new URL(target);
                String host = url.getHost().toLowerCase(Locale.ROOT);
                if ("https".equals(url.getProtocol()) && url.getUserInfo() == null
                        && (url.getPort() == -1 || url.getPort() == 443)) {
                    for (String d : hosts) {
                        if (host.equals(d) || host.endsWith("." + d)) return url;
                    }
                }
            } catch (MalformedURLException ignored) {
            }
        }
        throw new FileNotFoundException("blocked: " + target);
    }

    private void transfer(URL url, ParcelFileDescriptor sink, boolean model, long from) {
        HttpURLConnection conn = null;
        DataOutputStream out = new DataOutputStream(new ParcelFileDescriptor.AutoCloseOutputStream(sink));
        boolean answered = false;
        try {
            conn = open(url, model ? MODEL_HOSTS : GIF_HOSTS, from);
            int code = conn.getResponseCode();
            out.writeInt(code);
            answered = true;
            if (model) out.writeLong(fullSize(conn, code, from));
            long max = model ? MAX_MODEL_BYTES : MAX_GIF_BYTES;
            InputStream in = code >= 400 ? conn.getErrorStream() : conn.getInputStream();
            if (in != null) {
                try (InputStream body = in) {
                    byte[] buf = new byte[64 << 10];
                    long total = 0;
                    int n;
                    while ((n = body.read(buf)) > 0) {
                        total += n;
                        if (total > max) throw new IOException("answer too large");
                        out.write(buf, 0, n);
                    }
                }
            }
            out.close(); // closes the pipe normally
        } catch (Throwable t) {
            Log.w(TAG, "fetch failed: " + url.getHost() + ": " + t);
            try {
                // No status at all means the site couldn't be reached (the keyboard then says it is not
                // connected); anything else that fails before an answer (TLS, refused redirect...) is a 502.
                if (!answered && !unreachable(t)) out.writeInt(502);
            } catch (IOException ignored) {
            }
            try {
                sink.closeWithError(String.valueOf(t.getMessage()));
            } catch (IOException ignored) {
            }
        } finally {
            if (conn != null) conn.disconnect();
        }
    }

    private static boolean unreachable(Throwable t) {
        return t instanceof UnknownHostException || t instanceof ConnectException
                || t instanceof NoRouteToHostException || t instanceof SocketTimeoutException;
    }

    /** Size of the whole file: Content-Range's total for a resumed (206) answer, else the length. */
    private static long fullSize(HttpURLConnection c, int code, long from) {
        String range = c.getHeaderField("Content-Range");
        if (code == 206 && range != null && range.lastIndexOf('/') > 0) {
            return parse(range.substring(range.lastIndexOf('/') + 1));
        }
        long length = c.getContentLengthLong();
        return code == 200 && length >= 0 ? length : -1;
    }

    private static long parse(String s) {
        try {
            return s == null ? -1 : Long.parseLong(s.trim());
        } catch (NumberFormatException e) {
            return -1;
        }
    }

    /** Follows redirects only to allowed hosts; from > 0 asks for the rest of the file. */
    private static HttpURLConnection open(URL url, String[] hosts, long from) throws IOException {
        for (int hop = 0; ; hop++) {
            HttpURLConnection c = (HttpURLConnection) url.openConnection();
            c.setInstanceFollowRedirects(false);
            c.setUseCaches(false);
            c.setConnectTimeout(10_000);
            c.setReadTimeout(60_000);
            c.setRequestProperty("User-Agent", USER_AGENT);
            if (from > 0) c.setRequestProperty("Range", "bytes=" + from + "-");
            int code = c.getResponseCode();
            if (code < 300 || code >= 400 || code == 304) return c;
            String location = c.getHeaderField("Location");
            c.disconnect();
            if (location == null || hop >= MAX_REDIRECTS) throw new IOException("redirect " + code);
            url = allowed(new URL(url, location).toString(), hosts);
        }
    }

    // Nothing else is offered.

    @Override
    public Cursor query(Uri uri, String[] projection, String selection, String[] args, String sortOrder) {
        return null;
    }

    @Override
    public String getType(Uri uri) {
        return null;
    }

    @Override
    public Uri insert(Uri uri, ContentValues values) {
        return null;
    }

    @Override
    public int delete(Uri uri, String selection, String[] args) {
        return 0;
    }

    @Override
    public int update(Uri uri, ContentValues values, String selection, String[] args) {
        return 0;
    }
}
