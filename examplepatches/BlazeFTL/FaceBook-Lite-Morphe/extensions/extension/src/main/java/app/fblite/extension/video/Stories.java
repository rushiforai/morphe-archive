package app.fblite.extension.video;

import android.app.Activity;
import android.os.SystemClock;
import android.view.InputDevice;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Set;

import app.fblite.extension.settings.MorpheLog;

/**
 * The story viewer. A story screen is recognised by its progress bar (com.facebook.lite.widget.ProgressBarView, a
 * thin view at the top that Reels and the feed do not have), or by its two full-height tap zones (40% and 60% of the
 * width) when the bar view is absent (no story in the 2026-10-27 17:2x log had one). Under it sits the header: the owner's name and a
 * second line (the age, or "Sponsored" on an ad), drawn by small app views. Their texts are read by value from
 * the views and the objects they hold, so no obfuscated field name is pinned. Used for the file name of a
 * downloaded story and for skipping sponsored stories.
 *
 * With Debug logging on, every header view and what was read from it is logged once per change (tag "story").
 */
final class Stories {
    private static final String PROGRESS_BAR = "com.facebook.lite.widget.ProgressBarView";
    private static final long SKIP_COOLDOWN_MS = 1000;
    private static final int MAX_NODES = 250;
    private static final int MAX_DEPTH = 3;
    private static final int MAX_LEAVES = 40;
    private static final Set<String> SPONSORED = new HashSet<>(Arrays.asList(
            "sponsored", "promoted", "advertisement", "ad", "được tài trợ", "quảng cáo", "স্পনসর্ড", "বিজ্ঞাপন", "प्रायोजित",
            "سپانسرڈ", "ممول", "إعلان ممول", "patrocinado", "patrocinada", "publicidad", "gesponsert", "sponsorisé",
            "sponsorizzato", "disponsori", "bersponsor", "iklan", "реклама", "ได้รับการสนับสนุน", "赞助", "贊助",
            "広告", "スポンサー", "광고", "sponsorlu", "reklam", "sponsrad", "gesponsord", "sponsoroitu"));

    private static long lastSkip;
    /** When the sponsored header was first seen on the current story, for the log; 0 when it is not on screen. */
    private static long sponsoredSince;
    private static String lastLogged = "";

    private Stories() {
    }

    /** What the header of the story on screen says. */
    static final class Header {
        /** The page or person that posted, or null when it could not be read. */
        final String owner;
        /** True when a header text is the sponsored label. */
        final boolean sponsored;

        Header(String owner, boolean sponsored) {
            this.owner = owner;
            this.sponsored = sponsored;
        }
    }

    private static final class Leaf {
        final View view;
        final int left;
        final int top;
        List<Text> texts = new ArrayList<>();

        Leaf(View view, int left, int top) {
            this.view = view;
            this.left = left;
            this.top = top;
        }
    }

    private static final class Text {
        final String path;
        /** How far from the view the text was found; texts of text components come first at the same depth. */
        final int depth;
        final boolean component;
        final String value;

        Text(String path, int depth, boolean component, String value) {
            this.path = path;
            this.depth = depth;
            this.component = component;
            this.value = value;
        }
    }

    /** The story header on screen, or null when this is not a story screen. Never throws. */
    static Header read(Activity activity) {
        try {
            View root = activity.getWindow().getDecorView();
            int screenHeight = root.getHeight();
            if (screenHeight <= 0) return null;
            int screenWidth = root.getWidth();
            int[] bar = new int[] {Integer.MAX_VALUE, -1};
            boolean[] zones = new boolean[2];
            List<Leaf> leaves = new ArrayList<>();
            walk(root, screenWidth, screenHeight, bar, zones, leaves, 0);
            boolean hasBar = bar[1] >= 0;
            if (!hasBar && !(zones[0] && zones[1])) return null;

            int bandTop = hasBar ? bar[0] - 4 : 0;
            int bandBottom = hasBar ? bar[0] + Math.max(Math.round(screenHeight * 0.12f), 200)
                    : Math.max(Math.round(screenHeight * 0.2f), 400);
            List<Leaf> header = new ArrayList<>();
            for (Leaf leaf : leaves) if (leaf.top >= bandTop && leaf.top <= bandBottom) header.add(leaf);
            Collections.sort(header, new Comparator<Leaf>() {
                @Override
                public int compare(Leaf a, Leaf b) {
                    return a.top != b.top ? Integer.compare(a.top, b.top) : Integer.compare(a.left, b.left);
                }
            });

            String owner = null;
            boolean sponsored = false;
            StringBuilder log = MorpheLog.enabled() ? new StringBuilder() : null;
            for (Leaf leaf : header) {
                leaf.texts = textsOf(leaf.view);
                Collections.sort(leaf.texts, new Comparator<Text>() {
                    @Override
                    public int compare(Text a, Text b) {
                        if (a.depth != b.depth) return Integer.compare(a.depth, b.depth);
                        return a.component == b.component ? 0 : a.component ? -1 : 1;
                    }
                });
                for (Text text : leaf.texts) if (isSponsoredWord(text.value)) sponsored = true;
                if (owner == null) {
                    for (Text text : leaf.texts) {
                        if (trusted(text) && FeedItems.isNameLike(text.value) && !isSponsoredWord(text.value)) {
                            owner = text.value;
                            break;
                        }
                    }
                }
                if (log != null) {
                    log.append("\n  ").append(leaf.view.getClass().getName()).append(' ').append(leaf.view.getWidth()).append('x')
                            .append(leaf.view.getHeight()).append(" at ").append(leaf.left).append(',').append(leaf.top);
                    int shown = 0;
                    for (Text text : leaf.texts) {
                        if (shown++ >= 6) break;
                        log.append("\n     ").append(text.component ? "text " : "field ").append(text.path).append(" = \"")
                                .append(text.value.length() > 60 ? text.value.substring(0, 60) + "…" : text.value).append('"');
                    }
                }
            }
            if (log != null) {
                String line = "owner=" + owner + " sponsored=" + sponsored + " via=" + (hasBar ? "bar" : "tap zones")
                        + " header views=" + header.size() + log;
                if (!line.equals(lastLogged)) {
                    lastLogged = line;
                    MorpheLog.log("story", "Header: " + line);
                }
            }
            if (!sponsored) sponsoredSince = 0;
            else if (sponsoredSince == 0) sponsoredSince = SystemClock.uptimeMillis();
            return new Header(owner, sponsored);
        } catch (Throwable t) {
            VideoFeatures.log("Story header failed", t);
            return null;
        }
    }

