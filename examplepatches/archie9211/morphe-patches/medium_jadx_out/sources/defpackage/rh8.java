package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class rh8 {
    public final vsb a;
    public final b55 b;
    public m73 c;
    public boolean d;
    public final s26 e = new s26();

    public rh8(vsb vsbVar, b55 b55Var, m73 m73Var) {
        this.a = vsbVar;
        this.b = b55Var;
        this.c = m73Var;
    }

    public static void a(lb9 lb9Var) {
        List list = lb9Var.a;
        int size = list.size();
        for (int i = 0; i < size; i++) {
            ((rb9) list.get(i)).a();
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object b(defpackage.b55 r6, defpackage.p92 r7) {
        /*
            r5 = this;
            boolean r0 = r7 instanceof defpackage.qh8
            if (r0 == 0) goto L13
            r0 = r7
            qh8 r0 = (defpackage.qh8) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            qh8 r0 = new qh8
            r0.<init>(r5, r7)
        L18:
            java.lang.Object r7 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 0
            r4 = 1
            if (r2 == 0) goto L2e
            if (r2 != r4) goto L28
            defpackage.br7.v(r7)
            goto L4c
        L28:
            java.lang.String r5 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r5)
            return r3
        L2e:
            defpackage.br7.v(r7)
            r5.d = r4
            kd7 r7 = new kd7
            r2 = 10
            r7.<init>(r5, r6, r3, r2)
            r0.d = r4
            l2d r6 = new l2d
            ib2 r2 = r0.getContext()
            r6.<init>(r0, r2)
            java.lang.Object r6 = defpackage.mo7.U(r6, r4, r6, r7)
            if (r6 != r1) goto L4c
            return r1
        L4c:
            r6 = 0
            r5.d = r6
            c1e r5 = defpackage.c1e.a
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.rh8.b(b55, p92):java.lang.Object");
    }
}
