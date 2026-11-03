package app.tikkamasalla.stremio.subs;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * "Avoid SDH subtitles" for the Compose builds (TV 1.10.x / 1.12.x, phone 2.x), where Media3 and the
 * app's track model are obfuscated. No Media3 type is referenced here, so this class loads everywhere.
 *
 * Layers (see SdhFingerprints.kt for the hooks):
 *  1. Ranking: the app picks its default subtitle with a pure function findTrack(list, id, lang, pref1, pref2).
 *     Its result goes through {@link #onFindTrackResult}: a track whose label says SDH/CC/HI is swapped for a
 *     full-dialogue track of the same language when one exists. An id picked earlier (explicit) is never touched.
 *  2. Content check of addon subtitles: the chosen addon file is downloaded and scored in the background; when it
 *     reads as SDH the track is switched through the app's own player interface (setTrack).
 *  3. Cue cleaning: ExoPlayer cues are cleaned in SubtitleView.setCues by field type (the Cue class is found from
 *     the cue objects themselves); mpv gets its own sub-filter-sdh option.
 * The patch writes the obfuscated field and method names into {@link #config()} at patch time.
 * Language code "hi" (Hindi) is never read as SDH: only labels and flags count.
 */
public final class SdhPort {
    private static final String TAG = "SdhAvoid";
    private static final int MAX_SWITCHES = 4;
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final ExecutorService NET = Executors.newCachedThreadPool();
    private static final Map<String, Boolean> VERDICTS = new ConcurrentHashMap<String, Boolean>();
    private static final ThreadLocal<Object[]> ENTRY = new ThreadLocal<Object[]>();
    private static final Map<Class<?>, Object> CUE_SHAPES = new ConcurrentHashMap<Class<?>, Object>();
    private static final Object NO_SHAPE = new Object();

    private static volatile Map<String, String> cfg;
    private static final Map<String, Field> FIELDS = new HashMap<String, Field>();
    private static volatile WeakReference<Object> player = new WeakReference<Object>(null);
    private static volatile String curTextId;
    private static volatile String curLang = "";
    private static volatile int switches;
    private static volatile int generation;

    private SdhPort() {
    }

    /** Patch-generated body: "setTrack=m;type=f;id=f;uri=f;label=f;language=f;forced=f". Empty on other builds. */
    static String config() {
        return "";
    }

    /** One text/audio track of the app, read through the resolved field names. */
    static final class T {
        Object raw;
        boolean text;
        boolean forced;
        String id;
        String label;
        String lang;
        String url;
    }

    // ---- layer 1: ranking -----------------------------------------------------------------

    /** findTrack entry: remembers (list, id) for the result hook. */
    public static void onFindTrack(Object list, Object id) {
        ENTRY.set(new Object[] {list, id});
    }

    /** findTrack return: the track Stremio is about to select, or a better one. */
    public static Object onFindTrackResult(Object result) {
        Object[] entry = ENTRY.get();
        ENTRY.remove();
        try {
            if (result == null || entry == null || !(entry[0] instanceof List)) return result;
            if (!avoidEnabled()) return result;
            T chosen = read(result);
            if (chosen == null || !chosen.text) return result;
            if (entry[1] != null && entry[1].equals(chosen.id)) return result; // explicit pick
            List<T> all = tracks((List) entry[0]);
            Object out = result;
            if (isSdh(chosen)) {
                T alt = best(all, chosen);
                if (alt != null) {
                    Log.i(TAG, "rank: " + chosen.id + " '" + chosen.label + "' is SDH, using " + alt.id + " '" + alt.label + "'");
                    chosen = alt;
                    out = alt.raw;
                }
            }
            if (chosen.url != null && !VERDICTS.containsKey(chosen.url)) check(chosen, all);
            return out;
        } catch (Throwable error) {
            Log.w(TAG, "rank failed", error);
            return result;
        }
    }

    /** Best same-language, non-SDH, full-dialogue track in list order, never [avoid] itself. */
    static T best(List<T> all, T avoid) {
        String lang = SdhLabels.normLang(avoid.lang);
        for (T t : all) {
            if (!t.text || t == avoid || (t.id != null && t.id.equals(avoid.id))) continue;
            if (!lang.equals(SdhLabels.normLang(t.lang))) continue;
            if (isSdh(t) || kind(t) != SdhLabels.KIND_FULL) continue;
            return t;
        }
        return null;
    }

    static boolean isSdh(T t) {
        return (t.url != null && Boolean.TRUE.equals(VERDICTS.get(t.url))) || kind(t) == SdhLabels.KIND_SDH;
    }

    /** Label kind. The bare token "hi" is not SDH on a Hindi track or when the label is just the language code. */
    static int kind(T t) {
        String label = t.label;
        if (label != null) {
            String lang = SdhLabels.normLang(t.lang);
            String trimmed = label.trim();
            if (trimmed.equalsIgnoreCase(t.lang == null ? "" : t.lang.trim()) || trimmed.equalsIgnoreCase(lang)) {
                label = null;
            } else if ("hi".equals(lang)) {
                label = label.replaceAll("(?i)(?<![A-Za-z0-9])hi(?![A-Za-z0-9])", " ");
            }
        }
        return SdhLabels.kindOf(label, 0, t.forced ? 2 : 0);
    }

    // ---- layer 2: addon content check -----------------------------------------------------

    private static void check(final T t, final List<T> all) {
        final String url = t.url;
        final int gen = generation;
        VERDICTS.put(url, Boolean.FALSE); // in flight counts as clean; replaced by the verdict
        NET.execute(new Runnable() {
            @Override
            public void run() {
                boolean sdh = false;
                boolean fetched = false;
                try {
                    String body = download(url);
                    if (body != null) {
                        fetched = true;
                        List<String> cues = SdhLabels.parseSubtitleFile(url, body);
                        if (cues.size() > 200) cues = cues.subList(0, 200);
                        double score = SdhLabels.scoreCues(cues);
                        Log.i(TAG, "addon score " + url + " = " + score + " over " + cues.size() + " cues");
                        sdh = score >= SdhLabels.SDH_THRESHOLD;
                    }
                } catch (Throwable error) {
                    Log.w(TAG, "addon fetch failed", error);
                }
                if (!fetched) {
                    VERDICTS.remove(url); // network failure: retry on the next selection
                    return;
                }
                final boolean verdict = sdh;
                MAIN.post(new Runnable() {
                    @Override
                    public void run() {
                        try {
                            VERDICTS.put(url, Boolean.valueOf(verdict));
                            if (verdict) onSdhVerdict(t, all, gen);
                        } catch (Throwable error) {
                            Log.w(TAG, "verdict failed", error);
                        }
                    }
                });
            }
        });
    }

    private static void onSdhVerdict(T t, List<T> all, int gen) {
        if (gen != generation || t.id == null || !t.id.equals(curTextId) || switches >= MAX_SWITCHES) return;
        T alt = best(all, t);
        if (alt == null) return; // nothing better: the cue cleaner covers it
        Object p = player.get();
        String method = cfgValue("setTrack");
        if (p == null || method == null) return;
        try {
            Method m = p.getClass().getMethod(method, alt.raw.getClass());
            switches++;
            Log.i(TAG, "addon is SDH, switching to " + alt.id + " '" + alt.label + "'");
            m.invoke(p, alt.raw);
            if (alt.url != null && !VERDICTS.containsKey(alt.url)) check(alt, all);
        } catch (Throwable error) {
            Log.w(TAG, "switch failed", error);
        }
    }

    /** Player.setTrack(Track), index 0 in every engine: tracks the live selection and the player instance. */
    public static void onSetTrack(Object self, Object track) {
        try {
            if (self != player.get()) {
                player = new WeakReference<Object>(self);
                switches = 0;
                generation++;
                curTextId = null;
                curLang = "";
            }
            if (track == null) {
                curTextId = null; // setTrack(null) turns text off
                curLang = "";
                return;
            }
            T t = read(track);
            if (t == null || !t.text) return;
            curTextId = t.id;
            curLang = SdhLabels.normLang(t.lang);
        } catch (Throwable error) {
            Log.w(TAG, "setTrack hook failed", error);
        }
    }

    // ---- layer 3: cue cleaning ------------------------------------------------------------

    /** Cue field/builder shape found from the cue objects themselves. */
    private static final class CueShape {
        Field text;
        Method buildUpon;
        Method setText;
        Method build;
    }

    /** SubtitleView.setCues(List) hook: English cues lose sound notes; cues left empty are dropped. */
    public static List cleanCues(List cues) {
        try {
            if (cues == null || cues.isEmpty() || !"en".equals(curLang)) return cues;
            Context app = app();
            if (app != null && !SdhPrefs.isCleanEnabled(app)) return cues;
            List<Object> out = new ArrayList<Object>(cues.size());
            boolean changed = false;
            for (Object item : cues) {
                CueShape shape = item == null ? null : shapeOf(item.getClass());
                CharSequence text = shape == null ? null : (CharSequence) shape.text.get(item);
                if (text == null || !SdhLabels.isSoundCue(text.toString())) {
                    out.add(item);
                    continue;
                }
                String cleaned = SdhLabels.cleanCueText(text.toString());
                changed = true;
                if (cleaned == null) continue;
                out.add(rebuild(shape, item, cleaned));
            }
            return changed ? out : cues;
        } catch (Throwable error) {
            return cues;
        }
    }

    private static Object rebuild(CueShape shape, Object cue, String text) {
        try {
            if (shape.buildUpon != null) {
                Object builder = shape.buildUpon.invoke(cue);
                shape.setText.invoke(builder, text);
                return shape.build.invoke(builder);
            }
            shape.text.set(cue, text); // no builder in this build: same cleaning, in place
        } catch (Throwable ignored) {
            // keep the original cue
        }
        return cue;
    }

    /** A cue class has exactly one CharSequence field; the builder is the public no-arg method returning a class with setText(CharSequence) and build(). */
    private static CueShape shapeOf(Class<?> cls) {
        Object known = CUE_SHAPES.get(cls);
        if (known != null) return known == NO_SHAPE ? null : (CueShape) known;
        CueShape shape = null;
        try {
            Field text = null;
            int count = 0;
            for (Field f : cls.getDeclaredFields()) {
                if (!Modifier.isStatic(f.getModifiers()) && f.getType() == CharSequence.class) {
                    text = f;
                    count++;
                }
            }
            if (count == 1) {
                text.setAccessible(true);
                shape = new CueShape();
                shape.text = text;
                for (Method up : cls.getDeclaredMethods()) {
                    Class<?> b = up.getReturnType();
                    if (up.getParameterTypes().length != 0 || !Modifier.isPublic(up.getModifiers())
                            || Modifier.isStatic(up.getModifiers()) || b.isPrimitive() || b == cls || b == Object.class) continue;
                    Method set = null;
                    Method build = null;
                    for (Method m : b.getDeclaredMethods()) {
                        if (!Modifier.isPublic(m.getModifiers()) || Modifier.isStatic(m.getModifiers())) continue;
                        Class<?>[] p = m.getParameterTypes();
                        if (p.length == 1 && p[0] == CharSequence.class && m.getReturnType() == b) set = m;
                        if (p.length == 0 && m.getReturnType() == cls) build = m;
                    }
                    if (set != null && build != null) {
                        shape.buildUpon = up;
                        shape.setText = set;
                        shape.build = build;
                        break;
                    }
                }
            }
        } catch (Throwable ignored) {
            shape = null;
        }
        CUE_SHAPES.put(cls, shape == null ? NO_SHAPE : shape);
        return shape;
    }

    /** MPVLib.init() hook (before nativeInit): mpv's own SDH filter. */
    public static void onMpvInit(Object mpv) {
        try {
            Context app = app();
            if (mpv == null || (app != null && !SdhPrefs.isCleanEnabled(app))) return;
            java.lang.reflect.Method set = mpv.getClass().getMethod("setOptionString", String.class, String.class);
            Object code = set.invoke(mpv, "sub-filter-sdh", "yes");
            Log.i(TAG, "mpv sub-filter-sdh=yes -> " + code);
            // Run 4: "(sighs) Fine, go on." kept its "(sighs)" with the plain filter. The option exists in
            // the bundled libmpv of every supported build (strings: sub-filter / sdh-harder).
            Object harder = set.invoke(mpv, "sub-filter-sdh-harder", "yes");
            Log.i(TAG, "mpv sub-filter-sdh-harder=yes -> " + harder);
        } catch (Throwable error) {
            Log.w(TAG, "mpv option failed", error);
        }
    }

    // ---- helpers --------------------------------------------------------------------------

    private static List<T> tracks(List list) {
        List<T> out = new ArrayList<T>();
        for (Object item : new ArrayList<Object>(list)) {
            T t = item == null ? null : read(item);
            if (t != null) out.add(t);
        }
        return out;
    }

    private static Map<String, String> cfg() {
        Map<String, String> c = cfg;
        if (c == null) {
            c = new HashMap<String, String>();
            for (String part : config().split(";")) {
                int eq = part.indexOf('=');
                if (eq > 0) c.put(part.substring(0, eq), part.substring(eq + 1));
            }
            cfg = c;
        }
        return c;
    }

    private static String cfgValue(String key) {
        String v = cfg().get(key);
        return v == null || v.isEmpty() ? null : v;
    }

    private static Object get(Object track, String key) throws Exception {
        String name = cfgValue(key);
        if (name == null) return null;
        String slot = track.getClass().getName() + "#" + name;
        Field f;
        synchronized (FIELDS) {
            f = FIELDS.get(slot);
            if (f == null) {
                f = track.getClass().getDeclaredField(name);
                f.setAccessible(true);
                FIELDS.put(slot, f);
            }
        }
        return f.get(track);
    }

    /** Reads the fields the patch resolved; null when this object is not a track. */
    static T read(Object track) {
        try {
            if (cfgValue("type") == null) return null;
            Object type = get(track, "type");
            T t = new T();
            t.raw = track;
            t.text = "TEXT".equals(type instanceof Enum ? ((Enum<?>) type).name() : String.valueOf(type));
            t.id = (String) get(track, "id");
            t.label = (String) get(track, "label");
            t.lang = (String) get(track, "language");
            Object forced = get(track, "forced");
            t.forced = forced instanceof Boolean && ((Boolean) forced).booleanValue();
            Object uri = get(track, "uri");
            String url = uri == null ? null : uri.toString();
            t.url = url != null && url.toLowerCase(java.util.Locale.US).startsWith("http") ? url : null;
            return t;
        } catch (Throwable error) {
            return null;
        }
    }

    private static boolean avoidEnabled() {
        Context app = app();
        return app == null || SdhPrefs.isAvoidEnabled(app);
    }

    private static Context app() {
        try {
            Object app = Class.forName("android.app.ActivityThread").getMethod("currentApplication").invoke(null);
            return app instanceof Context ? (Context) app : null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static String download(String url) {
        HttpURLConnection connection = null;
        try {
            connection = (HttpURLConnection) new URL(url).openConnection();
            connection.setConnectTimeout(8000);
            connection.setReadTimeout(8000);
            connection.setRequestProperty("User-Agent", "Stremio");
            connection.setInstanceFollowRedirects(true);
            InputStream in = connection.getInputStream();
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buffer = new byte[8192];
            int read;
            int total = 0;
            while ((read = in.read(buffer)) != -1) {
                total += read;
                if (total > 300 * 1024) break;
                out.write(buffer, 0, read);
            }
            in.close();
            // BOM / UTF-16 aware like SdhAvoid; plain UTF-8 stays UTF-8.
            return out.size() == 0 ? null : SdhLabels.decodeSubtitleBytes(out.toByteArray());
        } catch (Throwable ignored) {
            return null;
        } finally {
            if (connection != null) connection.disconnect();
        }
    }
}
