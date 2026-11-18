package app.afterglow.extension.navigation;

/** Keep the native height animator's precondition valid for an already expanded hidden row. */
final class SubbarAnimation {
    private SubbarAnimation() {}

    static int start(int requested, int end, int current, boolean collapsed) {
        return collapsed && requested == 0 && current == end && end > 0 ? current : requested;
    }
}
