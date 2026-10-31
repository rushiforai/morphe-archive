package a5;

import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsets;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.Interpolator;
import android.view.animation.PathInterpolator;
import java.util.List;

/* loaded from: classes2.dex */
public final class p1 extends s1 {

    /* renamed from: e, reason: collision with root package name */
    public static final PathInterpolator f342e = new PathInterpolator(0.0f, 1.1f, 0.0f, 1.0f);

    /* renamed from: f, reason: collision with root package name */
    public static final f6.a f343f = new f6.a(0);

    /* renamed from: g, reason: collision with root package name */
    public static final DecelerateInterpolator f344g = new DecelerateInterpolator();

    public p1(int i5, Interpolator interpolator, long j11) {
        super(i5, interpolator, j11);
    }

    public static void e(View view, t1 t1Var) {
        l1 l1VarJ = j(view);
        if (l1VarJ != null) {
            l1VarJ.d(t1Var);
            if (l1VarJ.f316a == 0) {
                return;
            }
        }
        if (view instanceof ViewGroup) {
            ViewGroup viewGroup = (ViewGroup) view;
            for (int i5 = 0; i5 < viewGroup.getChildCount(); i5++) {
                e(viewGroup.getChildAt(i5), t1Var);
            }
        }
    }

    public static void f(View view, t1 t1Var, WindowInsets windowInsets, boolean z11) {
        l1 l1VarJ = j(view);
        if (l1VarJ != null) {
            l1VarJ.f317b = windowInsets;
            if (!z11) {
                l1VarJ.e();
                z11 = l1VarJ.f316a == 0;
            }
        }
        if (view instanceof ViewGroup) {
            ViewGroup viewGroup = (ViewGroup) view;
            for (int i5 = 0; i5 < viewGroup.getChildCount(); i5++) {
                f(viewGroup.getChildAt(i5), t1Var, windowInsets, z11);
            }
        }
    }

    public static void g(View view, h2 h2Var, List list) {
        l1 l1VarJ = j(view);
        if (l1VarJ != null) {
            h2Var = l1VarJ.f(h2Var, list);
            if (l1VarJ.f316a == 0) {
                return;
            }
        }
        if (view instanceof ViewGroup) {
            ViewGroup viewGroup = (ViewGroup) view;
            for (int i5 = 0; i5 < viewGroup.getChildCount(); i5++) {
                g(viewGroup.getChildAt(i5), h2Var, list);
            }
        }
    }

    public static void h(View view, t1 t1Var, c10.a aVar) {
        l1 l1VarJ = j(view);
        if (l1VarJ != null) {
            l1VarJ.g(t1Var, aVar);
            if (l1VarJ.f316a == 0) {
                return;
            }
        }
        if (view instanceof ViewGroup) {
            ViewGroup viewGroup = (ViewGroup) view;
            for (int i5 = 0; i5 < viewGroup.getChildCount(); i5++) {
                h(viewGroup.getChildAt(i5), t1Var, aVar);
            }
        }
    }

    public static WindowInsets i(View view, WindowInsets windowInsets) {
        return view.getTag(2131428981) != null ? windowInsets : view.onApplyWindowInsets(windowInsets);
    }

    public static l1 j(View view) {
        Object tag = view.getTag(2131428990);
        if (tag instanceof o1) {
            return ((o1) tag).f339a;
        }
        return null;
    }

    public static void k(View view, l1 l1Var) {
        Object tag = view.getTag(2131428981);
        if (l1Var == null) {
            view.setTag(2131428990, null);
            if (tag == null) {
                view.setOnApplyWindowInsetsListener(null);
                return;
            }
            return;
        }
        View.OnApplyWindowInsetsListener o1Var = new o1(view, l1Var);
        view.setTag(2131428990, o1Var);
        if (tag == null) {
            view.setOnApplyWindowInsetsListener(o1Var);
        }
    }
}
