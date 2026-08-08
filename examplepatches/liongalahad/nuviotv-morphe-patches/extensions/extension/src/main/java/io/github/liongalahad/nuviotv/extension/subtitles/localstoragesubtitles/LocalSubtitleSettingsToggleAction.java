package io.github.liongalahad.nuviotv.extension.subtitles.localstoragesubtitles;

import io.github.liongalahad.nuviotv.extension.settings.MorpheSettingsUi;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;

/** Native Compose action for this patch's Morphe switch. */
public final class LocalSubtitleSettingsToggleAction implements Function0<Unit> {
    private LocalSubtitleSettingsToggleAction() {}

    public static Function0<Unit> create() {
        return new LocalSubtitleSettingsToggleAction();
    }

    @Override public Unit invoke() {
        LocalSubtitleRuntime.toggleFeatureEnabled();
        MorpheSettingsUi.refresh();
        return Unit.INSTANCE;
    }
}
