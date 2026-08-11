package io.github.liongalahad.nuviotv.extension.playback.localmedia;

import android.app.Activity;

import io.github.liongalahad.nuviotv.extension.settings.MorpheSettingsUi;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;

/** Folder-picker action owned by Local Media. */
public final class LocalMediaFolderAction implements Function0<Unit> {
    private LocalMediaFolderAction() {}

    public static Function0<Unit> create() {
        return new LocalMediaFolderAction();
    }

    @Override public Unit invoke() {
        Activity activity = MorpheSettingsUi.resumedActivity();
        if (activity != null) LocalMediaRuntime.openFolderPicker(activity);
        return Unit.INSTANCE;
    }
}
