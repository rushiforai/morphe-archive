package patches.podimo;

import android.util.Log;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Restructures Podimo's Android Auto browse tree around podcast series, and
 * opens the tree to every car client. The app's own loaders build everything:
 * a series folder carries the podcast UUID as its media id, so opening it runs
 * the app's paginated episode query; playback, queueing and entitlement keep
 * running through unmodified Podimo code paths.
 *
 * <p>Every lookup reflects over the app's minified names that the patch bundle
 * pins before installing, and every failure falls back to the app's original
 * behaviour instead of breaking browsing.
 */
public final class CarBrowse {
    private static final String TAG = "NlPodimoCar";

    /** The Android Auto client Podimo maps its full browse tree to. */
    private static final String GEARHEAD = "com.google.android.projection.gearhead";

    /** App classes reached through reflection; pinned by the patch's ABI checks. */
    private static final String NODE = "c00.b";
    private static final String NODE_VALUE = "c00.e";
    private static final String FOLDER = "c00.f";
    private static final String PLAYABLE = "c00.g";
    private static final String SORTING = "c00.c";
    private static final String EPISODE = "com.podimo.dto.AudioPlayerEpisodeItem";

    private static final Map<String, Field> FIELDS = new HashMap<String, Field>();
    private static final Map<String, Method> METHODS = new HashMap<String, Method>();

    private CarBrowse() {
    }

    // ---------------------------------------------------------------------
    // Allow-all caller gate: hs.c.a(uid, pkg). Every car client gets the full
    // section tree instead of Podimo's certificate-pinned package map.
    // ---------------------------------------------------------------------

    /**
     * The browse tree for any caller: its own mapped tree when the app has one
     * (Podimo itself keeps its queue tree), otherwise the Android Auto section
     * tree, and only when that is unavailable the app's queue-tree fallback.
     */
    public static Object treeFor(Object gate, String pkg) {
        try {
            Object tree = treeMap(gate).get(pkg);
            if (tree != null) {
                return tree;
            }
            tree = treeMap(gate).get(GEARHEAD);
            if (tree != null) {
                return tree;
            }
        } catch (Throwable t) {
            Log.e(TAG, "caller gate failed; falling back to the app tree", t);
        }
        try {
            return field(gate, "b");
        } catch (Throwable t) {
            Log.e(TAG, "caller fallback failed", t);
            return null;
        }
    }

    // ---------------------------------------------------------------------
    // For-you regroup: zz/a's mapped result. Episode sections become grids of
    // series folders; opening a folder loads the show's episodes.
    // ---------------------------------------------------------------------

    /**
     * One grid entry per podcast series across both episode sections, or the
     * original layout untouched whenever the shape is not the for-you list.
     */
    public static Object filter(Object result) {
        try {
            if (!(result instanceof List)) {
                return result;
            }
            List<?> sections = (List<?>) result;
            if (sections.size() != 3 || !isForYouList(sections)) {
                return result;
            }
            Map<String, Boolean> carried = new LinkedHashMap<String, Boolean>();
            Object second = withSeriesGrid(sections.get(1), carried);
            Object third = withSeriesGrid(sections.get(2), carried);
            if (second == sections.get(1) && third == sections.get(2)) {
                return result;
            }
            List<Object> out = new ArrayList<Object>(3);
            out.add(sections.get(0));
            out.add(second);
            out.add(third);
            Log.i(TAG, "For-you: " + carried.size() + " podcast series in the Android Auto grids");
            return out;
        } catch (Throwable t) {
            Log.e(TAG, "for-you regroup failed; keeping the app layout", t);
            return result;
        }
    }

    // ---------------------------------------------------------------------
    // Root tabs: is/k's online root. The library tab disappears for guests
    // with nothing saved locally; registered listeners always keep it.
    // ---------------------------------------------------------------------

    /**
     * The browse tabs without an empty library: guests without any saved or
     * followed content see the remaining tabs instead of an empty section.
     */
    public static ArrayList rootTabs(Object tree, ArrayList tabs) {
        try {
            if (tabs == null || tabs.size() != 3) {
                return tabs; // The offline root keeps its single library tab.
            }
            if (!"secondTab".equals(mediaId(tabs.get(1)))) {
                return tabs;
            }
            if (libraryHasContent(tree) || isRegistered(tree)) {
                return tabs;
            }
            ArrayList<Object> out = new ArrayList<Object>(2);
            out.add(tabs.get(0));
            out.add(tabs.get(2));
            Log.i(TAG, "Hiding the empty Android Auto library tab");
            return out;
        } catch (Throwable t) {
            Log.e(TAG, "library tab check failed; keeping the tab", t);
            return tabs;
        }
    }

    /** The for-you list arrives as three sections carrying the app's empty placeholder value. */
    private static boolean isForYouList(List<?> sections) throws Exception {
        for (Object section : sections) {
            Object value = nodeValue(section);
            if (value == null || !FOLDER.equals(value.getClass().getName())) {
                return false;
            }
            String id = (String) invoke(value, "getId");
            String title = (String) invoke(value, "getTitle");
            if (id == null || id.length() != 0 || title == null || title.length() != 0) {
                return false;
            }
        }
        return true;
    }

