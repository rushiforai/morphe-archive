package io.github.liongalahad.nuviotv.extension.playback.sourceselectionrestore;

import io.github.liongalahad.nuviotv.extension.settings.MorpheSettingsUi;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;

/** Settings action owned by Restore Source Selection. */
public final class SourceSelectionRestoreToggleAction implements Function0<Unit> {
    private SourceSelectionRestoreToggleAction() {}

    public static Function0<Unit> create() {
        return new SourceSelectionRestoreToggleAction();
    }

    @Override
    public Unit invoke() {
        SourceSelectionRestoreSettings.toggle();
        MorpheSettingsUi.refresh();
        return Unit.INSTANCE;
    }
}
