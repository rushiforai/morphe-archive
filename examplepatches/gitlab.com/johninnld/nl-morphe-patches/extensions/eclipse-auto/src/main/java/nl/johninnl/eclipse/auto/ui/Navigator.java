package nl.johninnl.eclipse.auto.ui;

import androidx.car.app.Screen;
import androidx.car.app.ScreenManager;
import java.util.ArrayList;
import java.util.List;
import java.util.function.Supplier;

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

    /**
     * The screens a new session starts with, bottom first. A host opens a playing app on its Now
     * Playing page by starting the session with SHOW_MEDIA_PLAYBACK. Back is answered by the
     * app's own stack and does nothing on its last screen, so the root page lies beneath the
     * player; a player alone could never be left.
     */
    public static <S> List<S> startStack(boolean showPlayback, Supplier<S> root, Supplier<S> player) {
        List<S> stack = new ArrayList<>(2);
        stack.add(root.get());
        if (showPlayback) stack.add(player.get());
        return stack;
    }

    /** Pushes every screen of {@code stack} but the top one, which the session returns from onCreateScreen. */
    public static Screen start(ScreenManager screens, List<Screen> stack) {
        for (int i = 0; i < stack.size() - 1; i++) screens.push(stack.get(i));
        return stack.get(stack.size() - 1);
    }

    private Navigator() { }
}
