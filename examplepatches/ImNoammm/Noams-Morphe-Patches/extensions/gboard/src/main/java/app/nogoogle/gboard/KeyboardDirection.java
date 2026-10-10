package app.nogoogle.gboard;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.view.View;

/**
 * "Keyboard stays left-to-right": Gboard asks here before giving the keyboard and its views the
 * input language's locale or direction. With the switch on, a right-to-left language changes only
 * the letters on the keys; typing itself (cursor moves, swipes, handwriting) keeps its direction.
 */
@SuppressWarnings("unused")
public final class KeyboardDirection {
    private KeyboardDirection() {
    }

    private static boolean keepLtr() {
        return NoGoogleSettings.bool(NoGoogleSettings.KEEP_LTR);
    }

    /** Gboard's choice (use the input language / mirror for it), or false with the switch on. */
    public static boolean follow(boolean stock) {
        return stock && !keepLtr();
    }

    /** A keyboard view's layout direction: Gboard's (the language's), or left-to-right with the switch on. */
    public static int layout(int stock) {
        return keepLtr() ? View.LAYOUT_DIRECTION_LTR : stock;
    }

    /**
     * Every View.setLayoutDirection call in Gboard's code: with the switch on, right-to-left becomes
     * left-to-right on keyboard views (activities, such as Gboard's settings, keep the system's).
     */
    public static void setLayoutDirection(View view, int direction) {
        if (direction == View.LAYOUT_DIRECTION_RTL && keepLtr() && !inActivity(view.getContext())) {
            direction = View.LAYOUT_DIRECTION_LTR;
        }
        view.setLayoutDirection(direction);
    }

    /** A keyboard view (SoftKeyboardView) once inflated / attached: left-to-right with the switch on. */
    public static void keyboardView(View view) {
        if (keepLtr() && !inActivity(view.getContext())) view.setLayoutDirection(View.LAYOUT_DIRECTION_LTR);
    }

    private static boolean inActivity(Context c) {
        while (c instanceof ContextWrapper) {
            if (c instanceof Activity) return true;
            c = ((ContextWrapper) c).getBaseContext();
        }
        return false;
    }
}
