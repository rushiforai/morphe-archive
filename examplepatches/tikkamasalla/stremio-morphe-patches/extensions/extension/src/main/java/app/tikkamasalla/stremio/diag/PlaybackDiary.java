package app.tikkamasalla.stremio.diag;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.Build;

import java.io.File;
import java.io.FileOutputStream;
import java.math.BigDecimal;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Playback diary: a small rolling JSON-lines log in the app's external files folder, readable with
 * "adb pull" (no root, no permission). Shared by Stremio and Vimu, so it imports nothing from either.
 * Callers build a line on their own thread; one daemon worker appends it. Any I/O error switches the
 * diary off for the rest of the process. No URLs, tokens or accounts are ever written (see redact()).
 */
public final class PlaybackDiary {
    public static final String FILE_NAME = "playback-diary.jsonl";
    public static final String KEY_ENABLED = "playback_diary";
    public static final long MAX_BYTES = 512L * 1024L;

    private static volatile boolean dead = false;
    private static final ConcurrentLinkedQueue<String> queue = new ConcurrentLinkedQueue<>();
    private static final AtomicInteger queueSize = new AtomicInteger(0);
    private static final AtomicBoolean DRAINING = new AtomicBoolean(false);
    private static final AtomicInteger playCounter = new AtomicInteger(0);

    private static volatile Context appContext;
    private static volatile long resolveFailTime = 0;
    private static volatile long prefsCacheTime = 0;
    private static volatile boolean prefsCacheValue = true;
    private static volatile String lastErrorMsg = null;
    private static volatile long lastErrorTime = 0;

    private static volatile File testDir = null;
    private static volatile Boolean testEnabled = null;

    private static final ThreadPoolExecutor WORKER = new ThreadPoolExecutor(0, 1, 30L, TimeUnit.SECONDS,
            new LinkedBlockingQueue<Runnable>(),
            new ThreadFactory() {
                @Override
                public Thread newThread(Runnable r) {
                    Thread t = new Thread(r, "playback-diary");
                    t.setDaemon(true);
                    return t;
                }
            });

    private static final Pattern URL_PATTERN =
            Pattern.compile("([A-Za-z][A-Za-z0-9+.-]*://)([^/?#\\s\"'<>]+)([^\\s\"'<>]*)");
    private static final Pattern EMAIL_PATTERN = Pattern.compile("[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}");
    private static final Pattern KEY_VALUE_PATTERN = Pattern.compile(
            "(?i)\\b(token|access_token|apikey|api_key|auth|authorization|bearer|password|passwd|secret|session|sid|cookie)\\s*[:=]\\s*([^\\s&,;]+)");
    private static final Pattern BEARER_PATTERN = Pattern.compile("(?i)\\bbearer\\s+[^\\s]+");
    private static final Pattern TOKEN_PATTERN = Pattern.compile("[A-Za-z0-9_-]{24,}");

    private PlaybackDiary() {
    }

    // ------------------------------------------------------------------ public API

    /** Logs one event with the process-wide application Context. kv = alternating String key, value. */
    public static void ev(String event, Object... kv) {
        ev((Context) null, event, kv);
    }

    /** Logs one event; never throws, never does disk I/O on the caller thread. */
    public static void ev(Context ctx, String event, Object... kv) {
        try {
            if (dead) return;
            Context validCtx = resolveContext(ctx);
            if (!isEnabled(validCtx)) return;

            long now = System.currentTimeMillis();
            int pNo = "play".equals(event) ? playCounter.incrementAndGet() : playCounter.get();

            String line = buildLine(event, kv, pNo, now);
            if (line == null) return;

            if (queueSize.get() < 512) {
                queue.offer(line);
                queueSize.incrementAndGet();
                triggerDrain();
            }
        } catch (Throwable t) {
            // Fail-soft: the diary is optional.
        }
    }

