package io.github.liongalahad.nuviotv.extension.subtitles.localstoragesubtitles;

import io.github.liongalahad.nuviotv.extension.settings.MorpheSettingsUi;
import kotlin.Unit;
import kotlin.jvm.functions.Function3;

/** Native switch content owned by this optional patch. */
public final class LocalSubtitleSettingsContent implements Function3<Object, Object, Object, Unit> {
    private final Object modifier;

    private LocalSubtitleSettingsContent(Object modifier) {
        this.modifier = modifier;
    }

    public static Function3<Object, Object, Object, Unit> create(Object modifier) {
        return new LocalSubtitleSettingsContent(modifier);
    }

    @Override public Unit invoke(Object scope, Object composer, Object flags) {
        if (!MorpheSettingsUi.beginComposition(composer, flags)) return Unit.INSTANCE;
        MorpheSettingsUi.switchRow(
                modifier,
                composer,
                "Allow Importing Subs from Local Storage",
                "Show Local Storage in ExoPlayer's subtitle menu.",
                LocalSubtitleRuntime.isFeatureEnabled(),
                LocalSubtitleSettingsToggleAction.create()
        );
        return Unit.INSTANCE;
    }
}
