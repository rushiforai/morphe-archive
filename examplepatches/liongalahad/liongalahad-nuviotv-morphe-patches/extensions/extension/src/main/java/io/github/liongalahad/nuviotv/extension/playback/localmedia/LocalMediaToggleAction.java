package io.github.liongalahad.nuviotv.extension.playback.localmedia;

import io.github.liongalahad.nuviotv.extension.settings.MorpheSettingsUi;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;

/** Toggle action owned by Local Media. */
public final class LocalMediaToggleAction implements Function0<Unit> {
    private LocalMediaToggleAction() {}

    public static Function0<Unit> create() {
        return new LocalMediaToggleAction();
    }

    @Override public Unit invoke() {
        boolean enabling = !LocalMediaRuntime.isEnabled();
        LocalMediaRuntime.setEnabled(enabling);
        LocalMediaLibraryUi.invalidate();
        MorpheSettingsUi.refresh();
        return Unit.INSTANCE;
    }
}
