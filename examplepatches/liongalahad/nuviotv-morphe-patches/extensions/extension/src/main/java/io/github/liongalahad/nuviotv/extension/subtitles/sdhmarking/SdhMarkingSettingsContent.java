package io.github.liongalahad.nuviotv.extension.subtitles.sdhmarking;

import io.github.liongalahad.nuviotv.extension.settings.MorpheSdhMarkingToggleAction;
import io.github.liongalahad.nuviotv.extension.settings.MorpheSettingsRuntime;
import io.github.liongalahad.nuviotv.extension.settings.MorpheSettingsUi;
import kotlin.Unit;
import kotlin.jvm.functions.Function3;

public final class SdhMarkingSettingsContent implements Function3<Object, Object, Object, Unit> {
    private final Object modifier;
    private SdhMarkingSettingsContent(Object modifier) { this.modifier = modifier; }
    public static Function3<Object, Object, Object, Unit> create(Object modifier) {
        return new SdhMarkingSettingsContent(modifier);
    }
    @Override public Unit invoke(Object scope, Object composer, Object flags) {
        if (!MorpheSettingsUi.beginComposition(composer, flags)) return Unit.INSTANCE;
        MorpheSettingsUi.switchRow(modifier, composer,
                MorpheSettingsRuntime.sdhMarkingTitle(),
                MorpheSettingsRuntime.sdhMarkingDescription(),
                MorpheSettingsRuntime.isSdhMarkingEnabled(),
                MorpheSdhMarkingToggleAction.create());
        return Unit.INSTANCE;
    }
}
