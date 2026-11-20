package app.template.extension.wemuslim;

import android.util.Log;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

/**
 * Removes the promotion shortcuts from the Home/Prayer shortcut grid. The grid receives a list of
 * DiscoverResourceUiModelWithFolder(folderResource, resourceList): a single shortcut is
 * (null, [item]) and a folder is (folder, [children]). The app's classes are reached by reflection
 * (their names are kept in the release build); if anything about them is unexpected, the original
 * list is returned unchanged.
 */
public final class ShortcutFilter {

    private static final String TAG = "Morphe-WeMuslim";

    private ShortcutFilter() {
    }

    /** Called at the start of HomeStreamListView.setDiscoverData(List). */
    @SuppressWarnings({"rawtypes", "unchecked"})
    public static List filterDiscover(List entries) {
        if (entries == null || entries.isEmpty()) return entries;
        try {
            List out = new ArrayList(entries.size());
            boolean changed = false;
            for (int i = 0; i < entries.size(); i++) {
                Object entry = entries.get(i);
                Object kept = entry == null ? null : filterEntry(entry, i);
                if (kept != entry) changed = true;
                if (kept != null) out.add(kept);
            }
            return changed ? out : entries;
        } catch (Throwable t) {
            Log.w(TAG, "shortcut filter skipped: " + t);
            return entries;
        }
    }

    /** The entry itself, a rebuilt entry, or null when nothing of it is left. */
    @SuppressWarnings({"rawtypes", "unchecked"})
    private static Object filterEntry(Object entry, int index) throws Exception {
        Class<?> type = entry.getClass();
        Method getFolder = type.getMethod("getFolderResource");
        Object folder = getFolder.invoke(entry);
        List children = (List) type.getMethod("getResourceList").invoke(entry);
        if (folder != null && check(folder, index, "folder")) return null;
        if (children == null) return entry;

        List kept = new ArrayList(children.size());
        for (Object child : children) {
            if (child == null || !check(child, index, "item")) kept.add(child);
        }
        if (kept.size() == children.size()) return entry;
        if (kept.isEmpty()) return null;
        // The app shows a folder with one child as that child on its own; do the same.
        Object newFolder = kept.size() == 1 ? null : folder;
        Constructor<?> constructor = type.getConstructor(getFolder.getReturnType(), List.class);
        return constructor.newInstance(newFolder, kept);
    }

    /** Logs one grid resource and answers whether it is a promotion. */
    private static boolean check(Object resource, int index, String kind) throws Exception {
        Class<?> type = resource.getClass();
        String link = (String) type.getMethod("getJumpUrl").invoke(resource);
        boolean drop = ShortcutLinks.isPromotion(link);
        Log.d(TAG, "shortcut " + index + " " + kind
                + " type=" + type.getMethod("getType").invoke(resource)
                + " id=" + type.getMethod("getId").invoke(resource)
                + " link=" + ShortcutLinks.describe(link)
                + (drop ? " drop" : " keep"));
        return drop;
    }
}
