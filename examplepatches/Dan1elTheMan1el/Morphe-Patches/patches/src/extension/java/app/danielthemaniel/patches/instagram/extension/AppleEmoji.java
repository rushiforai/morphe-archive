package app.danielthemaniel.patches.instagram.extension;

import android.app.Activity;
import android.app.AlarmManager;
import android.app.AlertDialog;
import android.app.Application;
import android.app.PendingIntent;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Paint;
import android.graphics.Typeface;
import android.graphics.fonts.Font;
import android.graphics.fonts.FontFamily;
import android.graphics.fonts.FontStyle;
import android.os.Build;
import android.os.Bundle;
import android.os.Looper;
import android.os.Process;
import android.os.SystemClock;
import android.util.Log;
import android.view.Gravity;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.TextView;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * Runtime half of the "Apple emoji" patch for Instagram.
 *
 * <p>
 * The patch downloads an Apple-style emoji font on first launch (after asking),
 * prepares it with
 * {@link FontPrep}, and puts it at the front of every typeface Instagram
 * builds, so emoji render
 * with Apple glyphs while normal text keeps using the app's own fonts.
 *
 * <p>
 * If the font has not been downloaded yet, every hook returns its input
 * unchanged and the app
 * behaves exactly like stock Instagram.
 */
@SuppressWarnings({ "unused", "JavaReflectionMemberAccess", "PrivateApi", "DiscouragedPrivateApi",
        "SameParameterValue" })
public final class AppleEmoji {
    private static final String TAG = "AppleEmoji";

    // ---- Pinned font release
    // -------------------------------------------------------------
    // https://github.com/samuelngs/apple-emoji-ttf/releases/tag/macos-26-20260722-484daf4e
    private static final String FONT_URL = "https://github.com/samuelngs/apple-emoji-ttf/releases/download/"
            + "macos-26-20260722-484daf4e/AppleColorEmoji-Linux.ttf";
    private static final long FONT_BYTES = 115_969_256L;
    private static final String FONT_SHA256 = "e37c7af6265ac4a0af6d57bc65e86109a776d9966e8343334557f63da482516f";
    /**
     * Bump when the prepared-font format changes; also changes the emoji image
     * cache keys.
     */
    private static final String PREPARED_NAME = "apple-emoji-macos26-20260722-p5.ttf";
    private static final String CACHE_SALT = "ap5";

    private static final String PREFS = "apple_emoji_patch";
    private static final String PREF_NEVER_ASK = "never_ask";

    // ---- State
    // ---------------------------------------------------------------------------
    private static final Object LOCK = new Object();
    private static volatile boolean initialised;
    private static Context appContext;
    private static FontFamily family; // prepared Apple font, null until downloaded
    private static boolean processWide; // set by an optional patch hook
    private static Typeface defaultTypeface;
    private static boolean defaultBuilt;
    private static final Map<Integer, Object> RES_CACHE = new ConcurrentHashMap<>();
    private static final Set<Typeface> MINE = Collections
            .newSetFromMap(Collections.synchronizedMap(new WeakHashMap<Typeface, Boolean>()));

    // ---- Entry points injected by the patch
    // -----------------------------------------------

    /** Called first thing in Application.attachBaseContext. */
    public static void init(Application app, Context base) {
        appContext = base;
        try {
            app.registerActivityLifecycleCallbacks(new Lifecycle());
        } catch (Throwable t) {
            Log.w(TAG, "Could not register lifecycle callbacks", t);
        }
        // Load the font now if it is installed. This also replaces the process-wide default
        // typefaces before Instagram creates any text, and does not depend on any other hook firing.
        try {
            if (Build.VERSION.SDK_INT >= 29 && preparedFile(base).isFile())
                family(base);
        } catch (Throwable t) {
            Log.w(TAG, "Could not load the emoji font at start-up", t);
        }
    }


    /** Optional: also replace Android's process-wide default/system typefaces. */
    public static void enableProcessWide() {
        processWide = true;
    }

    /**
     * Appended to emoji image cache keys so stock bitmaps and Apple bitmaps never
     * collide.
     */
    public static String salt(String base) {
        try {
            Context c = appContext;
            if (c != null && family(c) != null)
                return base + CACHE_SALT;
        } catch (Throwable ignored) {
        }
        return base;
    }

