package app.wordfeudwordfinder.extension.play;

import app.wordfeudwordfinder.extension.core.WfError;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;
import java.util.function.LongSupplier;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * Reads the app's own session cookie (spec section 8.2). The app keeps its cookies in
 * {@code <filesDir>/.cookies/<store>/.domains}: JSON {@code {domain: {path: {name: "name=value; attr; ..."}}}}.
 * The patch never logs in itself and never logs the cookie.
 *
 * <p>The {@code .cookies} sub-directories are tried in sorted order; the first one with a valid
 * {@code wordfeud.com} -&gt; {@code /} -&gt; {@code sessionid} cookie wins. Expiry: the {@code Expires} attribute
 * (RFC 1123 date, with or without weekday, "-" separated dates tolerated); when it is missing or unreadable,
 * {@code _crt} (creation, epoch seconds) + {@code Max-Age} if both are present; otherwise a session cookie (valid).
 * A cookie is expired from its expiry instant on. An {@code Expires} that cannot be read (with no usable
 * {@code _crt}/{@code Max-Age}) is deliberately treated as valid: the server is the final judge, and an expired
 * session then shows up as a server error rather than blocking a move on a date format we do not know.
 */
public final class SessionReader {
    static final long MAX_FILE_BYTES = 1L << 20;
    private static final String[] DOMAINS = {"wordfeud.com", ".wordfeud.com", "api.wordfeud.com"};

    private final File filesDir;
    private final LongSupplier nowMillis;

    /** @param nowMillis current time in epoch milliseconds (System::currentTimeMillis in production). */
    public SessionReader(File filesDir, LongSupplier nowMillis) {
        this.filesDir = filesDir;
        this.nowMillis = nowMillis;
    }

    /** The session id (the part after {@code sessionid=} up to the first {@code ;}). */
    public String sessionId() throws WfError {
        File[] stores = new File(filesDir, ".cookies").listFiles(File::isDirectory);
        if (stores == null || stores.length == 0) throw WfError.mvSession();
        Arrays.sort(stores, (a, b) -> a.getName().compareTo(b.getName()));
        long now = nowMillis.getAsLong();
        for (File store : stores) {
            String id = fromFile(new File(store, ".domains"), now);
            if (id != null) return id;
        }
        throw WfError.mvSession();
    }

    /** Null when the file is missing, unreadable, or has no valid session cookie. */
    static String fromFile(File f, long now) {
        if (!f.isFile() || f.length() > MAX_FILE_BYTES) return null;
        String text;
        try {
            text = read(f);
        } catch (IOException e) {
            return null;
        }
        return fromJson(text, now);
    }

    static String fromJson(String text, long now) {
        JSONObject root;
        try {
            root = new JSONObject(text);
        } catch (JSONException e) {
            return null;
        } catch (RuntimeException e) {
            return null;
        }
        for (String domain : DOMAINS) {
            Object d = root.opt(domain);
            if (!(d instanceof JSONObject)) continue;
            Object p = ((JSONObject) d).opt("/");
            if (!(p instanceof JSONObject)) continue;
            Object c = ((JSONObject) p).opt("sessionid");
            if (!(c instanceof String)) continue;
            String id = fromCookie((String) c, now);
            if (id != null) return id;
        }
        return null;
    }

    /** Parses one cookie string; null when it is not a usable, unexpired sessionid cookie. */
    static String fromCookie(String cookie, long now) {
        String[] parts = cookie.split(";");
        String first = parts[0].trim();
        if (!first.startsWith("sessionid=")) return null;
        String value = first.substring("sessionid=".length()).trim();
        if (value.isEmpty() || !isHeaderSafe(value)) return null;
        String expires = null;
        String maxAge = null;
        String crt = null;
        for (int i = 1; i < parts.length; i++) {
            String a = parts[i].trim();
            int eq = a.indexOf('=');
            if (eq < 0) continue;
            String name = a.substring(0, eq).trim().toLowerCase(Locale.ROOT);
            String v = a.substring(eq + 1).trim();
            if (name.equals("expires")) expires = v;
            else if (name.equals("max-age")) maxAge = v;
            else if (name.equals("_crt")) crt = v;
        }
        Long expiry = expires == null ? null : parseExpires(expires);
        if (expiry == null && maxAge != null && crt != null) {
            try {
                expiry = Math.addExact(Math.multiplyExact(Long.parseLong(crt), 1000L),
                        Math.multiplyExact(Long.parseLong(maxAge), 1000L));
            } catch (NumberFormatException | ArithmeticException e) {
                expiry = null;
            }
        }
        if (expiry != null && now >= expiry) return null;
        return value;
    }

    /** Visible ASCII only (no spaces, no control characters), so it cannot break the Cookie header. */
    private static boolean isHeaderSafe(String v) {
        for (int i = 0; i < v.length(); i++) {
            char ch = v.charAt(i);
            if (ch <= 0x20 || ch >= 0x7f) return false;
        }
        return true;
    }

    /** Epoch millis, or null when unreadable. Accepts "Tue, 03 Nov 2026 13:14:36 GMT" and variants. */
    static Long parseExpires(String s) {
        String t = s.trim();
        int comma = t.indexOf(',');
        if (comma >= 0) t = t.substring(comma + 1);
        t = t.replace('-', ' ').trim().replaceAll("\\s+", " ");
        for (String pattern : new String[] {"d MMM yyyy HH:mm:ss zzz", "d MMM yyyy HH:mm:ss", "d MMM yy HH:mm:ss zzz"}) {
            SimpleDateFormat f = new SimpleDateFormat(pattern, Locale.US);
            f.setTimeZone(TimeZone.getTimeZone("GMT"));
            f.setLenient(false);
            try {
                Date d = f.parse(t);
                if (d != null) return d.getTime();
            } catch (ParseException | RuntimeException e) {
                // try the next pattern
            }
        }
        return null;
    }

    private static String read(File f) throws IOException {
        try (InputStream in = new FileInputStream(f)) {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buf = new byte[8192];
            int n;
            while ((n = in.read(buf)) != -1) {
                out.write(buf, 0, n);
                if (out.size() > MAX_FILE_BYTES) throw new IOException("too big");
            }
            return new String(out.toByteArray(), StandardCharsets.UTF_8);
        }
    }
}
