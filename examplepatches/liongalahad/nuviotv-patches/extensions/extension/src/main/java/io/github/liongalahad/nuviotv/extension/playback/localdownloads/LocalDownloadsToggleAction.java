package io.github.liongalahad.nuviotv.extension.playback.localdownloads;

import io.github.liongalahad.nuviotv.extension.settings.MorpheSettingsUi;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;

public enum LocalDownloadsToggleAction implements Function0<Unit> {
    INSTANCE;
    @Override public Unit invoke() {
        boolean enabled = !LocalDownloadsSettings.isEnabled();
        LocalDownloadsSettings.setEnabled(enabled);
        MorpheSettingsUi.refresh();
        return Unit.INSTANCE;
    }
}
