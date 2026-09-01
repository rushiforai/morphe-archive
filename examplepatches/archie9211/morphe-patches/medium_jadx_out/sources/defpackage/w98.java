package defpackage;

import java.util.TreeSet;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class w98 {
    public TreeSet a;
    public final /* synthetic */ int b;

    public /* synthetic */ w98(int i) {
        this.b = i;
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x0011 A[Catch: all -> 0x000f, TRY_LEAVE, TryCatch #1 {all -> 0x000f, all -> 0x0024, blocks: (B:5:0x0004, B:7:0x0008, B:20:0x002b, B:22:0x002f, B:24:0x0035, B:25:0x0037, B:27:0x003b, B:29:0x0049, B:36:0x005b, B:35:0x0058, B:12:0x0011, B:19:0x0029, B:18:0x0025, B:15:0x001f), top: B:43:0x0004 }] */
    /* JADX WARN: Unreachable blocks removed: 2, instructions: 2 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final synchronized void a(boolean r4) {
        /*
            r3 = this;
            monitor-enter(r3)
            r0 = 0
            if (r4 != 0) goto L11
            java.util.TreeSet r4 = r3.a     // Catch: java.lang.Throwable -> Lf
            if (r4 == 0) goto L11
            boolean r4 = r4.isEmpty()     // Catch: java.lang.Throwable -> Lf
            if (r4 != 0) goto L11
            goto L2b
        Lf:
            r4 = move-exception
            goto L62
        L11:
            x98 r4 = defpackage.x98.a     // Catch: java.lang.Throwable -> Lf
            java.lang.Class<x98> r1 = defpackage.x98.class
            java.util.Set r2 = defpackage.ec2.a     // Catch: java.lang.Throwable -> Lf
            boolean r2 = r2.contains(r1)     // Catch: java.lang.Throwable -> Lf
            if (r2 == 0) goto L1f
        L1d:
            r4 = r0
            goto L29
        L1f:
            java.util.TreeSet r4 = r4.f(r3)     // Catch: java.lang.Throwable -> L24
            goto L29
        L24:
            r4 = move-exception
            defpackage.ec2.a(r1, r4)     // Catch: java.lang.Throwable -> Lf
            goto L1d
        L29:
            r3.a = r4     // Catch: java.lang.Throwable -> Lf
        L2b:
            java.util.TreeSet r4 = r3.a     // Catch: java.lang.Throwable -> Lf
            if (r4 == 0) goto L35
            boolean r4 = r4.isEmpty()     // Catch: java.lang.Throwable -> Lf
            if (r4 == 0) goto L60
        L35:
            int r4 = r3.b     // Catch: java.lang.Throwable -> Lf
            switch(r4) {
                case 2: goto L3b;
                default: goto L3a;
            }     // Catch: java.lang.Throwable -> Lf
        L3a:
            goto L60
        L3b:
            android.content.Context r4 = defpackage.f94.a()     // Catch: java.lang.Throwable -> Lf
            android.content.pm.ApplicationInfo r4 = r4.getApplicationInfo()     // Catch: java.lang.Throwable -> Lf
            int r4 = r4.targetSdkVersion     // Catch: java.lang.Throwable -> Lf
            r1 = 30
            if (r4 < r1) goto L60
            java.lang.Class<x98> r4 = defpackage.x98.class
            java.util.Set r1 = defpackage.ec2.a     // Catch: java.lang.Throwable -> Lf
            boolean r1 = r1.contains(r4)     // Catch: java.lang.Throwable -> Lf
            if (r1 == 0) goto L54
            goto L5b
        L54:
            java.lang.String r0 = "x98"
            goto L5b
        L57:
            r1 = move-exception
            defpackage.ec2.a(r4, r1)     // Catch: java.lang.Throwable -> Lf
        L5b:
            java.lang.String r4 = "Apps that target Android API 30+ (Android 11+) cannot call Facebook native apps unless the package visibility needs are declared. Please follow https://developers.facebook.com/docs/android/troubleshooting/#faq_267321845055988 to make the declaration."
            android.util.Log.w(r0, r4)     // Catch: java.lang.Throwable -> Lf
        L60:
            monitor-exit(r3)
            return
        L62:
            monitor-exit(r3)     // Catch: java.lang.Throwable -> Lf
            throw r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.w98.a(boolean):void");
    }

    public final String b() {
        switch (this.b) {
            case 0:
                return "com.facebook.arstudio.player";
            case 1:
                return "com.instagram.android";
            case 2:
                return "com.facebook.katana";
            case 3:
                return "com.facebook.orca";
            default:
                return "com.facebook.wakizashi";
        }
    }

    public final void c() {
    }
}
