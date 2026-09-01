package defpackage;

import android.view.ViewGroup;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class d9f {
    public static final ViewGroup.LayoutParams a = new ViewGroup.LayoutParams(-2, -2);

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:23:0x0061  */
    /* JADX WARN: Removed duplicated region for block: B:26:0x007c  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x008d  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x0092  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final defpackage.a9f a(defpackage.x0 r7, defpackage.u12 r8, defpackage.mz1 r9) {
        /*
            java.util.concurrent.atomic.AtomicBoolean r0 = defpackage.td5.a
            r1 = 0
            r2 = 1
            boolean r0 = r0.compareAndSet(r1, r2)
            r3 = 0
            if (r0 == 0) goto L41
            r0 = 6
            uz0 r0 = defpackage.pwd.e(r2, r0, r3)
            w5d r4 = defpackage.dt.m
            java.lang.Object r4 = r4.getValue()
            ib2 r4 = (defpackage.ib2) r4
            k92 r4 = defpackage.o7f.c(r4)
            ku2 r5 = new ku2
            r6 = 29
            r5.<init>(r0, r3, r6)
            r6 = 3
            defpackage.vx0.c0(r4, r3, r3, r5, r6)
            ce r4 = new ce
            r5 = 20
            r4.<init>(r5, r0)
            java.lang.Object r0 = defpackage.uic.c
            monitor-enter(r0)
            java.util.List r5 = defpackage.uic.i     // Catch: java.lang.Throwable -> L3e
            java.util.ArrayList r4 = defpackage.bu1.R0(r5, r4)     // Catch: java.lang.Throwable -> L3e
            defpackage.uic.i = r4     // Catch: java.lang.Throwable -> L3e
            monitor-exit(r0)
            defpackage.uic.c()
            goto L41
        L3e:
            r7 = move-exception
            monitor-exit(r0)
            throw r7
        L41:
            int r0 = r7.getChildCount()
            if (r0 <= 0) goto L5b
            android.view.View r0 = r7.getChildAt(r1)
            boolean r1 = r0 instanceof defpackage.mn
            if (r1 == 0) goto L52
            mn r0 = (defpackage.mn) r0
            goto L53
        L52:
            r0 = r3
        L53:
            if (r0 == 0) goto L59
            r0.setComposeViewContext(r8)
            goto L5f
        L59:
            r0 = r3
            goto L5f
        L5b:
            r7.removeAllViews()
            goto L59
        L5f:
            if (r0 != 0) goto L73
            mn r0 = new mn
            android.content.Context r1 = r7.getContext()
            r0.<init>(r1, r8)
            android.view.View r1 = r0.getView()
            android.view.ViewGroup$LayoutParams r4 = defpackage.d9f.a
            r7.addView(r1, r4)
        L73:
            r0.setComposeViewContext(r8)
            u12 r7 = r7.getComposeViewContext$ui()
            if (r7 == 0) goto L82
            r8.c()
            r0.setComposeViewContextIncrementedDuringInit$ui(r2)
        L82:
            r7 = 2131362587(0x7f0a031b, float:1.8344959E38)
            java.lang.Object r1 = r0.getTag(r7)
            boolean r2 = r1 instanceof defpackage.a9f
            if (r2 == 0) goto L90
            r3 = r1
            a9f r3 = (defpackage.a9f) r3
        L90:
            if (r3 != 0) goto Laa
            a9f r3 = new a9f
            vwa r1 = new vwa
            aq6 r2 = r0.getRoot()
            r1.<init>(r2)
            l22 r2 = r8.b
            q22 r4 = new q22
            r4.<init>(r2, r1)
            r3.<init>(r0, r4)
            r0.setTag(r7, r3)
        Laa:
            r3.b(r9)
            l22 r7 = r8.b
            c9f r8 = new c9f
            r8.<init>(r7)
            r0.setFrameEndScheduler$ui(r8)
            return r3
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.d9f.a(x0, u12, mz1):a9f");
    }
}
