package io.github.liongalahad.nuviotv.extension.playback.sourceselectionrestore;

import io.github.liongalahad.nuviotv.extension.settings.MorpheSettingsUi;
import kotlin.Unit;
import kotlin.jvm.functions.Function3;

/** Native Morphe settings row owned by Restore Source Selection. */
public final class SourceSelectionRestoreSettingsContent
        implements Function3<Object, Object, Object, Unit> {
    private final Object modifier;

    private SourceSelectionRestoreSettingsContent(Object modifier) {
        this.modifier = modifier;
    }

    public static Function3<Object, Object, Object, Unit> create(Object modifier) {
        return new SourceSelectionRestoreSettingsContent(modifier);
    }

    @Override
    public Unit invoke(Object ignoredScope, Object composer, Object flags) {
        if (!MorpheSettingsUi.beginComposition(composer, flags)) return Unit.INSTANCE;
        MorpheSettingsUi.switchRow(
                modifier,
                composer,
                SourceSelectionRestoreSettings.TITLE,
                SourceSelectionRestoreSettings.DESCRIPTION,
                SourceSelectionRestoreSettings.isEnabled(),
                SourceSelectionRestoreToggleAction.create()
        );
        return Unit.INSTANCE;
    }
}
