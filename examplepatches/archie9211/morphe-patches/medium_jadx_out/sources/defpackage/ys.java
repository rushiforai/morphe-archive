package defpackage;

import android.graphics.Paint;
import android.text.TextPaint;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ys extends TextPaint {
    public uq a;
    public ohd b;
    public int c;
    public i3c d;
    public uu1 e;
    public ez0 f;
    public j83 g;
    public dfc h;
    public pxf i;

    public final uq a() {
        uq uqVar = this.a;
        if (uqVar != null) {
            return uqVar;
        }
        uq uqVar2 = new uq(this);
        this.a = uqVar2;
        return uqVar2;
    }

    public final void b(int i) {
        if (i == this.c) {
            return;
        }
        a().d(i);
        this.c = i;
    }

    /* JADX WARN: Removed duplicated region for block: B:19:0x0038  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void c(defpackage.ez0 r6, long r7, float r9) {
        /*
            r5 = this;
            r0 = 0
            if (r6 != 0) goto Ld
            r5.g = r0
            r5.f = r0
            r5.h = r0
            r5.setShader(r0)
            return
        Ld:
            boolean r1 = r6 instanceof defpackage.dkc
            if (r1 == 0) goto L1d
            dkc r6 = (defpackage.dkc) r6
            long r6 = r6.a
            long r6 = defpackage.mq7.D(r9, r6)
            r5.d(r6)
            return
        L1d:
            boolean r1 = r6 instanceof defpackage.g3c
            if (r1 == 0) goto L6e
            ez0 r1 = r5.f
            boolean r1 = defpackage.g76.L(r1, r6)
            r2 = 0
            if (r1 == 0) goto L38
            dfc r1 = r5.h
            if (r1 != 0) goto L30
            r1 = r2
            goto L36
        L30:
            long r3 = r1.a
            boolean r1 = defpackage.dfc.a(r3, r7)
        L36:
            if (r1 != 0) goto L55
        L38:
            r3 = 9205357640488583168(0x7fc000007fc00000, double:2.247117487993712E307)
            int r1 = (r7 > r3 ? 1 : (r7 == r3 ? 0 : -1))
            if (r1 == 0) goto L55
            r5.f = r6
            dfc r1 = new dfc
            r1.<init>(r7)
            r5.h = r1
            xs r1 = new xs
            r1.<init>(r2, r7, r6)
            j83 r6 = defpackage.bjc.b(r1)
            r5.g = r6
        L55:
            uq r6 = r5.a()
            j83 r7 = r5.g
            if (r7 == 0) goto L64
            java.lang.Object r7 = r7.getValue()
            android.graphics.Shader r7 = (android.graphics.Shader) r7
            goto L65
        L64:
            r7 = r0
        L65:
            r6.h(r7)
            r5.e = r0
            defpackage.vc2.O(r5, r9)
            return
        L6e:
            defpackage.ygf.a()
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ys.c(ez0, long, float):void");
    }

    public final void d(long j) {
        uu1 uu1Var = this.e;
        if ((uu1Var == null ? false : ezd.a(uu1Var.a, j)) || j == 16) {
            return;
        }
        this.e = new uu1(j);
        setColor(op8.n0(j));
        this.g = null;
        this.f = null;
        this.h = null;
        setShader(null);
    }

    public final void e(pxf pxfVar) {
        if (pxfVar == null || g76.L(this.i, pxfVar)) {
            return;
        }
        this.i = pxfVar;
        if (pxfVar.equals(ph4.R)) {
            setStyle(Paint.Style.FILL);
            return;
        }
        if (!(pxfVar instanceof uuc)) {
            ygf.a();
            return;
        }
        a().l(1);
        uuc uucVar = (uuc) pxfVar;
        a().k(uucVar.R);
        uq uqVarA = a();
        uqVarA.a.setStrokeMiter(uucVar.S);
        a().j(uucVar.U);
        a().i(uucVar.T);
        a().a.setPathEffect(null);
    }

    public final void f(i3c i3cVar) {
        if (i3cVar == null || g76.L(this.d, i3cVar)) {
            return;
        }
        this.d = i3cVar;
        if (i3cVar.equals(i3c.d)) {
            clearShadowLayer();
            return;
        }
        i3c i3cVar2 = this.d;
        float f = i3cVar2.c;
        if (f == 0.0f) {
            f = Float.MIN_VALUE;
        }
        setShadowLayer(f, Float.intBitsToFloat((int) (i3cVar2.b >> 32)), Float.intBitsToFloat((int) (this.d.b & 4294967295L)), op8.n0(this.d.a));
    }

    public final void g(ohd ohdVar) {
        if (ohdVar == null || g76.L(this.b, ohdVar)) {
            return;
        }
        this.b = ohdVar;
        int i = ohdVar.a;
        setUnderlineText((i | 1) == i);
        int i2 = this.b.a;
        setStrikeThruText((i2 | 2) == i2);
    }
}
