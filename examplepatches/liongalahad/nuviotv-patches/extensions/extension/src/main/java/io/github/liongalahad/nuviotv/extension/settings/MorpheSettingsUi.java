package io.github.liongalahad.nuviotv.extension.settings;

import android.app.Activity;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function3;

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

    /** Generic nested settings section using the same expandable card as top-level categories. */
    public static void nestedSection(
            Object composer,
            String title,
            String description,
            boolean initiallyExpanded,
            Function3<Object, Object, Object, Unit> content
    ) {
        Object expanded = MorpheSettingsRows.rememberBooleanState(composer, initiallyExpanded);
        Object focus = MorpheSettingsRows.rememberFocusRequester(composer);
        MorpheSettingsRows.collapsibleSection(
                composer,
                title,
                description,
                MorpheSettingsRows.booleanStateValue(expanded),
                MorpheSettingsRows.booleanStateToggle(expanded),
                focus,
                noOp(),
                content
        );
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
