package defpackage;

import android.graphics.Point;
import android.graphics.Rect;
import android.os.Build;
import android.util.Log;
import android.view.Display;
import android.view.View;
import android.view.WindowInsets;
import j$.util.Objects;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class o4f extends w4f {
    public static boolean n = false;
    public static Method o;
    public static Class p;
    public static Field q;
    public static Field r;
    public final WindowInsets c;
    public b36[] d;
    public b36 e;
    public z4f f;
    public b36 g;
    public int h;
    public rh3 i;
    public int j;
    public int k;
    public Rect[][] l;
    public Rect[][] m;

    public o4f(z4f z4fVar, WindowInsets windowInsets) {
        super(z4fVar);
        this.e = null;
        this.l = new Rect[10][];
        this.m = new Rect[10][];
        this.c = windowInsets;
    }

    private rh3 D(View view) {
        Display display;
        if (view == null || (display = view.getDisplay()) == null) {
            return null;
        }
        Point point = new Point();
        display.getRealSize(point);
        if (this.a.a.t()) {
            return rh3.a(point.x, point.y, true, 0, 0, 0, 0);
        }
        zlb zlbVarK = io.k(display, 0);
        zlb zlbVarK2 = io.k(display, 1);
        zlb zlbVarK3 = io.k(display, 2);
        zlb zlbVarK4 = io.k(display, 3);
        return rh3.a(point.x, point.y, false, zlbVarK != null ? zlbVarK.b : 0, zlbVarK2 != null ? zlbVarK2.b : 0, zlbVarK3 != null ? zlbVarK3.b : 0, zlbVarK4 != null ? zlbVarK4.b : 0);
    }

    private static List<Rect> E(Rect[][] rectArr, int i) {
        Rect[] rectArr2;
        Rect[] rectArr3 = null;
        for (int i2 = 1; i2 <= 512; i2 <<= 1) {
            if ((i & i2) != 0 && (rectArr2 = rectArr[pr7.m(i2)]) != null) {
                if (rectArr3 == null) {
                    rectArr3 = rectArr2;
                } else {
                    Rect[] rectArr4 = new Rect[rectArr3.length + rectArr2.length];
                    System.arraycopy(rectArr3, 0, rectArr4, 0, rectArr3.length);
                    System.arraycopy(rectArr2, 0, rectArr4, rectArr3.length, rectArr2.length);
                    rectArr3 = rectArr4;
                }
            }
        }
        return rectArr3 == null ? Collections.EMPTY_LIST : Arrays.asList(rectArr3);
    }

    private Rect[] F(b36 b36Var) {
        ArrayList arrayList = new ArrayList();
        int i = b36Var.a;
        int i2 = b36Var.d;
        int i3 = b36Var.c;
        int i4 = b36Var.b;
        if (i != 0) {
            arrayList.add(new Rect(0, 0, b36Var.a, this.j));
        }
        if (i4 != 0) {
            arrayList.add(new Rect(0, 0, this.k, i4));
        }
        if (i3 != 0) {
            int i5 = this.k;
            arrayList.add(new Rect(i5 - i3, 0, i5, this.j));
        }
        if (i2 != 0) {
            int i6 = this.j;
            arrayList.add(new Rect(0, i6 - i2, this.k, i6));
        }
        return (Rect[]) arrayList.toArray(new Rect[arrayList.size()]);
    }

    private b36 G(int i, boolean z) {
        b36 b36VarA = b36.e;
        for (int i2 = 1; i2 <= 512; i2 <<= 1) {
            if ((i & i2) != 0) {
                b36VarA = b36.a(b36VarA, H(i2, z));
            }
        }
        return b36VarA;
    }

    private b36 I() {
        z4f z4fVar = this.f;
        return z4fVar != null ? z4fVar.a.l() : b36.e;
    }

    private b36 J(View view) {
        if (Build.VERSION.SDK_INT >= 30) {
            ik4.k("getVisibleInsets() should not be called on API >= 30. Use WindowInsets.isVisible() instead.");
            return null;
        }
        if (!n) {
            L();
        }
        Method method = o;
        if (method != null && p != null && q != null) {
            try {
                Object objInvoke = method.invoke(view, null);
                if (objInvoke == null) {
                    Log.w("WindowInsetsCompat", "Failed to get visible insets. getViewRootImpl() returned null from the provided view. This means that the view is either not attached or the method has been overridden", new NullPointerException());
                    return null;
                }
                Rect rect = (Rect) q.get(r.get(objInvoke));
                if (rect != null) {
                    return b36.c(rect.left, rect.top, rect.right, rect.bottom);
                }
                return null;
            } catch (ReflectiveOperationException e) {
                Log.e("WindowInsetsCompat", "Failed to get visible insets. (Reflection error). " + e.getMessage(), e);
            }
        }
        return null;
    }

    private static void L() {
        try {
            o = View.class.getDeclaredMethod("getViewRootImpl", null);
            Class<?> cls = Class.forName("android.view.View$AttachInfo");
            p = cls;
            q = cls.getDeclaredField("mVisibleInsets");
            r = Class.forName("android.view.ViewRootImpl").getDeclaredField("mAttachInfo");
            q.setAccessible(true);
            r.setAccessible(true);
        } catch (ReflectiveOperationException e) {
            Log.e("WindowInsetsCompat", "Failed to get visible insets. (Reflection error). " + e.getMessage(), e);
        }
        n = true;
    }

    public static boolean M(int i, int i2) {
        return (i & 6) == (i2 & 6);
    }

    @Override // defpackage.w4f
    public void A(int i) {
        this.h = i;
    }

    @Override // defpackage.w4f
    public void B(Rect[][] rectArr) {
        Objects.requireNonNull(rectArr);
        this.l = (Rect[][]) rectArr.clone();
    }

    @Override // defpackage.w4f
    public void C(Rect[][] rectArr) {
        Objects.requireNonNull(rectArr);
        this.m = (Rect[][]) rectArr.clone();
    }

    public b36 H(int i, boolean z) {
        b36 b36VarL;
        int i2;
        b36 b36Var = b36.e;
        if (i != 1) {
            if (i != 2) {
                if (i == 8) {
                    b36[] b36VarArr = this.d;
                    b36VarL = b36VarArr != null ? b36VarArr[pr7.m(8)] : null;
                    if (b36VarL != null) {
                        return b36VarL;
                    }
                    b36 b36VarN = n();
                    b36 b36VarI = I();
                    int i3 = b36VarN.d;
                    if (i3 > b36VarI.d) {
                        return b36.c(0, 0, 0, i3);
                    }
                    b36 b36Var2 = this.g;
                    if (b36Var2 != null && !b36Var2.equals(b36Var) && (i2 = this.g.d) > b36VarI.d) {
                        return b36.c(0, 0, 0, i2);
                    }
                } else {
                    if (i == 16) {
                        return m();
                    }
                    if (i == 32) {
                        return k();
                    }
                    if (i == 64) {
                        return o();
                    }
                    if (i == 128) {
                        z4f z4fVar = this.f;
                        yg3 yg3VarH = z4fVar != null ? z4fVar.a.h() : h();
                        if (yg3VarH != null) {
                            int i4 = Build.VERSION.SDK_INT;
                            return b36.c(i4 >= 28 ? uy.s(yg3VarH.a) : 0, i4 >= 28 ? uy.u(yg3VarH.a) : 0, i4 >= 28 ? uy.t(yg3VarH.a) : 0, i4 >= 28 ? uy.r(yg3VarH.a) : 0);
                        }
                    }
                }
            } else {
                if (z) {
                    b36 b36VarI2 = I();
                    b36 b36VarL2 = l();
                    return b36.c(Math.max(b36VarI2.a, b36VarL2.a), 0, Math.max(b36VarI2.c, b36VarL2.c), Math.max(b36VarI2.d, b36VarL2.d));
                }
                if ((this.h & 2) == 0) {
                    b36 b36VarN2 = n();
                    z4f z4fVar2 = this.f;
                    b36VarL = z4fVar2 != null ? z4fVar2.a.l() : null;
                    int iMin = b36VarN2.d;
                    if (b36VarL != null) {
                        iMin = Math.min(iMin, b36VarL.d);
                    }
                    return b36.c(b36VarN2.a, 0, b36VarN2.c, iMin);
                }
            }
        } else {
            if (z) {
                return b36.c(0, Math.max(I().b, n().b), 0, 0);
            }
            if ((this.h & 4) == 0) {
                return b36.c(0, n().b, 0, 0);
            }
        }
        return b36Var;
    }

    public boolean K(int i) {
        if (i != 1 && i != 2) {
            if (i == 4) {
                return false;
            }
            if (i != 8 && i != 128) {
                return true;
            }
        }
        return !H(i, false).equals(b36.e);
    }

    @Override // defpackage.w4f
    public void d(View view) {
        this.k = view.getWidth();
        this.j = view.getHeight();
        b36 b36VarJ = J(view);
        if (b36VarJ == null) {
            b36VarJ = b36.e;
        }
        x(b36VarJ);
    }

    @Override // defpackage.w4f
    public void e(z4f z4fVar) {
        z4fVar.a.y(this.f);
        b36 b36Var = this.g;
        w4f w4fVar = z4fVar.a;
        w4fVar.x(b36Var);
        w4fVar.A(this.h);
        w4fVar.v(this.i);
        w4fVar.B(this.l);
        w4fVar.C(this.m);
    }

    @Override // defpackage.w4f
    public boolean equals(Object obj) {
        if (!super.equals(obj)) {
            return false;
        }
        o4f o4fVar = (o4f) obj;
        return Objects.equals(this.g, o4fVar.g) && M(this.h, o4fVar.h);
    }

    @Override // defpackage.w4f
    public List<Rect> f(int i) {
        return E(this.l, i);
    }

    @Override // defpackage.w4f
    public List<Rect> g(int i) {
        return E(this.m, i);
    }

    @Override // defpackage.w4f
    public b36 i(int i) {
        return G(i, false);
    }

    @Override // defpackage.w4f
    public b36 j(int i) {
        return G(i, true);
    }

    @Override // defpackage.w4f
    public final b36 n() {
        b36 b36Var = this.e;
        if (b36Var != null) {
            return b36Var;
        }
        WindowInsets windowInsets = this.c;
        b36 b36VarC = b36.c(windowInsets.getSystemWindowInsetLeft(), windowInsets.getSystemWindowInsetTop(), windowInsets.getSystemWindowInsetRight(), windowInsets.getSystemWindowInsetBottom());
        this.e = b36VarC;
        return b36VarC;
    }

    @Override // defpackage.w4f
    public void p(View view) {
        this.i = D(view);
    }

    @Override // defpackage.w4f
    public void q() {
        for (int i = 1; i <= 512; i <<= 1) {
            int iM = pr7.m(i);
            this.l[iM] = F(i(i));
            if (i != 8) {
                this.m[iM] = F(j(i));
            }
        }
    }

    @Override // defpackage.w4f
    public z4f r(int i, int i2, int i3, int i4) {
        z4f z4fVarH = z4f.h(this.c, null);
        int i5 = Build.VERSION.SDK_INT;
        n4f m4fVar = i5 >= 36 ? new m4f(z4fVarH) : i5 >= 35 ? new l4f(z4fVarH) : i5 >= 34 ? new k4f(z4fVarH) : i5 >= 31 ? new j4f(z4fVarH) : i5 >= 30 ? new i4f(z4fVarH) : i5 >= 29 ? new h4f(z4fVarH) : new g4f(z4fVarH);
        m4fVar.h(z4f.e(n(), i, i2, i3, i4));
        m4fVar.f(z4f.e(l(), i, i2, i3, i4));
        return m4fVar.b();
    }

    @Override // defpackage.w4f
    public boolean t() {
        return this.c.isRound();
    }

    @Override // defpackage.w4f
    public boolean u(int i) {
        for (int i2 = 1; i2 <= 512; i2 <<= 1) {
            if ((i & i2) != 0 && !K(i2)) {
                return false;
            }
        }
        return true;
    }

    @Override // defpackage.w4f
    public void v(rh3 rh3Var) {
        this.i = rh3Var;
    }

    @Override // defpackage.w4f
    public void w(b36[] b36VarArr) {
        this.d = b36VarArr;
    }

    @Override // defpackage.w4f
    public void x(b36 b36Var) {
        this.g = b36Var;
    }

    @Override // defpackage.w4f
    public void y(z4f z4fVar) {
        this.f = z4fVar;
    }

    public o4f(z4f z4fVar, o4f o4fVar) {
        this(z4fVar, new WindowInsets(o4fVar.c));
    }
}
