package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0001\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Likd;", "Lu28;", "Llkd;", "foundation"}, k = 1, mv = {2, 1, 0}, xi = 48)
public final class ikd extends u28 {
    public final String b;
    public final mkd c;
    public final yy4 d;
    public final int e;
    public final boolean f;
    public final int g;
    public final int h;
    public final dv1 i;

    public ikd(String str, mkd mkdVar, yy4 yy4Var, int i, boolean z, int i2, int i3, dv1 dv1Var) {
        this.b = str;
        this.c = mkdVar;
        this.d = yy4Var;
        this.e = i;
        this.f = z;
        this.g = i2;
        this.h = i3;
        this.i = dv1Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ikd)) {
            return false;
        }
        ikd ikdVar = (ikd) obj;
        return g76.L(this.i, ikdVar.i) && g76.L(this.b, ikdVar.b) && g76.L(this.c, ikdVar.c) && g76.L(this.d, ikdVar.d) && this.e == ikdVar.e && this.f == ikdVar.f && this.g == ikdVar.g && this.h == ikdVar.h;
    }

    @Override // defpackage.u28
    public final q28 f() {
        lkd lkdVar = new lkd();
        lkdVar.o = this.b;
        lkdVar.p = this.c;
        lkdVar.q = this.d;
        lkdVar.r = this.e;
        lkdVar.s = this.f;
        lkdVar.t = this.g;
        lkdVar.u = this.h;
        lkdVar.v = this.i;
        return lkdVar;
    }

    public final int hashCode() {
        int iHashCode = (((((((((this.d.hashCode() + b09.o(this.c, this.b.hashCode() * 31, 31)) * 31) + this.e) * 31) + (this.f ? 1231 : 1237)) * 31) + this.g) * 31) + this.h) * 31;
        dv1 dv1Var = this.i;
        return iHashCode + (dv1Var != null ? dv1Var.hashCode() : 0);
    }

    /* JADX WARN: Removed duplicated region for block: B:11:0x002a  */
    @Override // defpackage.u28
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void l(defpackage.q28 r18) {
        /*
            r17 = this;
            r0 = r17
            r1 = r18
            lkd r1 = (defpackage.lkd) r1
            dv1 r2 = r1.v
            dv1 r3 = r0.i
            boolean r2 = defpackage.g76.L(r3, r2)
            r1.v = r3
            r3 = 0
            r4 = 1
            mkd r5 = r0.c
            if (r2 == 0) goto L2a
            mkd r2 = r1.p
            if (r5 == r2) goto L25
            skc r6 = r5.a
            skc r2 = r2.a
            boolean r2 = r6.b(r2)
            if (r2 == 0) goto L2a
            goto L28
        L25:
            r5.getClass()
        L28:
            r2 = r3
            goto L2b
        L2a:
            r2 = r4
        L2b:
            java.lang.String r6 = r1.o
            java.lang.String r7 = r0.b
            boolean r6 = defpackage.g76.L(r6, r7)
            r8 = 0
            if (r6 == 0) goto L37
            goto L3c
        L37:
            r1.o = r7
            r1.A = r8
            r3 = r4
        L3c:
            mkd r6 = r1.p
            boolean r6 = r6.c(r5)
            r6 = r6 ^ r4
            r1.p = r5
            int r5 = r1.u
            int r7 = r0.h
            if (r5 == r7) goto L4e
            r1.u = r7
            r6 = r4
        L4e:
            int r5 = r1.t
            int r7 = r0.g
            if (r5 == r7) goto L57
            r1.t = r7
            r6 = r4
        L57:
            boolean r5 = r1.s
            boolean r7 = r0.f
            if (r5 == r7) goto L60
            r1.s = r7
            r6 = r4
        L60:
            yy4 r5 = r1.q
            yy4 r7 = r0.d
            boolean r5 = defpackage.g76.L(r5, r7)
            if (r5 != 0) goto L6d
            r1.q = r7
            r6 = r4
        L6d:
            int r5 = r1.r
            int r0 = r0.e
            if (r5 != r0) goto L75
            r4 = r6
            goto L77
        L75:
            r1.r = r0
        L77:
            if (r2 != 0) goto L7d
            if (r3 != 0) goto L7d
            if (r4 == 0) goto L7f
        L7d:
            r1.y = r8
        L7f:
            if (r3 != 0) goto L83
            if (r4 == 0) goto L9a
        L83:
            g29 r9 = r1.I0()
            java.lang.String r10 = r1.o
            mkd r11 = r1.p
            yy4 r12 = r1.q
            int r13 = r1.r
            boolean r14 = r1.s
            int r15 = r1.t
            int r0 = r1.u
            r16 = r0
            r9.f(r10, r11, r12, r13, r14, r15, r16)
        L9a:
            boolean r0 = r1.n
            if (r0 != 0) goto L9f
            goto Lb9
        L9f:
            if (r3 != 0) goto La7
            if (r2 == 0) goto Laa
            jkd r0 = r1.z
            if (r0 == 0) goto Laa
        La7:
            defpackage.dl7.u(r1)
        Laa:
            if (r3 != 0) goto Lae
            if (r4 == 0) goto Lb4
        Lae:
            defpackage.gx1.M(r1)
            defpackage.wgf.y(r1)
        Lb4:
            if (r2 == 0) goto Lb9
            defpackage.wgf.y(r1)
        Lb9:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ikd.l(q28):void");
    }
}
