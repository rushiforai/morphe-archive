package io.github.liongalahad.nuviotv.extension.playback.bingenextepisode;

import io.github.liongalahad.nuviotv.extension.settings.MorpheSettingsUi;
import kotlin.Unit;
import kotlin.jvm.functions.Function3;

/** Native settings row owned by Binge Group Manual Fallback. */
public final class BingeGroupManualFallbackSettingsContent implements Function3<Object, Object, Object, Unit> {
    private final Object modifier;

    private BingeGroupManualFallbackSettingsContent(Object modifier) { this.modifier = modifier; }

    public static Function3<Object, Object, Object, Unit> create(Object modifier) {
        return new BingeGroupManualFallbackSettingsContent(modifier);
    }

    @Override public Unit invoke(Object ignoredScope, Object composer, Object flags) {
        if (!MorpheSettingsUi.beginComposition(composer, flags)) return Unit.INSTANCE;
        MorpheSettingsUi.switchRow(
                modifier, composer, BingeGroupManualFallbackSettings.TITLE,
                BingeGroupManualFallbackSettings.DESCRIPTION,
                BingeGroupManualFallbackSettings.isEnabled(),
                BingeGroupManualFallbackToggleAction.create()
        );
        return Unit.INSTANCE;
    }
}