    public static Typeface file(Context c, Typeface orig, String path) {
        try {
            return wrap(c, orig, new Font.Builder(new File(path)).build());
        } catch (Throwable t) {
            return orig;
        }
    }

    public static Typeface fileObj(Context c, Typeface orig, File file) {
        try {
            return wrap(c, orig, new Font.Builder(file).build());
        } catch (Throwable t) {
            return orig;
        }
    }

    public static Typeface asset(Context c, Typeface orig, String path) {
        try {
            return wrap(c, orig, new Font.Builder(c.getAssets(), path).build());
        } catch (Throwable t) {
            return orig;
        }
    }

    // Drop-in replacements for Typeface factory methods. The patch points the font
    // loader's own calls
    // at these, so they take exactly the original arguments and keep the original
    // exceptions.

    public static Typeface createFromFile(String path) {
        return file(appContext, Typeface.createFromFile(path), path);
    }

    public static Typeface createFromFile(File file) {
        return fileObj(appContext, Typeface.createFromFile(file), file);
    }

    public static Typeface createFromAsset(android.content.res.AssetManager assets, String path) {
        Typeface orig = Typeface.createFromAsset(assets, path);
        try {
            return wrap(appContext, orig, new Font.Builder(assets, path).build());
        } catch (Throwable t) {
            return orig;
        }
    }

    public static Typeface create(String familyName, int style) {
        Typeface orig = Typeface.create(familyName, style);
        if (orig == null || familyName == null)
            return orig;
        return sys(appContext, orig, familyName, style);
    }

    /**
     * Resource fonts (also used by Compose). Results are cached per resource id.
     */
    public static Typeface res(Context c, Typeface orig, int id) {
        try {
            Object cached = RES_CACHE.get(id);
            if (cached instanceof Typeface)
                return (Typeface) cached;
            if (cached != null)
                return orig;
            Typeface out = wrap(c, orig, new Font.Builder(c.getResources(), id).build());
            RES_CACHE.put(id, out != orig && out != null ? out : Boolean.FALSE);
            return out;
        } catch (Throwable t) {
            return orig;
        }
    }

    /**
     * Typefaces created by system family name, e.g.
     * Typeface.create("sans-serif-medium", style).
     */
    public static Typeface sys(Context c, Typeface orig, String name, int style) {
        int weight = (style & Typeface.BOLD) != 0 ? 700 : 400;
        return systemFirst(c, orig, name, weight, (style & Typeface.ITALIC) != 0);
    }

    /** Wraps a Compose typeface result when it is the plain platform default. */
    public static Object cw(Object o) {
        try {
            if (!(o instanceof Typeface))
                return o;
            Typeface t = (Typeface) o;
            if (MINE.contains(t) || appContext == null)
                return o;
            // Compose builds its default via Typeface.create(Typeface.DEFAULT, weight,
            // italic).
            Typeface def = Typeface.create(Typeface.DEFAULT, t.getWeight(), t.isItalic());
            if (def != t)
                return o;
            return systemFirst(appContext, t, "sans-serif", t.getWeight(), t.isItalic());
        } catch (Throwable ignored) {
            return o;
        }
    }

    /** Gives a paint with no explicit typeface the Apple-first default. */
    public static void applyDefaultTypeface(Paint paint) {
        try {
            Typeface d = defaultTypeface();
            if (d != null && paint != null)
                paint.setTypeface(d);
        } catch (Throwable ignored) {
        }
    }

    /**
     * Typeface used when Instagram renders an emoji into a bitmap (picker, tray).
     */
    public static Typeface ec(Typeface orig) {
        try {
            Typeface d = defaultTypeface();
            return d != null ? d : orig;
        } catch (Throwable t) {
            return orig;
        }
    }

    // ---- Font family and typeface construction
    // --------------------------------------------

    private static FontFamily family(Context c) {
        if (initialised)
            return family;
        synchronized (LOCK) {
            if (initialised)
                return family;
            if (Build.VERSION.SDK_INT < 29) {
                initialised = true;
                return null;
            }
            Context app = c != null ? c.getApplicationContext() : null;
            if (app == null)
                app = c != null ? c : appContext;
            if (app == null)
                return null; // too early: try again on the next call
            initialised = true;
            try {
                if (appContext == null)
                    appContext = app;
                File f = preparedFile(app);
                if (f.isFile() && f.length() > 1_000_000L) {
                    family = new FontFamily.Builder(new Font.Builder(f).build()).build();
                    Log.i(TAG, "Apple emoji font loaded");
                    if (processWide)
                        installProcessWide();
                }
            } catch (Throwable t) {
                Log.w(TAG, "Failed to load Apple emoji font", t);
                family = null;
            }
            return family;
        }
    }