    /** Event "error": where, class and message only (no stack). */
    public static void err(String where, Throwable error) {
        try {
            if (dead) return;
            String msg = error != null ? error.getMessage() : "null";
            if (msg == null && error != null) msg = error.getClass().getSimpleName();
            String cls = error != null ? error.getClass().getSimpleName() : "null";
            ev("error", "where", where, "cls", cls, "msg", msg);
            recordError(msg);
        } catch (Throwable t) {
            // Fail-soft.
        }
    }

    /** Classifies one of the apps' own log lines into a diary event (cheap prefix tests). */
    public static void note(String m) {
        try {
            if (dead || m == null) return;
            if (m.startsWith("ERROR")) {
                ev("error", "m", m);
                recordError(m);
            } else if (m.startsWith("RETRYABLE") || (m.startsWith("RESPONSE ") && m.contains("retryable"))) {
                ev("http", "m", m);
                recordError(m);
            } else if (m.startsWith("Next episode") || m.startsWith("Timer overrun")) {
                ev("next", "m", m);
            } else if (m.startsWith("Auto-skip did not land") || m.startsWith("Landing ")
                    || m.startsWith("Chapters") || m.startsWith("Lookup retry") || m.startsWith("Re-armed")) {
                ev("note", "m", m);
            }
        } catch (Throwable t) {
            // Fail-soft.
        }
    }

    /** Last error/http note (at most 120 chars) if younger than 30 s, else null; reading clears it. */
    public static String lastError() {
        try {
            long now = System.currentTimeMillis();
            if (now - lastErrorTime > 30000L) return null;
            String msg = lastErrorMsg;
            lastErrorMsg = null;
            return msg;
        } catch (Throwable t) {
            return null;
        }
    }

    /** Lower-case host of a URL ("" when there is none): "https://U:p@Cdn.Example.com:8443/a?x=1" gives "cdn.example.com". */
    public static String host(String url) {
        try {
            if (url == null || url.isEmpty()) return "";
            Matcher m = URL_PATTERN.matcher(url);
            if (m.find() && m.start() == 0) {
                String hostPort = m.group(2);
                int atIndex = hostPort.lastIndexOf('@');
                if (atIndex != -1) hostPort = hostPort.substring(atIndex + 1);
                int colonIndex = hostPort.indexOf(':');
                if (colonIndex != -1) hostPort = hostPort.substring(0, colonIndex);
                return hostPort.toLowerCase(Locale.US);
            }
        } catch (Throwable t) {
            // Fall through.
        }
        return "";
    }

    /** One segment as a JSON object: type t, start s, end e (seconds), origin o. */
    public static Map<String, Object> seg(String type, double startSec, double endSec, String origin) {
        Map<String, Object> m = new LinkedHashMap<>();
        m.put("t", type);
        m.put("s", startSec);
        m.put("e", endSec);
        m.put("o", origin);
        return m;
    }

    /** Buffering tracker for one playback session; fed by the player poll loop (one thread). */
    public static final class Stall {
        private boolean seenReady = false;
        private long since = 0;

        public Stall() {
        }

        public void update(boolean buffering, long nowMs, long posMs) {
            try {
                if (buffering) {
                    if (since == 0) since = nowMs;
                } else if (since > 0) {
                    long ms = nowMs - since;
                    since = 0;
                    if (!seenReady) {
                        seenReady = true;
                        ev("startup", "ms", ms);
                    } else if (ms >= 400) {
                        ev("stall", "ms", ms, "pos", posMs);
                    }
                } else {
                    seenReady = true;
                }
            } catch (Throwable t) {
                // Fail-soft.
            }
        }
    }

    // ------------------------------------------------------------------ string half

