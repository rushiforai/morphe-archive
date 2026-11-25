package app.hushmessenger.extension;

import android.app.Activity;
import android.os.Build;
import android.view.Display;
import android.view.Window;
import android.view.WindowManager;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.TreeSet;
import java.util.WeakHashMap;

/**
 * #208 Screen refresh rate. Android picks the rate Messenger runs at, and many phones hold it at 60 Hz in apps or keep
 * it at the screen's fastest. With this on, each Messenger screen asks for the rate picked in settings as it comes to the
 * front, through its window's preferred display mode. Android can still overrule the ask, for example in power saving
 * mode or when the phone's own motion smoothness setting caps the rate. FbFragmentActivity.onResume, which nearly every
 * Messenger screen runs through, calls resumed(). Public, since the call comes from Messenger's own package.
 */
public final class RefreshRate {
    static final String KEY = "refresh_rate";
    /** The rate picked, in whole hertz. Nothing saved, or 0, means the fastest the screen does. */
    static final String RATE = "refresh_rate_hz";

    /** The mode each window was given here, so turning the switch off takes back only what this set. */
    private static final Map<Window, Integer> asked = new WeakHashMap<>();

    private RefreshRate() {}

    /** A Messenger screen came to the front. */
    public static void resumed(Activity activity) {
        try {
            if (activity == null) return;
            apply(activity.getWindow(), display(activity));
        } catch (RuntimeException | LinkageError error) {
            Settings.hookFailed(KEY, "Can't set the screen's refresh rate", error);
        }
    }

    static void apply(Window window, Display display) {
        if (window == null) return;
        WindowManager.LayoutParams attributes = window.getAttributes();
        Integer mine;
        synchronized (asked) { mine = asked.get(window); }
        int want;
        if (Settings.enabled(KEY) && display != null) {
            Display.Mode mode = modeFor(display.getMode(), display.getSupportedModes(), picked());
            want = mode == null ? 0 : mode.getModeId();
        } else {
            // Off, paused or in safe mode: give back only a mode this asked for, never one Messenger set itself.
            if (mine == null) return;
            want = 0;
        }
        if (attributes.preferredDisplayModeId != want) {
            attributes.preferredDisplayModeId = want;
            window.setAttributes(attributes);
        }
        synchronized (asked) {
            if (want == 0) asked.remove(window);
            else asked.put(window, want);
        }
    }

    /** The rate picked in settings, 0 for the fastest. */
    static int picked() {
        return Settings.preferences == null ? 0 : Math.max(0, Settings.preferences.getInt(RATE, 0));
    }

    /**
     * The mode with the screen's current size whose rate is nearest [hertz], the faster one on a tie, or the fastest of
     * them for 0. Null with no modes. A rate the screen doesn't do, from a backup made on another phone, gets the nearest.
     */
    static Display.Mode modeFor(Display.Mode current, Display.Mode[] supported, int hertz) {
        Display.Mode best = null;
        for (Display.Mode mode : sameSize(current, supported)) {
            if (best == null) {
                best = mode;
                continue;
            }
            float rate = mode.getRefreshRate(), bestRate = best.getRefreshRate();
            if (hertz <= 0) {
                if (rate > bestRate) best = mode;
                continue;
            }
            float off = Math.abs(rate - hertz), bestOff = Math.abs(bestRate - hertz);
            if (off < bestOff - 0.5f || (Math.abs(off - bestOff) <= 0.5f && rate > bestRate)) best = mode;
        }
        return best;
    }

    /** The rates the screen does at its current size, in whole hertz, slowest first. */
    static List<Integer> rates(Display display) {
        if (display == null) return Collections.emptyList();
        TreeSet<Integer> found = new TreeSet<>();
        for (Display.Mode mode : sameSize(display.getMode(), display.getSupportedModes())) {
            found.add(Math.round(mode.getRefreshRate()));
        }
        return new ArrayList<>(found);
    }

    /** Modes at the current mode's size. A phone that changes resolution with the rate isn't asked to. */
    private static List<Display.Mode> sameSize(Display.Mode current, Display.Mode[] supported) {
        List<Display.Mode> found = new ArrayList<>();
        if (supported == null) return found;
        for (Display.Mode mode : supported) {
            if (mode == null) continue;
            if (current != null && (mode.getPhysicalWidth() != current.getPhysicalWidth()
                || mode.getPhysicalHeight() != current.getPhysicalHeight())) continue;
            found.add(mode);
        }
        return found;
    }

    static Display display(Activity activity) {
        if (Build.VERSION.SDK_INT >= 30) {
            try {
                Display display = activity.getDisplay();
                if (display != null) return display;
            } catch (UnsupportedOperationException notYet) {
                // An activity that isn't tied to a display yet throws here. Its window manager still names the screen.
            }
        }
        @SuppressWarnings("deprecation") Display fallback = activity.getWindowManager().getDefaultDisplay();
        return fallback;
    }
}
