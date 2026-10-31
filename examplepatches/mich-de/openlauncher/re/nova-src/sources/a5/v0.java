package a5;

import android.view.View;

/* loaded from: classes2.dex */
public abstract class v0 {
    public static CharSequence a(View view) {
        return view.getAccessibilityPaneTitle();
    }

    public static boolean b(View view) {
        return view.isAccessibilityHeading();
    }

    public static boolean c(View view) {
        return view.isScreenReaderFocusable();
    }

    public static void d(View view, boolean z11) {
        view.setAccessibilityHeading(z11);
    }

    public static void e(View view, CharSequence charSequence) {
        view.setAccessibilityPaneTitle(charSequence);
    }

    public static void f(View view, boolean z11) {
        view.setScreenReaderFocusable(z11);
    }
}