    /** [Apple emoji] + [the app's own font] + system fallback. */
    private static Typeface wrap(Context c, Typeface orig, Font base) {
        FontFamily apple = family(c);
        if (apple == null || base == null)
            return orig;
        try {
            Typeface.CustomFallbackBuilder b = new Typeface.CustomFallbackBuilder(apple);
            b.addCustomFallback(new FontFamily.Builder(base).build());
            b.setSystemFallback("sans-serif");
            b.setStyle(base.getStyle());
            return remember(b.build());
        } catch (Throwable t) {
            return orig;
        }
    }

    /** [Apple emoji] + the named system family. */
    private static Typeface systemFirst(Context c, Typeface orig, String name, int weight, boolean italic) {
        FontFamily apple = family(c);
        if (apple == null)
            return orig;
        try {
            Typeface.CustomFallbackBuilder b = new Typeface.CustomFallbackBuilder(apple);
            b.setSystemFallback(name);
            b.setStyle(new FontStyle(weight, italic ? FontStyle.FONT_SLANT_ITALIC : FontStyle.FONT_SLANT_UPRIGHT));
            return remember(b.build());
        } catch (Throwable t) {
            return orig;
        }
    }

    private static Typeface remember(Typeface t) {
        if (t != null)
            MINE.add(t);
        return t;
    }

    private static Typeface defaultTypeface() {
        if (defaultBuilt)
            return defaultTypeface;
        Context c = appContext;
        if (c == null)
            c = currentApplication();
        if (c == null)
            return null;
        if (family(c) == null) {
            defaultBuilt = true;
            return null;
        }
        synchronized (LOCK) {
            if (!defaultBuilt) {
                defaultTypeface = systemFirst(c, null, "sans-serif", 400, false);
                defaultBuilt = true;
            }
        }
        return defaultTypeface;
    }

    private static Context currentApplication() {
        try {
            Class<?> at = Class.forName("android.app.ActivityThread");
            return (Context) at.getMethod("currentApplication").invoke(null);
        } catch (Throwable t) {
            return null;
        }
    }

    // ---- Optional: process-wide typeface replacement
    // --------------------------------------

    private static void installProcessWide() {
        try {
            Typeface def = defaultTypeface();
            if (def == null)
                return;
            Method setDefault = findSetDefault();
            if (setDefault == null) {
                exemptHiddenApis();
                setDefault = findSetDefault();
            }
            if (setDefault != null)
                setDefault.invoke(null, def);
            setStatic("DEFAULT", def);
            setStatic("SANS_SERIF", def);
            try {
                replaceSystemFontMap();
            } catch (Throwable t) {
                // Not fatal: the default typefaces below are what most text uses.
                Log.w(TAG, "System font map not replaced", t);
            }
            Typeface[] defaults = new Typeface[4];
            for (int i = 0; i < 4; i++)
                defaults[i] = Typeface.create(def, i);
            Field f = Typeface.class.getDeclaredField("sDefaults");
            f.setAccessible(true);
            f.set(null, defaults);
            setStatic("DEFAULT_BOLD", defaults[Typeface.BOLD]);
            Log.i(TAG, "Process-wide typeface table replaced");
        } catch (Throwable t) {
            Log.w(TAG, "Process-wide typeface replacement skipped", t);
        }
    }

    private static Method findSetDefault() {
        try {
            Method m = Typeface.class.getDeclaredMethod("setDefault", Typeface.class);
            m.setAccessible(true);
            return m;
        } catch (Throwable t) {
            return null;
        }
    }

    private static void setStatic(String name, Typeface value) {
        try {
            Field f = Typeface.class.getField(name);
            f.setAccessible(true);
            f.set(null, value);
        } catch (Throwable ignored) {
        }
    }

