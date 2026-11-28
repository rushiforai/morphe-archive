package app.ayufa.extension.simeji;

import android.content.Context;
import android.content.ContextWrapper;
import android.inputmethodservice.InputMethodService;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.inputmethod.InputConnection;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Collections;
import java.util.Set;
import java.util.WeakHashMap;

/**
 * Gives the cursor-move control-panel item its drag behaviour.
 * Called from the patched {@code BaseLauncher.attachLauncher},
 * which (re)builds the panel's button row every time the panel
 * attaches: the item itself is a stock icon view built from
 * {@link CursorPadProvider} by the stock code, so all that is left
 * to do here is find that view (its tag is the provider) and attach
 * a touch listener to it.
 *
 * <p>The hook sits at the very start of attachLauncher, where the
 * register holding the launcher is still intact, so the work is
 * posted to the view's message queue and runs after the row has
 * been built (the same pattern as {@link SimejiSettingsEntry}).
 *
 * <p>While the item is held, sliding a finger left or right moves
 * the text cursor by one character per step, mirroring the cursor
 * key of Simeji for iPhone. A plain tap keeps the stock click
 * behaviour (the provider's onLaunch is a no-op). Movement goes
 * through the IME service's own {@code sendDownUpKeyEvents} with
 * the DPAD left/right key codes — exactly how stock Simeji's plus
 * connector implements {@code moveCursorLeft}/{@code moveCursorRight}
 * for mushroom apps — so during Japanese conversion the gesture
 * moves the conversion clause, just like a hardware arrow key.
 *
 * <p>All Simeji classes are reached reflectively, like the rest of
 * the extension, so nothing here depends on the host app at compile
 * time. Every entry point is guarded: a failure anywhere simply
 * leaves the stock panel unchanged.
 */
public final class CursorPad {

    /** Horizontal slide distance that moves the cursor one character. */
    private static final float STEP_DP = 10.0f;

    private static final Set<View> sInstalled =
            Collections.newSetFromMap(new WeakHashMap<View, Boolean>());
    private static Object cachedService;

    private CursorPad() {
    }

    public static void attach(final View launcher) {
        if (launcher == null) {
            return;
        }
        launcher.post(new Runnable() {
            @Override
            public void run() {
                installDragListeners(launcher);
            }
        });
    }

    private static void installDragListeners(View launcher) {
        try {
            if (!(launcher instanceof ViewGroup)) {
                return;
            }
            ViewGroup bar = (ViewGroup) launcher;
            for (int i = 0; i < bar.getChildCount(); i++) {
                View child = bar.getChildAt(i);
                if (!CursorPadProvider.isCursorPad(child.getTag())) {
                    continue;
                }
                synchronized (sInstalled) {
                    if (sInstalled.contains(child)) {
                        continue;
                    }
                    sInstalled.add(child);
                }
                child.setOnTouchListener(new DragListener());
            }
        } catch (Throwable ignored) {
            // Never break the stock control panel.
        }
    }

    /**
     * Drag handling for one icon view. The listener consumes the
     * gesture from ACTION_DOWN on: with web search fields the stock
     * pass-through handling lost vertical-tilting drags to the
     * surrounding containers, which dismissed the keyboard
     * mid-slide. A plain tap is replayed as a click on release, so
     * the stock click behaviour (the provider's onLaunch) is kept;
     * a recognised drag never produces a click.
     */
    private static final class DragListener implements View.OnTouchListener {

        private float downRawX;
        private int sentSteps;
        private boolean dragging;

        @Override
        public boolean onTouch(View view, MotionEvent event) {
            switch (event.getActionMasked()) {
                case MotionEvent.ACTION_DOWN:
                    downRawX = event.getRawX();
                    sentSteps = 0;
                    dragging = false;
                    disallowIntercept(view);
                    return true;
                case MotionEvent.ACTION_MOVE:
                    disallowIntercept(view);
                    float dx = event.getRawX() - downRawX;
                    if (!dragging) {
                        int slop = ViewConfiguration.get(view.getContext())
                                .getScaledTouchSlop();
                        if (Math.abs(dx) <= slop) {
                            return true;
                        }
                        dragging = true;
                        view.setPressed(false);
                    }
                    float stepPx = STEP_DP
                            * view.getResources().getDisplayMetrics().density;
                    int steps = (int) (dx / stepPx);
                    int delta = steps - sentSteps;
                    if (delta != 0) {
                        moveCursor(view.getContext(), delta);
                        sentSteps = steps;
                    }
                    return true;
                case MotionEvent.ACTION_UP:
                    boolean wasDragging = dragging;
                    dragging = false;
                    if (!wasDragging) {
                        view.performClick();
                    }
                    return true;
                case MotionEvent.ACTION_CANCEL:
                    dragging = false;
                    return true;
                default:
                    return true;
            }
        }

