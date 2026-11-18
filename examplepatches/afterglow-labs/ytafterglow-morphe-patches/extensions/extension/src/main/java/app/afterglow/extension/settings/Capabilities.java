package app.afterglow.extension.settings;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Runtime feature availability, the counterpart of the iOS
 * YTAGYouTubeCompatibilityRuntime capability states and the standard player
 * control probe (YTAGStandardPlayerControlIsAvailable). The settings UI reads
 * these to disable rows ("Unavailable in this YouTube version.") and to hide the
 * Overlay page's standard-control rows. Nothing probes YouTube on Android yet,
 * so every capability and control reports available until a patch says otherwise.
 */
public final class Capabilities {
    public enum State { UNKNOWN, DISABLED, FALLBACK, AVAILABLE }

    private static final Map<String, State> STATES = new ConcurrentHashMap<>();
    private static final Map<String, Boolean> STANDARD_CONTROLS = new ConcurrentHashMap<>();

    private Capabilities() {}

    /** State of an iOS capability name (Descriptor.capability, e.g. "StandardPlayerControls"). */
    public static State state(String capability) {
        if (capability == null) return State.AVAILABLE;
        State state = STATES.get(capability);
        return state == null ? State.AVAILABLE : state;
    }

    public static void setState(String capability, State state) {
        if (capability == null) return;
        if (state == null) STATES.remove(capability);
        else STATES.put(capability, state);
    }

    /** Standard player control by iOS name: Title, Fullscreen, Overflow, YouTubeMusic, Collapse. */
    public static boolean standardControlAvailable(String control) {
        Boolean available = control == null ? null : STANDARD_CONTROLS.get(control);
        return available == null || available;
    }

    public static void setStandardControlAvailable(String control, boolean available) {
        if (control != null) STANDARD_CONTROLS.put(control, available);
    }
}
