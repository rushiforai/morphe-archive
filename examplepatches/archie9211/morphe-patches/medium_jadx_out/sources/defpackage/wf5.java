package defpackage;

import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Outline;
import android.graphics.Paint;
import android.graphics.PorterDuffXfermode;
import android.graphics.Rect;
import android.os.Build;
import android.view.View;
import android.view.ViewParent;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wf5 implements qf5 {
    public static final vf5 C = new vf5();
    public float A;
    public ts0 B;
    public final wl3 b;
    public final h61 c;
    public final oue d;
    public final Resources e;
    public final Rect f;
    public Paint g;
    public int h;
    public int i;
    public long j;
    public boolean k;
    public boolean l;
    public boolean m;
    public int n;
    public int o;
    public float p;
    public boolean q;
    public float r;
    public float s;
    public float t;
    public float u;
    public float v;
    public long w;
    public long x;
    public float y;
    public float z;

    public wf5(wl3 wl3Var) {
        h61 h61Var = new h61();
        g61 g61Var = new g61();
        this.b = wl3Var;
        this.c = h61Var;
        oue oueVar = new oue(wl3Var, h61Var, g61Var);
        this.d = oueVar;
        this.e = wl3Var.getResources();
        this.f = new Rect();
        wl3Var.addView(oueVar);
        oueVar.setClipBounds(null);
        this.j = 0L;
        View.generateViewId();
        this.n = 3;
        this.o = 0;
        this.p = 1.0f;
        this.r = 1.0f;
        this.s = 1.0f;
        long j = uu1.b;
        this.w = j;
        this.x = j;
    }

    @Override // defpackage.qf5
    public final float A() {
        return this.d.getCameraDistance() / this.e.getDisplayMetrics().densityDpi;
    }

    @Override // defpackage.qf5
    public final float B() {
        return this.t;
    }

    @Override // defpackage.qf5
    public final void C(ts0 ts0Var) {
        this.B = ts0Var;
        if (Build.VERSION.SDK_INT >= 31) {
            io.r(this.d, ts0Var);
        }
    }

    @Override // defpackage.qf5
    public final void D(boolean z) {
        boolean z2 = false;
        this.m = z && !this.l;
        this.k = true;
        if (z && this.l) {
            z2 = true;
        }
        this.d.setClipToOutline(z2);
    }

    @Override // defpackage.qf5
    public final float E() {
        return this.y;
    }

    /* JADX WARN: Type inference fix 'apply assigned field type' failed
    java.lang.UnsupportedOperationException: ArgType.getObject(), call class: class jadx.core.dex.instructions.args.ArgType$PrimitiveArg
    	at jadx.core.dex.instructions.args.ArgType.getObject(ArgType.java:593)
    	at jadx.core.dex.attributes.nodes.ClassTypeVarsAttr.getTypeVarsMapFor(ClassTypeVarsAttr.java:35)
    	at jadx.core.dex.nodes.utils.TypeUtils.replaceClassGenerics(TypeUtils.java:177)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.insertExplicitUseCast(FixTypesVisitor.java:397)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.tryFieldTypeWithNewCasts(FixTypesVisitor.java:359)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.applyFieldType(FixTypesVisitor.java:309)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.visit(FixTypesVisitor.java:94)
     */
    @Override // defpackage.qf5
    public final void F(m73 m73Var, ip6 ip6Var, of5 of5Var, ce ceVar) {
        oue oueVar = this.d;
        ViewParent parent = oueVar.getParent();
        wl3 wl3Var = this.b;
        if (parent == null) {
            wl3Var.addView(oueVar);
        }
        oueVar.g = m73Var;
        oueVar.h = ip6Var;
        oueVar.i = ceVar;
        oueVar.j = of5Var;
        if (oueVar.isAttachedToWindow()) {
            oueVar.setVisibility(4);
            oueVar.setVisibility(0);
            try {
                pm pmVar = this.c.a;
                vf5 vf5Var = C;
                Canvas canvas = pmVar.a;
                pmVar.a = vf5Var;
                wl3Var.a(pmVar, oueVar, oueVar.getDrawingTime());
                pmVar.a = canvas;
            } catch (ClassCastException unused) {
            }
        }
    }

    @Override // defpackage.qf5
    public final void G(int i) {
        this.o = i;
        Q();
    }

    @Override // defpackage.qf5
    public final void H(float f) {
        this.t = f;
        this.d.setTranslationX(f);
    }

    @Override // defpackage.qf5
    public final void I(long j) {
        if (Build.VERSION.SDK_INT >= 28) {
            this.x = j;
            uy.J(this.d, op8.n0(j));
        }
    }

    @Override // defpackage.qf5
    public final Matrix J() {
        return this.d.getMatrix();
    }

    @Override // defpackage.qf5
    public final void K(float f) {
        this.d.setCameraDistance(f * this.e.getDisplayMetrics().densityDpi);
    }

    @Override // defpackage.qf5
    public final float L() {
        return this.v;
    }

    @Override // defpackage.qf5
    public final float M() {
        return this.s;
    }

    @Override // defpackage.qf5
    public final void N(float f) {
        this.y = f;
        this.d.setRotationX(f);
    }

    @Override // defpackage.qf5
    public final int O() {
        return this.n;
    }

    public final void P(int i) {
        Paint paint = this.g;
        oue oueVar = this.d;
        boolean z = true;
        if (i == 1) {
            oueVar.setLayerType(2, paint);
        } else if (i == 2) {
            oueVar.setLayerType(0, paint);
            z = false;
        } else {
            oueVar.setLayerType(0, paint);
        }
        oueVar.setCanUseCompositingLayer$ui_graphics(z);
    }

    public final void Q() {
        int i = this.o;
        if (i != 1 && this.n == 3) {
            P(i);
        } else {
            P(1);
        }
    }

    @Override // defpackage.qf5
    public final float a() {
        return this.p;
    }

    @Override // defpackage.qf5
    public final void b(float f) {
        this.z = f;
        this.d.setRotationY(f);
    }

    @Override // defpackage.qf5
    public final float c() {
        return this.r;
    }

    @Override // defpackage.qf5
    public final void d(float f) {
        this.v = f;
        this.d.setElevation(f);
    }

    @Override // defpackage.qf5
    public final ts0 e() {
        return this.B;
    }

    @Override // defpackage.qf5
    public final void f(float f) {
        this.A = f;
        this.d.setRotation(f);
    }

    @Override // defpackage.qf5
    public final void g(float f) {
        this.u = f;
        this.d.setTranslationY(f);
    }

    @Override // defpackage.qf5
    public final void h(Outline outline, long j) {
        oue oueVar = this.d;
        oueVar.e = outline;
        oueVar.invalidateOutline();
        if ((this.m || oueVar.getClipToOutline()) && outline != null) {
            oueVar.setClipToOutline(true);
            if (this.m) {
                this.m = false;
                this.k = true;
            }
        }
        this.l = outline != null;
    }

    @Override // defpackage.qf5
    public final void i(int i) {
        this.n = i;
        Paint paint = this.g;
        if (paint == null) {
            paint = new Paint();
            this.g = paint;
        }
        paint.setXfermode(new PorterDuffXfermode(nm.M(i)));
        Q();
    }

    @Override // defpackage.qf5
    public final void j() {
        this.b.removeViewInLayout(this.d);
    }

    @Override // defpackage.qf5
    public final void k(e61 e61Var) {
        Rect rect;
        boolean z = this.k;
        oue oueVar = this.d;
        if (z) {
            if ((this.m || oueVar.getClipToOutline()) && !this.l) {
                rect = this.f;
                rect.left = 0;
                rect.top = 0;
                rect.right = oueVar.getWidth();
                rect.bottom = oueVar.getHeight();
            } else {
                rect = null;
            }
            oueVar.setClipBounds(rect);
        }
        if (qm.a(e61Var).isHardwareAccelerated()) {
            this.b.a(e61Var, oueVar, oueVar.getDrawingTime());
        }
    }

    @Override // defpackage.qf5
    public final int l() {
        return this.o;
    }

    @Override // defpackage.qf5
    public final bs0 m() {
        return null;
    }

    @Override // defpackage.qf5
    public final void n(float f) {
        this.s = f;
        this.d.setScaleY(f);
    }

    @Override // defpackage.qf5
    public final void o(int i, int i2, long j) {
        boolean zA = s46.a(this.j, j);
        oue oueVar = this.d;
        if (zA) {
            int i3 = this.h;
            if (i3 != i) {
                oueVar.offsetLeftAndRight(i - i3);
            }
            int i4 = this.i;
            if (i4 != i2) {
                oueVar.offsetTopAndBottom(i2 - i4);
            }
        } else {
            if (this.m || oueVar.getClipToOutline()) {
                this.k = true;
            }
            int i5 = (int) (j >> 32);
            int i6 = (int) (4294967295L & j);
            oueVar.layout(i, i2, i + i5, i2 + i6);
            this.j = j;
            if (this.q) {
                oueVar.setPivotX(i5 / 2.0f);
                oueVar.setPivotY(i6 / 2.0f);
            }
        }
        this.h = i;
        this.i = i2;
    }

    @Override // defpackage.qf5
    public final float p() {
        return this.z;
    }

    @Override // defpackage.qf5
    public final boolean q() {
        return true;
    }

    @Override // defpackage.qf5
    public final float r() {
        return this.A;
    }

    @Override // defpackage.qf5
    public final void s(long j) {
        long j2 = 9223372034707292159L & j;
        oue oueVar = this.d;
        if (j2 != 9205357640488583168L) {
            this.q = false;
            oueVar.setPivotX(Float.intBitsToFloat((int) (j >> 32)));
            oueVar.setPivotY(Float.intBitsToFloat((int) (j & 4294967295L)));
        } else {
            if (Build.VERSION.SDK_INT >= 28) {
                uy.B(oueVar);
                return;
            }
            this.q = true;
            oueVar.setPivotX(((int) (this.j >> 32)) / 2.0f);
            oueVar.setPivotY(((int) (this.j & 4294967295L)) / 2.0f);
        }
    }

    @Override // defpackage.qf5
    public final long t() {
        return this.w;
    }

    @Override // defpackage.qf5
    public final void u(float f) {
        this.p = f;
        this.d.setAlpha(f);
    }

    @Override // defpackage.qf5
    public final float v() {
        return this.u;
    }

    @Override // defpackage.qf5
    public final long w() {
        return this.x;
    }

    @Override // defpackage.qf5
    public final void x(long j) {
        if (Build.VERSION.SDK_INT >= 28) {
            this.w = j;
            uy.I(this.d, op8.n0(j));
        }
    }

    @Override // defpackage.qf5
    public final void y() {
        Paint paint = this.g;
        if (paint == null) {
            paint = new Paint();
            this.g = paint;
        }
        paint.setColorFilter(null);
        Q();
    }

    @Override // defpackage.qf5
    public final void z(float f) {
        this.r = f;
        this.d.setScaleX(f);
    }
}
