/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import java.lang.ref.WeakReference;
import java.util.function.Predicate;

/** Stands in for the patched stub that has a chat screen decide on its pinned bar. */
public final class TranslateBarForTests {
    private TranslateBarForTests() {}

    public static void decideWith(Predicate<Object> decider) {
        TranslateBar.decider = decider;
    }

    /** Back to the stub, with no chat at the front. */
    public static void restore() {
        TranslateBar.decider = TranslateBar::decidePinnedBar;
        TranslateBar.front = new WeakReference<>(null);
    }
}
