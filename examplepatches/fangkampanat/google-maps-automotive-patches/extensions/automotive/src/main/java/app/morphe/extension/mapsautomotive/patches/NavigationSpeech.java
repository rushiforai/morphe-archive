package app.morphe.extension.mapsautomotive.patches;

import org.json.JSONException;
import org.json.JSONObject;

import app.morphe.extension.shared.Utils;

/**
 * Navigation speech (patch "Navigation speech", switch "navigation_speech").
 * <p>
 * Maps keeps two voices for spoken directions: the head unit's text-to-speech engine (local) and Google's online
 * voice. Its server settings choose the local voice only, the online voice only, or both, and while the online voice
 * is on, only a prompt the online voice made counts as ready. Where the online voice fails, nothing is ready and Maps
 * plays short canned prompts without street names.
 * <p>
 * While the switch is on, {@link #bothVoices} makes Maps create both voices where it would create the online voice
 * only (Maps' own "both" choice; "local only" stays), and {@link #localReady} lets a prompt the local voice made count
 * as ready while the online voice's last result ({@link #onlineResult}) was a failure. Where the online voice works,
 * prompts stay Maps' own, so the two voices do not take turns. Maps still takes the online voice's prompt first when
 * it has one. The switch is read once per process.
 */
@SuppressWarnings("unused")
public final class NavigationSpeech {
    private static final String TAG = "MorpheNavigationSpeech";
    private static final int UNSET = -1;

    /** Whether this process changes Maps' voices, null before Maps first made them. */
    private static volatile Boolean on;
    /** Maps' choice at its last voice creation: 0 local only, 1 online only, else by its flags; UNSET before. */
    private static volatile int choice = UNSET;
    /** Voice creations where Maps made both voices instead of the online one only. */
    private static volatile int bothInstead;
    /** Prompts from the local voice that counted as ready. */
    private static volatile int localReadyCount;
    /** The online voice's results: prompts made and failed, and whether the last one failed. */
    private static volatile int onlineMade, onlineFailed;
    private static volatile boolean onlineFailing;

    private NavigationSpeech() {
    }

    /**
     * Injection point: where Maps creates its voices, with its choice (its setting minus one: 0 local only, 1 online
     * only, else its flags decide between online only and both). Returns true to create both voices.
     */
    public static boolean bothVoices(int mapsChoice) {
        try {
            boolean feature = enabled();
            boolean both = feature && mapsChoice != 0;
            if (both) bothInstead++;
            if (choice != mapsChoice) {
                choice = mapsChoice;
                ReportLog.i(TAG, "Maps' voices: " + describe(mapsChoice) + (both ? "; both voices instead" : ""));
                saveState();
            }
            return both;
        } catch (Throwable error) {
            return false;
        }
    }

    /**
     * Injection point: Maps' readiness check of a prepared prompt while the online voice is on, with the prompt's voice
     * and the online voice's tag. Returns true for another voice's prompt (the local one) while the switch is on and the
     * online voice's last result was a failure; false leaves Maps' check as it is.
     */
    public static boolean localReady(Object voice, Object online) {
        try {
            if (voice == online || !onlineFailing || !enabled()) return false;
            if (localReadyCount++ == 0) ReportLog.i(TAG, "a prompt from the head unit's voice counts as ready");
            return true;
        } catch (Throwable error) {
            return false;
        }
    }

    /**
     * Injection point: the start of the completion listener's result method, with its success flag. With both voices
     * (and with the online voice only) the listener is the online voice's; with the local voice only it is the local
     * voice's, and then {@link #localReady} is never asked.
     */
    public static void onlineResult(boolean made) {
        try {
            if (made) onlineMade++;
            else onlineFailed++;
            if (onlineFailing == made) {
                onlineFailing = !made;
                ReportLog.i(TAG, made ? "Google's online voice works again" : "Google's online voice failed a prompt");
                saveState();
            }
        } catch (Throwable error) {
            // Counting only.
        }
    }

    private static boolean enabled() {
        Boolean feature = on;
        return feature != null ? feature : decide();
    }

    private static synchronized boolean decide() {
        Boolean feature = on;
        if (feature == null) {
            feature = SafeMode.on(SafeMode.NAVIGATION_SPEECH);
            on = feature;
            ReportLog.i(TAG, "Navigation speech " + (feature ? "on" : "off (switched off)"));
        }
        return feature;
    }

    // The report screen's process reads the main process's last saved state: saved when this changes.
    private static void saveState() {
        if (Utils.isContextSet()) ReportBuilder.saveSnapshot(Utils.getContext(), true);
    }

    private static String describe(int mapsChoice) {
        switch (mapsChoice) {
            case 0: return "head unit only";
            case 1: return "online only (Maps' setting)";
            default: return "by Maps' flags (online only or both)";
        }
    }

    /** For the problem report (main process): Maps' last choice, what the switch changed, and the switch. */
    static JSONObject report() throws JSONException {
        int maps = choice;
        Boolean feature = on;
        return new JSONObject()
                .put("maps_choice", maps == UNSET ? JSONObject.NULL : maps == 0 ? "local" : maps == 1 ? "online" : "flags")
                .put("both_instead", bothInstead)
                .put("local_ready", localReadyCount)
                .put("online_made", onlineMade)
                .put("online_failed", onlineFailed)
                .put("online_failing", onlineFailing)
                .put("on", feature != null ? feature : JSONObject.NULL);
    }
}
