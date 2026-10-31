package app.bitchord.telegram;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;

import java.lang.reflect.Method;

/**
 * Wraps the Sources screen's "edit source" callback. A tap on the Telegram row opens the Telegram
 * settings page; the generic editor would only show the internal add-on address. Every other source
 * still opens the editor.
 */
public final class SourceEditorRoute implements Function1<Object, Object> {
    private static volatile Method idGetter;
    private final Function1<Object, Object> editor;

    private SourceEditorRoute(Function1<Object, Object> editor) {
        this.editor = editor;
    }

    public static Function1<Object, Object> wrap(Function1<Object, Object> editor) {
        if (editor == null || editor instanceof SourceEditorRoute) return editor;
        return new SourceEditorRoute(editor);
    }

    @Override
    public Object invoke(Object config) {
        if (isTelegram(config)) {
            TelegramBridge.openSetup();
            return Unit.INSTANCE;
        }
        return editor.invoke(config);
    }

    static boolean isTelegram(Object config) {
        if (config == null) return false;
        try {
            Method getter = idGetter;
            if (getter == null || getter.getDeclaringClass() != config.getClass()) {
                getter = config.getClass().getMethod("getId");
                idGetter = getter;
            }
            return NativeSource.ID.equals(getter.invoke(config));
        } catch (ReflectiveOperationException e) {
            return false;
        }
    }

    // Compose compares callbacks with equals() to decide whether to rebuild the row's click
    // handler, so a fresh wrapper around the same callback must count as unchanged.
    @Override
    public boolean equals(Object other) {
        return other instanceof SourceEditorRoute
                && editor.equals(((SourceEditorRoute) other).editor);
    }

    @Override
    public int hashCode() {
        return editor.hashCode();
    }
}
