package a5;

import android.annotation.SuppressLint;
import android.graphics.Rect;
import android.os.Build;
import android.util.Log;
import android.view.View;
import android.view.WindowInsets;
import androidx.core.graphics.Insets;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Objects;

/* loaded from: classes.dex */
public class z1 extends f2 {

    /* renamed from: h, reason: collision with root package name */
    public static boolean f390h = false;

    /* renamed from: i, reason: collision with root package name */
    public static Method f391i;

    /* renamed from: j, reason: collision with root package name */
    public static Class f392j;

    /* renamed from: k, reason: collision with root package name */
    public static Field f393k;

    /* renamed from: l, reason: collision with root package name */
    public static Field f394l;

    /* renamed from: c, reason: collision with root package name */
    public final WindowInsets f395c;

    /* renamed from: d, reason: collision with root package name */
    public Insets[] f396d;

    /* renamed from: e, reason: collision with root package name */
    public Insets f397e;

    /* renamed from: f, reason: collision with root package name */
    public h2 f398f;

    /* renamed from: g, reason: collision with root package name */
    public Insets f399g;

    public z1(h2 h2Var, WindowInsets windowInsets) {
        super(h2Var);
        this.f397e = null;
        this.f395c = windowInsets;
    }

    @SuppressLint({"PrivateApi"})
    private static void A() throws ClassNotFoundException, SecurityException {
        try {
            f391i = View.class.getDeclaredMethod("getViewRootImpl", null);
            Class<?> cls = Class.forName("android.view.View$AttachInfo");
            f392j = cls;
            f393k = cls.getDeclaredField("mVisibleInsets");
            f394l = Class.forName("android.view.ViewRootImpl").getDeclaredField("mAttachInfo");
            f393k.setAccessible(true);
            f394l.setAccessible(true);
        } catch (ReflectiveOperationException e3) {
            Log.e("WindowInsetsCompat", "Failed to get visible insets. (Reflection error). " + e3.getMessage(), e3);
        }
        f390h = true;
    }

    @SuppressLint({"WrongConstant"})
    private Insets v(int i5, boolean z11) {
        Insets insetsMax = Insets.NONE;
        for (int i11 = 1; i11 <= 256; i11 <<= 1) {
            if ((i5 & i11) != 0) {
                insetsMax = Insets.max(insetsMax, w(i11, z11));
            }
        }
        return insetsMax;
    }

    private Insets x() {
        h2 h2Var = this.f398f;
        return h2Var != null ? h2Var.f296a.j() : Insets.NONE;
    }

    private Insets y(View view) throws IllegalAccessException, ClassNotFoundException, SecurityException, IllegalArgumentException, InvocationTargetException {
        if (Build.VERSION.SDK_INT >= 30) {
            throw new UnsupportedOperationException("getVisibleInsets() should not be called on API >= 30. Use WindowInsets.isVisible() instead.");
        }
        if (!f390h) {
            A();
        }
        Method method = f391i;
        if (method != null && f392j != null && f393k != null) {
            try {
                Object objInvoke = method.invoke(view, null);
                if (objInvoke == null) {
                    Log.w("WindowInsetsCompat", "Failed to get visible insets. getViewRootImpl() returned null from the provided view. This means that the view is either not attached or the method has been overridden", new NullPointerException());
                    return null;
                }
                Rect rect = (Rect) f393k.get(f394l.get(objInvoke));
                if (rect != null) {
                    return Insets.of(rect);
                }
                return null;
            } catch (ReflectiveOperationException e3) {
                Log.e("WindowInsetsCompat", "Failed to get visible insets. (Reflection error). " + e3.getMessage(), e3);
            }
        }
        return null;
    }

    @Override // a5.f2
    public void d(View view) throws IllegalAccessException, ClassNotFoundException, SecurityException, IllegalArgumentException, InvocationTargetException {
        Insets insetsY = y(view);
        if (insetsY == null) {
            insetsY = Insets.NONE;
        }
        s(insetsY);
    }

    @Override // a5.f2
    public void e(h2 h2Var) {
        h2Var.f296a.t(this.f398f);
        h2Var.f296a.s(this.f399g);
    }

    @Override // a5.f2
    public boolean equals(Object obj) {
        if (super.equals(obj)) {
            return Objects.equals(this.f399g, ((z1) obj).f399g);
        }
        return false;
    }

    @Override // a5.f2
    public Insets g(int i5) {
        return v(i5, false);
    }

    @Override // a5.f2
    public Insets h(int i5) {
        return v(i5, true);
    }

