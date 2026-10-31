package app.fblite.extension.hideads;

import android.app.Activity;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.ValueCallback;
import android.webkit.WebView;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

/**
 * Debug only (Morphe settings, Debug logging): writes down how Facebook Lite builds screens that carry ads, so
 * a rule that hides them can be written from facts. Nothing here changes the app.
 *
 * It logs three things, to morphe-debug.log:
 * - DECODE: every new place in the component tree the server fills in (the chain of container ids), so the
 *   container of Marketplace or any other screen shows up.
 * - PAGER: every list on screen (X.0zb, which holds the feed, Reels and other lists) with one line per item:
 *   flags, counts of the markers the existing rules use, and text. Items that carry a "Sponsored" label in any
 *   language, or match the feed rule, get a path to the label and a full field dump, with a few organic items
 *   for comparison.
 * - TREE and WEBVIEW: the view hierarchy of the front activity when it changes and what a web page holds,
 *   to tell whether a screen is native components or a web page.
 *
 * Names are for Facebook Lite 530.0.0.8.106.
 */
final class AdTrace {
    private static final String TAG = "ads";
    private static final long TREE_INTERVAL_MS = 1500;
    private static final long PAGER_INTERVAL_MS = 2500;
    private static final long WEB_INTERVAL_MS = 8000;
    private static final int MAX_ITEMS_PER_PAGER = 90;
    private static final int MAX_DEEP_SPONSORED = 8;
    private static final int MAX_DEEP_ORGANIC = 3;
    private static final int MAX_CHAINS = 400;

    private static final Set<String> SPONSORED_WORDS = new HashSet<>(Arrays.asList(
            "sponsored", "promoted", "advertisement", "ad", "được tài trợ", "quảng cáo", "স্পনসর্ড", "বিজ্ঞাপন", "प्रायोजित",
            "سپانسرڈ", "ممول", "إعلان ممول", "patrocinado", "patrocinada", "publicidad", "gesponsert", "sponsorisé",
            "sponsorizzato", "disponsori", "bersponsor", "iklan", "реклама", "ได้รับการสนับสนุน", "赞助", "贊助",
            "広告", "スポンサー", "광고", "sponsorlu", "reklam", "sponsrad", "gesponsord", "sponsoroitu"));

    private static boolean resolved;
    private static boolean failed;
    private static Class<?> component, container, textClass;
    private static Method childList;
    private static Field fId, fGroup, fHeight, fHidden, fParent, fA2X, fA2k, fFlag32, fRefs;

    private static final Set<String> CHAINS = new HashSet<>();
    private static final WeakHashMap<View, Long> PAGER_TIME = new WeakHashMap<>();
    private static final WeakHashMap<View, String> PAGER_SIGNATURE = new WeakHashMap<>();
    private static final Map<Class<?>, Method> TEXT_METHODS = new HashMap<>();
    private static final Method NO_METHOD = null;
    private static final Map<Object, Long> WEB_TIME = new WeakHashMap<>();
    private static int deepSponsored;
    private static int deepOrganic;
    private static long lastTree;
    private static String lastTreeText = "";
    private static int treeLogs;
    private static int webProbes;

    private AdTrace() {
    }

    // ------------------------------------------------------------------------------------ decode

    /** A container was just decoded. Logs each new chain of container ids once. */
    static void onDecode(Object node) {
        if (failed || disabled.contains("DECODE trace failed") || node == null || !AdLog.enabled()) return;
        try {
            resolve();
            StringBuilder chain = new StringBuilder();
            Object p = node;
            for (int depth = 0; p != null && depth < 12; depth++) {
                if (chain.length() > 0) chain.append(" < ");
                chain.append(label(p));
                p = fParent.get(p);
            }
            String key = chain.toString();
            if (fParent.get(node) == null) logImages(node);
            if (CHAINS.size() >= MAX_CHAINS || !CHAINS.add(key)) return;
            Stats stats = new Stats();
            scan(node, 0, stats);
            AdLog.log(TAG, "DECODE chain: " + key + " | " + stats.summary() + " | text: " + AdLog.cut(stats.text.toString(), 140));
            if (stats.sponsoredNode != null) {
                AdLog.log(TAG, "  DECODE sponsored label \"" + AdLog.cut(stats.sponsoredText, 40) + "\" path: " + path(stats.sponsoredNode));
            }
        } catch (Throwable t) {
            fail("DECODE trace failed", t);
        }
    }

