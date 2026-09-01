package defpackage;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.util.Log;
import java.io.Serializable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class e4 {
    public Serializable a;
    public Serializable b;
    public int c;
    public int d;
    public Object e;

    public static String d(xj4 xj4Var) {
        xj4Var.a();
        nk4 nk4Var = xj4Var.c;
        String str = nk4Var.e;
        if (str != null) {
            return str;
        }
        xj4Var.a();
        String str2 = nk4Var.b;
        if (!str2.startsWith("1:")) {
            return str2;
        }
        String[] strArrSplit = str2.split(":");
        if (strArrSplit.length < 2) {
            return null;
        }
        String str3 = strArrSplit[1];
        if (str3.isEmpty()) {
            return null;
        }
        return str3;
    }

    /* JADX WARN: Type inference failed for: r0v5, types: [java.io.Serializable, long[]] */
    /* JADX WARN: Type inference failed for: r2v10, types: [int[], java.io.Serializable] */
    public int a(long j) {
        int i = this.c + 1;
        long[] jArr = (long[]) this.a;
        int length = jArr.length;
        if (i > length) {
            int i2 = length * 2;
            ?? r0 = new long[i2];
            ?? r2 = new int[i2];
            k80.i0(jArr, r0, 0, 0, jArr.length);
            k80.k0(0, 0, (int[]) this.b, r2, 14);
            this.a = r0;
            this.b = r2;
        }
        int i3 = this.c;
        this.c = i3 + 1;
        int[] iArr = (int[]) this.e;
        int length2 = iArr.length;
        if (this.d >= length2) {
            int i4 = length2 * 2;
            iArr = new int[i4];
            int i5 = 0;
            while (i5 < i4) {
                int i6 = i5 + 1;
                iArr[i5] = i6;
                i5 = i6;
            }
            k80.k0(0, 0, (int[]) this.e, iArr, 14);
            this.e = iArr;
        }
        int[] iArr2 = iArr;
        int i7 = this.d;
        this.d = iArr[i7];
        long[] jArr2 = (long[]) this.a;
        jArr2[i3] = j;
        ((int[]) this.b)[i3] = i7;
        iArr2[i7] = i3;
        while (i3 > 0) {
            int i8 = ((i3 + 1) >> 1) - 1;
            if (g76.R(jArr2[i8], j) <= 0) {
                break;
            }
            h(i8, i3);
            i3 = i8;
        }
        return i7;
    }

    public synchronized String b() {
        try {
            if (((String) this.a) == null) {
                g();
            }
        } catch (Throwable th) {
            throw th;
        }
        return (String) this.a;
    }

    public synchronized String c() {
        try {
            if (((String) this.b) == null) {
                g();
            }
        } catch (Throwable th) {
            throw th;
        }
        return (String) this.b;
    }

    public PackageInfo e(String str) {
        try {
            return ((Context) this.e).getPackageManager().getPackageInfo(str, 0);
        } catch (PackageManager.NameNotFoundException e) {
            Log.w("FirebaseMessaging", "Failed to find package " + e);
            return null;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:24:0x004c A[Catch: all -> 0x0027, TRY_ENTER, TryCatch #0 {, blocks: (B:3:0x0001, B:8:0x000a, B:10:0x001d, B:15:0x0029, B:17:0x002f, B:19:0x0041, B:21:0x0047, B:24:0x004c, B:26:0x005f, B:28:0x0065, B:31:0x006a, B:33:0x0077, B:34:0x007b), top: B:42:0x0001 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public boolean f() {
        /*
            r5 = this;
            monitor-enter(r5)
            int r0 = r5.d     // Catch: java.lang.Throwable -> L27
            r1 = 1
            r2 = 0
            if (r0 == 0) goto La
            monitor-exit(r5)
            goto L7f
        La:
            java.lang.Object r0 = r5.e     // Catch: java.lang.Throwable -> L27
            android.content.Context r0 = (android.content.Context) r0     // Catch: java.lang.Throwable -> L27
            android.content.pm.PackageManager r0 = r0.getPackageManager()     // Catch: java.lang.Throwable -> L27
            java.lang.String r3 = "com.google.android.c2dm.permission.SEND"
            java.lang.String r4 = "com.google.android.gms"
            int r3 = r0.checkPermission(r3, r4)     // Catch: java.lang.Throwable -> L27
            r4 = -1
            if (r3 != r4) goto L29
            java.lang.String r0 = "FirebaseMessaging"
            java.lang.String r3 = "Google Play services missing or without correct permission."
            android.util.Log.e(r0, r3)     // Catch: java.lang.Throwable -> L27
            monitor-exit(r5)
            r0 = r2
            goto L7f
        L27:
            r0 = move-exception
            goto L83
        L29:
            boolean r3 = defpackage.gq7.D()     // Catch: java.lang.Throwable -> L27
            if (r3 != 0) goto L4c
            android.content.Intent r3 = new android.content.Intent     // Catch: java.lang.Throwable -> L27
            java.lang.String r4 = "com.google.android.c2dm.intent.REGISTER"
            r3.<init>(r4)     // Catch: java.lang.Throwable -> L27
            java.lang.String r4 = "com.google.android.gms"
            r3.setPackage(r4)     // Catch: java.lang.Throwable -> L27
            java.util.List r3 = r0.queryIntentServices(r3, r2)     // Catch: java.lang.Throwable -> L27
            if (r3 == 0) goto L4c
            int r3 = r3.size()     // Catch: java.lang.Throwable -> L27
            if (r3 <= 0) goto L4c
            r5.d = r1     // Catch: java.lang.Throwable -> L27
            monitor-exit(r5)
            r0 = r1
            goto L7f
        L4c:
            android.content.Intent r3 = new android.content.Intent     // Catch: java.lang.Throwable -> L27
            java.lang.String r4 = "com.google.iid.TOKEN_REQUEST"
            r3.<init>(r4)     // Catch: java.lang.Throwable -> L27
            java.lang.String r4 = "com.google.android.gms"
            r3.setPackage(r4)     // Catch: java.lang.Throwable -> L27
            java.util.List r0 = r0.queryBroadcastReceivers(r3, r2)     // Catch: java.lang.Throwable -> L27
            r3 = 2
            if (r0 == 0) goto L6a
            int r0 = r0.size()     // Catch: java.lang.Throwable -> L27
            if (r0 <= 0) goto L6a
            r5.d = r3     // Catch: java.lang.Throwable -> L27
            monitor-exit(r5)
            r0 = r3
            goto L7f
        L6a:
            java.lang.String r0 = "FirebaseMessaging"
            java.lang.String r4 = "Failed to resolve IID implementation package, falling back"
            android.util.Log.w(r0, r4)     // Catch: java.lang.Throwable -> L27
            boolean r0 = defpackage.gq7.D()     // Catch: java.lang.Throwable -> L27
            if (r0 == 0) goto L7b
            r5.d = r3     // Catch: java.lang.Throwable -> L27
            r0 = r3
            goto L7e
        L7b:
            r5.d = r1     // Catch: java.lang.Throwable -> L27
            r0 = r1
        L7e:
            monitor-exit(r5)
        L7f:
            if (r0 == 0) goto L82
            return r1
        L82:
            return r2
        L83:
            monitor-exit(r5)     // Catch: java.lang.Throwable -> L27
            throw r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.e4.f():boolean");
    }

    public synchronized void g() {
        PackageInfo packageInfoE = e(((Context) this.e).getPackageName());
        if (packageInfoE != null) {
            this.a = Integer.toString(packageInfoE.versionCode);
            this.b = packageInfoE.versionName;
        }
    }

    public void h(int i, int i2) {
        long[] jArr = (long[]) this.a;
        int[] iArr = (int[]) this.b;
        int[] iArr2 = (int[]) this.e;
        long j = jArr[i];
        jArr[i] = jArr[i2];
        jArr[i2] = j;
        int i3 = iArr[i];
        int i4 = iArr[i2];
        iArr[i] = i4;
        iArr[i2] = i3;
        iArr2[i4] = i;
        iArr2[i3] = i2;
    }
}
