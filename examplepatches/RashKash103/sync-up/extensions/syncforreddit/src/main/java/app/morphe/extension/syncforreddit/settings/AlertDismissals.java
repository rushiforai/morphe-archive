package app.morphe.extension.syncforreddit.settings;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import android.content.SharedPreferences;

import app.morphe.extension.shared.Logger;

/**
 * Which alerts have been put away, and for how long.
 *
 * <p>Two kinds, because they answer two different thoughts. <i>Just once</i> is "not now" and
 * lives only as long as the app is running, so the next time it starts the alert is there
 * again. <i>Always</i> is "I know, and I am not going to do anything about it", and is
 * remembered — which means it has to be possible to change one's mind, so what was dismissed
 * is listed and can be brought back.
 *
 * <p>What is remembered is the id and the words beside it. The words, because an alert that is
 * dismissed is not built any more — there would be nothing to show in the list but an id
 * nobody wrote for reading.
 */
public final class AlertDismissals {
    /** Kept in Sync's own settings, so it travels in a backup as any other preference does. */
    private static final String DISMISSED = "sync_up_alerts_dismissed";

    /** Between the id and the words, in a character neither of them can hold. */
    private static final String AND = "\u001f";

    /** Put away for as long as the app is running, and no longer. */
    private static final Set<String> forNow = new LinkedHashSet<>();

    private AlertDismissals() {}

    /** @return Whether this alert is not to be shown at the moment. */
    public static boolean isDismissed(String id) {
        synchronized (forNow) {
            if (forNow.contains(id)) {
                return true;
            }
        }
        return forever().contains(id);
    }

    public static void justOnce(String id) {
        synchronized (forNow) {
            forNow.add(id);
        }
    }

    /** Remembers it, with the words to list it by. */
    public static void always(String id, String title) {
        try {
            List<String> kept = new ArrayList<>();
            for (String line : lines()) {
                if (!idOf(line).equals(id)) {
                    kept.add(line);
                }
            }
            kept.add(id + AND + title);
            putLines(kept);
        } catch (Exception ex) {
            Logger.printInfo(() -> "alerts: could not put one away: " + ex);
        }
    }

    /** Brings one back, whichever way it was dismissed. */
    public static void bringBack(String id) {
        synchronized (forNow) {
            forNow.remove(id);
        }
        try {
            List<String> kept = new ArrayList<>();
            for (String line : lines()) {
                if (!idOf(line).equals(id)) {
                    kept.add(line);
                }
            }
            putLines(kept);
        } catch (Exception ex) {
            Logger.printInfo(() -> "alerts: could not bring one back: " + ex);
        }
    }

    /** @return The ids put away for good. */
    public static Set<String> forever() {
        Set<String> ids = new LinkedHashSet<>();
        for (String line : lines()) {
            ids.add(idOf(line));
        }
        return ids;
    }

    /** @return What was put away for good, as id and words, in the order it was put away. */
    public static List<String[]> listed() {
        List<String[]> found = new ArrayList<>();
        for (String line : lines()) {
            int at = line.indexOf(AND);
            found.add(at < 0
                    ? new String[]{line, line}
                    : new String[]{line.substring(0, at), line.substring(at + AND.length())});
        }
        return found;
    }

    /** @return What is kept, one dismissal to a line, with the blank ones dropped. */
    private static List<String> lines() {
        List<String> held = new ArrayList<>();
        SharedPreferences settings = SyncUpSettings.store();
        if (settings == null) {
            return held;
        }
        try {
            String written = settings.getString(DISMISSED, "");
            if (written == null || written.isEmpty()) {
                return held;
            }
            for (String line : written.split("\n")) {
                if (!line.trim().isEmpty()) {
                    held.add(line);
                }
            }
        } catch (Exception ex) {
            Logger.printInfo(() -> "alerts: could not read what was put away: " + ex);
        }
        return held;
    }

    private static void putLines(List<String> lines) {
        SharedPreferences settings = SyncUpSettings.store();
        if (settings == null) {
            return;
        }
        StringBuilder written = new StringBuilder();
        for (String line : lines) {
            if (written.length() > 0) {
                written.append('\n');
            }
            written.append(line);
        }
        settings.edit().putString(DISMISSED, written.toString()).apply();
    }

    private static String idOf(String line) {
        int at = line.indexOf(AND);
        return at < 0 ? line : line.substring(0, at);
    }
}
