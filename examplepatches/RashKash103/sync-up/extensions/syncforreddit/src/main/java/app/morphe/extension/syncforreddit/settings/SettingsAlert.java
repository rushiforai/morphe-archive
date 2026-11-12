package app.morphe.extension.syncforreddit.settings;

import android.content.Context;

import androidx.annotation.Nullable;

/**
 * One thing worth saying at the top of the settings.
 *
 * <p>A patch can leave the app in a state nothing on the screen explains — a Rimgo instance
 * that had a client certificate and came back from a backup without it goes on being asked and
 * goes on being refused, and nothing anywhere says why. An alert says it where the reader will
 * see it without going looking, and {@link #whatToDo} takes them to the thing that fixes it
 * rather than to the screen near it.
 */
public final class SettingsAlert {
    /** How much it matters, which decides the icon and the order they are shown in. */
    public enum Level {
        /** Something is broken now. */
        ERROR,
        /** Something will not work as it was set up to. */
        WARNING,
        /** Worth knowing, nothing is wrong. */
        INFO,
    }

    /**
     * What this alert is, so that dismissing it can be remembered.
     *
     * <p>It has to name the thing rather than the words — an instance's certificate is
     * {@code rimgo-certificate:<instance>} — or dismissing one instance's alert would dismiss
     * every other instance's too, and changing the wording later would bring back everything
     * anyone had ever put away.
     */
    public final String id;

    public final Level level;

    public final String title;

    public final String summary;

    /** What tapping it does. Null where there is nowhere useful to go. */
    @Nullable
    public final Tap whatToDo;

    /** What to do when the alert is tapped, given the context the row was drawn in. */
    public interface Tap {
        void act(Context context, Runnable afterwards);
    }

    public SettingsAlert(String id, Level level, String title, String summary,
                         @Nullable Tap whatToDo) {
        this.id = id;
        this.level = level;
        this.title = title;
        this.summary = summary;
        this.whatToDo = whatToDo;
    }
}