    // ------------------------------------------------------------------------------------ pictures

    private static int imageLogs;
    private static final Set<String> IMAGE_SEEN = new HashSet<>();

    /**
     * Debug: a component tree that stands alone (no parent, as the screen of a story does) is searched for picture
     * addresses on Facebook's CDN, to learn where a story photo's address lives.
     */
    private static void logImages(Object root) {
        if (imageLogs > 60) return;
        List<String> urls = new ArrayList<>();
        findUrls(root, 0, new int[] {0}, "", urls);
        for (String u : urls) {
            if (imageLogs > 60 || !IMAGE_SEEN.add(u)) continue;
            imageLogs++;
            AdLog.log(TAG, "IMAGE in root " + root.getClass().getName() + " " + u);
        }
    }

    private static void findUrls(Object node, int depth, int[] count, String path, List<String> out) {
        if (node == null || depth > 30 || ++count[0] > 3000 || out.size() > 8) return;
        for (Class<?> c = node.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
            for (Field f : c.getDeclaredFields()) {
                if (Modifier.isStatic(f.getModifiers()) || f.getType().isPrimitive()) continue;
                try {
                    f.setAccessible(true);
                    Object v = f.get(node);
                    if (v instanceof CharSequence) {
                        String s = v.toString();
                        if (s.startsWith("http") && (s.contains("fbcdn") || s.contains("scontent"))) {
                            out.add(c.getSimpleName() + "." + f.getName() + " " + shortUrl(s));
                        }
                    }
                } catch (Throwable ignored) {
                }
            }
        }
        for (Object child : children(node)) findUrls(child, depth + 1, count, path, out);
    }

    /** Host, path tail and the picture-size part of a CDN address, without its signature. */
    private static String shortUrl(String url) {
        int q = url.indexOf('?');
        String base = q < 0 ? url : url.substring(0, q);
        if (base.length() > 90) base = base.substring(0, 30) + "…" + base.substring(base.length() - 56);
        java.util.regex.Matcher m = java.util.regex.Pattern.compile("[?&]stp=([^&]*)").matcher(url);
        return base + (m.find() ? " stp=" + m.group(1) : "") + " len=" + url.length();
    }

    // ------------------------------------------------------------------------------------ feed check

    private static final WeakHashMap<Object, Boolean> LABEL_CACHE = new WeakHashMap<>();
    private static final WeakHashMap<Object, Boolean> FEED_LOGGED = new WeakHashMap<>();
    private static int deepMissed;

    /**
     * Compares the feed rule with the "Sponsored" label: logs each post group the rule hides, and above all each
     * group that has a label in some language but is not hidden (a miss of the rule). Called before hiding.
     */
    static void checkFeed(List<?> posts, Set<Integer> hiddenGroups) {
        if (failed || disabled.contains("FEED check failed") || !AdLog.enabled()) return;
        try {
            resolve();
            Object[] snapshot = snapshot(posts);
            Map<Integer, Object> firstOfGroup = new HashMap<>();
            Set<Integer> labelled = new HashSet<>();
            for (Object child : snapshot) {
                int group = (Integer) fGroup.get(child);
                if (group == 0) continue;
                if (!firstOfGroup.containsKey(group)) firstOfGroup.put(group, child);
                Boolean has = LABEL_CACHE.get(child);
                if (has == null) {
                    Stats stats = new Stats();
                    scan(child, 0, stats);
                    has = stats.sponsoredNode != null;
                    LABEL_CACHE.put(child, has);
                }
                if (has) labelled.add(group);
            }
            for (Map.Entry<Integer, Object> entry : firstOfGroup.entrySet()) {
                int group = entry.getKey();
                boolean hidden = hiddenGroups != null && hiddenGroups.contains(group);
                boolean label = labelled.contains(group);
                if (!hidden && !label) continue;
                Object first = entry.getValue();
                if (FEED_LOGGED.put(first, Boolean.TRUE) != null) continue;
                String kind = hidden && label ? "HIDDEN (rule and label agree)"
                        : hidden ? "HIDDEN by rule, but no label found" : "MISSED: label found, rule did not match";
                AdLog.log(TAG, "FEED " + kind + " group=" + group + " " + describe(first));
                if (!hidden && deepMissed < 4) {
                    deepMissed++;
                    AdLog.log(TAG, "  DEEP missed group " + group + " (" + deepMissed + "/4)");
                    for (Object child : snapshot) {
                        if ((Integer) fGroup.get(child) == group) deep(child, 0, new int[] {0});
                    }
                }
            }
        } catch (Throwable t) {
            fail("FEED check failed", t);
        }
    }

