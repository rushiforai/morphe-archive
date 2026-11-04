package app.linkedin.extension;


import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

@SuppressWarnings("unused")
public final class HideAdsPatch {
    private static final String TAG = "LinkedInPatches";

    private static volatile Method copyWithNewElements;

    /**
     * Replaces collectionTemplate.copyWithNewElements(list) in the main feed's model filter.
     */
    public static Object copyWithoutSponsored(Object collectionTemplate, List<Object> updates) throws Exception {
        Method copy = copyWithNewElements;
        if (copy == null) {
            copy = collectionTemplate.getClass().getMethod("copyWithNewElements", List.class);
            copyWithNewElements = copy;
        }
        try {
            return copy.invoke(collectionTemplate, filterSponsored(updates));
        } catch (InvocationTargetException e) {
            // Keep the original call's exception behavior.
            Throwable cause = e.getCause();
            if (cause instanceof Exception) throw (Exception) cause;
            throw e;
        }
    }

    /**
     * A feed Update is an ad when update.metadata.trackingData.sponsoredTracking is set.
     */
    static List<Object> filterSponsored(List<Object> updates) {
        if (updates == null || updates.isEmpty() || !Settings.hideAds()) return updates;
        try {
            List<Object> result = new ArrayList<>(updates.size());
            for (Object update : updates) {
                if (!isSponsored(update)) result.add(update);
            }
            Settings.debugLog("legacy feed: removed " + (updates.size() - result.size()) + " of " + updates.size());
            return result;
        } catch (Throwable t) {
            Diagnostics.error("filterSponsored failed", t);
            return updates;
        }
    }

    private static boolean isSponsored(Object update) {
        Object metadata = Reflect.get(update, "metadata");
        Object trackingData = Reflect.get(metadata, "trackingData");
        return Reflect.get(trackingData, "sponsoredTracking") != null;
    }
}
