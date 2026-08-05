package io.github.liongalahad.nuviotv.extension.settings;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;

/** Expands the Subtitles compartment inside Nuvio's existing settings pane. */
@SuppressWarnings("unused")
public final class MorpheSubtitlesExpandAction implements Function0<Unit> {
    private final Function0<?> originalAction;

    private MorpheSubtitlesExpandAction(Function0<?> originalAction) {
        this.originalAction = originalAction;
    }

    public static Function0<Unit> wrap(Function0<?> originalAction) {
        MorpheComposeModeAction.captureRefreshAction(originalAction);
        return new MorpheSubtitlesExpandAction(originalAction);
    }

    @Override
    public Unit invoke() {
        MorpheSettingsRuntime.toggleSubtitlesExpanded();
        MorpheComposeToggleAction.pulseCapturedComposeState(originalAction);
        return Unit.INSTANCE;
    }
}