    private static final WeakHashMap<Object, Boolean> LABELLED = new WeakHashMap<>();

    /** True when a text of the subtree is a sponsored label ("Sponsored", "Ad", ...). Cached per node. */
    static boolean hasSponsoredLabel(Object node) {
        Boolean cached = LABELLED.get(node);
        if (cached != null) return cached;
        boolean found = false;
        try {
            if (ensure()) {
                Stats stats = new Stats();
                scan(node, 0, stats);
                found = stats.sponsoredNode != null;
            }
        } catch (Throwable ignored) {
        }
        LABELLED.put(node, found);
        return found;
    }

    /** One line about a subtree: counts of the rule's markers and its text. */
    static String describe(Object node) {
        try {
            resolve();
            Stats stats = new Stats();
            scan(node, 0, stats);
            return node.getClass().getName() + " " + stats.summary() + " | text: " + AdLog.cut(stats.text.toString(), 120);
        } catch (Throwable t) {
            return node.getClass().getName() + " (could not describe)";
        }
    }

    // ------------------------------------------------------------------------------------ lists

    /** A list (X.0zb) is on screen. Dumps its items when they changed. */
    static void onPager(View pager) {
        if (failed || disabled.contains("PAGER trace failed") || !AdLog.enabled()) return;
        try {
            resolve();
            long now = SystemClock.uptimeMillis();
            Long last = PAGER_TIME.get(pager);
            if (last != null && now - last < PAGER_INTERVAL_MS) return;
            PAGER_TIME.put(pager, now);

            Object layout = field(pager, "A05");
            Object snap = field(pager, "A07");
            if (layout == null) return;
            Object itemList = field(layout, "A0E");
            if (!(itemList instanceof List)) return;
            Object[] items = snapshot((List<?>) itemList);
            StringBuilder signature = new StringBuilder().append(items.length);
            for (int i = 0; i < items.length && i < 12; i++) signature.append(':').append(field(items[i], "A0J"));
            String sig = signature.toString();
            if (sig.equals(PAGER_SIGNATURE.get(pager))) return;
            PAGER_SIGNATURE.put(pager, sig);

            int current = (Integer) field(layout, "A03");
            Object horizontal = pager.getClass().getMethod("AQS").invoke(pager);
            Object snapMode = snap == null ? null : field(snap, "A02");
            int[] where = new int[2];
            pager.getLocationOnScreen(where);
            AdLog.log(TAG, "PAGER " + chain(pager.getClass()) + " " + pager.getWidth() + "x" + pager.getHeight() + " at " + where[0] + "," + where[1]
                    + " horizontal=" + horizontal + " snapMode=" + snapMode + " items=" + items.length + " current=" + current
                    + " views: " + viewPath(pager));
            int shown = Math.min(items.length, MAX_ITEMS_PER_PAGER);
            for (int i = 0; i < shown; i++) {
                try {
                    describeItem(i, items[i], i == current);
                } catch (Throwable t) {
                    AdLog.log(TAG, "  [" + i + "] could not be described: " + t);
                }
            }
            if (items.length > shown) AdLog.log(TAG, "  … " + (items.length - shown) + " more items");
        } catch (Throwable t) {
            fail("PAGER trace failed", t);
        }
    }