    /** The owner of the story on screen for a file name, or null. */
    static String owner(Activity activity) {
        Header header = read(activity);
        return header == null ? null : header.owner;
    }

    /**
     * True when the video's tracking text marks it as an ad: an ad's JSON starts {"adid":"...", an organic video's
     * does not carry the key (found in the 2026-10-23 logs). Language independent.
     */
    static boolean isAdVideo(View video) {
        try {
            Class<?> videoView = VideoFeatures.videoViewClass();
            Object props = VideoFeatures.field(video, videoView, "A0F");
            Object json = props == null ? null : ObjectScan.field(props, "A0a");
            return json instanceof String && ((String) json).startsWith("{\"adid\"");
        } catch (Throwable t) {
            return false;
        }
    }

    /**
     * Moves the viewer on from a sponsored story with a tap on its "next" arrow (a round arrow on the right edge,
     * mid-height), or on the right edge when no arrow view is found. At most once every 1.5 seconds.
     */
    static void skip(Activity activity) {
        long now = SystemClock.uptimeMillis();
        if (now - lastSkip < SKIP_COOLDOWN_MS) return;
        lastSkip = now;
        try {
            final View root = activity.getWindow().getDecorView();
            int width = root.getWidth();
            int height = root.getHeight();
            if (width <= 0 || height <= 0) return;
            int[] target = nextArrow(root, width, height, new int[] {Math.round(width * 0.9f), Math.round(height * 0.5f)}, 0);
            MorpheLog.log("story", "Sponsored story: tapping next at " + target[0] + "," + target[1]
                    + (sponsoredSince == 0 ? "" : " (header on screen for " + (now - sponsoredSince) + " ms)"));
            tap(root, target[0], target[1]);
        } catch (Throwable t) {
            VideoFeatures.log("Skipping a sponsored story failed", t);
        }
    }

