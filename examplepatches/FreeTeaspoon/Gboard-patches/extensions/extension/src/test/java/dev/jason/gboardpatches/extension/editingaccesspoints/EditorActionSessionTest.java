package dev.jason.gboardpatches.extension.editingaccesspoints;

import android.view.inputmethod.InputConnection;
import java.lang.reflect.Proxy;
import java.util.concurrent.atomic.AtomicInteger;
import org.junit.Test;
import static org.junit.Assert.*;

public class EditorActionSessionTest {
    private final AtomicInteger calls = new AtomicInteger();
    private final AtomicInteger last = new AtomicInteger();

    private InputConnection connection(String selected, boolean accepted, Runnable onSelection) {
        return (InputConnection) Proxy.newProxyInstance(getClass().getClassLoader(),
                new Class<?>[] {InputConnection.class}, (proxy, method, args) -> {
                    if (method.getName().equals("getSelectedText")) {
                        if (onSelection != null) onSelection.run();
                        return selected;
                    }
                    if (method.getName().equals("performContextMenuAction")) {
                        calls.incrementAndGet();
                        last.set((Integer) args[0]);
                        return accepted;
                    }
                    if (method.getReturnType() == boolean.class) return false;
                    if (method.getReturnType() == int.class) return 0;
                    return null;
                });
    }

    @Test public void dispatchesEachActionExactlyOnce() {
        for (EditorAction action : EditorAction.values()) {
            EditorActionSession session = new EditorActionSession();
            InputConnection connection = connection("文字 text", true, null);
            EditorActionSession.Editor editor = () -> connection;
            session.begin(editor);
            int before = calls.get();
            assertTrue(session.execute(action));
            assertEquals(before + 1, calls.get());
            assertEquals(action.contextMenuId, last.get());
        }
    }

    @Test public void copyAndCutRejectEmptyButAllowWhitespace() {
        for (EditorAction action : new EditorAction[] {EditorAction.COPY, EditorAction.CUT}) {
            for (String selected : new String[] {null, "", " "}) {
                EditorActionSession session = new EditorActionSession();
                InputConnection connection = connection(selected, true, null);
                EditorActionSession.Editor editor = () -> connection;
                session.begin(editor);
                assertEquals(" ".equals(selected), session.execute(action));
            }
        }
        assertEquals(2, calls.get());
    }

    @Test public void hiddenAndReplacedSessionsCannotDispatch() {
        EditorActionSession session = new EditorActionSession();
        InputConnection connection = connection("selected", true, session::end);
        EditorActionSession.Editor editor = () -> connection;
        session.begin(editor);
        assertFalse(session.execute(EditorAction.CUT));
        assertFalse(session.execute(EditorAction.PASTE));
        assertEquals(0, calls.get());
    }

    @Test public void obtainsNewConnectionOnEveryClick() {
        EditorActionSession session = new EditorActionSession();
        InputConnection[] current = {connection("", false, null)};
        EditorActionSession.Editor editor = () -> current[0];
        session.begin(editor);
        assertFalse(session.execute(EditorAction.PASTE));
        current[0] = connection("", true, null);
        assertTrue(session.execute(EditorAction.PASTE));
        current[0] = null;
        assertFalse(session.execute(EditorAction.PASTE));
        assertEquals(2, calls.get());
    }

    @Test public void connectionChangeDuringSelectionRejectsCut() {
        EditorActionSession session = new EditorActionSession();
        InputConnection[] current = new InputConnection[1];
        current[0] = connection("text", true,
                () -> current[0] = connection("other", true, null));
        EditorActionSession.Editor editor = () -> current[0];
        session.begin(editor);
        assertFalse(session.execute(EditorAction.CUT));
        assertEquals(0, calls.get());
    }

    @Test public void editorFailureIsContained() {
        EditorActionSession session = new EditorActionSession();
        EditorActionSession.Editor editor = () -> { throw new IllegalStateException(); };
        session.begin(editor);
        assertFalse(session.execute(EditorAction.SELECT_ALL));
    }
}
