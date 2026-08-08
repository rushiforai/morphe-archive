package io.github.liongalahad.nuviotv.extension.subtitles.sdh;

import io.github.liongalahad.nuviotv.extension.settings.MorpheSdhModeDialogAction;
import io.github.liongalahad.nuviotv.extension.settings.MorpheSettingsRuntime;
import io.github.liongalahad.nuviotv.extension.settings.MorpheSettingsUi;
import kotlin.Unit;
import kotlin.jvm.functions.Function3;

public final class RemoveSdhSettingsContent implements Function3<Object, Object, Object, Unit> {
    private final Object modifier;
    private RemoveSdhSettingsContent(Object modifier) { this.modifier = modifier; }
    public static Function3<Object, Object, Object, Unit> create(Object modifier) {
        return new RemoveSdhSettingsContent(modifier);
    }
    @Override public Unit invoke(Object scope, Object composer, Object flags) {
        if (!MorpheSettingsUi.beginComposition(composer, flags)) return Unit.INSTANCE;
        MorpheSettingsUi.selectorRow(modifier, composer,
                MorpheSettingsRuntime.sdhDialogTitle(),
                MorpheSettingsRuntime.currentSdhModeTitle(),
                MorpheSdhModeDialogAction.create());
        return Unit.INSTANCE;
    }
}