    @SuppressWarnings("unchecked")
    private static void replaceSystemFontMap() throws Exception {
        exemptHiddenApis();
        Field f = Typeface.class.getDeclaredField("sSystemFontMap");
        f.setAccessible(true);
        Map<String, Typeface> original = (Map<String, Typeface>) f.get(null);
        Map<String, Typeface> replaced = new HashMap<>();
        // Android stores this as an ArrayMap, whose entry set cannot be copied with toArray()
        // (new ArrayList<>(entrySet()) throws), so snapshot it by iterating.
        List<Map.Entry<String, Typeface>> entries = new ArrayList<>();
        for (Map.Entry<String, Typeface> e : original.entrySet())
            entries.add(new java.util.AbstractMap.SimpleEntry<>(e.getKey(), e.getValue()));
        for (Map.Entry<String, Typeface> e : entries) {
            Typeface v = e.getValue();
            Typeface w = v == null ? null : systemFirst(appContext, v, e.getKey(), v.getWeight(), v.isItalic());
            replaced.put(e.getKey(), w != null ? w : v);
        }
        try {
            f.set(null, replaced);
        } catch (IllegalAccessException finalField) {
            original.putAll(replaced); // the field is final on newer Android; the map itself is mutable
        }
    }

    /**
     * Lifts hidden-API restrictions for this process (only used for the optional
     * table swap).
     */
    private static void exemptHiddenApis() {
        try {
            Method forName = Class.class.getDeclaredMethod("forName", String.class);
            Method getDeclaredMethod = Class.class.getDeclaredMethod("getDeclaredMethod", String.class, Class[].class);
            Class<?> vmRuntime = (Class<?>) forName.invoke(null, "dalvik.system.VMRuntime");
            Method getRuntime = (Method) getDeclaredMethod.invoke(vmRuntime, "getRuntime", null);
            Method setExemptions = (Method) getDeclaredMethod.invoke(
                    vmRuntime, "setHiddenApiExemptions", new Class[] { String[].class });
            Object runtime = getRuntime.invoke(null);
            setExemptions.invoke(runtime, new Object[] { new String[] { "L" } });
        } catch (Throwable ignored) {
        }
    }

    // ---- Files
    // ----------------------------------------------------------------------------

    private static File fontDir(Context c) {
        File d = new File(c.getFilesDir(), "apple_emoji");
        // noinspection ResultOfMethodCallIgnored
        d.mkdirs();
        return d;
    }

    /** A font prepared by an older version of this patch, or null. */
    private static File legacyPrepared(Context c) {
        File[] files = fontDir(c).listFiles();
        if (files == null)
            return null;
        for (File f : files) {
            String n = f.getName();
            if (n.startsWith("apple-emoji-") && n.endsWith(".ttf") && !n.equals(PREPARED_NAME)
                    && f.length() > 1_000_000L)
                return f;
        }
        return null;
    }

    private static File preparedFile(Context c) {
        return new File(fontDir(c), PREPARED_NAME);
    }

    // ---- First-run UI
    // -----------------------------------------------------------------------

    private static final class Lifecycle implements Application.ActivityLifecycleCallbacks {
        private boolean prompted;

        @Override
        public void onActivityResumed(Activity a) {
            lastActivity = new WeakReference<>(a);
            String name = a.getClass().getName();
            if (prompted || Build.VERSION.SDK_INT < 29)
                return;
            // Only prompt from the main screen, not from login/redirect trampolines. The
            // manifest's
            // "MainTabActivity" is just an alias; the real class is InstagramMainActivity.
            if (!name.endsWith("InstagramMainActivity") && !name.endsWith("MainTabActivity"))
                return;
            prompted = true;
            try {
                Context app = a.getApplicationContext();
                if (preparedFile(app).isFile())
                    return;
                if (legacyPrepared(app) != null) {
                    // Already agreed to the download once; just update the font file in place.
                    startDownload(a);
                    return;
                }
                SharedPreferences prefs = app.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
                if (prefs.getBoolean(PREF_NEVER_ASK, false))
                    return;
                showDownloadPrompt(a, prefs);
            } catch (Throwable t) {
                Log.w(TAG, "Could not show download prompt", t);
            }
        }

        @Override
        public void onActivityCreated(Activity a, Bundle b) {
        }

        @Override
        public void onActivityStarted(Activity a) {
        }

        @Override
        public void onActivityPaused(Activity a) {
        }

        @Override
        public void onActivityStopped(Activity a) {
        }

        @Override
        public void onActivitySaveInstanceState(Activity a, Bundle b) {
        }

