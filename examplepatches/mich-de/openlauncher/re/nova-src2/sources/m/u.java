package m;

import a5.a1;
import a5.h2;
import a5.t0;
import a5.u1;
import a5.w1;
import a5.x1;
import a5.y1;
import android.content.Context;
import android.graphics.Rect;
import android.os.Build;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowInsets;
import android.widget.FrameLayout;
import androidx.appcompat.widget.ActionBarContextView;
import androidx.core.graphics.Insets;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.WeakHashMap;
import r.o2;
import r.p2;

/* loaded from: classes2.dex */
public final class u implements a5.a0, q.v {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f75373a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ f0 f75374b;

    public /* synthetic */ u(f0 f0Var, int i5) {
        this.f75373a = i5;
        this.f75374b = f0Var;
    }

    @Override // q.v
    public void b(q.k kVar, boolean z11) {
        e0 e0Var;
        switch (this.f75373a) {
            case 2:
                this.f75374b.I(kVar);
                break;
            default:
                q.k kVarK = kVar.k();
                int i5 = 0;
                boolean z12 = kVarK != kVar;
                if (z12) {
                    kVar = kVarK;
                }
                f0 f0Var = this.f75374b;
                e0[] e0VarArr = f0Var.L;
                int length = e0VarArr != null ? e0VarArr.length : 0;
                while (true) {
                    if (i5 >= length) {
                        e0Var = null;
                    } else {
                        e0Var = e0VarArr[i5];
                        if (e0Var == null || e0Var.f75209h != kVar) {
                            i5++;
                        }
                    }
                }
                if (e0Var != null) {
                    if (!z12) {
                        f0Var.J(e0Var, z11);
                        break;
                    } else {
                        f0Var.H(e0Var.f75202a, e0Var, kVarK);
                        f0Var.J(e0Var, true);
                        break;
                    }
                }
                break;
        }
    }

    @Override // q.v
    public boolean m(q.k kVar) {
        Window.Callback callback;
        switch (this.f75373a) {
            case 2:
                Window.Callback callback2 = this.f75374b.f75231l.getCallback();
                if (callback2 != null) {
                    callback2.onMenuOpened(108, kVar);
                    break;
                }
                break;
            default:
                if (kVar == kVar.k()) {
                    f0 f0Var = this.f75374b;
                    if (f0Var.F && (callback = f0Var.f75231l.getCallback()) != null && !f0Var.Q) {
                        callback.onMenuOpened(108, kVar);
                        break;
                    }
                }
                break;
        }
        return true;
    }

