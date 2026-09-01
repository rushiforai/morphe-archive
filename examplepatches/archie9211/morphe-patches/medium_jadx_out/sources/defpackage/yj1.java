package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class yj1 implements f65 {
    public final ib2 a;
    public final int b;
    public final nz0 c;

    public yj1(ib2 ib2Var, int i, nz0 nz0Var) {
        this.a = ib2Var;
        this.b = i;
        this.c = nz0Var;
    }

    @Override // defpackage.bo4
    public Object b(do4 do4Var, n92 n92Var) {
        Object objS = o7f.s(new l0(do4Var, this, null, 24), n92Var);
        return objS == tb2.COROUTINE_SUSPENDED ? objS : c1e.a;
    }

    /* JADX WARN: Removed duplicated region for block: B:9:0x0015  */
    @Override // defpackage.f65
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final defpackage.bo4 c(defpackage.ib2 r5, int r6, defpackage.nz0 r7) {
        /*
            r4 = this;
            ib2 r0 = r4.a
            ib2 r5 = r5.j0(r0)
            nz0 r1 = defpackage.nz0.SUSPEND
            nz0 r2 = r4.c
            int r3 = r4.b
            if (r7 == r1) goto Lf
            goto L26
        Lf:
            r7 = -3
            if (r3 != r7) goto L13
            goto L25
        L13:
            if (r6 != r7) goto L17
        L15:
            r6 = r3
            goto L25
        L17:
            r7 = -2
            if (r3 != r7) goto L1b
            goto L25
        L1b:
            if (r6 != r7) goto L1e
            goto L15
        L1e:
            int r6 = r6 + r3
            if (r6 < 0) goto L22
            goto L25
        L22:
            r6 = 2147483647(0x7fffffff, float:NaN)
        L25:
            r7 = r2
        L26:
            boolean r0 = defpackage.g76.L(r5, r0)
            if (r0 == 0) goto L31
            if (r6 != r3) goto L31
            if (r7 != r2) goto L31
            return r4
        L31:
            yj1 r4 = r4.f(r5, r6, r7)
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.yj1.c(ib2, int, nz0):bo4");
    }

    public String d() {
        return null;
    }

    public abstract Object e(l2a l2aVar, n92 n92Var);

    public abstract yj1 f(ib2 ib2Var, int i, nz0 nz0Var);

    public bo4 i() {
        return null;
    }

    public wj1 j(sb2 sb2Var) {
        int i = this.b;
        if (i == -3) {
            i = -2;
        }
        wb2 wb2Var = wb2.ATOMIC;
        r91 r91Var = new r91(this, (n92) null, 4);
        l2a l2aVar = new l2a(guc.Q(sb2Var, this.a), pwd.e(i, 4, this.c));
        wb2Var.invoke(r91Var, l2aVar, l2aVar);
        return l2aVar;
    }

    public String toString() {
        ArrayList arrayList = new ArrayList(4);
        String strD = d();
        if (strD != null) {
            arrayList.add(strD);
        }
        zx3 zx3Var = zx3.a;
        ib2 ib2Var = this.a;
        if (ib2Var != zx3Var) {
            arrayList.add("context=" + ib2Var);
        }
        int i = this.b;
        if (i != -3) {
            arrayList.add("capacity=" + i);
        }
        nz0 nz0Var = nz0.SUSPEND;
        nz0 nz0Var2 = this.c;
        if (nz0Var2 != nz0Var) {
            arrayList.add("onBufferOverflow=" + nz0Var2);
        }
        StringBuilder sb = new StringBuilder(getClass().getSimpleName());
        sb.append('[');
        return ev6.z(sb, bu1.F0(arrayList, ", ", null, null, null, 62), ']');
    }
}