    private static int[] nextArrow(View view, int width, int height, int[] best, int depth) {
        if (view.getVisibility() != View.VISIBLE || depth > 40) return best;
        int[] location = new int[2];
        view.getLocationInWindow(location);
        int w = view.getWidth();
        int h = view.getHeight();
        boolean sized = w >= width * 0.04f && w <= width * 0.1f && h >= width * 0.04f && h <= width * 0.1f;
        boolean right = location[0] >= width * 0.85f;
        boolean middle = location[1] + h / 2 >= height * 0.35f && location[1] + h / 2 <= height * 0.65f;
        if (sized && right && middle) return new int[] {location[0] + w / 2, location[1] + h / 2};
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                int[] found = nextArrow(group.getChildAt(i), width, height, null, depth + 1);
                if (found != null) return found;
            }
        }
        return best;
    }

    private static void tap(final View root, float x, float y) {
        long down = SystemClock.uptimeMillis();
        MotionEvent press = MotionEvent.obtain(down, down, MotionEvent.ACTION_DOWN, x, y, 0);
        press.setSource(InputDevice.SOURCE_TOUCHSCREEN);
        root.dispatchTouchEvent(press);
        press.recycle();
        final float fx = x;
        final float fy = y;
        VideoFeatures.MAIN.postDelayed(new Runnable() {
            @Override
            public void run() {
                long up = SystemClock.uptimeMillis();
                MotionEvent release = MotionEvent.obtain(down, up, MotionEvent.ACTION_UP, fx, fy, 0);
                release.setSource(InputDevice.SOURCE_TOUCHSCREEN);
                root.dispatchTouchEvent(release);
                release.recycle();
            }
        }, 60);
    }

    // ------------------------------------------------------------------------------------ reading

    private static void walk(View view, int screenWidth, int screenHeight, int[] bar, boolean[] zones, List<Leaf> leaves, int depth) {
        if (view.getVisibility() != View.VISIBLE || depth > 40) return;
        int[] location = new int[2];
        view.getLocationInWindow(location);
        if (view.getHeight() >= screenHeight * 0.8f) {
            int w = view.getWidth();
            float tolerance = screenWidth * 0.02f;
            if (Math.abs(w - screenWidth * 0.4f) <= tolerance) zones[0] = true;
            else if (Math.abs(w - screenWidth * 0.6f) <= tolerance) zones[1] = true;
        }
        if (view.getClass().getName().equals(PROGRESS_BAR)) {
            if (view.getHeight() <= 16 && location[1] < screenHeight * 0.25f && location[1] < bar[0]) {
                bar[0] = location[1];
                bar[1] = location[1] + view.getHeight();
            }
            return;
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) walk(group.getChildAt(i), screenWidth, screenHeight, bar, zones, leaves, depth + 1);
            return;
        }
        if (view instanceof ImageView || view.getWidth() < 30 || view.getHeight() < 30 || leaves.size() >= MAX_LEAVES) return;
        leaves.add(new Leaf(view, location[0], location[1]));
    }

    /**
     * Texts of one view: a TextView's text, texts of text components the view holds (method AIW) and plain string
     * fields of the view and the app objects below it. Component parents are not followed, or the whole screen's
     * texts would be reached.
     */
    private static List<Text> textsOf(View view) {
        List<Text> out = new ArrayList<>();
        if (view instanceof TextView) {
            add(out, "text", 0, false, ((TextView) view).getText());
        }
        IdentityHashMap<Object, Boolean> seen = new IdentityHashMap<>();
        ArrayDeque<Object[]> queue = new ArrayDeque<>();
        seen.put(view, Boolean.TRUE);
        queue.add(new Object[] {view, 0, "view"});
        int nodes = 0;
        while (!queue.isEmpty() && nodes < MAX_NODES) {
            Object[] entry = queue.poll();
            Object node = entry[0];
            int depth = (Integer) entry[1];
            String path = (String) entry[2];
            nodes++;
            String component = FeedItems.textOf(node);
            if (component != null) out.add(new Text(path, depth, true, component));
            for (Class<?> c = node.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
                String className = c.getName();
                if (className.startsWith("android.") || className.startsWith("java.") || className.startsWith("androidx.")) break;
                Field[] fields;
                try {
                    fields = c.getDeclaredFields();
                } catch (Throwable t) {
                    continue;
                }
                for (Field f : fields) {
                    // A18 is the parent link of the app's components.
                    if (Modifier.isStatic(f.getModifiers()) || f.getType().isPrimitive() || f.getName().equals("A18")) continue;
                    Object value;
                    try {
                        f.setAccessible(true);
                        value = f.get(node);
                    } catch (Throwable t) {
                        continue;
                    }
                    if (value == null) continue;
                    String childPath = path + "." + f.getName();
                    if (value instanceof CharSequence) {
                        add(out, childPath, depth + 1, false, (CharSequence) value);
                    } else if (value instanceof char[]) {
                        char[] chars = (char[]) value;
                        if (chars.length >= 2 && chars.length <= 80) add(out, childPath, depth + 1, false, new String(chars));
                    } else if (depth < MAX_DEPTH && ObjectScan.isAppObject(value) && seen.put(value, Boolean.TRUE) == null) {
                        queue.add(new Object[] {value, depth + 1, childPath});
                    }
                }
            }
        }
        return out;
    }

    private static void add(List<Text> out, String path, int depth, boolean component, CharSequence value) {
        if (value == null) return;
        String text = FeedItems.clean(value.toString());
        if (text.length() < 2 || text.length() > 80) return;
        out.add(new Text(path, depth, component, text));
    }

    /**
     * A name read from a text component is trusted. A plain string field is trusted only when it looks like a
     * name and not like a resource, class, font or address, which app objects also hold.
     */
    private static boolean trusted(Text text) {
        if (text.component || text.path.equals("text")) return true;
        String s = text.value;
        if (s.length() < 3 || s.indexOf('/') >= 0 || s.indexOf('_') >= 0 || s.indexOf(':') >= 0 || s.indexOf('.') >= 0 && s.indexOf(' ') < 0) return false;
        return !s.startsWith("{") && !s.startsWith("[");
    }

    static boolean isSponsoredWord(String text) {
        String t = text == null ? "" : text.trim().toLowerCase(Locale.ROOT);
        if (t.isEmpty() || t.length() > 40) return false;
        for (String word : SPONSORED) {
            if (t.equals(word)) return true;
            if (word.length() >= 6 && (t.startsWith(word + "·") || t.startsWith(word + " ·"))) return true;
        }
        return false;
    }
}
