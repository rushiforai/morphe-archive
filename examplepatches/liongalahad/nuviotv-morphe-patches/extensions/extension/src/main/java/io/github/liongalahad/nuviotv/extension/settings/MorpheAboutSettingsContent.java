package io.github.liongalahad.nuviotv.extension.settings;

import kotlin.Unit;
import kotlin.jvm.functions.Function3;

/** Global Morphe build information shown at the end of the settings pane. */
public final class MorpheAboutSettingsContent implements Function3<Object, Object, Object, Unit> {
    private final Object modifier;

    private MorpheAboutSettingsContent(Object modifier) {
        this.modifier = modifier;
    }

    static Function3<Object, Object, Object, Unit> create(Object modifier) {
        return new MorpheAboutSettingsContent(modifier);
    }

    @Override
    public Unit invoke(Object ignoredScope, Object composer, Object flags) {
        if (!MorpheSettingsRows.beginComposition(composer, flags)) return Unit.INSTANCE;
        MorpheSettingsRows.selectorRow(
                modifier,
                composer,
                "Morphe Patches " + MorpheBuildInfo.version(),
                "By " + MorpheBuildInfo.author() + " · Open GitHub repository",
                MorpheOpenRepositoryAction.create()
        );
        return Unit.INSTANCE;
    }
}
