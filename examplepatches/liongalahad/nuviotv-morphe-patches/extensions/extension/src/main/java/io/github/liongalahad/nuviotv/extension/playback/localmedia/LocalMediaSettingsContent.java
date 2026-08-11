package io.github.liongalahad.nuviotv.extension.playback.localmedia;

import io.github.liongalahad.nuviotv.extension.settings.MorpheSettingsUi;
import kotlin.Unit;
import kotlin.jvm.functions.Function3;

/** Native Morphe settings content owned by Local Media. */
public final class LocalMediaSettingsContent implements Function3<Object, Object, Object, Unit> {
    private final Object modifier;

    private LocalMediaSettingsContent(Object modifier) {
        this.modifier = modifier;
    }

    public static Function3<Object, Object, Object, Unit> create(Object modifier) {
        return new LocalMediaSettingsContent(modifier);
    }

    @Override public Unit invoke(Object scope, Object composer, Object flags) {
        if (!MorpheSettingsUi.beginComposition(composer, flags)) return Unit.INSTANCE;
        MorpheSettingsUi.nestedSection(
                composer,
                "Local Storage",
                "Browse and play video files stored on this device",
                true,
                (innerScope, innerComposer, innerFlags) -> {
                    if (!MorpheSettingsUi.beginComposition(innerComposer, innerFlags)) {
                        return Unit.INSTANCE;
                    }
                    MorpheSettingsUi.switchRow(
                            modifier,
                            innerComposer,
                            "Show local storage in Library",
                            "Add Storage beside Saved and Cloud. Access is requested when enabled.",
                            LocalMediaRuntime.isEnabled(),
                            LocalMediaToggleAction.create()
                    );
                    MorpheSettingsUi.selectorRow(
                            modifier,
                            innerComposer,
                            "Folder location",
                            LocalMediaRuntime.folderDisplayLabel(),
                            LocalMediaFolderAction.create()
                    );
                    return Unit.INSTANCE;
                }
        );
        return Unit.INSTANCE;
    }
}
