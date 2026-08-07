package io.github.liongalahad.nuviotv.extension.settings;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;

/** Native Compose action for the independent SDH title-marking switch. */
public final class MorpheSdhMarkingToggleAction implements Function0<Unit> {
    private MorpheSdhMarkingToggleAction() {}

    public static Function0<Unit> create() { return new MorpheSdhMarkingToggleAction(); }

    @Override public Unit invoke() {
        MorpheSettingsRuntime.toggleSdhMarkingEnabled();
        MorpheComposeModeAction.refreshSettingsPane();
        return Unit.INSTANCE;
    }
}
