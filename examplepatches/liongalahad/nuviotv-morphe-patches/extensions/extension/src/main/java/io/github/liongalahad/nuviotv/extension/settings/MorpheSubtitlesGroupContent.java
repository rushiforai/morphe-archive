package io.github.liongalahad.nuviotv.extension.settings;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function3;

/** Dedicated native-group renderer so Ratings and Subtitles never share Compose slots. */
@SuppressWarnings("unused")
public final class MorpheSubtitlesGroupContent implements Function3<Object, Object, Object, Unit> {
    private static final String SDH_MARKING_ACTION_CLASS =
            "io.github.liongalahad.nuviotv.extension.settings.MorpheSdhMarkingToggleAction";

    private final Object modifier;

    private MorpheSubtitlesGroupContent(Object modifier) {
        this.modifier = modifier;
    }

    public static Function3<Object, Object, Object, Unit> create(Object modifier) {
        return new MorpheSubtitlesGroupContent(modifier);
    }

    @Override
    public Unit invoke(Object ignoredScope, Object composer, Object ignoredFlags) {
        if (!MorpheSettingsRows.beginComposition(composer, ignoredFlags)) return Unit.INSTANCE;
        if (MorpheSettingsRuntime.hasSdhMarkingFeature()) {
            invokeSdhMarkingSwitch(composer);
        }
        if (MorpheSettingsRuntime.hasRemoveSdhFeature()) {
            MorpheSettingsRows.selectorRow(
                    modifier,
                    composer,
                    MorpheSettingsRuntime.sdhDialogTitle(),
                    MorpheSettingsRuntime.currentSdhModeTitle(),
                    MorpheSdhModeDialogAction.create()
            );
        }
        return Unit.INSTANCE;
    }

    private void invokeSdhMarkingSwitch(Object composer) {
        try {
            ClassLoader loader = composer.getClass().getClassLoader();
            Class<?> actionClass = Class.forName(SDH_MARKING_ACTION_CLASS, false, loader);
            Function0<?> action = (Function0<?>) actionClass.getMethod("create").invoke(null);
            MorpheSettingsRows.switchRow(
                    modifier,
                    composer,
                    MorpheSettingsRuntime.sdhMarkingTitle(),
                    MorpheSettingsRuntime.sdhMarkingDescription(),
                    MorpheSettingsRuntime.isSdhMarkingEnabled(),
                    action
            );
        } catch (ReflectiveOperationException error) {
            throw new IllegalStateException("Unable to render the native SDH marking row", error);
        }
    }
}
