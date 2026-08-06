package io.github.liongalahad.nuviotv.extension.settings;

import android.app.Activity;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;

/** Opens the three-choice Episode Ratings selector over Nuvio's settings pane. */
@SuppressWarnings("unused")
public final class MorpheEpisodeRatingsDialogAction implements Function0<Unit> {
    private MorpheEpisodeRatingsDialogAction() {}
    public static Function0<Unit> create() { return new MorpheEpisodeRatingsDialogAction(); }
    @Override public Unit invoke() {
        Activity activity = MorpheSettingsRuntime.resumedActivity();
        if (activity != null) activity.runOnUiThread(() -> MorpheEpisodeRatingsDialog.show(activity));
        return Unit.INSTANCE;
    }
}