    static String redact(String s) {
        if (s == null) return null;

        Matcher urlMatcher = URL_PATTERN.matcher(s);
        StringBuffer sb = new StringBuffer();
        while (urlMatcher.find()) {
            String hostPortInfo = urlMatcher.group(2);
            int atIndex = hostPortInfo.lastIndexOf('@');
            if (atIndex != -1) hostPortInfo = hostPortInfo.substring(atIndex + 1);
            int colonIndex = hostPortInfo.indexOf(':');
            if (colonIndex != -1) hostPortInfo = hostPortInfo.substring(0, colonIndex);
            urlMatcher.appendReplacement(sb, Matcher.quoteReplacement(urlMatcher.group(1) + hostPortInfo));
        }
        urlMatcher.appendTail(sb);
        s = sb.toString();

        s = EMAIL_PATTERN.matcher(s).replaceAll("<email>");
        // "Bearer <value>" first: key=value would otherwise swallow only the word "Bearer" and leak the value.
        s = BEARER_PATTERN.matcher(s).replaceAll("Bearer <redacted>");

        Matcher kvMatcher = KEY_VALUE_PATTERN.matcher(s);
        sb = new StringBuffer();
        while (kvMatcher.find()) {
            String all = kvMatcher.group();
            kvMatcher.appendReplacement(sb, Matcher.quoteReplacement(
                    all.substring(0, all.length() - kvMatcher.group(2).length()) + "<redacted>"));
        }
        kvMatcher.appendTail(sb);
        s = sb.toString();

        Matcher tokenMatcher = TOKEN_PATTERN.matcher(s);
        sb = new StringBuffer();
        while (tokenMatcher.find()) {
            String match = tokenMatcher.group();
            boolean hasDigit = false;
            boolean hasLetter = false;
            for (int i = 0; i < match.length(); i++) {
                char c = match.charAt(i);
                if (Character.isDigit(c)) hasDigit = true;
                else if (Character.isLetter(c)) hasLetter = true;
            }
            tokenMatcher.appendReplacement(sb, hasDigit && hasLetter ? "<tok>" : Matcher.quoteReplacement(match));
        }
        tokenMatcher.appendTail(sb);
        s = sb.toString();

        return s.length() > 240 ? s.substring(0, 240) : s;
    }

    /** The full JSON line without the trailing newline, or null when it must be dropped. */
    static String buildLine(String event, Object[] kv, int playNo, long nowMs) {
        if (event == null) return null;
        StringBuilder sb = new StringBuilder();
        sb.append("{\"t\":").append(nowMs);
        if (playNo > 0) sb.append(",\"n\":").append(playNo);
        sb.append(",\"ev\":").append(jsonString(redact(event)));
        if (kv != null) {
            for (int i = 0; i < kv.length - 1; i += 2) {
                if (!(kv[i] instanceof String)) continue;
                String key = (String) kv[i];
                String keyLower = key.toLowerCase(Locale.US);
                if (keyLower.contains("token") || keyLower.contains("auth") || keyLower.contains("email")
                        || keyLower.contains("password") || keyLower.contains("secret")
                        || keyLower.contains("cookie") || keyLower.contains("apikey") || keyLower.contains("api_key")) {
                    continue;
                }
                sb.append(',').append(jsonString(redact(key))).append(':');
                appendJsonValue(sb, kv[i + 1], 0);
            }
        }
        sb.append('}');
        String res = sb.toString();
        try {
            if (res.getBytes("UTF-8").length > 8192) return null;
        } catch (Exception e) {
            return null;
        }
        return res;
    }

