package io.github.liongalahad.nuviotv.extension.settings;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;

/** Toggles overall rating visibility and redraws the Morphe pane immediately. */
@SuppressWarnings("unused")
public final class MorpheOverallRatingsToggleAction implements Function0<Unit> {
    private MorpheOverallRatingsToggleAction() {}
    public static Function0<Unit> create() { return new MorpheOverallRatingsToggleAction(); }
    @Override public Unit invoke() {
        MorpheSettingsRuntime.toggleOverallRatings();
        MorpheComposeModeAction.refreshSettingsPane();
        return Unit.INSTANCE;
    }
}
