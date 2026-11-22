package android.view;

/**
 * Lab stub: the parts of a ViewGroup the grid measurement reads.
 *
 * The extension measures a row by looking at the card's parent: how many children it holds, what
 * each child's top is, and how wide the parent is. All of that is public framework API, so unlike
 * the field-name reflection this replaced, none of it can be obfuscated away.
 */
public abstract class ViewGroup extends View implements ViewParent {
    public static final int FOCUS_BEFORE_DESCENDANTS = 0x20000;
    public int getDescendantFocusability() { throw new RuntimeException(); }
    public void setDescendantFocusability(int focusability) {}
    public int getChildCount() { throw new RuntimeException(); }
    public View getChildAt(int index) { throw new RuntimeException(); }
    /**
     * Ask this container to make `child` visible. The framework scrolls the minimum needed, which is
     * what makes it safe to call before a reorder: a child that is already fully on screen produces
     * no scroll at all.
     */
    public boolean requestChildRectangleOnScreen(View child, Object rectangle,
                                                boolean immediate) { throw new RuntimeException(); }
}