    @Override // a5.f2
    public final Insets l() {
        if (this.f397e == null) {
            WindowInsets windowInsets = this.f395c;
            this.f397e = Insets.of(windowInsets.getSystemWindowInsetLeft(), windowInsets.getSystemWindowInsetTop(), windowInsets.getSystemWindowInsetRight(), windowInsets.getSystemWindowInsetBottom());
        }
        return this.f397e;
    }

    @Override // a5.f2
    public h2 n(int i5, int i11, int i12, int i13) {
        h2 h2VarG = h2.g(null, this.f395c);
        int i14 = Build.VERSION.SDK_INT;
        y1 x1Var = i14 >= 30 ? new x1(h2VarG) : i14 >= 29 ? new w1(h2VarG) : new u1(h2VarG);
        x1Var.g(h2.e(l(), i5, i11, i12, i13));
        x1Var.e(h2.e(j(), i5, i11, i12, i13));
        return x1Var.b();
    }

    @Override // a5.f2
    public boolean p() {
        return this.f395c.isRound();
    }

    @Override // a5.f2
    @SuppressLint({"WrongConstant"})
    public boolean q(int i5) {
        for (int i11 = 1; i11 <= 256; i11 <<= 1) {
            if ((i5 & i11) != 0 && !z(i11)) {
                return false;
            }
        }
        return true;
    }

    @Override // a5.f2
    public void r(Insets[] insetsArr) {
        this.f396d = insetsArr;
    }

    @Override // a5.f2
    public void s(Insets insets) {
        this.f399g = insets;
    }

    @Override // a5.f2
    public void t(h2 h2Var) {
        this.f398f = h2Var;
    }

    public Insets w(int i5, boolean z11) {
        Insets insetsJ;
        int i11;
        if (i5 == 1) {
            return z11 ? Insets.of(0, Math.max(x().top, l().top), 0, 0) : Insets.of(0, l().top, 0, 0);
        }
        if (i5 == 2) {
            if (z11) {
                Insets insetsX = x();
                Insets insetsJ2 = j();
                return Insets.of(Math.max(insetsX.left, insetsJ2.left), 0, Math.max(insetsX.right, insetsJ2.right), Math.max(insetsX.bottom, insetsJ2.bottom));
            }
            Insets insetsL = l();
            h2 h2Var = this.f398f;
            insetsJ = h2Var != null ? h2Var.f296a.j() : null;
            int iMin = insetsL.bottom;
            if (insetsJ != null) {
                iMin = Math.min(iMin, insetsJ.bottom);
            }
            return Insets.of(insetsL.left, 0, insetsL.right, iMin);
        }
        if (i5 == 8) {
            Insets[] insetsArr = this.f396d;
            insetsJ = insetsArr != null ? insetsArr[fg.a.C(8)] : null;
            if (insetsJ != null) {
                return insetsJ;
            }
            Insets insetsL2 = l();
            Insets insetsX2 = x();
            int i12 = insetsL2.bottom;
            if (i12 > insetsX2.bottom) {
                return Insets.of(0, 0, 0, i12);
            }
            Insets insets = this.f399g;
            return (insets == null || insets.equals(Insets.NONE) || (i11 = this.f399g.bottom) <= insetsX2.bottom) ? Insets.NONE : Insets.of(0, 0, 0, i11);
        }
        if (i5 == 16) {
            return k();
        }
        if (i5 == 32) {
            return i();
        }
        if (i5 == 64) {
            return m();
        }
        if (i5 != 128) {
            return Insets.NONE;
        }
        h2 h2Var2 = this.f398f;
        n nVarF = h2Var2 != null ? h2Var2.f296a.f() : f();
        if (nVarF == null) {
            return Insets.NONE;
        }
        int i13 = Build.VERSION.SDK_INT;
        return Insets.of(i13 >= 28 ? l.f(nVarF.f328a) : 0, i13 >= 28 ? l.h(nVarF.f328a) : 0, i13 >= 28 ? l.g(nVarF.f328a) : 0, i13 >= 28 ? l.e(nVarF.f328a) : 0);
    }

    public boolean z(int i5) {
        if (i5 != 1 && i5 != 2) {
            if (i5 == 4) {
                return false;
            }
            if (i5 != 8 && i5 != 128) {
                return true;
            }
        }
        return !w(i5, false).equals(Insets.NONE);
    }

    public z1(h2 h2Var, z1 z1Var) {
        this(h2Var, new WindowInsets(z1Var.f395c));
    }
}