    private static void describeItem(int index, Object item, boolean isCurrent) throws Exception {
        Object wrapper = field(item, "A0B");
        Object tree = wrapper == null ? null : field(wrapper, "A03");
        StringBuilder line = new StringBuilder("  ").append(isCurrent ? ">" : " ").append('[').append(index).append("] item id=")
                .append(field(item, "A0J")).append(" h=").append(field(item, "A01")).append(" snappable=").append(field(item, "A0N"));
        if (tree == null) {
            AdLog.log(TAG, line.append(" no tree").toString());
            return;
        }
        Stats stats = new Stats();
        scan(tree, 0, stats);
        boolean rule = matchesFeedRule(tree, 0);
        line.append(" tree=").append(tree.getClass().getName()).append(" ").append(stats.summary())
                .append(" feedRule=").append(rule)
                .append(" treeHeight=").append(component.isInstance(tree) ? fHeight.get(tree) : "?")
                .append(" treeHidden=").append(component.isInstance(tree) ? fHidden.get(tree) : "?")
                .append(" | text: ").append(AdLog.cut(stats.text.toString(), 110));
        AdLog.log(TAG, line.toString());

        boolean sponsored = stats.sponsoredNode != null || stats.flagged >= 2 || rule;
        if (stats.sponsoredNode != null) {
            AdLog.log(TAG, "    SPONSORED-TEXT \"" + AdLog.cut(stats.sponsoredText, 40) + "\" path: " + path(stats.sponsoredNode));
        }
        if (sponsored && deepSponsored < MAX_DEEP_SPONSORED) {
            deepSponsored++;
            AdLog.log(TAG, "    DEEP sponsored item [" + index + "] (" + deepSponsored + "/" + MAX_DEEP_SPONSORED + ")");
            deep(tree, 0, new int[] {0});
        } else if (!sponsored && deepOrganic < MAX_DEEP_ORGANIC && stats.nodes > 3) {
            deepOrganic++;
            AdLog.log(TAG, "    DEEP organic item [" + index + "] for comparison (" + deepOrganic + "/" + MAX_DEEP_ORGANIC + ")");
            deep(tree, 0, new int[] {0});
        }
    }

    /** The feed rule of SponsoredPosts applied to a subtree: a tappable header with references. */
    private static boolean matchesFeedRule(Object node, int depth) throws Exception {
        if (node == null || depth > 30) return false;
        if (container.isInstance(node) && component.isInstance(node)
                && (Integer) fGroup.get(node) != 0 && (Boolean) fA2X.get(node) && (Boolean) fA2k.get(node) && fRefs.get(node) != null) {
            return true;
        }
        for (Object child : children(node)) if (matchesFeedRule(child, depth + 1)) return true;
        return false;
    }

    // ------------------------------------------------------------------------------------ views and web pages

    /** Called while debug logging is on, for the front activity. Logs its view tree when it changes. */
    static void onTick(Activity activity) {
        if (!AdLog.enabled()) return;
        try {
            long now = SystemClock.uptimeMillis();
            if (now - lastTree < TREE_INTERVAL_MS) return;
            lastTree = now;
            StringBuilder tree = new StringBuilder();
            List<WebView> webs = new ArrayList<>();
            int[] count = new int[1];
            walk(activity.getWindow().getDecorView(), 0, tree, webs, count);
            String text = tree.toString();
            if (!text.equals(lastTreeText) && treeLogs < 80) {
                lastTreeText = text;
                treeLogs++;
                AdLog.log(TAG, "TREE " + activity.getClass().getName() + "\n" + text);
            }
            for (WebView web : webs) probeWeb(web, now);
        } catch (Throwable t) {
            fail("TREE trace failed", t);
        }
    }