    /** One section whose episode children become a grid of series folders. */
    private static Object withSeriesGrid(Object section, Map<String, Boolean> carried) throws Exception {
        List<?> children = (List<?>) field(section, "b");
        List<Object> folders = new ArrayList<Object>();
        List<Object> rest = new ArrayList<Object>();
        for (Object child : children) {
            Object folder = seriesFolder(child, carried);
            if (folder != null) {
                folders.add(folder);
            } else {
                rest.add(child);
            }
        }
        if (folders.isEmpty()) {
            return section; // Keep the app layout for this section.
        }
        List<Object> merged = new ArrayList<Object>(folders.size() + rest.size());
        merged.addAll(folders);
        merged.addAll(rest);
        return withChildren(section, merged);
    }

    /**
     * A browsable series folder for one episode row: the podcast UUID becomes
     * the media id, so opening it loads the show's episodes through the app's
     * own paginated query. Non-episode rows return null and keep their place.
     */
    private static Object seriesFolder(Object row, Map<String, Boolean> carried) throws Exception {
        Object value = nodeValue(row);
        if (value == null || !PLAYABLE.equals(value.getClass().getName())) {
            return null;
        }
        Object item = invoke(value, "g");
        if (item == null || !EPISODE.equals(item.getClass().getName())) {
            return null;
        }
        String podcastId = (String) invoke(item, "getPodcastId");
        String podcastName = (String) invoke(item, "getPodcastName");
        if (podcastId == null || podcastId.length() == 0 || podcastName == null || podcastName.length() == 0) {
            return null;
        }
        if (carried.containsKey(podcastId)) {
            return null; // One folder per series across both sections.
        }
        carried.put(podcastId, Boolean.TRUE);
        Object cover = orEmpty(invoke(item, "getImageUrl"));
        Object artist = orEmpty(invoke(item, "getArtist"));
        Object newestFirst = enumConstant(SORTING, "b"); // DESCENDING
        return Class.forName(FOLDER).getConstructor(
                String.class, String.class, String.class, String.class, String.class,
                boolean.class, Class.forName(SORTING), int.class)
                .newInstance(podcastId, podcastName, podcastId, cover, artist, true, newestFirst, 4);
    }

    /** True when any local library list holds content. */
    private static boolean libraryHasContent(Object tree) throws Exception {
        List<?> sections = (List<?>) field(tree, "d");
        Object data = null;
        for (Object section : sections) {
            data = field(section, "a"); // d00.c.a: the shared tree data source
            break;
        }
        if (data == null) {
            return true; // Unknown state keeps the tab.
        }
        Object snapshot = invoke(data, "f"); // c00.a: the local library lists
        if (snapshot != null) {
            for (char name : new char[] {'a', 'b', 'c', 'd', 'e'}) {
                List<?> list = (List<?>) field(snapshot, String.valueOf(name));
                if (list != null && !list.isEmpty()) {
                    return true;
                }
            }
        }
        return false;
    }

    /** True for registered listeners; guests browse without a profile. */
    private static boolean isRegistered(Object tree) throws Exception {
        Object validator = field(field(tree, "f"), "a"); // is.l.a: the access validator
        Object session = field(validator, "b"); // ks.w.b: the session store
        Object profile = invoke(session, "i");
        if (profile == null) {
            return false;
        }
        return ((Boolean) field(profile, "c")).booleanValue(); // lr0.b0.c: isRegistered
    }

    /** The section's children replaced, its value kept. */
    private static Object withChildren(Object section, List<Object> children) throws Exception {
        Class<?> nodeClass = Class.forName(NODE);
        Method copy = nodeClass.getMethod(
                "a", nodeClass, Class.forName(NODE_VALUE), List.class, int.class);
        return copy.invoke(null, section, null, children, 1);
    }

    // ---------------------------------------------------------------------
    // Reflection helpers. Names are pinned by the patch bundle's ABI checks.
    // ---------------------------------------------------------------------

    private static Object nodeValue(Object node) throws Exception {
        return field(node, "a");
    }

    private static String mediaId(Object mediaItem) throws Exception {
        return (String) field(mediaItem, "a");
    }

    private static Map<?, ?> treeMap(Object gate) throws Exception {
        return (Map<?, ?>) field(gate, "a");
    }

    private static Object orEmpty(Object value) {
        return value != null ? value : "";
    }

    private static Object enumConstant(String className, String field) throws Exception {
        return Class.forName(className).getField(field).get(null);
    }

    private static synchronized Object field(Object target, String name) throws Exception {
        Class<?> cls = target.getClass();
        String key = cls.getName() + '#' + name;
        Field found = FIELDS.get(key);
        if (found == null) {
            try {
                found = cls.getField(name);
            } catch (NoSuchFieldException noPublic) {
                found = cls.getDeclaredField(name);
                found.setAccessible(true);
            }
            FIELDS.put(key, found);
        }
        return found.get(target);
    }

    private static synchronized Object invoke(Object target, String name) throws Exception {
        Class<?> cls = target.getClass();
        String key = cls.getName() + '#' + name + "()";
        Method found = METHODS.get(key);
        if (found == null) {
            found = cls.getMethod(name);
            METHODS.put(key, found);
        }
        return found.invoke(target);
    }
}
