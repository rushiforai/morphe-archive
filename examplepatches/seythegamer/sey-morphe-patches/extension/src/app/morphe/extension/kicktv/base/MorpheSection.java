package app.morphe.extension.kicktv.base;

/**
 * A block of settings contributed by a feature patch. The base SEYTTINGS
 * extension finds implementations by name, so it never needs a compile time
 * dependency on the feature extension.
 */
public interface MorpheSection {

    /**
     * Adds the feature rows to the dialog. Called on the UI thread while the
     * dialog is being built.
     */
    void addTo(android.app.Activity activity, android.widget.LinearLayout container);
}
