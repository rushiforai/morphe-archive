package nl.johninnl.soundcloud;

/**
 * Decisions of the timer window, separated from Android so they can be tested on a plain JVM:
 * what a tap in the centre does, what happens on a saved value, and what "+5 min" does.
 * It owns no timer of its own: every action goes to the existing timer through {@link Backend}.
 */
final class SleepTimerController {
    static final int ADD_MINUTES = 5;

    interface Backend {
        boolean isRunning();

        /** Starts the timer; if one is already running it is replaced (restart). */
        void start(int minutes);

        void stop();

        /** Adds minutes to the time that is left on a running timer. */
        void extend(int minutes);
    }

    private final Backend backend;
    private int startedPreset;

    SleepTimerController(Backend backend) {
        this.backend = backend;
    }

    /**
     * Tap in the centre of the dial: stops a running timer, otherwise starts one with the
     * selected value. Returns true if a timer is running afterwards.
     */
    boolean onCenterTap(int selectedMinutes) {
        if (backend.isRunning()) {
            backend.stop();
            startedPreset = 0;
            return false;
        }
        if (selectedMinutes < SleepTimerMath.MIN_MINUTES || selectedMinutes > SleepTimerMath.MAX_MINUTES) return false;
        backend.start(selectedMinutes);
        startedPreset = 0; // started from the dial, not from a saved value
        return true;
    }

    /** Tap on a saved value: starts at once, also while another timer is running (restart). */
    boolean onPreset(int minutes) {
        if (minutes < SleepTimerMath.MIN_MINUTES || minutes > SleepTimerMath.MAX_MINUTES) return false;
        backend.start(minutes);
        startedPreset = minutes;
        return true;
    }

    /** "+5 min": only meaningful while a timer runs. Returns true if time was added. */
    boolean onAddTime() {
        if (!backend.isRunning()) return false;
        backend.extend(ADD_MINUTES);
        startedPreset = 0; // the time left no longer equals the saved value that was started
        return true;
    }

    /** Call regularly: forgets the started saved value once the timer is no longer running. */
    void sync() {
        if (!backend.isRunning()) startedPreset = 0;
    }

    /** The saved value that was started from this window and is still running, or 0. */
    int startedPreset() {
        return backend.isRunning() ? startedPreset : 0;
    }
}
