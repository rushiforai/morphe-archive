package io.github.bryceaspringfield.morphe.extension.youtube;

import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

/**
 * Audio only, through YouTube's own audio-only playback mode (its PlaybackModality class, which YouTube Premium's
 * audio-only playback uses): the player drops the video surface and plays the audio stream alone. The patch hooks
 * the class's constructors and names its two methods, enable (boolean userInduced, boolean) and disable (boolean
 * userInduced), since the names change with each YouTube version.
 */
public final class AudioOnly {

    private static final List<WeakReference<Object>> MODALITIES = new ArrayList<>();
    private static volatile String enableName;
    private static volatile String disableName;
    private static volatile boolean on;

    private AudioOnly() {
    }

    /** Injection point, at the end of each constructor of YouTube's playback modality. */
    public static void setModality(Object modality, String names) {
        try {
            String[] n = names.split("\\|");
            enableName = n[0];
            disableName = n[1];
            synchronized (MODALITIES) {
                MODALITIES.removeIf(r -> r.get() == null);
                MODALITIES.add(new WeakReference<>(modality));
            }
            if (XSettings.DEBUG.get()) Logger.printDebug(() -> "YouTube Extras: playback modality " + modality.getClass().getName() + " " + names);
            if (XSettings.AUDIO_ONLY.get()) Utils.runOnMainThreadDelayed(() -> set(true, "player created"), 500);
        } catch (Throwable t) {
            Logger.printDebug(() -> "YouTube Extras: playback modality not kept: " + t);
        }
    }

    static boolean available() {
        synchronized (MODALITIES) {
            for (WeakReference<Object> r : MODALITIES) if (r.get() != null) return enableName != null;
        }
        return false;
    }

    static boolean isOn() {
        return on;
    }

    /** Turns YouTube's audio-only mode on or off on every live player; false when no player was found. */
    static boolean set(boolean audioOnly, String why) {
        List<Object> live = new ArrayList<>();
        synchronized (MODALITIES) {
            for (WeakReference<Object> r : MODALITIES) {
                Object m = r.get();
                if (m != null) live.add(m);
            }
        }
        if (live.isEmpty() || enableName == null) {
            Logger.printDebug(() -> "YouTube Extras: audio only " + audioOnly + " (" + why + "): no player");
            return false;
        }
        Utils.runOnMainThread(() -> {
            for (Object m : live) {
                try {
                    if (audioOnly) {
                        Method e = m.getClass().getMethod(enableName, boolean.class, boolean.class);
                        e.invoke(m, true, false);
                    } else {
                        Method d = m.getClass().getMethod(disableName, boolean.class);
                        d.invoke(m, true);
                    }
                } catch (Throwable t) {
                    Logger.printDebug(() -> "YouTube Extras: audio only not set: " + t);
                }
            }
            on = audioOnly;
            Logger.printDebug(() -> "YouTube Extras: audio only " + audioOnly + " (" + why + "), players " + live.size());
        });
        return true;
    }
}
