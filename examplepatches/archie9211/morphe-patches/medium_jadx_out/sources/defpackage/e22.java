package defpackage;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class e22 implements d40 {
    public final List a;

    public e22(List list) {
        this.a = list;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // defpackage.d40
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object N(defpackage.p92 r6) {
        /*
            r5 = this;
            boolean r0 = r6 instanceof defpackage.d22
            if (r0 == 0) goto L13
            r0 = r6
            d22 r0 = (defpackage.d22) r0
            int r1 = r0.f
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.f = r1
            goto L18
        L13:
            d22 r0 = new d22
            r0.<init>(r5, r6)
        L18:
            java.lang.Object r6 = r0.d
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.f
            r3 = 1
            if (r2 == 0) goto L34
            if (r2 != r3) goto L2d
            int r5 = r0.c
            java.util.Iterator r2 = r0.b
            java.util.Iterator r2 = (java.util.Iterator) r2
            defpackage.br7.v(r6)
            goto L40
        L2d:
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r5)
            r5 = 0
            return r5
        L34:
            defpackage.br7.v(r6)
            java.util.List r5 = r5.a
            java.util.Iterator r5 = r5.iterator()
            r6 = 0
            r2 = r5
            r5 = r6
        L40:
            boolean r6 = r2.hasNext()
            if (r6 == 0) goto L5c
            java.lang.Object r6 = r2.next()
            d40 r6 = (defpackage.d40) r6
            r4 = r2
            java.util.Iterator r4 = (java.util.Iterator) r4
            r0.b = r4
            r0.c = r5
            r0.f = r3
            java.lang.Object r6 = r6.N(r0)
            if (r6 != r1) goto L40
            return r1
        L5c:
            c1e r5 = defpackage.c1e.a
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.e22.N(p92):java.lang.Object");
    }

    @Override // defpackage.ba2
    public final List P(qt5 qt5Var) {
        qt5Var.getClass();
        ArrayList arrayList = new ArrayList();
        Iterator it2 = this.a.iterator();
        while (it2.hasNext()) {
            bu1.n0(((d40) it2.next()).P(qt5Var), arrayList);
        }
        return arrayList;
    }

    @Override // defpackage.d40
    public final void clear() {
        Iterator it2 = this.a.iterator();
        while (it2.hasNext()) {
            ((d40) it2.next()).clear();
        }
    }

    @Override // defpackage.ba2
    public final void z(qt5 qt5Var, List list) {
        qt5Var.getClass();
        Iterator it2 = this.a.iterator();
        while (it2.hasNext()) {
            ((d40) it2.next()).z(qt5Var, list);
        }
    }
}
