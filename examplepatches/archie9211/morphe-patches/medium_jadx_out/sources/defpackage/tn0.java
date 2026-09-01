package defpackage;

import android.graphics.BlurMaskFilter;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Path;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.RectF;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class tn0 implements qm3, nn0 {
    public float A;
    public BlurMaskFilter B;
    public ao6 C;
    public final Path a = new Path();
    public final Matrix b = new Matrix();
    public final Matrix c = new Matrix();
    public final ao6 d = new ao6(1, 0);
    public final ao6 e;
    public final ao6 f;
    public final ao6 g;
    public final ao6 h;
    public final RectF i;
    public final RectF j;
    public final RectF k;
    public final RectF l;
    public final RectF m;
    public final Matrix n;
    public final rc7 o;
    public final wo6 p;
    public final ku3 q;
    public final zu1 r;
    public tn0 s;
    public tn0 t;
    public List u;
    public final ArrayList v;
    public final mrd w;
    public boolean x;
    public boolean y;
    public ao6 z;

    public tn0(rc7 rc7Var, wo6 wo6Var) {
        char c = 1;
        PorterDuff.Mode mode = PorterDuff.Mode.DST_IN;
        this.e = new ao6(mode);
        PorterDuff.Mode mode2 = PorterDuff.Mode.DST_OUT;
        this.f = new ao6(mode2);
        ao6 ao6Var = new ao6(1, 0);
        this.g = ao6Var;
        PorterDuff.Mode mode3 = PorterDuff.Mode.CLEAR;
        ao6 ao6Var2 = new ao6();
        ao6Var2.setXfermode(new PorterDuffXfermode(mode3));
        this.h = ao6Var2;
        this.i = new RectF();
        this.j = new RectF();
        this.k = new RectF();
        this.l = new RectF();
        this.m = new RectF();
        this.n = new Matrix();
        this.v = new ArrayList();
        this.x = true;
        this.A = 0.0f;
        this.o = rc7Var;
        this.p = wo6Var;
        List list = wo6Var.h;
        if (wo6Var.u == vo6.INVERT) {
            ao6Var.setXfermode(new PorterDuffXfermode(mode2));
        } else {
            ao6Var.setXfermode(new PorterDuffXfermode(mode));
        }
        vu vuVar = wo6Var.i;
        vuVar.getClass();
        mrd mrdVar = new mrd(vuVar);
        this.w = mrdVar;
        mrdVar.b(this);
        if (list != null && !list.isEmpty()) {
            ku3 ku3Var = new ku3(list);
            this.q = ku3Var;
            Iterator it2 = ((ArrayList) ku3Var.b).iterator();
            while (it2.hasNext()) {
                ((rn0) it2.next()).a(this);
            }
            for (rn0 rn0Var : (ArrayList) this.q.c) {
                d(rn0Var);
                rn0Var.a(this);
            }
        }
        wo6 wo6Var2 = this.p;
        if (wo6Var2.t.isEmpty()) {
            if (true != this.x) {
                this.x = true;
                this.o.invalidateSelf();
                return;
            }
            return;
        }
        zu1 zu1Var = new zu1(wo6Var2.t, c == true ? 1 : 0);
        this.r = zu1Var;
        zu1Var.b = true;
        zu1Var.a(new lrd(3, this));
        boolean z = ((Float) this.r.d()).floatValue() == 1.0f;
        if (z != this.x) {
            this.x = z;
            this.o.invalidateSelf();
        }
        d(this.r);
    }

    @Override // defpackage.nn0
    public final void a() {
        this.o.invalidateSelf();
    }

    @Override // defpackage.qm3
    public void c(RectF rectF, Matrix matrix, boolean z) {
        this.i.set(0.0f, 0.0f, 0.0f, 0.0f);
        f();
        Matrix matrix2 = this.n;
        matrix2.set(matrix);
        if (z) {
            List list = this.u;
            if (list != null) {
                for (int size = list.size() - 1; size >= 0; size--) {
                    matrix2.preConcat(((tn0) this.u.get(size)).w.d());
                }
            } else {
                tn0 tn0Var = this.t;
                if (tn0Var != null) {
                    matrix2.preConcat(tn0Var.w.d());
                }
            }
        }
        matrix2.preConcat(this.w.d());
    }

    public final void d(rn0 rn0Var) {
        if (rn0Var == null) {
            return;
        }
        this.v.add(rn0Var);
    }

    /* JADX WARN: Removed duplicated region for block: B:127:0x0355  */
    /* JADX WARN: Removed duplicated region for block: B:84:0x01dd  */
    @Override // defpackage.qm3
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void e(android.graphics.Canvas r20, android.graphics.Matrix r21, int r22, defpackage.bn3 r23) {
        /*
            Method dump skipped, instruction units count: 932
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.tn0.e(android.graphics.Canvas, android.graphics.Matrix, int, bn3):void");
    }

    public final void f() {
        if (this.u != null) {
            return;
        }
        if (this.t == null) {
            this.u = Collections.EMPTY_LIST;
            return;
        }
        this.u = new ArrayList();
        for (tn0 tn0Var = this.t; tn0Var != null; tn0Var = tn0Var.t) {
            this.u.add(tn0Var);
        }
    }

    public final void g(Canvas canvas) {
        t90 t90Var = xn6.a;
        RectF rectF = this.i;
        canvas.drawRect(rectF.left - 1.0f, rectF.top - 1.0f, rectF.right + 1.0f, rectF.bottom + 1.0f, this.h);
    }

    public abstract void i(Canvas canvas, Matrix matrix, int i, bn3 bn3Var);

    public pkf j() {
        return this.p.w;
    }

    public final boolean k() {
        ku3 ku3Var = this.q;
        return (ku3Var == null || ((ArrayList) ku3Var.b).isEmpty()) ? false : true;
    }

    public final void l() {
        tz7 tz7Var = this.o.a.a;
        String str = this.p.c;
    }

    public void m(boolean z) {
        if (z && this.z == null) {
            this.z = new ao6();
        }
        this.y = z;
    }

    public void n(float f) {
        t90 t90Var = xn6.a;
        mrd mrdVar = this.w;
        zu1 zu1Var = mrdVar.p;
        if (zu1Var != null) {
            zu1Var.g(f);
        }
        zu1 zu1Var2 = mrdVar.v;
        if (zu1Var2 != null) {
            zu1Var2.g(f);
        }
        zu1 zu1Var3 = mrdVar.w;
        if (zu1Var3 != null) {
            zu1Var3.g(f);
        }
        vk6 vk6Var = mrdVar.l;
        if (vk6Var != null) {
            vk6Var.g(f);
        }
        rn0 rn0Var = mrdVar.m;
        if (rn0Var != null) {
            rn0Var.g(f);
        }
        se5 se5Var = mrdVar.n;
        if (se5Var != null) {
            se5Var.g(f);
        }
        zu1 zu1Var4 = mrdVar.o;
        if (zu1Var4 != null) {
            zu1Var4.g(f);
        }
        zu1 zu1Var5 = mrdVar.q;
        if (zu1Var5 != null) {
            zu1Var5.g(f);
        }
        zu1 zu1Var6 = mrdVar.r;
        if (zu1Var6 != null) {
            zu1Var6.g(f);
        }
        zu1 zu1Var7 = mrdVar.s;
        if (zu1Var7 != null) {
            zu1Var7.g(f);
        }
        zu1 zu1Var8 = mrdVar.t;
        if (zu1Var8 != null) {
            zu1Var8.g(f);
        }
        zu1 zu1Var9 = mrdVar.u;
        if (zu1Var9 != null) {
            zu1Var9.g(f);
        }
        int i = 0;
        ku3 ku3Var = this.q;
        if (ku3Var != null) {
            ArrayList arrayList = (ArrayList) ku3Var.b;
            for (int i2 = 0; i2 < arrayList.size(); i2++) {
                ((rn0) arrayList.get(i2)).g(f);
            }
            t90 t90Var2 = xn6.a;
        }
        zu1 zu1Var10 = this.r;
        if (zu1Var10 != null) {
            zu1Var10.g(f);
        }
        tn0 tn0Var = this.s;
        if (tn0Var != null) {
            tn0Var.n(f);
        }
        while (true) {
            ArrayList arrayList2 = this.v;
            if (i >= arrayList2.size()) {
                t90 t90Var3 = xn6.a;
                return;
            } else {
                ((rn0) arrayList2.get(i)).g(f);
                i++;
            }
        }
    }

    @Override // defpackage.v72
    public final void b(List list, List list2) {
    }
}