        private static void disallowIntercept(View view) {
            if (view.getParent() != null) {
                view.getParent()
                        .requestDisallowInterceptTouchEvent(true);
            }
        }
    }

    private static void moveCursor(Context context, int delta) {
        Object service = resolveService(context);
        if (service == null) {
            return;
        }
        int keyCode = delta > 0
                ? KeyEvent.KEYCODE_DPAD_RIGHT
                : KeyEvent.KEYCODE_DPAD_LEFT;
        int count = Math.abs(delta);
        for (int i = 0; i < count; i++) {
            if (!canMove(service, keyCode)) {
                // Already at the edge of the text: an extra arrow
                // key would leave the field in some editors (web
                // search boxes drop the keyboard when the caret is
                // pushed past the start), so send nothing.
                return;
            }
            if (!sendDownUp(service, keyCode)) {
                return;
            }
        }
    }

    /**
     * Whether one more arrow key in the given direction can still
     * move the caret. A selection always counts as movable (the key
     * collapses it), and any doubt — no connection, an editor that
     * reports nothing, a composing state — also sends, matching the
     * stock behaviour; only a positively empty side of the caret
     * blocks the key.
     */
    private static boolean canMove(Object service, int keyCode) {
        try {
            Object connection = service.getClass()
                    .getMethod("getCurrentInputConnection").invoke(service);
            if (!(connection instanceof InputConnection)) {
                return true;
            }
            InputConnection inputConnection = (InputConnection) connection;
            CharSequence selected = inputConnection.getSelectedText(0);
            if (selected != null && selected.length() > 0) {
                return true;
            }
            CharSequence side = keyCode == KeyEvent.KEYCODE_DPAD_LEFT
                    ? inputConnection.getTextBeforeCursor(1, 0)
                    : inputConnection.getTextAfterCursor(1, 0);
            return side == null || side.length() > 0;
        } catch (Throwable ignored) {
            return true;
        }
    }

    /**
     * Sends one key press the way the IME service itself does. The
     * reflective call mirrors {@code OpenWnn}'s plus connector; if
     * it is unavailable, explicit key events on the current input
     * connection are the fallback.
     */
    private static boolean sendDownUp(Object service, int keyCode) {
        try {
            Method method = service.getClass()
                    .getMethod("sendDownUpKeyEvents", int.class);
            method.invoke(service, keyCode);
            return true;
        } catch (Throwable ignored) {
            // Try the input connection directly.
        }
        try {
            Object connection = service.getClass()
                    .getMethod("getCurrentInputConnection").invoke(service);
            if (connection instanceof InputConnection) {
                InputConnection inputConnection = (InputConnection) connection;
                inputConnection.sendKeyEvent(
                        new KeyEvent(KeyEvent.ACTION_DOWN, keyCode));
                inputConnection.sendKeyEvent(
                        new KeyEvent(KeyEvent.ACTION_UP, keyCode));
                return true;
            }
        } catch (Throwable ignored) {
            // No way to move the cursor right now.
        }
        return false;
    }

    /**
     * The IME service behind the panel views: unwraps the view's
     * context first (IME views are created with the service as their
     * context, possibly under theme wrappers), then falls back to
     * the app's router service, whose getIME() returns the IME.
     */
    private static Object resolveService(Context context) {
        if (cachedService != null) {
            return cachedService;
        }
        Object found = unwrapService(context);
        if (found == null) {
            found = routerService();
        }
        if (found != null) {
            cachedService = found;
        }
        return found;
    }

    private static Object unwrapService(Context context) {
        Context current = context;
        while (current != null) {
            if (current instanceof InputMethodService) {
                return current;
            }
            if (!(current instanceof ContextWrapper)) {
                return null;
            }
            Context base = ((ContextWrapper) current).getBaseContext();
            if (base == null || base == current) {
                return null;
            }
            current = base;
        }
        return null;
    }

    private static Object routerService() {
        try {
            Class<?> routerServices =
                    Class.forName("com.baidu.simeji.base.router.RouterServices");
            Field field = routerServices.getField("sSimejiIMERouter");
            Object imeRouter = field.get(null);
            if (imeRouter == null) {
                return null;
            }
            Object ime = imeRouter.getClass().getMethod("getIME").invoke(imeRouter);
            return ime instanceof InputMethodService ? ime : null;
        } catch (Throwable ignored) {
            return null;
        }
    }
}
