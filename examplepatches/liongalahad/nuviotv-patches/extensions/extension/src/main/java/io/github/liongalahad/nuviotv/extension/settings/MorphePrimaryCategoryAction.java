package io.github.liongalahad.nuviotv.extension.settings;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;

/** Expands the primary installed Morphe category without invoking Nuvio's hidden mode action. */
@SuppressWarnings("unused")
public final class MorphePrimaryCategoryAction implements Function0<Unit> {
    private final Function0<?> originalAction;

    private MorphePrimaryCategoryAction(Function0<?> originalAction) {
        this.originalAction = originalAction;
    }

    public static Function0<Unit> wrap(Function0<?> originalAction) {
        MorpheComposeModeAction.captureRefreshAction(originalAction);
        return new MorphePrimaryCategoryAction(originalAction);
    }

    @Override public Unit invoke() {
        MorpheSettingsRuntime.togglePrimaryCategory();
        MorpheComposeToggleAction.pulseCapturedComposeState(originalAction);
        return Unit.INSTANCE;
    }
}
