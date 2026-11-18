package app.afterglow.extension.navigation;

/** Native animation heights, margins and fresh requests must survive hiding. */
public final class SubbarMarginTest {
    private static int checks;

    private static void equal(int expected, int actual) {
        checks++;
        if (expected != actual) throw new AssertionError(expected + " != " + actual);
    }

    public static void main(String[] args) {
        for (int original : new int[]{-8, 0, 16}) {
            SubbarMargin state = new SubbarMargin();
            equal(original, state.apply(original, 126, false));
            int current = original;
            // Search's native collapse and expand animation must not accumulate spacing.
            for (int height : new int[]{126, 94, 48, 1, 0, 1, 48, 126}) {
                current = state.apply(current, height, true);
                equal(original, current + height);
            }
            equal(original, state.apply(current, 126, false));
            equal(original, state.apply(original, 126, false));
        }
        SubbarMargin state = new SubbarMargin();
        equal(-48, state.apply(0, 48, true));
        equal(-56, state.apply(8, 64, true)); // A new native margin while hidden wins.
        equal(8, state.apply(-56, 64, false));
        equal(-56, state.apply(8, 64, true));
        equal(12, state.apply(12, 64, false)); // Native change just before restoration wins.
        equal(-84, state.apply(12, 96, true));
        equal(12, state.apply(-84, 96, false)); // Detachment restores before reuse.
        equal(0, state.apply(0, 0, true));
        equal(-126, state.apply(0, 126, true)); // First measurement after attachment.
        equal(0, state.apply(-126, 126, false));
        for (boolean collapsed : new boolean[]{false, true}) {
            equal(collapsed ? 126 : 0, SubbarAnimation.start(0, 126, 126, collapsed));
            equal(0, SubbarAnimation.start(0, 126, 0, collapsed));
            equal(0, SubbarAnimation.start(0, 126, 48, collapsed));
            equal(0, SubbarAnimation.start(0, 0, 0, collapsed));
            equal(0, SubbarAnimation.start(0, -2, -2, collapsed));
            equal(126, SubbarAnimation.start(126, 0, 126, collapsed));
            equal(48, SubbarAnimation.start(48, 126, 48, collapsed));
            equal(0, SubbarAnimation.start(0, 126, -1, collapsed));
        }
        System.out.println("subbar spacing: " + checks + " checks passed");
    }
}
