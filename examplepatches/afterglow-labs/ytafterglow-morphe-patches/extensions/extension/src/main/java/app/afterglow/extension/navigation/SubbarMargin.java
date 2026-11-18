package app.afterglow.extension.navigation;

/** Collapse occupied space without replacing native animation dimensions. */
final class SubbarMargin {
    private boolean hidden;
    private int nativeMargin, appliedMargin;

    int apply(int current, int measuredHeight, boolean hide) {
        if (hide) {
            if (!hidden || current != appliedMargin) nativeMargin = current;
            hidden = true;
            appliedMargin = nativeMargin - Math.max(0, measuredHeight);
            return appliedMargin;
        }
        if (!hidden) return current;
        hidden = false;
        return current == appliedMargin ? nativeMargin : current;
    }
}
