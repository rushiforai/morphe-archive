package io.github.liongalahad.nuviotv.extension.settings;

import android.app.Activity;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;

/** Public rendering facade available to isolated patch settings providers. */
public final class MorpheSettingsUi {
    private MorpheSettingsUi() {}

    public static boolean beginComposition(Object composer, Object flags) {
        return MorpheSettingsRows.beginComposition(composer, flags);
    }

    public static void switchRow(
            Object modifier,
            Object composer,
            String title,
            String description,
            boolean selected,
            Function0<?> action
    ) {
        MorpheSettingsRows.switchRow(modifier, composer, title, description, selected, action);
    }

    public static void selectorRow(
            Object modifier,
            Object composer,
            String title,
            String value,
            Function0<?> action
    ) {
        MorpheSettingsRows.selectorRow(modifier, composer, title, value, action);
    }

    public static void refresh() {
        MorpheComposeModeAction.refreshSettingsPane();
    }

    public static Activity resumedActivity() {
        return MorpheSettingsRuntime.resumedActivity();
    }

    public static Function0<Unit> noOp() {
        return () -> Unit.INSTANCE;
    }
}
