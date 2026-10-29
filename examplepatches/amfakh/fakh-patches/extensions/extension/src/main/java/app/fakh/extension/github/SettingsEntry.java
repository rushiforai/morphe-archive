package app.fakh.extension.github;

/**
 * Click listener of a switch in the Fakh Patches section of Settings. The patch makes it implement the preference
 * click listener interface, whose name R8 renamed, and adds the callback that calls
 * {@link MaterialYou#toggled} for {@link #key}.
 */
@SuppressWarnings("unused")
public final class SettingsEntry {
    /** The switch's setting key. */
    public final String key;

    public SettingsEntry(String key) {
        this.key = key;
    }
}