        @Override
        public void onActivityDestroyed(Activity a) {
        }
    }

    private static volatile WeakReference<Activity> lastActivity = new WeakReference<>(null);

    private static void showDownloadPrompt(final Activity a, final SharedPreferences prefs) {
        new AlertDialog.Builder(a)
                .setTitle("Apple emoji")
                .setMessage("Download the Apple emoji font now?\n\n"
                        + "It is about 116 MB, is stored privately in Instagram's app data, and "
                        + "needs roughly 250 MB of free space while it is being prepared. "
                        + "Wi-Fi is recommended.")
                .setPositiveButton("Download", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface d, int w) {
                        startDownload(a);
                    }
                })
                .setNegativeButton("Later", null)
                .setNeutralButton("Don't ask again", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface d, int w) {
                        prefs.edit().putBoolean(PREF_NEVER_ASK, true).apply();
                    }
                })
                .show();
    }

    private static final class ProgressUi {
        final AlertDialog dialog;
        final ProgressBar bar;
        final TextView text;

        ProgressUi(AlertDialog dialog, ProgressBar bar, TextView text) {
            this.dialog = dialog;
            this.bar = bar;
            this.text = text;
        }
    }

    private static ProgressUi buildProgressDialog(Activity a, final AtomicBoolean cancelled) {
        int pad = (int) (20 * a.getResources().getDisplayMetrics().density);
        LinearLayout box = new LinearLayout(a);
        box.setOrientation(LinearLayout.VERTICAL);
        box.setPadding(pad, pad, pad, pad / 2);
        box.setGravity(Gravity.CENTER_HORIZONTAL);
        TextView text = new TextView(a);
        text.setText("Starting download…");
        ProgressBar bar = new ProgressBar(a, null, android.R.attr.progressBarStyleHorizontal);
        bar.setMax(1000);
        box.addView(text, new LinearLayout.LayoutParams(-1, -2));
        box.addView(bar, new LinearLayout.LayoutParams(-1, -2));
        AlertDialog dialog = new AlertDialog.Builder(a)
                .setTitle("Apple emoji")
                .setView(box)
                .setCancelable(false)
                .setNegativeButton("Cancel", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface d, int w) {
                        cancelled.set(true);
                    }
                })
                .create();
        dialog.show();
        return new ProgressUi(dialog, bar, text);
    }

    private static void startDownload(final Activity activity) {
        final Context app = activity.getApplicationContext();
        final AtomicBoolean cancelled = new AtomicBoolean(false);
        final ProgressUi ui = buildProgressDialog(activity, cancelled);

        new Thread(new Runnable() {
            @Override
            public void run() {
                File dir = fontDir(app);
                File part = new File(dir, "download.part");
                File raw = new File(dir, "downloaded.ttf");
                File tmp = new File(dir, PREPARED_NAME + ".new");
                try {
                    boolean haveRaw = raw.isFile() && raw.length() == FONT_BYTES;
                    if (haveRaw) {
                        setProgress(activity, ui, "Checking the earlier download…", -1);
                        haveRaw = FONT_SHA256.equalsIgnoreCase(sha256(raw));
                    }
                    File source = raw;
                    File legacy = haveRaw ? null : legacyPrepared(app);
                    if (legacy != null) {
                        // Font prepared by an older version of the patch: re-prepare it, no download.
                        Log.i(TAG, "Upgrading " + legacy.getName());
                        source = legacy;
                    } else if (!haveRaw) {
                        // noinspection ResultOfMethodCallIgnored
                        raw.delete();
                        long need = FONT_BYTES * 2 + 40_000_000L;
                        if (dir.getUsableSpace() < need) {
                            throw new IllegalStateException("Not enough free space. About "
                                    + (need / 1_000_000L) + " MB is needed.");
                        }
                        download(part, ui, activity, cancelled);
                        if (!part.renameTo(raw))
                            throw new IllegalStateException("Cannot store the download");
                    }
                    setProgress(activity, ui, "Preparing font…", -1);
                    FontPrep.prepare(source, tmp);
                    setProgress(activity, ui, "Checking that Android can render it…", -1);
                    selfTest(tmp);
                    File finalFile = preparedFile(app);
                    if (finalFile.exists() && !finalFile.delete())
                        throw new IllegalStateException("Cannot replace old font");
                    if (!tmp.renameTo(finalFile))
                        throw new IllegalStateException("Cannot store prepared font");
                    // noinspection ResultOfMethodCallIgnored
                    raw.delete();
                    // Remove fonts prepared by older versions of the patch (about 116 MB each).
                    File[] stale = finalFile.getParentFile().listFiles();
                    if (stale != null)
                        for (File f : stale) {
                            String n = f.getName();
                            if (n.startsWith("apple-emoji-") && n.endsWith(".ttf") && !n.equals(PREPARED_NAME)) {
                                // noinspection ResultOfMethodCallIgnored
                                f.delete();
                            }
                        }
                    finish(activity, ui, true, null);
                } catch (Throwable t) {
                    Log.w(TAG, "Apple emoji setup failed", t);
                    // noinspection ResultOfMethodCallIgnored
                    part.delete();
                    // noinspection ResultOfMethodCallIgnored
                    tmp.delete();
                    // The verified download (raw) is kept so a retry does not download 116 MB
                    // again.
                    finish(activity, ui, false,
                            cancelled.get() ? "Download cancelled." : String.valueOf(t.getMessage()));
                }
            }
        }, "AppleEmoji-download").start();
    }

    private static String sha256(File f) throws Exception {
        MessageDigest sha = MessageDigest.getInstance("SHA-256");
        byte[] buf = new byte[1 << 20];
        try (InputStream in = new java.io.FileInputStream(f)) {
            int n;
            while ((n = in.read(buf)) > 0)
                sha.update(buf, 0, n);
        }
        StringBuilder hex = new StringBuilder();
        for (byte b : sha.digest())
            hex.append(String.format("%02x", b));
        return hex.toString();
    }

    private static void download(File part, ProgressUi ui, Activity a, AtomicBoolean cancelled) throws Exception {
        HttpURLConnection c = (HttpURLConnection) new URL(FONT_URL).openConnection();
        c.setConnectTimeout(20_000);
        c.setReadTimeout(30_000);
        c.setInstanceFollowRedirects(true);
        c.setRequestProperty("User-Agent", "Mozilla/5.0 (Android) AppleEmojiPatch");
        int code = c.getResponseCode();
        if (code != 200)
            throw new IllegalStateException("Server returned HTTP " + code);

        MessageDigest sha = MessageDigest.getInstance("SHA-256");
        long total = c.getContentLengthLong() > 0 ? c.getContentLengthLong() : FONT_BYTES;
        long done = 0, lastUi = 0;
        byte[] buf = new byte[256 * 1024];
        try (InputStream in = c.getInputStream(); FileOutputStream out = new FileOutputStream(part)) {
            int n;
            while ((n = in.read(buf)) > 0) {
                if (cancelled.get())
                    throw new IllegalStateException("cancelled");
                out.write(buf, 0, n);
                sha.update(buf, 0, n);
                done += n;
                long now = SystemClock.elapsedRealtime();
                if (now - lastUi > 250) {
                    lastUi = now;
                    setProgress(a, ui, "Downloading… " + (done / 1_000_000L) + " / " + (total / 1_000_000L) + " MB",
                            (int) (done * 1000L / total));
                }
            }
        } finally {
            c.disconnect();
        }
        if (done != FONT_BYTES)
            throw new IllegalStateException("Download was incomplete (" + done + " bytes).");
        StringBuilder hex = new StringBuilder();
        for (byte b : sha.digest())
            hex.append(String.format("%02x", b));
        if (!hex.toString().equalsIgnoreCase(FONT_SHA256)) {
            throw new IllegalStateException("Downloaded file did not match the expected checksum.");
        }
    }

    /**
     * Confirms the prepared font works the way the app will use it: first in the
     * chain, with the
     * system font behind it. Uses text widths, because Paint.hasGlyph() cannot tell
     * which font
     * answered (Android adds its system fallback to custom typefaces).
     *
     * <ul>
     * <li>Emoji sequences (keycap, flag, skin tone, family) must shape to ONE
     * glyph, so they are about
     * as wide as a single emoji. If the text engine cannot apply the font's
     * substitution tables,
     * they come out as several glyphs and are much wider.</li>
     * <li>The prepared file's character map is re-read to confirm it no longer
     * claims plain digits
     * and symbols ({@link FontPrep#verify}).</li>
     * </ul>
     */
    private static void selfTest(File prepared) {
        Font font;
        try {
            font = new Font.Builder(prepared).build();
        } catch (Exception e) {
            throw new IllegalStateException("The font could not be opened: " + e.getMessage());
        }
        Typeface test = new Typeface.CustomFallbackBuilder(new FontFamily.Builder(font).build())
                .setSystemFallback("sans-serif")
                .build();
        Paint p = new Paint();
        p.setTypeface(test);
        p.setTextSize(48f);

        float one = p.measureText("\uD83D\uDE00");
        if (!(one > 4f))
            throw new IllegalStateException("The font did not produce a glyph for a basic emoji.");

        String[][] cases = {
                { "1\uFE0F\u20E3", "keycap" },
                { "\uD83C\uDDE8\uD83C\uDDE6", "flag" },
                { "\uD83D\uDC4D\uD83C\uDFFD", "skin tone" },
                { "\uD83D\uDC68\u200D\uD83D\uDC69\u200D\uD83D\uDC67", "family" },
        };
        for (String[] c : cases) {
            float w = p.measureText(c[0]);
            if (w > one * 1.35f) {
                throw new IllegalStateException("This Android version cannot apply the font's " + c[1]
                        + " sequences (width " + Math.round(w) + " vs " + Math.round(one)
                        + "), so it was not installed.");
            }
        }

        // Plain digits: checked directly on the prepared file. (Comparing widths
        // against the system
        // font is unreliable: the system font and a named family can differ on some
        // devices.)
        try {
            FontPrep.verify(prepared);
        } catch (java.io.IOException e) {
            throw new IllegalStateException("Font preparation check failed: " + e.getMessage());
        }
    }

    private static void setProgress(final Activity a, final ProgressUi ui, final String msg, final int permille) {
        runOnUi(a, new Runnable() {
            @Override
            public void run() {
                ui.text.setText(msg);
                if (permille < 0)
                    ui.bar.setIndeterminate(true);
                else {
                    ui.bar.setIndeterminate(false);
                    ui.bar.setProgress(permille);
                }
            }
        });
    }

    private static void runOnUi(Activity a, Runnable r) {
        Activity top = lastActivity.get();
        Activity target = top != null && !top.isFinishing() ? top : a;
        try {
            if (Looper.myLooper() == Looper.getMainLooper())
                r.run();
            else
                target.runOnUiThread(r);
        } catch (Throwable ignored) {
        }
    }

    private static void finish(final Activity a, final ProgressUi ui, final boolean ok, final String error) {
        runOnUi(a, new Runnable() {
            @Override
            public void run() {
                try {
                    ui.dialog.dismiss();
                } catch (Throwable ignored) {
                }
                Activity top = lastActivity.get();
                Activity target = top != null && !top.isFinishing() ? top : a;
                if (ok) {
                    new AlertDialog.Builder(target)
                            .setTitle("Apple emoji ready")
                            .setMessage("Restart Instagram to start using Apple emoji.")
                            .setPositiveButton("Restart now", new DialogInterface.OnClickListener() {
                                @Override
                                public void onClick(DialogInterface d, int w) {
                                    restart(target);
                                }
                            })
                            .setNegativeButton("Later", null)
                            .show();
                } else {
                    new AlertDialog.Builder(target)
                            .setTitle("Apple emoji")
                            .setMessage("Setup did not finish.\n\n" + error
                                    + "\n\nYou will be asked again next time you open the app.")
                            .setPositiveButton("OK", null)
                            .show();
                }
            }
        });
    }

    private static void restart(Activity a) {
        try {
            Context app = a.getApplicationContext();
            Intent launch = app.getPackageManager().getLaunchIntentForPackage(app.getPackageName());
            if (launch != null) {
                launch.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
                PendingIntent pi = PendingIntent.getActivity(app, 0, launch,
                        PendingIntent.FLAG_CANCEL_CURRENT | PendingIntent.FLAG_IMMUTABLE);
                ((AlarmManager) app.getSystemService(Context.ALARM_SERVICE))
                        .set(AlarmManager.RTC, System.currentTimeMillis() + 400, pi);
            }
            a.finishAffinity();
        } catch (Throwable ignored) {
        }
        Process.killProcess(Process.myPid());
    }

    private AppleEmoji() {
    }
}