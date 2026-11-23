package nl.johninnl.eclipse.auto.ui;

import androidx.car.app.Screen;
import androidx.car.app.ScreenManager;

/**
 * The host allows five screens on the stack. Root (1), a collection (2), a collection from an
 * artist (3), Up Next (4) and the player (5) fill it, so a sixth push first pops back to the root.
 */
public final class Navigator {
    public static final int STACK_LIMIT = 5;

    /** True when pushing one more screen would exceed the host's limit. */
    public static boolean mustResetBeforePush(int stackSize) { return stackSize >= STACK_LIMIT; }

    public static void push(ScreenManager screens, Screen next) {
        if (mustResetBeforePush(screens.getStackSize())) screens.popToRoot();
        screens.push(next);
    }

    private Navigator() { }
}
