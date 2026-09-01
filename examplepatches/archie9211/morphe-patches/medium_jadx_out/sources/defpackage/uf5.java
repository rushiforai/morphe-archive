package defpackage;

import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Outline;
import android.graphics.Paint;
import android.graphics.RecordingCanvas;
import android.graphics.RenderNode;
import android.os.Build;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class uf5 implements qf5 {
    public final h61 b;
    public final g61 c;
    public final RenderNode d;
    public long e;
    public Paint f;
    public Matrix g;
    public boolean h;
    public float i;
    public int j;
    public float k;
    public float l;
    public float m;
    public float n;
    public float o;
    public long p;
    public long q;
    public float r;
    public float s;
    public float t;
    public float u;
    public boolean v;
    public boolean w;
    public boolean x;
    public ts0 y;
    public int z;

    public uf5() {
        h61 h61Var = new h61();
        g61 g61Var = new g61();
        this.b = h61Var;
        this.c = g61Var;
        RenderNode renderNode = new RenderNode("graphicsLayer");
        this.d = renderNode;
        this.e = 0L;
        renderNode.setClipToBounds(false);
        Q(renderNode, 0);
        this.i = 1.0f;
        this.j = 3;
        this.k = 1.0f;
        this.l = 1.0f;
        long j = uu1.b;
        this.p = j;
        this.q = j;
        this.u = 8.0f;
        this.z = 0;
    }

    @Override // defpackage.qf5
    public final float A() {
        return this.u;
    }

    @Override // defpackage.qf5
    public final float B() {
        return this.m;
    }

    @Override // defpackage.qf5
    public final void C(ts0 ts0Var) {
        this.y = ts0Var;
        if (Build.VERSION.SDK_INT >= 31) {
            io.q(this.d, ts0Var);
        }
    }

    @Override // defpackage.qf5
    public final void D(boolean z) {
        this.v = z;
        P();
    }

    @Override // defpackage.qf5
    public final float E() {
        return this.r;
    }

    @Override // defpackage.qf5
    public final void F(m73 m73Var, ip6 ip6Var, of5 of5Var, ce ceVar) {
        g61 g61Var = this.c;
        RecordingCanvas recordingCanvasBeginRecording = this.d.beginRecording();
        try {
            h61 h61Var = this.b;
            pm pmVar = h61Var.a;
            Canvas canvas = pmVar.a;
            pmVar.a = recordingCanvasBeginRecording;
            m50 m50Var = g61Var.b;
            m50Var.O(m73Var);
            m50Var.P(ip6Var);
            m50Var.c = of5Var;
            m50Var.Q(this.e);
            m50Var.M(pmVar);
            ceVar.invoke(g61Var);
            h61Var.a.a = canvas;
        } finally {
            this.d.endRecording();
        }
    }

    @Override // defpackage.qf5
    public final void G(int i) {
        this.z = i;
        R();
    }

    @Override // defpackage.qf5
    public final void H(float f) {
        this.m = f;
        this.d.setTranslationX(f);
    }

    @Override // defpackage.qf5
    public final void I(long j) {
        this.q = j;
        this.d.setSpotShadowColor(op8.n0(j));
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
        this.u = f;
        this.d.setCameraDistance(f);
    }

    @Override // defpackage.qf5
    public final float L() {
        return this.o;
    }

    @Override // defpackage.qf5
    public final float M() {
        return this.l;
    }

    @Override // defpackage.qf5
    public final void N(float f) {
        this.r = f;
        this.d.setRotationX(f);
    }

    @Override // defpackage.qf5
    public final int O() {
        return this.j;
    }

    public final void P() {
        boolean z = this.v;
        boolean z2 = false;
        boolean z3 = z && !this.h;
        if (z && this.h) {
            z2 = true;
        }
        if (z3 != this.w) {
            this.w = z3;
            this.d.setClipToBounds(z3);
        }
        if (z2 != this.x) {
            this.x = z2;
            this.d.setClipToOutline(z2);
        }
    }

    public final void Q(RenderNode renderNode, int i) {
        if (i == 1) {
            renderNode.setUseCompositingLayer(true, this.f);
            renderNode.setHasOverlappingRendering(true);
            return;
        }
        Paint paint = this.f;
        if (i == 2) {
            renderNode.setUseCompositingLayer(false, paint);
            renderNode.setHasOverlappingRendering(false);
        } else {
            renderNode.setUseCompositingLayer(false, paint);
            renderNode.setHasOverlappingRendering(true);
        }
    }

    public final void R() {
        int i = this.z;
        if (i != 1 && this.j == 3 && this.y == null) {
            Q(this.d, i);
        } else {
            Q(this.d, 1);
        }
    }

    @Override // defpackage.qf5
    public final float a() {
        return this.i;
    }

    @Override // defpackage.qf5
    public final void b(float f) {
        this.s = f;
        this.d.setRotationY(f);
    }

    @Override // defpackage.qf5
    public final float c() {
        return this.k;
    }

    @Override // defpackage.qf5
    public final void d(float f) {
        this.o = f;
        this.d.setElevation(f);
    }

    @Override // defpackage.qf5
    public final ts0 e() {
        return this.y;
    }

    @Override // defpackage.qf5
    public final void f(float f) {
        this.t = f;
        this.d.setRotationZ(f);
    }

    @Override // defpackage.qf5
    public final void g(float f) {
        this.n = f;
        this.d.setTranslationY(f);
    }

    @Override // defpackage.qf5
    public final void h(Outline outline, long j) {
        this.d.setOutline(outline);
        this.h = outline != null;
        P();
    }

    @Override // defpackage.qf5
    public final void i(int i) {
        this.j = i;
        Paint paint = this.f;
        if (paint == null) {
            paint = new Paint();
            this.f = paint;
        }
        paint.setBlendMode(nm.K(i));
        R();
    }

    @Override // defpackage.qf5
    public final void j() {
        this.d.discardDisplayList();
    }

    @Override // defpackage.qf5
    public final void k(e61 e61Var) {
        qm.a(e61Var).drawRenderNode(this.d);
    }

    @Override // defpackage.qf5
    public final int l() {
        return this.z;
    }

    @Override // defpackage.qf5
    public final bs0 m() {
        return null;
    }

    @Override // defpackage.qf5
    public final void n(float f) {
        this.l = f;
        this.d.setScaleY(f);
    }

    @Override // defpackage.qf5
    public final void o(int i, int i2, long j) {
        this.d.setPosition(i, i2, ((int) (j >> 32)) + i, ((int) (4294967295L & j)) + i2);
        this.e = nk7.C0(j);
    }

    @Override // defpackage.qf5
    public final float p() {
        return this.s;
    }

    @Override // defpackage.qf5
    public final boolean q() {
        return this.d.hasDisplayList();
    }

    @Override // defpackage.qf5
    public final float r() {
        return this.t;
    }

    @Override // defpackage.qf5
    public final void s(long j) {
        long j2 = 9223372034707292159L & j;
        RenderNode renderNode = this.d;
        if (j2 == 9205357640488583168L) {
            renderNode.resetPivot();
        } else {
            renderNode.setPivotX(Float.intBitsToFloat((int) (j >> 32)));
            this.d.setPivotY(Float.intBitsToFloat((int) (j & 4294967295L)));
        }
    }

    @Override // defpackage.qf5
    public final long t() {
        return this.p;
    }

    @Override // defpackage.qf5
    public final void u(float f) {
        this.i = f;
        this.d.setAlpha(f);
    }

    @Override // defpackage.qf5
    public final float v() {
        return this.n;
    }

    @Override // defpackage.qf5
    public final long w() {
        return this.q;
    }

    @Override // defpackage.qf5
    public final void x(long j) {
        this.p = j;
        this.d.setAmbientShadowColor(op8.n0(j));
    }

    @Override // defpackage.qf5
    public final void y() {
        Paint paint = this.f;
        if (paint == null) {
            paint = new Paint();
            this.f = paint;
        }
        paint.setColorFilter(null);
        R();
    }

    @Override // defpackage.qf5
    public final void z(float f) {
        this.k = f;
        this.d.setScaleX(f);
    }
}
