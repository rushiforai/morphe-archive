package app.morphe.extension.chmate;

import android.text.method.MovementMethod;
import android.view.MotionEvent;
import android.view.ActionMode;
import android.view.View;
import android.view.ViewConfiguration;
import android.widget.TextView;
import java.lang.reflect.Method;
import java.util.WeakHashMap;

/** Opt-in framework selection on response bodies, never headers or editing fields. */
public final class DirectBodySelection {
    private static final WeakHashMap<TextView, State> STATES = new WeakHashMap<>();
    private static final java.util.regex.Pattern ANCHOR = java.util.regex.Pattern.compile(
            "(?:>>|＞＞|≫)[0-9０-９]+(?:[-－,，][0-9０-９]+)*");
    private DirectBodySelection() {}

    /** Preserve native listeners, but let TextView's own selection handle an opt-in long press. */
    public static View.OnLongClickListener longClickListener(Object object, View.OnLongClickListener nativeListener) {
        if (nativeListener == null || !isBody(object)) return nativeListener;
        // Rebinding can hand our current listener back through the native setter.
        // Do not grow a chain of wrappers on every response bind.
        return nativeListener instanceof SelectionLongClick ? nativeListener : new SelectionLongClick(nativeListener);
    }

    private static final class SelectionLongClick implements View.OnLongClickListener {
        private final View.OnLongClickListener nativeListener;
        private boolean running;
        SelectionLongClick(View.OnLongClickListener listener){nativeListener=listener;}
        public boolean onLongClick(View view){
            if(running)return true;
            running=true;
            try{return selectionContext(view)?false:nativeListener.onLongClick(view);}
            finally{running=false;}
        }
    }

    /** Anchor gestures retain ChMate's own long-press context dispatch. */
    public static boolean selectionContext(Object object) {
        if (!prepare(object)) return false;
        State state = STATES.get((TextView)object);
        return state != null && !state.nativeAnchor;
    }

    private static final class State {
        final boolean selectable, focusable, touchFocusable, clickable, longClickable;
        final MovementMethod movement;
        final ActionMode.Callback selectionCallback;
        final Method nativeDispatch;
        MotionEvent down;
        boolean moved, selectedAtDown, nativeAnchor, preparing, dispatching;
        State(TextView view) throws ReflectiveOperationException {
            selectable = view.isTextSelectable();
            focusable = view.isFocusable();
            touchFocusable = view.isFocusableInTouchMode();
            clickable = view.isClickable();
            longClickable = view.isLongClickable();
            movement = view.getMovementMethod();
            selectionCallback = view.getCustomSelectionActionModeCallback();
            nativeDispatch = view.getClass().getMethod("haiagaruDirectSelectionNativeDispatch", MotionEvent.class);
        }
        void cancel() { if (down != null) { down.recycle(); down = null; } }
    }

    static boolean isBody(Object view) {
        if (!(view instanceof TextView)) return false;
        String name = view.getClass().getName();
        return name.equals("o.r8lambdaDC40CispcBM3LVwPP01tT_FjLc")
                || name.equals("o.setCornerTopRightRadius") || name.equals("o.zzbhp");
    }

    /** Called at binding, refresh and before touch, so recycled rows restore correctly. */
    public static boolean prepare(Object object) {
        if (!isBody(object)) return false;
        TextView view = (TextView) object;
        if (!Haiagaru.directBodySelectionEnabled()) {
            State previous = STATES.remove(view);
            if (previous != null) {
                previous.cancel();
                view.clearFocus();
                view.setTextIsSelectable(previous.selectable);
                view.setMovementMethod(previous.movement);
                view.setFocusable(previous.focusable);
                view.setFocusableInTouchMode(previous.touchFocusable);
                view.setClickable(previous.clickable);
                view.setLongClickable(previous.longClickable);
                view.setCustomSelectionActionModeCallback(previous.selectionCallback);
            }
            return false;
        }
        if (!STATES.containsKey(view)) {
            try { STATES.put(view, new State(view)); }
            catch (ReflectiveOperationException error) { return false; }
        }
        State current=STATES.get(view);
        if(current.preparing)return true;
        current.preparing=true;
        try{
        if (!view.isTextSelectable()) view.setTextIsSelectable(true);
        // Rebinding/native link dispatch can replace these even while selectable stays true.
        view.setFocusableInTouchMode(true);
        view.setLongClickable(true);
        if (!(view.getMovementMethod() instanceof android.text.method.ArrowKeyMovementMethod))
            view.setMovementMethod(android.text.method.ArrowKeyMovementMethod.getInstance());
        // ChMate 191's callback returns false from onCreateActionMode and posts
        // its native delayed deselection. Both prevent normal selection/Copy.
        // Use the platform callback while opted in, and restore ChMate's on opt-out.
        if (view.getCustomSelectionActionModeCallback() != null)
            view.setCustomSelectionActionModeCallback(null);
        return true;
        }finally{current.preparing=false;}
    }

