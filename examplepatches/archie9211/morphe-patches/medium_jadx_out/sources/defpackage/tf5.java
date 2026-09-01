package defpackage;

import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Outline;
import android.graphics.Paint;
import android.graphics.PorterDuffXfermode;
import android.os.Build;
import android.view.DisplayListCanvas;
import android.view.RenderNode;
import java.util.concurrent.atomic.AtomicBoolean;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tf5 implements qf5 {
    public static final AtomicBoolean C = new AtomicBoolean(true);
    public boolean A;
    public ts0 B;
    public final h61 b;
    public final g61 c;
    public final RenderNode d;
    public long e;
    public Paint f;
    public Matrix g;
    public boolean h;
    public long i;
    public int j;
    public int k;
    public float l;
    public boolean m;
    public float n;
    public float o;
    public float p;
    public float q;
    public float r;
    public long s;
    public long t;
    public float u;
    public float v;
    public float w;
    public float x;
    public boolean y;
    public boolean z;

    public tf5(mn mnVar, h61 h61Var, g61 g61Var) {
        this.b = h61Var;
        this.c = g61Var;
        RenderNode renderNodeCreate = RenderNode.create("Compose", mnVar);
        this.d = renderNodeCreate;
        this.e = 0L;
        this.i = 0L;
        if (C.getAndSet(false)) {
            renderNodeCreate.setScaleX(renderNodeCreate.getScaleX());
            renderNodeCreate.setScaleY(renderNodeCreate.getScaleY());
            renderNodeCreate.setTranslationX(renderNodeCreate.getTranslationX());
            renderNodeCreate.setTranslationY(renderNodeCreate.getTranslationY());
            renderNodeCreate.setElevation(renderNodeCreate.getElevation());
            renderNodeCreate.setRotation(renderNodeCreate.getRotation());
            renderNodeCreate.setRotationX(renderNodeCreate.getRotationX());
            renderNodeCreate.setRotationY(renderNodeCreate.getRotationY());
            renderNodeCreate.setCameraDistance(renderNodeCreate.getCameraDistance());
            renderNodeCreate.setPivotX(renderNodeCreate.getPivotX());
            renderNodeCreate.setPivotY(renderNodeCreate.getPivotY());
            renderNodeCreate.setClipToOutline(renderNodeCreate.getClipToOutline());
            renderNodeCreate.setClipToBounds(false);
            renderNodeCreate.setAlpha(renderNodeCreate.getAlpha());
            renderNodeCreate.isValid();
            renderNodeCreate.setLeftTopRightBottom(0, 0, 0, 0);
            renderNodeCreate.offsetLeftAndRight(0);
            renderNodeCreate.offsetTopAndBottom(0);
            int i = Build.VERSION.SDK_INT;
            if (i >= 28) {
                q4b.c(renderNodeCreate, q4b.a(renderNodeCreate));
                q4b.d(renderNodeCreate, q4b.b(renderNodeCreate));
            }
            if (i >= 24) {
                p4b.a(renderNodeCreate);
            } else {
                o4b.a(renderNodeCreate);
            }
            renderNodeCreate.setLayerType(0);
            renderNodeCreate.setHasOverlappingRendering(renderNodeCreate.hasOverlappingRendering());
        }
        renderNodeCreate.setClipToBounds(false);
        Q(0);
        this.j = 0;
        this.k = 3;
        this.l = 1.0f;
        this.n = 1.0f;
        this.o = 1.0f;
        long j = uu1.b;
        this.s = j;
        this.t = j;
        this.x = 8.0f;
    }

    @Override // defpackage.qf5
    public final float A() {
        return this.x;
    }

    @Override // defpackage.qf5
    public final float B() {
        return this.p;
    }

    @Override // defpackage.qf5
    public final void C(ts0 ts0Var) {
        this.B = ts0Var;
    }

    @Override // defpackage.qf5
    public final void D(boolean z) {
        this.y = z;
        P();
    }

    @Override // defpackage.qf5
    public final float E() {
        return this.u;
    }

    @Override // defpackage.qf5
    public final void F(m73 m73Var, ip6 ip6Var, of5 of5Var, ce ceVar) {
        Canvas canvasStart = this.d.start(Math.max((int) (this.e >> 32), (int) (this.i >> 32)), Math.max((int) (this.e & 4294967295L), (int) (4294967295L & this.i)));
        try {
            pm pmVar = this.b.a;
            Canvas canvas = pmVar.a;
            pmVar.a = canvasStart;
            g61 g61Var = this.c;
            m50 m50Var = g61Var.b;
            long jC0 = nk7.C0(this.e);
            m73 m73VarY = m50Var.y();
            ip6 ip6VarA = m50Var.A();
            e61 e61VarX = m50Var.x();
            long jB = m50Var.B();
            of5 of5Var2 = (of5) m50Var.c;
            m50Var.O(m73Var);
            m50Var.P(ip6Var);
            m50Var.M(pmVar);
            m50Var.Q(jC0);
            m50Var.c = of5Var;
            pmVar.h();
            try {
                ceVar.invoke(g61Var);
                pmVar.q();
                m50Var.O(m73VarY);
                m50Var.P(ip6VarA);
                m50Var.M(e61VarX);
                m50Var.Q(jB);
                m50Var.c = of5Var2;
                pmVar.a = canvas;
            } catch (Throwable th) {
                pmVar.q();
                m50 m50Var2 = g61Var.b;
                m50Var2.O(m73VarY);
                m50Var2.P(ip6VarA);
                m50Var2.M(e61VarX);
                m50Var2.Q(jB);
                m50Var2.c = of5Var2;
                throw th;
            }
        } finally {
            this.d.end(canvasStart);
        }
    }

    @Override // defpackage.qf5
    public final void G(int i) {
        this.j = i;
        R();
    }

    @Override // defpackage.qf5
    public final void H(float f) {
        this.p = f;
        this.d.setTranslationX(f);
    }

    @Override // defpackage.qf5
    public final void I(long j) {
        if (Build.VERSION.SDK_INT >= 28) {
            this.t = j;
            q4b.d(this.d, op8.n0(j));
        }
    }

    @Override // defpackage.qf5
    public final Matrix J() {
        Matrix matrix = this.g;
        if (matrix == null) {
            matrix = new Matrix();
            this.g = matrix;
        }
        this.d.getMatrix(matrix);
        return matrix;
    }

    @Override // defpackage.qf5
    public final void K(float f) {
        this.x = f;
        this.d.setCameraDistance(-f);
    }

    @Override // defpackage.qf5
    public final float L() {
        return this.r;
    }

    @Override // defpackage.qf5
    public final float M() {
        return this.o;
    }

    @Override // defpackage.qf5
    public final void N(float f) {
        this.u = f;
        this.d.setRotationX(f);
    }

    @Override // defpackage.qf5
    public final int O() {
        return this.k;
    }

    public final void P() {
        boolean z = this.y;
        boolean z2 = false;
        boolean z3 = z && !this.h;
        if (z && this.h) {
            z2 = true;
        }
        if (z3 != this.z) {
            this.z = z3;
            this.d.setClipToBounds(z3);
        }
        if (z2 != this.A) {
            this.A = z2;
            this.d.setClipToOutline(z2);
        }
    }

    public final void Q(int i) {
        RenderNode renderNode = this.d;
        if (i == 1) {
            renderNode.setLayerType(2);
            renderNode.setLayerPaint(this.f);
            renderNode.setHasOverlappingRendering(true);
        } else if (i == 2) {
            renderNode.setLayerType(0);
            renderNode.setLayerPaint(this.f);
            renderNode.setHasOverlappingRendering(false);
        } else {
            renderNode.setLayerType(0);
            renderNode.setLayerPaint(this.f);
            renderNode.setHasOverlappingRendering(true);
        }
    }

    public final void R() {
        int i = this.j;
        if (i != 1 && this.k == 3) {
            Q(i);
        } else {
            Q(1);
        }
    }

    @Override // defpackage.qf5
    public final float a() {
        return this.l;
    }

    @Override // defpackage.qf5
    public final void b(float f) {
        this.v = f;
        this.d.setRotationY(f);
    }

    @Override // defpackage.qf5
    public final float c() {
        return this.n;
    }

    @Override // defpackage.qf5
    public final void d(float f) {
        this.r = f;
        this.d.setElevation(f);
    }

    @Override // defpackage.qf5
    public final ts0 e() {
        return this.B;
    }

    @Override // defpackage.qf5
    public final void f(float f) {
        this.w = f;
        this.d.setRotation(f);
    }

    @Override // defpackage.qf5
    public final void g(float f) {
        this.q = f;
        this.d.setTranslationY(f);
    }

    @Override // defpackage.qf5
    public final void h(Outline outline, long j) {
        this.i = j;
        this.d.setOutline(outline);
        this.h = outline != null;
        P();
    }

    @Override // defpackage.qf5
    public final void i(int i) {
        if (this.k == i) {
            return;
        }
        this.k = i;
        Paint paint = this.f;
        if (paint == null) {
            paint = new Paint();
            this.f = paint;
        }
        paint.setXfermode(new PorterDuffXfermode(nm.M(i)));
        R();
    }

    @Override // defpackage.qf5
    public final void j() {
        int i = Build.VERSION.SDK_INT;
        RenderNode renderNode = this.d;
        if (i >= 24) {
            p4b.a(renderNode);
        } else {
            o4b.a(renderNode);
        }
    }

    @Override // defpackage.qf5
    public final void k(e61 e61Var) {
        DisplayListCanvas displayListCanvasA = qm.a(e61Var);
        displayListCanvasA.getClass();
        displayListCanvasA.drawRenderNode(this.d);
    }

    @Override // defpackage.qf5
    public final int l() {
        return this.j;
    }

    @Override // defpackage.qf5
    public final bs0 m() {
        return null;
    }

    @Override // defpackage.qf5
    public final void n(float f) {
        this.o = f;
        this.d.setScaleY(f);
    }

    @Override // defpackage.qf5
    public final void o(int i, int i2, long j) {
        int i3 = (int) (j >> 32);
        int i4 = (int) (4294967295L & j);
        this.d.setLeftTopRightBottom(i, i2, i + i3, i2 + i4);
        if (s46.a(this.e, j)) {
            return;
        }
        if (this.m) {
            this.d.setPivotX(i3 / 2.0f);
            this.d.setPivotY(i4 / 2.0f);
        }
        this.e = j;
    }

    @Override // defpackage.qf5
    public final float p() {
        return this.v;
    }

    @Override // defpackage.qf5
    public final boolean q() {
        return this.d.isValid();
    }

    @Override // defpackage.qf5
    public final float r() {
        return this.w;
    }

    @Override // defpackage.qf5
    public final void s(long j) {
        if ((9223372034707292159L & j) == 9205357640488583168L) {
            this.m = true;
            this.d.setPivotX(((int) (this.e >> 32)) / 2.0f);
            this.d.setPivotY(((int) (4294967295L & this.e)) / 2.0f);
        } else {
            this.m = false;
            this.d.setPivotX(Float.intBitsToFloat((int) (j >> 32)));
            this.d.setPivotY(Float.intBitsToFloat((int) (j & 4294967295L)));
        }
    }

    @Override // defpackage.qf5
    public final long t() {
        return this.s;
    }

    @Override // defpackage.qf5
    public final void u(float f) {
        this.l = f;
        this.d.setAlpha(f);
    }

    @Override // defpackage.qf5
    public final float v() {
        return this.q;
    }

    @Override // defpackage.qf5
    public final long w() {
        return this.t;
    }

    @Override // defpackage.qf5
    public final void x(long j) {
        if (Build.VERSION.SDK_INT >= 28) {
            this.s = j;
            q4b.c(this.d, op8.n0(j));
        }
    }

    @Override // defpackage.qf5
    public final void y() {
        R();
    }

    @Override // defpackage.qf5
    public final void z(float f) {
        this.n = f;
        this.d.setScaleX(f);
    }
}
