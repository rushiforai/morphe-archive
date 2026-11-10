package app.morphed.extension.twitch.patches;

/**
 * When the label cannot be placed over the video, a block is shown as a toast instead. During an ad
 * break the label is refreshed on every poll (about every 2 seconds), so a break gets one toast,
 * not one per poll. A single block ("Ad blocked") always gets its toast; its caller debounces it.
 */
final class ToastThrottle {
    private boolean toastedThisBreak;

    /** Whether a toast may show now. */
    boolean allow(boolean duringBreak) {
        if (!duringBreak) return true;
        if (toastedThisBreak) return false;
        toastedThisBreak = true;
        return true;
    }

    /** The break ended: the next one gets its own toast. */
    void breakOver() {
        toastedThisBreak = false;
    }
}
