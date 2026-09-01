package defpackage;

import java.util.ArrayList;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class j72 implements lfc, qp6 {
    public long b;
    public ArrayList c;

    @Override // defpackage.qp6
    public final /* synthetic */ int a(fb7 fb7Var, tk7 tk7Var, int i) {
        return km4.c(this, fb7Var, tk7Var, i);
    }

    @Override // defpackage.r28
    public final /* synthetic */ r28 b(r28 r28Var) {
        return ev6.i(this, r28Var);
    }

    @Override // defpackage.qp6
    public final al7 c(bl7 bl7Var, tk7 tk7Var, long j) {
        l(j);
        t99 t99VarS = tk7Var.s(j);
        return bl7Var.q0(t99VarS.a, t99VarS.b, fy3.a, new y0(t99VarS, 3));
    }

    @Override // defpackage.qp6
    public final /* synthetic */ int d(fb7 fb7Var, tk7 tk7Var, int i) {
        return km4.a(this, fb7Var, tk7Var, i);
    }

    @Override // defpackage.qp6
    public final /* synthetic */ int e(fb7 fb7Var, tk7 tk7Var, int i) {
        return km4.e(this, fb7Var, tk7Var, i);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // defpackage.lfc
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object f(defpackage.p92 r8) throws java.lang.Throwable {
        /*
            r7 = this;
            boolean r0 = r8 instanceof defpackage.i72
            if (r0 == 0) goto L13
            r0 = r8
            i72 r0 = (defpackage.i72) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L18
        L13:
            i72 r0 = new i72
            r0.<init>(r7, r8)
        L18:
            java.lang.Object r8 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.e
            r3 = 1
            if (r2 == 0) goto L32
            if (r2 != r3) goto L2b
            rya r0 = r0.b
            defpackage.br7.v(r8)     // Catch: java.lang.Throwable -> L29
            goto L61
        L29:
            r8 = move-exception
            goto L70
        L2b:
            java.lang.String r7 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r7)
            r7 = 0
            return r7
        L32:
            defpackage.br7.v(r8)
            long r4 = r7.b
            boolean r8 = defpackage.f72.k(r4)
            if (r8 == 0) goto L7b
            rya r8 = new rya
            r8.<init>()
            r0.b = r8     // Catch: java.lang.Throwable -> L6c
            r0.e = r3     // Catch: java.lang.Throwable -> L6c
            x51 r2 = new x51     // Catch: java.lang.Throwable -> L6c
            n92 r0 = defpackage.pwd.Q(r0)     // Catch: java.lang.Throwable -> L6c
            r2.<init>(r3, r0)     // Catch: java.lang.Throwable -> L6c
            r2.s()     // Catch: java.lang.Throwable -> L6c
            r8.a = r2     // Catch: java.lang.Throwable -> L6c
            java.util.ArrayList r0 = r7.c     // Catch: java.lang.Throwable -> L6c
            r0.add(r2)     // Catch: java.lang.Throwable -> L6c
            java.lang.Object r0 = r2.q()     // Catch: java.lang.Throwable -> L6c
            if (r0 != r1) goto L60
            return r1
        L60:
            r0 = r8
        L61:
            java.util.ArrayList r8 = r7.c
            java.lang.Object r0 = r0.a
            defpackage.pwd.w(r8)
            r8.remove(r0)
            goto L7b
        L6c:
            r0 = move-exception
            r6 = r0
            r0 = r8
            r8 = r6
        L70:
            java.util.ArrayList r7 = r7.c
            java.lang.Object r0 = r0.a
            defpackage.pwd.w(r7)
            r7.remove(r0)
            throw r8
        L7b:
            long r7 = r7.b
            cfc r0 = new cfc
            int r1 = defpackage.f72.h(r7)
            ve3 r2 = defpackage.ve3.a
            r3 = 2147483647(0x7fffffff, float:NaN)
            if (r1 == r3) goto L93
            defpackage.ue3.a(r1)
            ue3 r4 = new ue3
            r4.<init>(r1)
            goto L94
        L93:
            r4 = r2
        L94:
            int r7 = defpackage.f72.g(r7)
            if (r7 == r3) goto La2
            defpackage.ue3.a(r7)
            ue3 r2 = new ue3
            r2.<init>(r7)
        La2:
            r0.<init>(r4, r2)
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.j72.f(p92):java.lang.Object");
    }

    @Override // defpackage.qp6
    public final /* synthetic */ int g(fb7 fb7Var, tk7 tk7Var, int i) {
        return km4.g(this, fb7Var, tk7Var, i);
    }

    @Override // defpackage.r28
    public final Object h(b55 b55Var, Object obj) {
        return b55Var.invoke(obj, this);
    }

    @Override // defpackage.r28
    public final boolean k(x45 x45Var) {
        return ((Boolean) x45Var.invoke(this)).booleanValue();
    }

    public final void l(long j) {
        this.b = j;
        if (f72.k(j)) {
            return;
        }
        ArrayList arrayList = this.c;
        if (arrayList.isEmpty()) {
            return;
        }
        this.c = new ArrayList();
        Iterator it2 = arrayList.iterator();
        while (it2.hasNext()) {
            ((n92) it2.next()).resumeWith(c1e.a);
        }
    }
}
