package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class pe8 {
    public static final String a = d87.k("NetworkStateTracker");

    /* JADX WARN: Removed duplicated region for block: B:11:0x0019  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x0048  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final defpackage.oe8 a(android.net.ConnectivityManager r9, boolean r10) {
        /*
            java.lang.String r1 = defpackage.pe8.a
            r9.getClass()
            android.net.NetworkInfo r2 = r9.getActiveNetworkInfo()     // Catch: java.lang.SecurityException -> L55
            r3 = 1
            r4 = 0
            if (r2 == 0) goto L19
            boolean r0 = r2.isConnected()     // Catch: java.lang.SecurityException -> L15
            if (r0 == 0) goto L19
            r5 = r3
            goto L1b
        L15:
            r0 = move-exception
            r9 = r0
            r7 = r10
            goto L58
        L19:
            r5 = r3
            r3 = r4
        L1b:
            android.net.Network r0 = r9.getActiveNetwork()     // Catch: java.lang.SecurityException -> L2c
            android.net.NetworkCapabilities r0 = r9.getNetworkCapabilities(r0)     // Catch: java.lang.SecurityException -> L2c
            if (r0 == 0) goto L2e
            r6 = 16
            boolean r0 = r0.hasCapability(r6)     // Catch: java.lang.SecurityException -> L2c
            goto L3a
        L2c:
            r0 = move-exception
            goto L30
        L2e:
            r0 = r4
            goto L3a
        L30:
            d87 r6 = defpackage.d87.h()     // Catch: java.lang.SecurityException -> L55
            java.lang.String r7 = "Unable to validate active network"
            r6.g(r1, r7, r0)     // Catch: java.lang.SecurityException -> L55
            goto L2e
        L3a:
            boolean r9 = r9.isActiveNetworkMetered()     // Catch: java.lang.SecurityException -> L55
            if (r2 == 0) goto L48
            boolean r2 = r2.isRoaming()     // Catch: java.lang.SecurityException -> L15
            if (r2 != 0) goto L48
            r6 = r5
            goto L49
        L48:
            r6 = r4
        L49:
            oe8 r2 = new oe8     // Catch: java.lang.SecurityException -> L55
            r5 = r9
            r7 = r10
            r4 = r0
            r2.<init>(r3, r4, r5, r6, r7)     // Catch: java.lang.SecurityException -> L52
            return r2
        L52:
            r0 = move-exception
        L53:
            r9 = r0
            goto L58
        L55:
            r0 = move-exception
            r7 = r10
            goto L53
        L58:
            d87 r10 = defpackage.d87.h()
            java.lang.String r0 = "Unable to get active network state"
            r10.g(r1, r0, r9)
            oe8 r3 = new oe8
            r6 = 0
            r8 = r7
            r7 = 1
            r4 = 0
            r5 = 0
            r3.<init>(r4, r5, r6, r7, r8)
            return r3
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.pe8.a(android.net.ConnectivityManager, boolean):oe8");
    }
}