    /** Bypass native delayed selection/menu dispatch only for the opt-in body. */
    public static boolean dispatch(TextView view, MotionEvent event) {
        State state = STATES.get(view);
        if (state == null) return false;
        if(state.dispatching)return true;
        state.dispatching=true;
        try{
        int action = event.getActionMasked();
        if (action == MotionEvent.ACTION_DOWN)
            state.nativeAnchor = Haiagaru.directCopyAnchorsEnabled() && !view.hasSelection() && anchorAt(view,event);
        if (state.nativeAnchor) {
            try {
                return Boolean.TRUE.equals(state.nativeDispatch.invoke(view,event));
            } catch (ReflectiveOperationException error) {
                android.util.Log.w("Haiagaru", "Cannot dispatch anchor gesture", error);
                return false;
            } finally {
                if(action==MotionEvent.ACTION_UP||action==MotionEvent.ACTION_CANCEL)state.nativeAnchor=false;
            }
        }
        if (action == MotionEvent.ACTION_DOWN) {
            state.cancel();
            state.down = MotionEvent.obtain(event);
            state.moved = false;
            state.selectedAtDown = view.hasSelection();
            // TextView selection must receive UP. Native row/list interception can
            // otherwise cancel the gesture after the long press, leaving only a magnifier.
            if (view.getParent() != null) view.getParent().requestDisallowInterceptTouchEvent(true);
        }
        if (state.down != null) {
            int slop = ViewConfiguration.get(view.getContext()).getScaledTouchSlop();
            if (Math.abs(event.getX() - state.down.getX()) > slop
                    || Math.abs(event.getY() - state.down.getY()) > slop
                    || event.getPointerCount() != 1) state.moved = true;
            // Ordinary vertical dragging still scrolls the thread. Keep interception
            // blocked only while starting/adjusting an actual text selection.
            if (state.moved && !state.selectedAtDown && !view.hasSelection()
                    && view.getParent() != null)
                view.getParent().requestDisallowInterceptTouchEvent(false);
            if (action == MotionEvent.ACTION_UP && !state.moved && !state.selectedAtDown
                    && !view.hasSelection()
                    && event.getEventTime() - state.down.getEventTime() < ViewConfiguration.getLongPressTimeout()) {
                // A short tap still uses ChMate's own URL/anchor/image dispatch.
                // Cancel framework handling before replay, avoiding duplicate URL launches.
                MotionEvent cancel = MotionEvent.obtain(event);
                cancel.setAction(MotionEvent.ACTION_CANCEL);
                view.onTouchEvent(cancel);
                cancel.recycle();
                try {
                    state.nativeDispatch.invoke(view, state.down);
                    state.nativeDispatch.invoke(view, event);
                } catch (ReflectiveOperationException error) {
                    android.util.Log.w("Haiagaru", "Cannot dispatch body tap", error);
                } finally { state.cancel(); }
                if (view.getParent() != null) view.getParent().requestDisallowInterceptTouchEvent(false);
                return true;
            }
        }
        // TextView handles word selection, draggable handles and the platform Copy menu.
        boolean retrySelection = action == MotionEvent.ACTION_UP && state.down != null
                && !state.moved && !state.selectedAtDown && !view.hasSelection()
                && event.getEventTime()-state.down.getEventTime() >= ViewConfiguration.getLongPressTimeout();
        view.onTouchEvent(event);
        // A recycled/rebound row can lose its scheduled framework long press. Retry only
        // when this stationary long press produced no selection, never during handle drags.
        if(retrySelection && !view.hasSelection())view.performLongClick();
        if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) {
            state.cancel();
            if (view.getParent() != null) view.getParent().requestDisallowInterceptTouchEvent(false);
        }
        return true;
        }finally{state.dispatching=false;}
    }

    private static boolean anchorAt(TextView view,MotionEvent event) {
        android.text.Layout layout=view.getLayout();CharSequence text=view.getText();
        if(layout==null||text==null)return false;
        float x=event.getX()-view.getTotalPaddingLeft()+view.getScrollX();
        float y=event.getY()-view.getTotalPaddingTop()+view.getScrollY();
        if(y<0||y>=layout.getHeight())return false;
        int line=layout.getLineForVertical((int)y);
        if(x<layout.getLineLeft(line)||x>layout.getLineRight(line))return false;
        int offset=layout.getOffsetForHorizontal(line,x);
        java.util.regex.Matcher match=ANCHOR.matcher(text);
        while(match.find())if(offset>=match.start()&&offset<match.end())return true;
        return false;
    }
}