    @Override // a5.a0
    public h2 u(View view, h2 h2Var) throws IllegalAccessException, NoSuchMethodException, SecurityException, IllegalArgumentException, InvocationTargetException {
        int i5;
        boolean z11;
        boolean z12;
        boolean z13;
        h2 h2VarB = h2Var;
        int iD = h2VarB.d();
        f0 f0Var = this.f75374b;
        Context context = f0Var.f75230k;
        int iD2 = h2VarB.d();
        ActionBarContextView actionBarContextView = f0Var.f75239v;
        if (actionBarContextView == null || !(actionBarContextView.getLayoutParams() instanceof ViewGroup.MarginLayoutParams)) {
            i5 = 0;
            z11 = false;
        } else {
            ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) f0Var.f75239v.getLayoutParams();
            if (f0Var.f75239v.isShown()) {
                if (f0Var.f75224c0 == null) {
                    f0Var.f75224c0 = new Rect();
                    f0Var.f75225d0 = new Rect();
                }
                Rect rect = f0Var.f75224c0;
                Rect rect2 = f0Var.f75225d0;
                rect.set(h2VarB.b(), h2VarB.d(), h2VarB.c(), h2VarB.a());
                ViewGroup viewGroup = f0Var.A;
                if (Build.VERSION.SDK_INT >= 29) {
                    boolean z14 = p2.f84838a;
                    o2.a(viewGroup, rect, rect2);
                } else {
                    if (!p2.f84838a) {
                        p2.f84838a = true;
                        try {
                            Method declaredMethod = View.class.getDeclaredMethod("computeFitSystemWindows", Rect.class, Rect.class);
                            p2.f84839b = declaredMethod;
                            if (!declaredMethod.isAccessible()) {
                                p2.f84839b.setAccessible(true);
                            }
                        } catch (NoSuchMethodException unused) {
                        }
                    }
                    Method method = p2.f84839b;
                    if (method != null) {
                        try {
                            method.invoke(viewGroup, rect, rect2);
                        } catch (Exception unused2) {
                        }
                    }
                }
                int i11 = rect.top;
                int i12 = rect.left;
                int i13 = rect.right;
                ViewGroup viewGroup2 = f0Var.A;
                WeakHashMap weakHashMap = a1.f250a;
                h2 h2VarA = t0.a(viewGroup2);
                int iB = h2VarA == null ? 0 : h2VarA.b();
                int iC = h2VarA == null ? 0 : h2VarA.c();
                if (marginLayoutParams.topMargin == i11 && marginLayoutParams.leftMargin == i12 && marginLayoutParams.rightMargin == i13) {
                    z13 = false;
                } else {
                    marginLayoutParams.topMargin = i11;
                    marginLayoutParams.leftMargin = i12;
                    marginLayoutParams.rightMargin = i13;
                    z13 = true;
                }
                if (i11 <= 0 || f0Var.C != null) {
                    View view2 = f0Var.C;
                    if (view2 != null) {
                        ViewGroup.MarginLayoutParams marginLayoutParams2 = (ViewGroup.MarginLayoutParams) view2.getLayoutParams();
                        int i14 = marginLayoutParams2.height;
                        int i15 = marginLayoutParams.topMargin;
                        if (i14 != i15 || marginLayoutParams2.leftMargin != iB || marginLayoutParams2.rightMargin != iC) {
                            marginLayoutParams2.height = i15;
                            marginLayoutParams2.leftMargin = iB;
                            marginLayoutParams2.rightMargin = iC;
                            f0Var.C.setLayoutParams(marginLayoutParams2);
                        }
                    }
                } else {
                    View view3 = new View(context);
                    f0Var.C = view3;
                    view3.setVisibility(8);
                    FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-1, marginLayoutParams.topMargin, 51);
                    layoutParams.leftMargin = iB;
                    layoutParams.rightMargin = iC;
                    f0Var.A.addView(f0Var.C, -1, layoutParams);
                }
                View view4 = f0Var.C;
                boolean z15 = view4 != null;
                if (z15 && view4.getVisibility() != 0) {
                    View view5 = f0Var.C;
                    view5.setBackgroundColor((view5.getWindowSystemUiVisibility() & UserMetadata.MAX_INTERNAL_KEY_SIZE) != 0 ? context.getColor(2131099654) : context.getColor(2131099653));
                }
                if (!f0Var.H && z15) {
                    iD2 = 0;
                }
                z12 = z13;
                z11 = z15;
                i5 = 0;
            } else {
                i5 = 0;
                if (marginLayoutParams.topMargin != 0) {
                    marginLayoutParams.topMargin = 0;
                    z11 = false;
                    z12 = true;
                } else {
                    z11 = false;
                    z12 = false;
                }
            }
            if (z12) {
                f0Var.f75239v.setLayoutParams(marginLayoutParams);
            }
        }
        View view6 = f0Var.C;
        if (view6 != null) {
            view6.setVisibility(z11 ? i5 : 8);
        }
        if (iD != iD2) {
            int iB2 = h2VarB.b();
            int iC2 = h2VarB.c();
            int iA = h2VarB.a();
            int i16 = Build.VERSION.SDK_INT;
            y1 x1Var = i16 >= 30 ? new x1(h2VarB) : i16 >= 29 ? new w1(h2VarB) : new u1(h2VarB);
            x1Var.g(Insets.of(iB2, iD2, iC2, iA));
            h2VarB = x1Var.b();
        }
        WeakHashMap weakHashMap2 = a1.f250a;
        WindowInsets windowInsetsF = h2VarB.f();
        if (windowInsetsF == null) {
            return h2VarB;
        }
        WindowInsets windowInsetsB = a5.q0.b(view, windowInsetsF);
        return !windowInsetsB.equals(windowInsetsF) ? h2.g(view, windowInsetsB) : h2VarB;
    }
}
