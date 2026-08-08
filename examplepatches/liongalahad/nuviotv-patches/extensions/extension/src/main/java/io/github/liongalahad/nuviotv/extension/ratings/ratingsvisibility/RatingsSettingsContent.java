package io.github.liongalahad.nuviotv.extension.ratings.ratingsvisibility;

import io.github.liongalahad.nuviotv.extension.settings.MorpheEpisodeRatingsDialogAction;
import io.github.liongalahad.nuviotv.extension.settings.MorpheOverallRatingsToggleAction;
import io.github.liongalahad.nuviotv.extension.settings.MorpheSettingsRuntime;
import io.github.liongalahad.nuviotv.extension.settings.MorpheSettingsUi;
import kotlin.Unit;
import kotlin.jvm.functions.Function3;

public final class RatingsSettingsContent implements Function3<Object, Object, Object, Unit> {
    private final Object modifier;
    private RatingsSettingsContent(Object modifier) { this.modifier = modifier; }
    public static Function3<Object, Object, Object, Unit> create(Object modifier) {
        return new RatingsSettingsContent(modifier);
    }
    @Override public Unit invoke(Object scope, Object composer, Object flags) {
        if (!MorpheSettingsUi.beginComposition(composer, flags)) return Unit.INSTANCE;
        MorpheSettingsUi.switchRow(modifier, composer,
                MorpheSettingsRuntime.overallRatingsTitle(),
                MorpheSettingsRuntime.overallRatingsDescription(),
                MorpheSettingsRuntime.isOverallRatingsShown(),
                MorpheOverallRatingsToggleAction.create());
        MorpheSettingsUi.selectorRow(modifier, composer,
                MorpheSettingsRuntime.episodeRatingsTitle(),
                MorpheSettingsRuntime.currentEpisodeRatingsTitle(),
                MorpheEpisodeRatingsDialogAction.create());
        return Unit.INSTANCE;
    }
}
