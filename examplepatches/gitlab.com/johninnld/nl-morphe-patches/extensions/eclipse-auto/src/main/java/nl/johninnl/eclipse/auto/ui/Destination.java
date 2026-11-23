package nl.johninnl.eclipse.auto.ui;

/** The root page's destinations, in display order. */
public enum Destination {
    HOME("home", "Home"),
    DISCOVER("discover", "Discover"),
    LIBRARY("library", "Library");

    public final String key;
    public final String title;

    Destination(String key, String title) {
        this.key = key;
        this.title = title;
    }

    /** Unknown or missing keys land on Home, so a stale key can never leave the page empty. */
    public static Destination fromKey(String key) {
        for (Destination destination : values()) {
            if (destination.key.equals(key)) return destination;
        }
        return HOME;
    }
}
