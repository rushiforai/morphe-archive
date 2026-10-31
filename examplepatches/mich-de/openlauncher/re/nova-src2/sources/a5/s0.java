package a5;

import android.content.res.ColorStateList;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.os.Build;
import android.view.View;
import android.view.WindowInsets;

/* loaded from: classes.dex */
public abstract class s0 {
    public static void a(WindowInsets windowInsets, View view) {
        View.OnApplyWindowInsetsListener onApplyWindowInsetsListener = (View.OnApplyWindowInsetsListener) view.getTag(2131428990);
        if (onApplyWindowInsetsListener != null) {
            onApplyWindowInsetsListener.onApplyWindowInsets(view, windowInsets);
        }
    }

    public static h2 b(View view, h2 h2Var, Rect rect) {
        WindowInsets windowInsetsF = h2Var.f();
        if (windowInsetsF != null) {
            return h2.g(view, view.computeSystemWindowInsets(windowInsetsF, rect));
        }
        rect.setEmpty();
        return h2Var;
    }

    public static ColorStateList c(View view) {
        return view.getBackgroundTintList();
    }

    public static PorterDuff.Mode d(View view) {
        return view.getBackgroundTintMode();
    }

    public static float e(View view) {
        return view.getElevation();
    }

    public static String f(View view) {
        return view.getTransitionName();
    }

    public static float g(View view) {
        return view.getZ();
    }

    public static boolean h(View view) {
        return view.isNestedScrollingEnabled();
    }

    public static void i(View view, ColorStateList colorStateList) {
        view.setBackgroundTintList(colorStateList);
    }

    public static void j(View view, PorterDuff.Mode mode) {
        view.setBackgroundTintMode(mode);
    }

    public static void k(View view, float f11) {
        view.setElevation(f11);
    }

    public static void l(View view, a0 a0Var) {
        if (Build.VERSION.SDK_INT < 30) {
            view.setTag(2131428981, a0Var);
        }
        if (a0Var == null) {
            view.setOnApplyWindowInsetsListener((View.OnApplyWindowInsetsListener) view.getTag(2131428990));
        } else {
            view.setOnApplyWindowInsetsListener(new r0(view, a0Var));
        }
    }

    public static void m(View view, String str) {
        view.setTransitionName(str);
    }

    public static void n(View view) {
        view.stopNestedScroll();
    }
}
