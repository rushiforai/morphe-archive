package lx;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.graphics.PointF;
import android.graphics.drawable.Drawable;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.inputmethod.InputMethodManager;
import com.teslacoilsw.launcher.NovaLauncher;
import dy.k;
import h50.q;
import java.util.ArrayList;
import java.util.Locale;
import kotlin.LazyKt;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class d {

    /* renamed from: a, reason: collision with root package name */
    public static final k f75158a = new k(5);

    static {
        LazyKt.a(new q(14));
    }

    public static final Activity a(Context context) {
        NovaLauncher novaLauncher;
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity) {
                return (Activity) context;
            }
            if ((context instanceof py.a) && (novaLauncher = ((py.a) context).f83127b) != null) {
                return novaLauncher;
            }
            context = ((ContextWrapper) context).getBaseContext();
        }
        return null;
    }

    public static final int b(Context context, int i5) {
        TypedValue typedValueF = f75158a.f();
        synchronized (typedValueF) {
            if (!context.getTheme().resolveAttribute(i5, typedValueF, true)) {
                return 0;
            }
            int i11 = typedValueF.type;
            if (i11 >= 16 && i11 <= 31) {
                return typedValueF.data;
            }
            if (i11 != 3) {
                return 0;
            }
            return context.getColor(typedValueF.resourceId);
        }
    }

    public static final Drawable c(Context context, int i5) {
        TypedValue typedValueF = f75158a.f();
        synchronized (typedValueF) {
            if (!context.getTheme().resolveAttribute(i5, typedValueF, true)) {
                return null;
            }
            if (typedValueF.type != 3) {
                return null;
            }
            return context.getDrawable(typedValueF.resourceId);
        }
    }

    public static final void d(View view) {
        Object systemService = view.getContext().getSystemService("input_method");
        Intrinsics.e(systemService, "null cannot be cast to non-null type android.view.inputmethod.InputMethodManager");
        ((InputMethodManager) systemService).hideSoftInputFromWindow(view.getWindowToken(), 0);
    }

    public static final PointF e(View view, ViewParent viewParent) {
        Object parent = view.getParent();
        if (Intrinsics.b(parent, viewParent)) {
            return new PointF(view.getX(), view.getY());
        }
        if (!(parent instanceof ViewGroup)) {
            throw new IllegalArgumentException("View.offsetFromParent must be called with an actual parent");
        }
        PointF pointFE = e((View) parent, viewParent);
        return new PointF(view.getX() + pointFE.x, view.getY() + pointFE.y);
    }

    public static final Object f(ArrayList arrayList) {
        return arrayList.remove(0);
    }

    public static final void g(View view) {
        Object systemService = view.getContext().getSystemService("input_method");
        Intrinsics.e(systemService, "null cannot be cast to non-null type android.view.inputmethod.InputMethodManager");
        ((InputMethodManager) systemService).showSoftInput(view, 1);
    }

    public static final String h(String str) {
        if (str.length() == 0) {
            return str;
        }
        String strSubstring = str.substring(0, 1);
        Intrinsics.f(strSubstring, "substring(...)");
        String upperCase = strSubstring.toUpperCase(Locale.getDefault());
        Intrinsics.f(upperCase, "toUpperCase(...)");
        String strSubstring2 = str.substring(1);
        Intrinsics.f(strSubstring2, "substring(...)");
        String lowerCase = strSubstring2.toLowerCase(Locale.getDefault());
        Intrinsics.f(lowerCase, "toLowerCase(...)");
        return upperCase.concat(lowerCase);
    }
}
