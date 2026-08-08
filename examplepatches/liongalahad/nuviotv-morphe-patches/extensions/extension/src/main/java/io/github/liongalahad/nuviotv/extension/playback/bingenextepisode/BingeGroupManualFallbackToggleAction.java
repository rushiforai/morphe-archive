package io.github.liongalahad.nuviotv.extension.playback.bingenextepisode;

import io.github.liongalahad.nuviotv.extension.settings.MorpheSettingsUi;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;

/** Settings action owned by Binge Group Manual Fallback. */
public final class BingeGroupManualFallbackToggleAction implements Function0<Unit> {
    private BingeGroupManualFallbackToggleAction() {}
    public static Function0<Unit> create() { return new BingeGroupManualFallbackToggleAction(); }
    @Override public Unit invoke() {
        BingeGroupManualFallbackSettings.toggle();
        MorpheSettingsUi.refresh();
        return Unit.INSTANCE;
    }
}
