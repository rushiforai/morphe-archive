package app.southstar21.extension.instagram.settings;

/**
 * A user-changeable value of a patch, shown in the southstar21 Patches menu and stored in
 * the app's preferences.
 */
public abstract class Setting {
    public final String key;
    public final String title;
    public final String summary;
    /** Whether a change only takes effect after Instagram restarts. */
    public final boolean requiresRestart;

    Setting(String key, String title, String summary, boolean requiresRestart) {
        this.key = key;
        this.title = title;
        this.summary = summary;
        this.requiresRestart = requiresRestart;
    }

    /** Forgets the stored value, falling back to the default. */
    public void reset() {
        Settings.preferences().edit().remove(key).apply();
    }
}
