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

    /** Only shown in the menu while this switch is on, e.g. the times of an optional schedule. */
    public BooleanSetting shownWhen;

    /** Shows this setting only while {@code parent} is on. */
    @SuppressWarnings("unchecked")
    public <T extends Setting> T shownWhen(BooleanSetting parent) {
        this.shownWhen = parent;
        return (T) this;
    }

    /** A longer explanation behind the setting's "?" button, or null for none. */
    public String help;

    /** Adds a "?" button to the setting's row that explains it with {@code text}. */
    @SuppressWarnings("unchecked")
    public <T extends Setting> T help(String text) {
        this.help = text;
        return (T) this;
    }

    /** Forgets the stored value, falling back to the default. */
    public void reset() {
        Settings.preferences().edit().remove(key).apply();
    }
}
