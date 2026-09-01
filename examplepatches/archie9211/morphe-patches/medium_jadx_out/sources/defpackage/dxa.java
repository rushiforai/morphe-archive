package defpackage;

import android.graphics.Path;
import android.graphics.PointF;
import android.graphics.RectF;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dxa implements nn0, v72, l59 {
    public final boolean c;
    public final rc7 d;
    public final rn0 e;
    public final rn0 f;
    public final zu1 g;
    public boolean j;
    public final Path a = new Path();
    public final RectF b = new RectF();
    public final ru h = new ru(2);
    public rn0 i = null;

    public dxa(rc7 rc7Var, tn0 tn0Var, exa exaVar) {
        this.c = exaVar.c;
        this.d = rc7Var;
        rn0 rn0VarW = exaVar.d.w();
        this.e = rn0VarW;
        rn0 rn0VarW2 = ((xu) exaVar.e).w();
        this.f = rn0VarW2;
        zu1 zu1VarW = exaVar.b.w();
        this.g = zu1VarW;
        tn0Var.d(rn0VarW);
        tn0Var.d(rn0VarW2);
        tn0Var.d(zu1VarW);
        rn0VarW.a(this);
        rn0VarW2.a(this);
        zu1VarW.a(this);
    }

    @Override // defpackage.nn0
    public final void a() {
        this.j = false;
        this.d.invalidateSelf();
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x0028  */
    @Override // defpackage.v72
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void b(java.util.List r5, java.util.List r6) {
        /*
            r4 = this;
            r6 = 0
        L1:
            r0 = r5
            java.util.ArrayList r0 = (java.util.ArrayList) r0
            int r1 = r0.size()
            if (r6 >= r1) goto L35
            java.lang.Object r0 = r0.get(r6)
            v72 r0 = (defpackage.v72) r0
            boolean r1 = r0 instanceof defpackage.ntd
            if (r1 == 0) goto L28
            r1 = r0
            ntd r1 = (defpackage.ntd) r1
            s4c r2 = r1.c
            s4c r3 = defpackage.s4c.SIMULTANEOUSLY
            if (r2 != r3) goto L28
            ru r0 = r4.h
            java.util.ArrayList r0 = r0.b
            r0.add(r1)
            r1.d(r4)
            goto L32
        L28:
            boolean r1 = r0 instanceof defpackage.emb
            if (r1 == 0) goto L32
            emb r0 = (defpackage.emb) r0
            rn0 r0 = r0.b
            r4.i = r0
        L32:
            int r6 = r6 + 1
            goto L1
        L35:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.dxa.b(java.util.List, java.util.List):void");
    }

    @Override // defpackage.l59
    public final Path h() {
        float f;
        rn0 rn0Var;
        boolean z = this.j;
        Path path = this.a;
        if (z) {
            return path;
        }
        path.reset();
        if (this.c) {
            this.j = true;
            return path;
        }
        PointF pointF = (PointF) this.f.d();
        float f2 = pointF.x / 2.0f;
        float f3 = pointF.y / 2.0f;
        zu1 zu1Var = this.g;
        float fI = zu1Var == null ? 0.0f : zu1Var.i();
        if (fI == 0.0f && (rn0Var = this.i) != null) {
            fI = Math.min(((Float) rn0Var.d()).floatValue(), Math.min(f2, f3));
        }
        float fMin = Math.min(f2, f3);
        if (fI > fMin) {
            fI = fMin;
        }
        PointF pointF2 = (PointF) this.e.d();
        path.moveTo(pointF2.x + f2, (pointF2.y - f3) + fI);
        path.lineTo(pointF2.x + f2, (pointF2.y + f3) - fI);
        RectF rectF = this.b;
        if (fI > 0.0f) {
            float f4 = pointF2.x + f2;
            float f5 = fI * 2.0f;
            f = 2.0f;
            float f6 = pointF2.y + f3;
            rectF.set(f4 - f5, f6 - f5, f4, f6);
            path.arcTo(rectF, 0.0f, 90.0f, false);
        } else {
            f = 2.0f;
        }
        path.lineTo((pointF2.x - f2) + fI, pointF2.y + f3);
        if (fI > 0.0f) {
            float f7 = pointF2.x - f2;
            float f8 = pointF2.y + f3;
            float f9 = fI * f;
            rectF.set(f7, f8 - f9, f9 + f7, f8);
            path.arcTo(rectF, 90.0f, 90.0f, false);
        }
        path.lineTo(pointF2.x - f2, (pointF2.y - f3) + fI);
        if (fI > 0.0f) {
            float f10 = pointF2.x - f2;
            float f11 = pointF2.y - f3;
            float f12 = fI * f;
            rectF.set(f10, f11, f10 + f12, f12 + f11);
            path.arcTo(rectF, 180.0f, 90.0f, false);
        }
        path.lineTo((pointF2.x + f2) - fI, pointF2.y - f3);
        if (fI > 0.0f) {
            float f13 = pointF2.x + f2;
            float f14 = fI * f;
            float f15 = pointF2.y - f3;
            rectF.set(f13 - f14, f15, f13, f14 + f15);
            path.arcTo(rectF, 270.0f, 90.0f, false);
        }
        path.close();
        this.h.e(path);
        this.j = true;
        return path;
    }
}
