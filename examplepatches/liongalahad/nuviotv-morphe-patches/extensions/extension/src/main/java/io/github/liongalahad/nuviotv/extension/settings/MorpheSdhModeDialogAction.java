package io.github.liongalahad.nuviotv.extension.settings;

import android.app.Activity;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;

/** Opens the TV-native SDH mode dialog over Nuvio's current settings pane. */
@SuppressWarnings("unused")
public final class MorpheSdhModeDialogAction implements Function0<Unit> {
    private MorpheSdhModeDialogAction() {}

    public static Function0<Unit> create() {
        return new MorpheSdhModeDialogAction();
    }

    @Override
    public Unit invoke() {
        Activity activity = MorpheSettingsRuntime.resumedActivity();
        if (activity != null) {
            activity.runOnUiThread(() -> MorpheSdhModeDialog.show(activity));
        }
        return Unit.INSTANCE;
    }
}
