package defpackage;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.widget.ImageView;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.concurrent.Semaphore;
import java.util.concurrent.ThreadPoolExecutor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wb7 extends co6 implements x45 {
    public final /* synthetic */ Rect a;
    public final /* synthetic */ w82 b;
    public final /* synthetic */ xd c;
    public final /* synthetic */ Matrix d;
    public final /* synthetic */ rc7 e;
    public final /* synthetic */ boolean f;
    public final /* synthetic */ boolean g;
    public final /* synthetic */ n4b h;
    public final /* synthetic */ t90 i;
    public final /* synthetic */ bc7 j;
    public final /* synthetic */ Map k;
    public final /* synthetic */ boolean l;
    public final /* synthetic */ boolean m;
    public final /* synthetic */ boolean n;
    public final /* synthetic */ boolean o;
    public final /* synthetic */ boolean p;
    public final /* synthetic */ boolean q;
    public final /* synthetic */ Context r;
    public final /* synthetic */ m45 s;
    public final /* synthetic */ l78 t;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public wb7(Rect rect, w82 w82Var, xd xdVar, Matrix matrix, rc7 rc7Var, boolean z, boolean z2, n4b n4bVar, t90 t90Var, bc7 bc7Var, Map map, boolean z3, boolean z4, boolean z5, boolean z6, boolean z7, boolean z8, Context context, m45 m45Var, l78 l78Var) {
        super(1);
        this.a = rect;
        this.b = w82Var;
        this.c = xdVar;
        this.d = matrix;
        this.e = rc7Var;
        this.f = z;
        this.g = z2;
        this.h = n4bVar;
        this.i = t90Var;
        this.j = bc7Var;
        this.k = map;
        this.l = z3;
        this.m = z4;
        this.n = z5;
        this.o = z6;
        this.p = z7;
        this.q = z8;
        this.r = context;
        this.s = m45Var;
        this.t = l78Var;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        boolean zRemove;
        zl3 zl3Var = (zl3) obj;
        zl3Var.getClass();
        e61 e61VarX = zl3Var.b0().x();
        Rect rect = this.a;
        long jFloatToRawIntBits = (((long) Float.floatToRawIntBits(rect.height())) & 4294967295L) | (((long) Float.floatToRawIntBits(rect.width())) << 32);
        long jX = nk7.x(nk7.w0(dfc.d(zl3Var.f())), nk7.w0(dfc.b(zl3Var.f())));
        long jG = this.b.g(jFloatToRawIntBits, zl3Var.f());
        float fD = dfc.d(jFloatToRawIntBits);
        int i = fqb.a;
        int i2 = (int) (jG >> 32);
        int i3 = (int) (jG & 4294967295L);
        long jA = this.c.a(nk7.x((int) (Float.intBitsToFloat(i2) * fD), (int) (Float.intBitsToFloat(i3) * dfc.b(jFloatToRawIntBits))), jX, zl3Var.getLayoutDirection());
        Matrix matrix = this.d;
        matrix.reset();
        matrix.preTranslate((int) (jA >> 32), (int) (jA & 4294967295L));
        matrix.preScale(Float.intBitsToFloat(i2), Float.intBitsToFloat(i3));
        sc7 sc7Var = sc7.MergePathsApi19;
        rc7 rc7Var = this.e;
        pkf pkfVar = rc7Var.j;
        zc7 zc7Var = rc7Var.b;
        HashSet hashSet = (HashSet) pkfVar.a;
        if (!this.f) {
            zRemove = hashSet.remove(sc7Var);
        } else if (Build.VERSION.SDK_INT < sc7Var.minRequiredSdkVersion) {
            h87.a(String.format("%s is not supported pre SDK %d", sc7Var.name(), Integer.valueOf(sc7Var.minRequiredSdkVersion)));
            zRemove = false;
        } else {
            zRemove = hashSet.add(sc7Var);
        }
        if (rc7Var.a != null && zRemove) {
            rc7Var.b();
        }
        rc7Var.d = this.g;
        rc7Var.s = this.h;
        rc7Var.c();
        rc7Var.I = this.i;
        ArrayList arrayList = rc7Var.f;
        bc7 bc7Var = rc7Var.a;
        bc7 bc7Var2 = this.j;
        if (bc7Var != bc7Var2) {
            rc7Var.H = true;
            if (zc7Var.m) {
                zc7Var.cancel();
                if (!rc7Var.isVisible()) {
                    rc7Var.e = qc7.NONE;
                }
            }
            rc7Var.a = null;
            rc7Var.m = null;
            rc7Var.g = null;
            rc7Var.N = -3.4028235E38f;
            zc7Var.l = null;
            zc7Var.j = -2.1474836E9f;
            zc7Var.k = 2.1474836E9f;
            rc7Var.invalidateSelf();
            rc7Var.a = bc7Var2;
            rc7Var.b();
            boolean z = zc7Var.l == null;
            zc7Var.l = bc7Var2;
            if (z) {
                zc7Var.k(Math.max(zc7Var.j, bc7Var2.l), Math.min(zc7Var.k, bc7Var2.m));
            } else {
                zc7Var.k((int) bc7Var2.l, (int) bc7Var2.m);
            }
            float f = zc7Var.h;
            zc7Var.h = 0.0f;
            zc7Var.g = 0.0f;
            zc7Var.j((int) f);
            zc7Var.c();
            rc7Var.m(zc7Var.getAnimatedFraction());
            Iterator it2 = new ArrayList(arrayList).iterator();
            while (it2.hasNext()) {
                pc7 pc7Var = (pc7) it2.next();
                if (pc7Var != null) {
                    pc7Var.run();
                }
                it2.remove();
            }
            arrayList.clear();
            rc7Var.c();
            Drawable.Callback callback = rc7Var.getCallback();
            if (callback instanceof ImageView) {
                ImageView imageView = (ImageView) callback;
                imageView.setImageDrawable(null);
                imageView.setImageDrawable(rc7Var);
            }
        }
        Map map = rc7Var.i;
        Map map2 = this.k;
        if (map2 != map) {
            rc7Var.i = map2;
            rc7Var.invalidateSelf();
        }
        if (this.t.getValue() != null) {
            rd6.m();
            return null;
        }
        boolean z2 = rc7Var.o;
        boolean z3 = this.l;
        if (z2 != z3) {
            rc7Var.o = z3;
            s22 s22Var = rc7Var.m;
            if (s22Var != null) {
                s22Var.m(z3);
            }
        }
        rc7Var.p = this.m;
        rc7Var.q = this.n;
        rc7Var.k = this.o;
        boolean z4 = rc7Var.l;
        boolean z5 = this.p;
        if (z5 != z4) {
            rc7Var.l = z5;
            s22 s22Var2 = rc7Var.m;
            if (s22Var2 != null) {
                s22Var2.L = z5;
            }
            rc7Var.invalidateSelf();
        }
        boolean z6 = rc7Var.r;
        boolean z7 = this.q;
        if (z7 != z6) {
            rc7Var.r = z7;
            rc7Var.invalidateSelf();
        }
        ki7 ki7VarG = rc7Var.g();
        if (rc7Var.a(this.r) || ki7VarG == null) {
            rc7Var.m(((Number) this.s.invoke()).floatValue());
        } else {
            rc7Var.m(ki7VarG.b);
        }
        rc7Var.setBounds(0, 0, rect.width(), rect.height());
        Canvas canvasA = qm.a(e61VarX);
        mc7 mc7Var = rc7Var.M;
        ThreadPoolExecutor threadPoolExecutor = rc7.Q;
        Semaphore semaphore = rc7Var.J;
        s22 s22Var3 = rc7Var.m;
        bc7 bc7Var3 = rc7Var.a;
        if (s22Var3 != null && bc7Var3 != null) {
            t90 t90Var = rc7Var.I;
            if (t90Var == null) {
                t90Var = xn6.a;
            }
            boolean z8 = t90Var == t90.ENABLED;
            if (z8) {
                try {
                    semaphore.acquire();
                    if (rc7Var.n()) {
                        rc7Var.m(zc7Var.d());
                    }
                } catch (InterruptedException unused) {
                    if (z8) {
                        semaphore.release();
                        if (s22Var3.K != zc7Var.d()) {
                        }
                    }
                    return c1e.a;
                } catch (Throwable th) {
                    if (z8) {
                        semaphore.release();
                        if (s22Var3.K != zc7Var.d()) {
                            threadPoolExecutor.execute(mc7Var);
                        }
                    }
                    throw th;
                }
            }
            boolean z9 = rc7Var.d;
            int i4 = rc7Var.n;
            boolean z10 = rc7Var.t;
            if (z9) {
                try {
                    if (z10) {
                        canvasA.save();
                        canvasA.concat(matrix);
                        rc7Var.j(canvasA, s22Var3);
                        canvasA.restore();
                    } else {
                        s22Var3.e(canvasA, matrix, i4, null);
                    }
                } catch (Throwable unused2) {
                    h87.a.getClass();
                    t90 t90Var2 = xn6.a;
                }
            } else if (z10) {
                canvasA.save();
                canvasA.concat(matrix);
                rc7Var.j(canvasA, s22Var3);
                canvasA.restore();
            } else {
                s22Var3.e(canvasA, matrix, i4, null);
            }
            rc7Var.H = false;
            if (z8) {
                semaphore.release();
                if (s22Var3.K != zc7Var.d()) {
                    threadPoolExecutor.execute(mc7Var);
                }
            }
        }
        return c1e.a;
    }
}
