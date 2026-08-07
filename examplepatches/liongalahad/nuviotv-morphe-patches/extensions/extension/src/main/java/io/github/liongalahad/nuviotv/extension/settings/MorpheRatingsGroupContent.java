package io.github.liongalahad.nuviotv.extension.settings;

import kotlin.Unit;
import kotlin.jvm.functions.Function3;

/** Dedicated native-group renderer so Ratings keeps stable Compose slots as drawers move. */
@SuppressWarnings("unused")
public final class MorpheRatingsGroupContent implements Function3<Object, Object, Object, Unit> {
    private final Object modifier;

    private MorpheRatingsGroupContent(Object modifier) {
        this.modifier = modifier;
    }

    public static Function3<Object, Object, Object, Unit> create(Object modifier) {
        return new MorpheRatingsGroupContent(modifier);
    }

    @Override
    public Unit invoke(Object ignoredScope, Object composer, Object ignoredFlags) {
        if (!MorpheSettingsRows.beginComposition(composer, ignoredFlags)) return Unit.INSTANCE;
        MorpheSettingsRows.switchRow(
                modifier,
                composer,
                MorpheSettingsRuntime.overallRatingsTitle(),
                MorpheSettingsRuntime.overallRatingsDescription(),
                MorpheSettingsRuntime.isOverallRatingsShown(),
                MorpheOverallRatingsToggleAction.create()
        );
        MorpheSettingsRows.selectorRow(
                modifier,
                composer,
                MorpheSettingsRuntime.episodeRatingsTitle(),
                MorpheSettingsRuntime.currentEpisodeRatingsTitle(),
                MorpheEpisodeRatingsDialogAction.create()
        );
        return Unit.INSTANCE;
    }
}
