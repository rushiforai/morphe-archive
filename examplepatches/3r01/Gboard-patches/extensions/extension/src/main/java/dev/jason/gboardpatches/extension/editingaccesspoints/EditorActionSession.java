package dev.jason.gboardpatches.extension.editingaccesspoints;

import android.view.inputmethod.InputConnection;
import java.lang.ref.WeakReference;

/** No connection is retained across clicks. All production calls run on the IME main thread. */
public final class EditorActionSession {
    public interface Editor {
        InputConnection connection();
    }

    private WeakReference<Editor> active = new WeakReference<>(null);
    private long generation;

    public void begin(Editor editor) {
        generation++;
        active = new WeakReference<>(editor);
    }

    public void end() {
        generation++;
        active.clear();
    }

    private static boolean canDispatch(InputConnection connection, EditorAction action) {
        if (connection == null) return false;
        if (action != EditorAction.COPY && action != EditorAction.CUT) return true;
        CharSequence selection = connection.getSelectedText(0);
        return selection != null && selection.length() > 0;
    }

    public boolean execute(EditorAction action) {
        Editor editor = active.get();
        long expectedGeneration = generation;
        if (editor == null || action == null) {
            return false;
        }
        try {
            InputConnection connection = editor.connection();
            if (!canDispatch(connection, action)) {
                return false;
            }
            // A selection read can cross an editor callback. Never dispatch into a replaced session.
            if (generation != expectedGeneration || active.get() != editor
                    || editor.connection() != connection) {
                return false;
            }
            return connection.performContextMenuAction(action.contextMenuId);
        } catch (Throwable ignored) {
            return false;
        }
    }
}
