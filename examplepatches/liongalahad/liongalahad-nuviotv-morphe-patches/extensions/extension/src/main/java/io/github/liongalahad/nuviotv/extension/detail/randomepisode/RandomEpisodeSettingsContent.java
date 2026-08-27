package io.github.liongalahad.nuviotv.extension.detail.randomepisode;

import io.github.liongalahad.nuviotv.extension.settings.MorpheSettingsUi;
import kotlin.Unit;
import kotlin.jvm.functions.Function3;

/** Native settings row owned by Random Episode. */
public final class RandomEpisodeSettingsContent implements Function3<Object, Object, Object, Unit> {
    private final Object modifier;

    private RandomEpisodeSettingsContent(Object modifier) { this.modifier = modifier; }

    public static Function3<Object, Object, Object, Unit> create(Object modifier) {
        return new RandomEpisodeSettingsContent(modifier);
    }

    @Override public Unit invoke(Object ignoredScope, Object composer, Object flags) {
        if (!MorpheSettingsUi.beginComposition(composer, flags)) return Unit.INSTANCE;
        MorpheSettingsUi.switchRow(
                modifier, composer, RandomEpisodeSettings.TITLE, RandomEpisodeSettings.DESCRIPTION,
                RandomEpisodeSettings.isEnabled(), RandomEpisodeToggleAction.create()
        );
        return Unit.INSTANCE;
    }
}
