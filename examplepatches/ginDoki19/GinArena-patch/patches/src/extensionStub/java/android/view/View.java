package android.view;
import android.content.Context;
import android.graphics.drawable.Drawable;
public class View {
    public Context getContext() { throw new RuntimeException(); }
    public int getId() { throw new RuntimeException(); }
    public Drawable getBackground() { throw new RuntimeException(); }
    public void setBackgroundColor(int color) {}
    public void setSystemUiVisibility(int visibility) {}
    public int getSystemUiVisibility() { throw new RuntimeException(); }
    public boolean post(Runnable action) { throw new RuntimeException(); }
    /** laid-out width in px; 0 before the first layout pass, same as the real View */
    public int getWidth() { throw new RuntimeException(); }
    /** laid-out height in px; 0 before the first layout pass */
    public int getHeight() { throw new RuntimeException(); }
    public void setOnLongClickListener(OnLongClickListener l) {}
    public void setLongClickable(boolean longClickable) {}
    public void setClickable(boolean clickable) {}
    public void setOnKeyListener(OnKeyListener l) {}
    public void setOnTouchListener(OnTouchListener l) {}
    public boolean requestFocus() { throw new RuntimeException(); }
    public boolean isFocused() { throw new RuntimeException(); }
    public boolean isFocusable() { throw new RuntimeException(); }
    public void setFocusable(boolean focusable) {}
    public void addOnLayoutChangeListener(OnLayoutChangeListener listener) {}
    public void removeOnLayoutChangeListener(OnLayoutChangeListener listener) {}
    public boolean isLayoutRequested() { throw new RuntimeException(); }
    /** the view's parent (the grid a card sits in); null before it is attached */
    public ViewParent getParent() { throw new RuntimeException(); }
    /** top edge in px, relative to the parent; 0 before layout */
    public int getTop() { throw new RuntimeException(); }
    /** true when this view is attached to a window and can take focus */
    public boolean isAttachedToWindow() { throw new RuntimeException(); }
    /** direction: negative = up/left, positive = down/right. True when there is somewhere to go. */
    public boolean canScrollVertically(int direction) { throw new RuntimeException(); }
    /**
     * NOT STUBBED ON PURPOSE.
     *
     * computeVerticalScrollOffset() is PROTECTED on the real android.view.View. Declaring it public
     * here made the extension compile and then fail on a device with:
     *
     *   IllegalAccessError: Method 'int android.view.View.computeVerticalScrollOffset()'
     *   is inaccessible to class 'app.template.extension.playfy.Pins'
     *
     * Stages 12-14 called it from inside catch(Throwable) and were silent no-ops for four rounds.
     * A stub that is more permissive than the framework is worse than no stub at all.
     */
    /** scroll the viewport by a delta, in px */
    public void scrollBy(int x, int y) { throw new RuntimeException(); }
    /** PUBLIC on the real View - how far this view's content has been scrolled vertically */
    public int getScrollY() { throw new RuntimeException(); }
    /** run a runnable after a delay, on this view's handler */
    public boolean postDelayed(Runnable action, long delayMillis) { throw new RuntimeException(); }
    public interface OnLongClickListener {
        boolean onLongClick(View v);
    }
    public interface OnKeyListener {
        boolean onKey(View v, int keyCode, KeyEvent event);
    }
    public interface OnTouchListener {
        boolean onTouch(View v, MotionEvent event);
    }
    public interface OnLayoutChangeListener {
        void onLayoutChange(View v, int left, int top, int right, int bottom,
                            int oldLeft, int oldTop, int oldRight, int oldBottom);
    }
}
