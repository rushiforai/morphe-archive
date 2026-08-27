package io.github.liongalahad.nuviotv.extension.settings;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;

/** Selects one SDH mode and invalidates Nuvio's native Compose settings scope. */
@SuppressWarnings("unused")
public final class MorpheComposeModeAction implements Function0<Unit> {
    private static volatile Function0<?> refreshAction;

    private final int mode;

    private MorpheComposeModeAction(int mode) {
        this.mode = mode;
    }

    public static Function0<Unit> forMode(int mode) {
        return new MorpheComposeModeAction(mode);
    }

    static void captureRefreshAction(Function0<?> action) {
        refreshAction = action;
    }

    static void refreshSettingsPane() {
        Function0<?> action = refreshAction;
        if (action != null) action.invoke();
    }

    @Override
    public Unit invoke() {
        MorpheSettingsRuntime.setSdhCleanupMode(mode);
        refreshSettingsPane();
        return Unit.INSTANCE;
    }
}
