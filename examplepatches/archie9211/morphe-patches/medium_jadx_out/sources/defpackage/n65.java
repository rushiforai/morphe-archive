package defpackage;

import java.util.HashSet;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class n65 extends l22 {
    public final long a;
    public final boolean b;
    public final boolean c;
    public HashSet d;
    public final g78 e;
    public final k49 f;
    public final /* synthetic */ p65 g;

    public n65(p65 p65Var, long j, boolean z, boolean z2, md5 md5Var) {
        this.g = p65Var;
        this.a = j;
        this.b = z;
        this.c = z2;
        g78 g78Var = iqb.a;
        this.e = new g78();
        this.f = new k49(i89.d, uob.g);
    }

    @Override // defpackage.l22
    public final void a(q22 q22Var, b55 b55Var) {
        this.g.b.a(q22Var, b55Var);
    }

    @Override // defpackage.l22
    public final g78 b(q22 q22Var, m8c m8cVar, b55 b55Var) {
        return this.g.b.b(q22Var, m8cVar, b55Var);
    }

    @Override // defpackage.l22
    public final void c() {
        p65 p65Var = this.g;
        p65Var.A--;
    }

    @Override // defpackage.l22
    public final boolean d() {
        return this.g.b.d();
    }

    @Override // defpackage.l22
    public final boolean e() {
        return this.b;
    }

    @Override // defpackage.l22
    public final boolean f() {
        return this.c;
    }

    @Override // defpackage.l22
    public final long g() {
        return this.a;
    }

    @Override // defpackage.l22
    public final k22 h() {
        return this.g.h;
    }

    @Override // defpackage.l22
    public final i89 i() {
        return (i89) this.f.getValue();
    }

    @Override // defpackage.l22
    public final ib2 j() {
        return this.g.b.j();
    }

    @Override // defpackage.l22
    public final boolean k() {
        return this.g.b.k();
    }

    @Override // defpackage.l22
    public final void l(q22 q22Var) {
        p65 p65Var = this.g;
        l22 l22Var = p65Var.b;
        l22Var.l(p65Var.h);
        l22Var.l(q22Var);
    }

    @Override // defpackage.l22
    public final r48 m(s48 s48Var) {
        return this.g.b.m(s48Var);
    }

    @Override // defpackage.l22
    public final g78 n(q22 q22Var, m8c m8cVar, g78 g78Var) {
        return this.g.b.n(q22Var, m8cVar, g78Var);
    }

    @Override // defpackage.l22
    public final void o(Set set) {
        HashSet hashSet = this.d;
        if (hashSet == null) {
            hashSet = new HashSet();
            this.d = hashSet;
        }
        hashSet.add(set);
    }

    @Override // defpackage.l22
    public final void p(p65 p65Var) {
        this.e.a(p65Var);
    }

    @Override // defpackage.l22
    public final void q(mwa mwaVar) {
        this.g.b.q(mwaVar);
    }

    @Override // defpackage.l22
    public final void r(q22 q22Var) {
        this.g.b.r(q22Var);
    }

    @Override // defpackage.l22
    public final y51 s(ir irVar) {
        return this.g.b.s(irVar);
    }

    @Override // defpackage.l22
    public final void t() {
        this.g.A++;
    }

    @Override // defpackage.l22
    public final void u(p65 p65Var) {
        HashSet<Set> hashSet = this.d;
        if (hashSet != null) {
            for (Set set : hashSet) {
                p65Var.getClass();
                set.remove(p65Var.x());
            }
        }
        if (y30.C(p65Var)) {
            this.e.l(p65Var);
        }
    }

    @Override // defpackage.l22
    public final void v(q22 q22Var) {
        this.g.b.v(q22Var);
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x0061  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void w() {
        /*
            r15 = this;
            g78 r0 = r15.e
            boolean r1 = r0.h()
            if (r1 == 0) goto L69
            java.util.HashSet r15 = r15.d
            if (r15 == 0) goto L66
            java.lang.Object[] r1 = r0.b
            long[] r2 = r0.a
            int r3 = r2.length
            int r3 = r3 + (-2)
            if (r3 < 0) goto L66
            r4 = 0
            r5 = r4
        L17:
            r6 = r2[r5]
            long r8 = ~r6
            r10 = 7
            long r8 = r8 << r10
            long r8 = r8 & r6
            r10 = -9187201950435737472(0x8080808080808080, double:-2.937446524422997E-306)
            long r8 = r8 & r10
            int r8 = (r8 > r10 ? 1 : (r8 == r10 ? 0 : -1))
            if (r8 == 0) goto L61
            int r8 = r5 - r3
            int r8 = ~r8
            int r8 = r8 >>> 31
            r9 = 8
            int r8 = 8 - r8
            r10 = r4
        L31:
            if (r10 >= r8) goto L5f
            r11 = 255(0xff, double:1.26E-321)
            long r11 = r11 & r6
            r13 = 128(0x80, double:6.3E-322)
            int r11 = (r11 > r13 ? 1 : (r11 == r13 ? 0 : -1))
            if (r11 >= 0) goto L5b
            int r11 = r5 << 3
            int r11 = r11 + r10
            r11 = r1[r11]
            p65 r11 = (defpackage.p65) r11
            java.util.Iterator r12 = r15.iterator()
        L47:
            boolean r13 = r12.hasNext()
            if (r13 == 0) goto L5b
            java.lang.Object r13 = r12.next()
            java.util.Set r13 = (java.util.Set) r13
            n22 r14 = r11.x()
            r13.remove(r14)
            goto L47
        L5b:
            long r6 = r6 >> r9
            int r10 = r10 + 1
            goto L31
        L5f:
            if (r8 != r9) goto L66
        L61:
            if (r5 == r3) goto L66
            int r5 = r5 + 1
            goto L17
        L66:
            r0.b()
        L69:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.n65.w():void");
    }
}
