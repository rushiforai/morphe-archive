package io.github.liongalahad.nuviotv.extension.settings;

import kotlin.Unit;
import kotlin.jvm.functions.Function3;

/** One shared path row at the bottom of Playback, independent of optional consumers. */
public final class MorpheStorageSettingsContent implements Function3<Object, Object, Object, Unit> {
    private final Object modifier;

    private MorpheStorageSettingsContent(Object modifier) { this.modifier = modifier; }

    public static Function3<Object, Object, Object, Unit> create(Object modifier) {
        return new MorpheStorageSettingsContent(modifier);
    }

    @Override public Unit invoke(Object scope, Object composer, Object flags) {
        if (!MorpheSettingsUi.beginComposition(composer, flags)) return Unit.INSTANCE;
        boolean enabled = MorpheStorageConsumers.isAnyEnabled();
        MorpheSettingsUi.selectorRow(
                modifier,
                composer,
                "Local storage path",
                MorpheStoragePath.displayLabel(),
                enabled,
                enabled ? MorpheStorageFolderAction.INSTANCE : MorpheStorageFolderAction.DISABLED
        );
        return Unit.INSTANCE;
    }
}
