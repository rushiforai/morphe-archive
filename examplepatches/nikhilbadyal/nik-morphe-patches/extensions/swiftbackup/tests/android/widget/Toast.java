package android.widget;

import android.content.Context;

/** Avoid Android framework execution while allowing failure-path notifications to complete. */
public final class Toast {
    public static final int LENGTH_LONG = 1;
    public static Toast makeText(Context context, CharSequence text, int duration) { return new Toast(); }
    public void show() {}
}
