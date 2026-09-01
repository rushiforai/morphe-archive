package defpackage;

import android.content.Context;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class p10 implements Runnable {
    public final /* synthetic */ int a;
    public final /* synthetic */ Context b;

    public /* synthetic */ p10(Context context, int i) {
        this.a = i;
        this.b = context;
    }

    /* JADX WARN: Removed duplicated region for block: B:28:0x0089  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x0093  */
    @Override // java.lang.Runnable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void run() {
        /*
            r10 = this;
            int r0 = r10.a
            r1 = 1
            android.content.Context r10 = r10.b
            switch(r0) {
                case 0: goto L2e;
                case 1: goto L14;
                default: goto L8;
            }
        L8:
            b70 r0 = new b70
            r0.<init>(r1)
            hpe r1 = defpackage.n01.m
            r2 = 0
            defpackage.n01.i0(r10, r0, r1, r2)
            return
        L14:
            java.util.concurrent.ThreadPoolExecutor r3 = new java.util.concurrent.ThreadPoolExecutor
            java.util.concurrent.LinkedBlockingQueue r9 = new java.util.concurrent.LinkedBlockingQueue
            r9.<init>()
            r4 = 0
            r5 = 1
            r6 = 0
            java.util.concurrent.TimeUnit r8 = java.util.concurrent.TimeUnit.MILLISECONDS
            r3.<init>(r4, r5, r6, r8, r9)
            p10 r0 = new p10
            r1 = 2
            r0.<init>(r10, r1)
            r3.execute(r0)
            return
        L2e:
            int r0 = android.os.Build.VERSION.SDK_INT
            r2 = 33
            if (r0 < r2) goto Lab
            android.content.ComponentName r3 = new android.content.ComponentName
            java.lang.String r4 = "androidx.appcompat.app.AppLocalesMetadataHolderService"
            r3.<init>(r10, r4)
            android.content.pm.PackageManager r4 = r10.getPackageManager()
            int r4 = r4.getComponentEnabledSetting(r3)
            if (r4 == r1) goto Lab
            java.lang.String r4 = "locale"
            if (r0 < r2) goto L84
            d80 r0 = defpackage.t10.g
            r0.getClass()
            t70 r2 = new t70
            r2.<init>(r0)
        L53:
            boolean r0 = r2.hasNext()
            if (r0 == 0) goto L72
            java.lang.Object r0 = r2.next()
            java.lang.ref.WeakReference r0 = (java.lang.ref.WeakReference) r0
            java.lang.Object r0 = r0.get()
            t10 r0 = (defpackage.t10) r0
            if (r0 == 0) goto L53
            f20 r0 = (defpackage.f20) r0
            android.content.Context r0 = r0.k
            if (r0 == 0) goto L53
            java.lang.Object r0 = r0.getSystemService(r4)
            goto L73
        L72:
            r0 = 0
        L73:
            if (r0 == 0) goto L89
            android.os.LocaleList r0 = defpackage.r10.a(r0)
            i67 r2 = new i67
            l67 r5 = new l67
            r5.<init>(r0)
            r2.<init>(r5)
            goto L8b
        L84:
            i67 r2 = defpackage.t10.c
            if (r2 == 0) goto L89
            goto L8b
        L89:
            i67 r2 = defpackage.i67.b
        L8b:
            k67 r0 = r2.a
            boolean r0 = r0.isEmpty()
            if (r0 == 0) goto La4
            java.lang.String r0 = defpackage.d46.Z(r10)
            java.lang.Object r2 = r10.getSystemService(r4)
            if (r2 == 0) goto La4
            android.os.LocaleList r0 = defpackage.q10.a(r0)
            defpackage.r10.b(r2, r0)
        La4:
            android.content.pm.PackageManager r10 = r10.getPackageManager()
            r10.setComponentEnabledSetting(r3, r1, r1)
        Lab:
            defpackage.t10.f = r1
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.p10.run():void");
    }
}
