package app.morphe.extension.facebook.settings;

import android.app.Application;

/** Exercises the same resume observer the installed application's entry hook registers. */
public final class CompletedEntryForTests {
    private CompletedEntryForTests() { }

    public static Application.ActivityLifecycleCallbacks watcher() {
        return new SettingsEntry.OpenWhenResumed();
    }
}