    static String jsonString(String s) {
        if (s == null) return "null";
        StringBuilder sb = new StringBuilder(s.length() + 2);
        sb.append('"');
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            switch (c) {
                case '"': sb.append("\\\""); break;
                case '\\': sb.append("\\\\"); break;
                case '\b': sb.append("\\b"); break;
                case '\f': sb.append("\\f"); break;
                case '\n': sb.append("\\n"); break;
                case '\r': sb.append("\\r"); break;
                case '\t': sb.append("\\t"); break;
                case ' ': sb.append("\\u2028"); break;
                case ' ': sb.append("\\u2029"); break;
                default:
                    if (c <= 0x1F) {
                        sb.append(String.format(Locale.US, "\\u%04x", (int) c));
                    } else {
                        sb.append(c);
                    }
            }
        }
        sb.append('"');
        return sb.toString();
    }

    private static void appendJsonValue(StringBuilder sb, Object val, int depth) {
        if (val == null || depth > 3) {
            sb.append("null");
        } else if (val instanceof Boolean) {
            sb.append(((Boolean) val).booleanValue());
        } else if (val instanceof Number) {
            if (val instanceof Double || val instanceof Float) {
                double d = ((Number) val).doubleValue();
                if (Double.isNaN(d) || Double.isInfinite(d)) {
                    sb.append("null");
                } else {
                    long rounded = Math.round(d * 1000.0);
                    sb.append(rounded == 0L ? "0" : BigDecimal.valueOf(rounded, 3).stripTrailingZeros().toPlainString());
                }
            } else {
                sb.append(((Number) val).longValue());
            }
        } else if (val instanceof Map) {
            sb.append('{');
            boolean first = true;
            int count = 0;
            for (Map.Entry<?, ?> e : ((Map<?, ?>) val).entrySet()) {
                if (count++ >= 32) break;
                if (!first) sb.append(',');
                sb.append(jsonString(redact(String.valueOf(e.getKey())))).append(':');
                appendJsonValue(sb, e.getValue(), depth + 1);
                first = false;
            }
            sb.append('}');
        } else if (val instanceof Collection) {
            sb.append('[');
            boolean first = true;
            int count = 0;
            for (Object item : (Collection<?>) val) {
                if (count++ >= 64) break;
                if (!first) sb.append(',');
                appendJsonValue(sb, item, depth + 1);
                first = false;
            }
            sb.append(']');
        } else if (val instanceof Object[]) {
            sb.append('[');
            boolean first = true;
            int count = 0;
            for (Object item : (Object[]) val) {
                if (count++ >= 64) break;
                if (!first) sb.append(',');
                appendJsonValue(sb, item, depth + 1);
                first = false;
            }
            sb.append(']');
        } else {
            sb.append(jsonString(redact(String.valueOf(val))));
        }
    }

    // ------------------------------------------------------------------ I/O half

    private static void recordError(String msg) {
        lastErrorMsg = msg != null && msg.length() > 120 ? msg.substring(0, 120) : msg;
        lastErrorTime = System.currentTimeMillis();
    }

    private static Context resolveContext(Context ctx) {
        if (ctx != null) {
            Context appCtx = ctx.getApplicationContext();
            appContext = appCtx != null ? appCtx : ctx;
            return appContext;
        }
        if (appContext != null) return appContext;

        long now = System.currentTimeMillis();
        if (now - resolveFailTime < 5000L) return null;
        try {
            Class<?> clazz = Class.forName("android.app.ActivityThread");
            Object app = clazz.getMethod("currentApplication").invoke(null);
            if (app instanceof Context) {
                appContext = (Context) app;
                return appContext;
            }
        } catch (Throwable t) {
            // Remember the failure below.
        }
        resolveFailTime = now;
        return null;
    }

    private static boolean isEnabled(Context ctx) {
        Boolean forced = testEnabled;
        if (forced != null) return forced.booleanValue();
        if (ctx == null) return testDir != null;

        long now = System.currentTimeMillis();
        if (now - prefsCacheTime < 2000L) return prefsCacheValue;

        boolean enabled = true;
        try {
            SharedPreferences sp1 = ctx.getSharedPreferences("introskip_prefs", Context.MODE_PRIVATE);
            if (!sp1.getBoolean(KEY_ENABLED, true)) {
                enabled = false;
            } else {
                SharedPreferences sp2 = ctx.getSharedPreferences(ctx.getPackageName() + "_preferences", Context.MODE_PRIVATE);
                if (!sp2.getBoolean(KEY_ENABLED, true)) enabled = false;
            }
        } catch (Throwable t) {
            // Default on.
        }
        prefsCacheValue = enabled;
        prefsCacheTime = now;
        return enabled;
    }

    private static void triggerDrain() {
        if (DRAINING.compareAndSet(false, true)) {
            try {
                WORKER.execute(new Runnable() {
                    @Override
                    public void run() {
                        drainQueue();
                    }
                });
            } catch (Throwable t) {
                DRAINING.set(false);
            }
        }
    }

    private static void drainQueue() {
        try {
            Thread.sleep(150L); // let a burst of events gather into one write
        } catch (InterruptedException ignored) {
            // Proceed.
        }
        try {
            Context ctx = appContext;
            File dir = testDir;
            if (dir == null) {
                dir = ctx == null ? null : ctx.getExternalFilesDir(null);
            }
            if (dir == null || (!dir.exists() && !dir.mkdirs())) {
                dead = true;
                return;
            }

            File f = new File(dir, FILE_NAME);
            long currentLength = f.length();
            FileOutputStream fos = null;
            try {
                while (true) {
                    String line = queue.poll();
                    if (line == null) break;
                    queueSize.decrementAndGet();

                    byte[] bytes = (line + "\n").getBytes("UTF-8");
                    if (currentLength > 0 && currentLength + bytes.length > MAX_BYTES) {
                        if (fos != null) {
                            fos.flush();
                            fos.close();
                            fos = null;
                        }
                        File old = new File(dir, FILE_NAME + ".1");
                        if (old.exists()) old.delete();
                        if (!f.renameTo(old)) f.delete();
                        currentLength = 0;
                    }
                    if (fos == null) fos = new FileOutputStream(f, true);
                    if (currentLength == 0) {
                        byte[] hb = buildHeader(ctx).getBytes("UTF-8");
                        fos.write(hb);
                        currentLength += hb.length;
                    }
                    fos.write(bytes);
                    currentLength += bytes.length;
                }
                if (fos != null) fos.flush();
            } finally {
                if (fos != null) {
                    try {
                        fos.close();
                    } catch (Throwable ignored) {
                        // Closed or failed already.
                    }
                }
            }
        } catch (Throwable t) {
            dead = true;
            queue.clear();
            queueSize.set(0);
        } finally {
            DRAINING.set(false);
            if (!queue.isEmpty() && !dead) triggerDrain();
        }
    }

    private static String buildHeader(Context ctx) {
        String pkg = "";
        String ver = "";
        int vc = 0;
        int sdk = 0;
        String dev = "";
        try {
            if (ctx != null) {
                PackageManager pm = ctx.getPackageManager();
                if (pm != null) {
                    PackageInfo pi = pm.getPackageInfo(ctx.getPackageName(), 0);
                    if (pi != null) {
                        pkg = pi.packageName != null ? pi.packageName : "";
                        ver = pi.versionName != null ? pi.versionName : "";
                        vc = pi.versionCode;
                    }
                }
            }
        } catch (Throwable ignored) {
            // Header pieces are optional.
        }
        try {
            sdk = Build.VERSION.SDK_INT;
        } catch (Throwable ignored) {
            // Optional.
        }
        try {
            dev = Build.MODEL != null ? Build.MODEL : "";
        } catch (Throwable ignored) {
            // Optional.
        }
        return "{\"t\":" + System.currentTimeMillis() + ",\"ev\":\"diary\",\"pkg\":" + jsonString(pkg)
                + ",\"ver\":" + jsonString(ver) + ",\"vc\":" + vc + ",\"sdk\":" + sdk
                + ",\"dev\":" + jsonString(dev) + ",\"cap\":" + MAX_BYTES + "}\n";
    }

    // ------------------------------------------------------------------ test hooks

    static void testSetDir(File dir) {
        testDir = dir;
    }

    static void testSetEnabled(Boolean on) {
        testEnabled = on;
    }

    static void testFlush() {
        try {
            long end = System.currentTimeMillis() + 5000L;
            while ((DRAINING.get() || !queue.isEmpty()) && System.currentTimeMillis() < end) Thread.sleep(10L);
        } catch (Throwable ignored) {
            // Test helper.
        }
    }

    static void testReset() {
        dead = false;
        queue.clear();
        queueSize.set(0);
        playCounter.set(0);
        lastErrorMsg = null;
        lastErrorTime = 0;
        testDir = null;
        testEnabled = null;
        appContext = null;
        prefsCacheTime = 0;
        resolveFailTime = 0;
        DRAINING.set(false);
    }

    static boolean testDead() {
        return dead;
    }
}
