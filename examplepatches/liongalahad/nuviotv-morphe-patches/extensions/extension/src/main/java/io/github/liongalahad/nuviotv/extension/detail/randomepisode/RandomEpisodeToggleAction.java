package io.github.liongalahad.nuviotv.extension.detail.randomepisode;

import io.github.liongalahad.nuviotv.extension.settings.MorpheSettingsUi;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;

/** Settings action owned by Random Episode. */
public final class RandomEpisodeToggleAction implements Function0<Unit> {
    private RandomEpisodeToggleAction() {}
    public static Function0<Unit> create() { return new RandomEpisodeToggleAction(); }
    @Override public Unit invoke() {
        RandomEpisodeSettings.toggle();
        MorpheSettingsUi.refresh();
        return Unit.INSTANCE;
    }
}
