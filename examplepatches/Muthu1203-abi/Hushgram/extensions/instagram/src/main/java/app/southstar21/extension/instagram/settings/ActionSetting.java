package app.southstar21.extension.instagram.settings;

/** A button in a patch's settings that runs something right away. Stores nothing. */
public final class ActionSetting extends Setting {
    /** Run when the button is tapped. Returns a short confirmation to show, or null. */
    public interface Action {
        String run();
    }

    public final Action action;

    public ActionSetting(String title, String summary, Action action) {
        super("", title, summary, false);
        this.action = action;
    }

    @Override
    public void reset() {
        // Nothing stored.
    }
}
