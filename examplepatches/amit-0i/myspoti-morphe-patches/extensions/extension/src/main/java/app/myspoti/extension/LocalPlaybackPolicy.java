package app.myspoti.extension;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.Set;

/**
 * Local-first selection for the host app's downloaded-track playback plan.
 *
 * MySpoti passes its `isDownloaded` function to LocalPlayPlan.localIds. The
 * function's interface is obfuscated in release APKs, so this adapter invokes
 * its stable Kotlin Function1 bridge (`invoke(Object)`) reflectively.
 */
public final class LocalPlaybackPolicy {
    private LocalPlaybackPolicy() { }

    /**
     * Returns the selected list's downloaded tracks in order when the picked
     * track exists locally; otherwise returns null so MySpoti keeps its normal
     * online playback path.
     *
     * The remaining parameters intentionally remain in the signature to match
     * LocalPlayPlan.localIds in MySpoti 2.3.0. Local playback is now independent
     * of connection state and whether the entire playlist has been downloaded.
     */
    public static ArrayList<String> localIds(
            ArrayList<?> ordered,
            String picked,
            boolean complete,
            boolean offline,
            boolean dataSaver,
            Object isDownloaded
    ) {
        if (ordered == null || isBlank(picked) || isDownloaded == null) {
            return null;
        }

        try {
            Method invoke = isDownloaded.getClass().getMethod("invoke", Object.class);
            invoke.setAccessible(true);
            if (!Boolean.TRUE.equals(invoke.invoke(isDownloaded, picked))) return null;

            Set<String> unique = new LinkedHashSet<>();
            for (Object value : ordered) {
                if (!(value instanceof String)) continue;
                String id = (String) value;
                if (!isBlank(id)) unique.add(id);
            }

            ArrayList<String> downloaded = new ArrayList<>();
            for (String id : unique) {
                if (Boolean.TRUE.equals(invoke.invoke(isDownloaded, id))) downloaded.add(id);
            }

            // Do not start an unrelated local item if the picked ID was not in
            // this queue (for example, a stale or incomplete context page).
            return downloaded.contains(picked) ? downloaded : null;
        } catch (Throwable error) {
            android.util.Log.w("MySpotiLocalPlayback", "Could not inspect downloaded tracks; using the normal playback path", error);
            return null;
        }
    }

    private static boolean isBlank(String value) {
        if (value == null || value.isEmpty()) return true;
        for (int i = 0; i < value.length(); i++) {
            char c = value.charAt(i);
            if (!Character.isWhitespace(c) && !Character.isSpaceChar(c)) return false;
        }
        return true;
    }
}
