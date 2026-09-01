package defpackage;

import androidx.recyclerview.widget.RecyclerView;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class pxa {
    public ixa a;
    public ArrayList b;
    public long c;
    public long d;
    public long e;
    public long f;

    public static void b(pr0 pr0Var) {
        RecyclerView recyclerView;
        int i = pr0Var.i;
        if (pr0Var.e() || (i & 4) != 0 || (recyclerView = pr0Var.q) == null) {
            return;
        }
        recyclerView.I(pr0Var);
    }

    public abstract boolean a(pr0 pr0Var, pr0 pr0Var2, yqa yqaVar, yqa yqaVar2);

    /* JADX WARN: Removed duplicated region for block: B:33:0x006e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void c(defpackage.pr0 r10) {
        /*
            r9 = this;
            ixa r9 = r9.a
            if (r9 == 0) goto Lb0
            androidx.recyclerview.widget.RecyclerView r9 = r9.a
            r0 = 1
            r10.m(r0)
            android.view.View r1 = r10.a
            pr0 r2 = r10.g
            r3 = 0
            if (r2 == 0) goto L17
            pr0 r2 = r10.h
            if (r2 != 0) goto L17
            r10.g = r3
        L17:
            r10.h = r3
            int r2 = r10.i
            r2 = r2 & 16
            if (r2 == 0) goto L21
            goto Lb0
        L21:
            yxa r2 = r9.c
            r9.i0()
            jl1 r3 = r9.f
            java.lang.Object r4 = r3.e
            il1 r4 = (defpackage.il1) r4
            java.lang.Object r5 = r3.d
            ixa r5 = (defpackage.ixa) r5
            int r6 = r3.c
            r7 = 0
            if (r6 != r0) goto L43
            java.lang.Object r0 = r3.f
            android.view.View r0 = (android.view.View) r0
            if (r0 != r1) goto L3d
        L3b:
            r0 = r7
            goto L6c
        L3d:
            java.lang.String r9 = "Cannot call removeViewIfHidden within removeView(At) for a different view"
            defpackage.ygf.f(r9)
            return
        L43:
            r8 = 2
            if (r6 == r8) goto Lab
            r3.c = r8     // Catch: java.lang.Throwable -> L57
            androidx.recyclerview.widget.RecyclerView r6 = r5.a     // Catch: java.lang.Throwable -> L57
            int r6 = r6.indexOfChild(r1)     // Catch: java.lang.Throwable -> L57
            r8 = -1
            if (r6 != r8) goto L59
            r3.S(r1)     // Catch: java.lang.Throwable -> L57
        L54:
            r3.c = r7
            goto L6c
        L57:
            r9 = move-exception
            goto La8
        L59:
            boolean r8 = r4.d(r6)     // Catch: java.lang.Throwable -> L57
            if (r8 == 0) goto L69
            r4.h(r6)     // Catch: java.lang.Throwable -> L57
            r3.S(r1)     // Catch: java.lang.Throwable -> L57
            r5.c(r6)     // Catch: java.lang.Throwable -> L57
            goto L54
        L69:
            r3.c = r7
            goto L3b
        L6c:
            if (r0 == 0) goto L97
            pr0 r3 = androidx.recyclerview.widget.RecyclerView.K(r1)
            r2.m(r3)
            r2.j(r3)
            boolean r2 = androidx.recyclerview.widget.RecyclerView.Q0
            if (r2 == 0) goto L97
            java.lang.StringBuilder r2 = new java.lang.StringBuilder
            java.lang.String r3 = "after removing animated view: "
            r2.<init>(r3)
            r2.append(r1)
            java.lang.String r3 = ", "
            r2.append(r3)
            r2.append(r9)
            java.lang.String r2 = r2.toString()
            java.lang.String r3 = "RecyclerView"
            android.util.Log.d(r3, r2)
        L97:
            r2 = r0 ^ 1
            r9.k0(r2)
            if (r0 != 0) goto Lb0
            boolean r10 = r10.i()
            if (r10 == 0) goto Lb0
            r9.removeDetachedView(r1, r7)
            return
        La8:
            r3.c = r7
            throw r9
        Lab:
            java.lang.String r9 = "Cannot call removeViewIfHidden within removeViewIfHidden"
            defpackage.ygf.f(r9)
        Lb0:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.pxa.c(pr0):void");
    }

    public abstract void d(pr0 pr0Var);

    public abstract void e();

    public abstract boolean f();
}