    private static void walk(View view, int depth, StringBuilder out, List<WebView> webs, int[] count) {
        if (depth > 24 || count[0] > 220 || view.getVisibility() != View.VISIBLE) return;
        String chain = chain(view.getClass());
        boolean interesting = view instanceof WebView || chain.contains("RecyclerView") || chain.contains("X.0zb")
                || chain.contains("VideoView") || chain.contains("TextureView") || chain.contains("SurfaceView");
        // The app has few views (its screens are component trees), so all of them are listed, to find what a story or a
        // photo is made of.
        count[0]++;
        for (int i = 0; i < depth; i++) out.append(' ');
        out.append(chain).append(' ').append(view.getWidth()).append('x').append(view.getHeight()).append(interesting ? " *" : "").append('\n');
        if (view instanceof WebView) webs.add((WebView) view);
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) walk(group.getChildAt(i), depth + 1, out, webs, count);
        }
    }

    /** Reads (never changes) what a web page holds: its address and any "sponsored" labels with their ancestors. */
    private static void probeWeb(final WebView web, long now) {
        Long last = WEB_TIME.get(web);
        if ((last != null && now - last < WEB_INTERVAL_MS) || webProbes > 40) return;
        WEB_TIME.put(web, now);
        webProbes++;
        AdLog.log(TAG, "WEBVIEW " + web.getClass().getName() + " " + web.getWidth() + "x" + web.getHeight() + " url=" + AdLog.cut(web.getUrl(), 160));
        String js = "(function(){try{var out=[];var els=document.querySelectorAll('span,div,a,p,h3');"
                + "for(var i=0;i<els.length&&out.length<6;i++){var e=els[i];if(e.children.length===0){var t=(e.textContent||'').trim();"
                + "if(t.length>0&&t.length<30&&/sponsor|promoted|advert|tài trợ|স্পনসর্ড/i.test(t)){var p=[];var n=e;"
                + "for(var d=0;d<5&&n;d++){p.push(n.tagName+(typeof n.className==='string'&&n.className?'.'+n.className.split(' ').slice(0,3).join('.'):''));n=n.parentElement;}"
                + "out.push(t+' <- '+p.join(' < '));}}}"
                + "return JSON.stringify({title:document.title,href:location.href.substring(0,120),textLength:document.body?document.body.innerText.length:0,sponsored:out});"
                + "}catch(x){return 'js error '+x}})()";
        web.evaluateJavascript(js, new ValueCallback<String>() {
            @Override
            public void onReceiveValue(String value) {
                AdLog.log(TAG, "  WEBVIEW page: " + AdLog.cut(value, 900));
            }
        });
    }

    // ------------------------------------------------------------------------------------ component tree helpers

    private static final class Stats {
        int nodes;
        int flagged;
        int a2x;
        int a2k;
        int a0m;
        Object sponsoredNode;
        String sponsoredText;
        final StringBuilder text = new StringBuilder();

        String summary() {
            return "nodes=" + nodes + " flaggedText=" + flagged + " A2X=" + a2x + " A2k=" + a2k + " A0M=" + a0m
                    + " sponsoredLabel=" + (sponsoredNode != null);
        }
    }

    private static void scan(Object node, int depth, Stats stats) throws Exception {
        if (node == null || depth > 40 || stats.nodes > 4000) return;
        stats.nodes++;
        if (component.isInstance(node)) {
            if ((Boolean) fA2X.get(node)) stats.a2x++;
            if ((Boolean) fA2k.get(node)) stats.a2k++;
            if (textClass.isInstance(node) && (Boolean) fFlag32.get(node)) stats.flagged++;
        }
        if (container.isInstance(node) && fRefs.get(node) != null) stats.a0m++;
        String text = textOf(node);
        if (text != null && !text.isEmpty()) {
            if (stats.text.length() < 400) stats.text.append(text.replace('\n', ' ')).append(" | ");
            if (stats.sponsoredNode == null && isSponsoredWord(text)) {
                stats.sponsoredNode = node;
                stats.sponsoredText = text;
            }
        }
        for (Object child : children(node)) scan(child, depth + 1, stats);
    }

    private static final java.util.regex.Pattern MARKUP = java.util.regex.Pattern.compile("\\\\[\\s\\S]");
    private static final java.util.regex.Pattern CONTROL = java.util.regex.Pattern.compile("[\\x00-\\x1f]");

    /** Removes the app's style markup (a backslash and one character) and control characters from a text. */
    static String clean(String raw) {
        if (raw == null) return "";
        return CONTROL.matcher(MARKUP.matcher(raw).replaceAll("")).replaceAll("").trim();
    }

    /**
     * True for a label such as "Sponsored" (Home feed, Reels) or "Ad" (Marketplace). The text must be the label
     * alone, or the label followed by a dot and more ("Sponsored · Paid for by ..."); short words like "ad" match
     * only when they are the whole text, so "Ad hoc" does not.
     */
    static boolean isSponsoredWord(String text) {
        String t = clean(text).toLowerCase(Locale.ROOT);
        if (t.isEmpty() || t.length() > 40) return false;
        for (String word : SPONSORED_WORDS) {
            if (t.equals(word)) return true;
            if (word.length() >= 6 && (t.startsWith(word + "·") || t.startsWith(word + " ·"))) return true;
        }
        return false;
    }

    /** From a node up to the root: class, container id, group, height and the flags the rules use. */
    static String path(Object node) throws Exception {
        StringBuilder sb = new StringBuilder();
        Object p = node;
        for (int depth = 0; p != null && depth < 14; depth++) {
            if (sb.length() > 0) sb.append(" < ");
            sb.append(label(p));
            if (component.isInstance(p)) {
                sb.append("{g=").append(fGroup.get(p)).append(",h=").append(fHeight.get(p));
                if ((Boolean) fA2X.get(p)) sb.append(",A2X");
                if ((Boolean) fA2k.get(p)) sb.append(",A2k");
                if (container.isInstance(p) && fRefs.get(p) != null) sb.append(",A0M");
                sb.append('}');
            }
            p = component.isInstance(p) ? fParent.get(p) : null;
        }
        return sb.toString();
    }

    static String label(Object node) throws Exception {
        String name = node.getClass().getName();
        if (name.startsWith("X.")) name = name.substring(2);
        return name + "#" + (component.isInstance(node) ? fId.get(node) : "?");
    }

    /** Every non-default field of every node of a subtree, one line per node. */
    private static void deep(Object node, int depth, int[] lines) throws Exception {
        if (node == null || depth > 30 || lines[0] > 160) return;
        lines[0]++;
        StringBuilder sb = new StringBuilder();
        for (Class<?> c = node.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
            for (Field f : c.getDeclaredFields()) {
                if (Modifier.isStatic(f.getModifiers())) continue;
                f.setAccessible(true);
                Object v = f.get(node);
                if (v == null) continue;
                String s;
                if (v instanceof Boolean) {
                    if (!(Boolean) v) continue;
                    s = "T";
                } else if (v instanceof Number) {
                    double d = ((Number) v).doubleValue();
                    if (d == 0 || d == -1 || d == -128 || d == -32768 || d == -32767 || d == 2147483647) continue;
                    s = v.toString();
                } else if (v instanceof CharSequence) {
                    if (v.toString().isEmpty()) continue;
                    s = "\"" + AdLog.cut(v.toString(), 40) + "\"";
                } else if (v instanceof List) {
                    s = "L" + ((List<?>) v).size();
                } else if (v instanceof byte[]) {
                    s = "bytes" + ((byte[]) v).length;
                } else {
                    s = v.getClass().getName().replace("X.", "");
                }
                sb.append(c.getName().replace("X.", "")).append('.').append(f.getName()).append('=').append(s).append(' ');
            }
        }
        String text = textOf(node);
        StringBuilder pad = new StringBuilder();
        for (int i = 0; i < depth; i++) pad.append('.');
        AdLog.log(TAG, "      " + pad + node.getClass().getName() + (text == null ? "" : " TEXT=\"" + AdLog.cut(text, 50) + "\"") + " | " + sb);
        for (Object child : children(node)) deep(child, depth + 1, lines);
    }

    /**
     * A copy of a list made by index. The app changes its lists while it runs, so they are never iterated live,
     * and its own list class (X.0yV) does not support toArray.
     */
    static Object[] snapshot(List<?> list) {
        int n = list.size();
        List<Object> out = new ArrayList<>(n);
        for (int i = 0; i < n; i++) {
            try {
                out.add(list.get(i));
            } catch (Throwable t) {
                break;
            }
        }
        return out.toArray();
    }

    /** A copy of the node's children. */
    static Object[] children(Object node) {
        try {
            if (!childList.getDeclaringClass().isInstance(node)) return NONE;
            Object list = childList.invoke(node);
            return list instanceof List ? snapshot((List<?>) list) : NONE;
        } catch (Throwable t) {
            return NONE;
        }
    }

    /** Loads the app's classes and fields; false when this is not the build the names are for. */
    static boolean ensure() {
        try {
            resolve();
            return true;
        } catch (Throwable t) {
            return false;
        }
    }

    private static final Object[] NONE = new Object[0];

    /** The node's text (method AIW of text components), or null. */
    private static String textOf(Object node) {
        Class<?> c = node.getClass();
        Method m;
        if (TEXT_METHODS.containsKey(c)) {
            m = TEXT_METHODS.get(c);
        } else {
            try {
                m = c.getMethod("AIW");
            } catch (NoSuchMethodException e) {
                m = NO_METHOD;
            }
            TEXT_METHODS.put(c, m);
        }
        if (m == null) return null;
        try {
            Object s = m.invoke(node);
            return s == null ? null : s.toString();
        } catch (Throwable t) {
            return null;
        }
    }

    private static String chain(Class<?> c) {
        StringBuilder sb = new StringBuilder(c.getName());
        for (Class<?> s = c.getSuperclass(); s != null && !s.getName().startsWith("android.") && !s.getName().startsWith("java."); s = s.getSuperclass()) {
            sb.append('<').append(s.getName());
        }
        return sb.toString();
    }

    private static String viewPath(View view) {
        StringBuilder sb = new StringBuilder();
        Object p = view.getParent();
        for (int i = 0; i < 6 && p instanceof View; i++) {
            if (sb.length() > 0) sb.append(" < ");
            sb.append(p.getClass().getName());
            p = ((View) p).getParent();
        }
        return sb.toString();
    }

    private static Object field(Object target, String name) throws Exception {
        for (Class<?> c = target.getClass(); c != null; c = c.getSuperclass()) {
            try {
                Field f = c.getDeclaredField(name);
                f.setAccessible(true);
                return f.get(target);
            } catch (NoSuchFieldException ignored) {
                // Try the superclass.
            }
        }
        throw new NoSuchFieldException(name);
    }

    private static void resolve() throws Exception {
        if (resolved) return;
        ClassLoader app = AdTrace.class.getClassLoader();
        component = Class.forName("X.0gp", false, app);
        container = Class.forName("X.0gs", false, app);
        textClass = Class.forName("X.0hW", false, app);
        childList = Class.forName("X.0gn", false, app).getMethod("AF0");
        fId = declared(component, "A1b");
        fGroup = declared(component, "A0v");
        fHeight = declared(component, "A0i");
        fHidden = declared(component, "A2c");
        fParent = declared(component, "A18");
        fA2X = declared(component, "A2X");
        fA2k = declared(component, "A2k");
        fFlag32 = declared(component, "A32");
        fRefs = declared(container, "A0M");
        resolved = true;
    }

    private static Field declared(Class<?> c, String name) throws Exception {
        Field f = c.getDeclaredField(name);
        f.setAccessible(true);
        return f;
    }

    private static final Map<String, Integer> FAILURES = new HashMap<>();

    /**
     * A list changing under the trace is normal and only skipped. Any other error counts against its feature,
     * which is switched off after three, so one broken part does not silence the rest.
     */
    private static void fail(String message, Throwable t) {
        if (t instanceof java.util.ConcurrentModificationException) {
            AdLog.log(TAG, message + ": the list changed while it was read, skipped");
            return;
        }
        int n = FAILURES.containsKey(message) ? FAILURES.get(message) + 1 : 1;
        FAILURES.put(message, n);
        AdLog.log(TAG, message + " (" + n + "/3)", t);
        if (n >= 3) disabled.add(message);
    }

    private static final Set<String> disabled = new HashSet<>();
}
