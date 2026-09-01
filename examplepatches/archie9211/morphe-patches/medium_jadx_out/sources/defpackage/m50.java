package defpackage;

import android.app.ActivityManager;
import android.app.KeyguardManager;
import android.app.NotificationManager;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Bundle;
import android.os.Process;
import android.os.Trace;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import androidx.core.graphics.drawable.IconCompat;
import androidx.emoji2.text.flatbuffer.aI.aJzfoQ;
import androidx.startup.StartupException;
import com.drew.imaging.raf.yvq.AXoTRPEGKEve;
import com.google.firebase.messaging.FirebaseMessaging;
import com.google.firebase.messaging.FirebaseMessagingService;
import com.medium.android.search.ui.main.SearchFragment;
import com.medium.reader.R;
import java.io.IOException;
import java.lang.Thread;
import java.math.BigInteger;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class m50 implements mic, xjc, ye1, ea4 {
    public static volatile m50 e;
    public static m50 h;
    public static m50 m;
    public static volatile m50 p;
    public final /* synthetic */ int a;
    public Object b;
    public Object c;
    public Object d;
    public static final Object f = new Object();
    public static final z46 g = new z46();
    public static final fc2 i = new fc2(0);
    public static final g j = new g(3);
    public static final vd2 k = new vd2();
    public static final rz5 l = new rz5(17);
    public static final Object n = new Object();
    public static final xsa o = new xsa(21);
    public static final byte[] q = new byte[0];

    public m50(int i2) {
        this.a = i2;
        switch (i2) {
            case 26:
                this.b = new rz2(1);
                this.c = new rz2(1);
                this.d = new rz2(1);
                break;
            default:
                this.b = new bd7(16);
                long[] jArr = hqb.a;
                this.c = new f78();
                this.d = new dq1(24);
                break;
        }
    }

    public static void I(bh4 bh4Var, String str, String str2) {
        if (str == null || str2 == null) {
            return;
        }
        try {
            bh4Var.b(str, "aqs.".concat(str2)).createNewFile();
        } catch (IOException e2) {
            Log.w("FirebaseCrashlytics", "Failed to persist App Quality Sessions session id.", e2);
        }
    }

    public static void J(m50 m50Var, ocb ocbVar, mp mpVar, Object obj) {
        m50Var.getClass();
        s90 s90Var = new s90(ocbVar);
        synchronized (((dq1) m50Var.d)) {
            try {
                if (obj == null) {
                    ((f78) m50Var.c).m(s90Var, new r90(null));
                } else {
                    ((bd7) m50Var.b).l(s90Var, new r90(obj));
                }
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public static final void l() {
        if (((Boolean) new gu1(0, k, vd2.class, "isBackgroundThread", "isBackgroundThread()Z", 0, 1).invoke()).booleanValue()) {
            return;
        }
        String str = "Must be called on a background thread, was called on " + Thread.currentThread().getName() + '.';
        if (Log.isLoggable("FirebaseCrashlytics", 3)) {
            Log.d("FirebaseCrashlytics", str, null);
        }
    }

    public static final void p() {
        if (((Boolean) new gu1(0, k, vd2.class, "isBlockingThread", "isBlockingThread()Z", 0, 2).invoke()).booleanValue()) {
            return;
        }
        String str = "Must be called on a blocking thread, was called on " + Thread.currentThread().getName() + '.';
        if (Log.isLoggable("FirebaseCrashlytics", 3)) {
            Log.d("FirebaseCrashlytics", str, null);
        }
    }

    public static m50 z(Context context) {
        if (e == null) {
            synchronized (f) {
                try {
                    if (e == null) {
                        e = new m50(context);
                    }
                } finally {
                }
            }
        }
        return e;
    }

    public ip6 A() {
        return ((g61) this.d).a.b;
    }

    public long B() {
        return ((g61) this.d).a.d;
    }

    public boolean C() {
        ww5 ww5Var;
        IconCompat iconCompat;
        if (((my6) this.d).A("gcm.n.noui")) {
            return true;
        }
        FirebaseMessagingService firebaseMessagingService = (FirebaseMessagingService) this.c;
        if (!((KeyguardManager) firebaseMessagingService.getSystemService("keyguard")).inKeyguardRestrictedInputMode()) {
            int iMyPid = Process.myPid();
            List<ActivityManager.RunningAppProcessInfo> runningAppProcesses = ((ActivityManager) firebaseMessagingService.getSystemService("activity")).getRunningAppProcesses();
            if (runningAppProcesses != null) {
                Iterator<ActivityManager.RunningAppProcessInfo> it2 = runningAppProcesses.iterator();
                while (true) {
                    if (!it2.hasNext()) {
                        break;
                    }
                    ActivityManager.RunningAppProcessInfo next = it2.next();
                    if (next.pid == iMyPid) {
                        if (next.importance == 100) {
                            return false;
                        }
                    }
                }
            }
        }
        String strE = ((my6) this.d).E("gcm.n.image");
        if (TextUtils.isEmpty(strE)) {
            ww5Var = null;
        } else {
            try {
                ww5Var = new ww5(new URL(strE));
            } catch (MalformedURLException unused) {
                Log.w("FirebaseMessaging", "Not downloading image, bad URL: " + strE);
                ww5Var = null;
            }
        }
        if (ww5Var != null) {
            ExecutorService executorService = (ExecutorService) this.b;
            wfd wfdVar = new wfd();
            ww5Var.b = executorService.submit(new fi2(ww5Var, 11, wfdVar));
            ww5Var.c = wfdVar.a;
        }
        s26 s26VarA = cx1.a((FirebaseMessagingService) this.c, (my6) this.d);
        ti8 ti8Var = (ti8) s26VarA.b;
        if (ww5Var != null) {
            try {
                jrg jrgVar = ww5Var.c;
                vp7.p(jrgVar);
                Bitmap bitmap = (Bitmap) vp7.i(jrgVar, 5L, TimeUnit.SECONDS);
                ti8Var.d(bitmap);
                ri8 ri8Var = new ri8(4);
                if (bitmap == null) {
                    iconCompat = null;
                } else {
                    iconCompat = new IconCompat(1);
                    iconCompat.b = bitmap;
                }
                ri8Var.c = iconCompat;
                ri8Var.d = null;
                ri8Var.e = true;
                ti8Var.e(ri8Var);
            } catch (InterruptedException unused2) {
                Log.w("FirebaseMessaging", "Interrupted while downloading image, showing notification without it");
                ww5Var.close();
                Thread.currentThread().interrupt();
            } catch (ExecutionException e2) {
                Log.w("FirebaseMessaging", "Failed to download image: " + e2.getCause());
            } catch (TimeoutException unused3) {
                Log.w("FirebaseMessaging", "Failed to download image in time, showing notification without it");
                ww5Var.close();
            }
        }
        if (Log.isLoggable("FirebaseMessaging", 3)) {
            Log.d("FirebaseMessaging", "Showing notification");
        }
        ((NotificationManager) ((FirebaseMessagingService) this.c).getSystemService("notification")).notify((String) s26VarA.c, 0, ((ti8) s26VarA.b).a());
        return true;
    }

    @Override // defpackage.ye1
    public void D(int i2, String str) {
        str.getClass();
    }

    /* JADX WARN: Code restructure failed: missing block: B:37:0x00aa, code lost:
    
        if (r9 == r1) goto L38;
     */
    /* JADX WARN: Removed duplicated region for block: B:43:0x00c2  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00d4  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object E(defpackage.p92 r10) {
        /*
            Method dump skipped, instruction units count: 222
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.m50.E(p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:29:0x00cc  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x00e5  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x00ef  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x013a  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x0141  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x0177  */
    /* JADX WARN: Removed duplicated region for block: B:73:0x0237  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x0284  */
    /* JADX WARN: Removed duplicated region for block: B:77:0x028c  */
    /* JADX WARN: Removed duplicated region for block: B:9:0x0030  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object F(java.lang.String r28, int r29, java.lang.String r30, java.lang.String r31, java.lang.String r32, defpackage.p92 r33) {
        /*
            Method dump skipped, instruction units count: 694
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.m50.F(java.lang.String, int, java.lang.String, java.lang.String, java.lang.String, p92):java.lang.Object");
    }

    public boolean G() {
        return !(((hkc) ((rz2) this.b).b).isEmpty() && ((hkc) ((rz2) this.d).b).isEmpty() && ((hkc) ((rz2) this.c).b).isEmpty());
    }

    public boolean H(int i2, ro0 ro0Var, b72 b72Var) {
        qo0 qo0Var = (qo0) this.c;
        a72[] a72VarArr = b72Var.U;
        int[] iArr = b72Var.u;
        qo0Var.a = a72VarArr[0];
        qo0Var.b = a72VarArr[1];
        qo0Var.c = b72Var.r();
        qo0Var.d = b72Var.l();
        qo0Var.i = false;
        qo0Var.j = i2;
        a72 a72Var = qo0Var.a;
        a72 a72Var2 = a72.MATCH_CONSTRAINT;
        boolean z = a72Var == a72Var2;
        boolean z2 = qo0Var.b == a72Var2;
        boolean z3 = z && b72Var.Y > 0.0f;
        boolean z4 = z2 && b72Var.Y > 0.0f;
        if (z3 && iArr[0] == 4) {
            qo0Var.a = a72.FIXED;
        }
        if (z4 && iArr[1] == 4) {
            qo0Var.b = a72.FIXED;
        }
        ro0Var.b(b72Var, qo0Var);
        b72Var.S(qo0Var.e);
        b72Var.N(qo0Var.f);
        b72Var.F = qo0Var.h;
        b72Var.J(qo0Var.g);
        qo0Var.j = 0;
        return qo0Var.i;
    }

    public void K(String str, Bitmap bitmap) {
        synchronized (n) {
            ((tc7) ((Map) this.c).get(str)).f = bitmap;
        }
    }

    public void L(String str) {
        if (str != null) {
            this.b = str;
        } else {
            z72.c("Null backendName");
        }
    }

    public void M(e61 e61Var) {
        ((g61) this.d).a.c = e61Var;
    }

    public void O(m73 m73Var) {
        ((g61) this.d).a.a = m73Var;
    }

    public void P(ip6 ip6Var) {
        ((g61) this.d).a.b = ip6Var;
    }

    public void Q(long j2) {
        ((g61) this.d).a.d = j2;
    }

    public void R(c72 c72Var, int i2, int i3, int i4) {
        int i5 = c72Var.d0;
        int i6 = c72Var.e0;
        c72Var.d0 = 0;
        c72Var.e0 = 0;
        c72Var.S(i3);
        c72Var.N(i4);
        if (i5 < 0) {
            c72Var.d0 = 0;
        } else {
            c72Var.d0 = i5;
        }
        if (i6 < 0) {
            c72Var.e0 = 0;
        } else {
            c72Var.e0 = i6;
        }
        c72 c72Var2 = (c72) this.d;
        c72Var2.u0 = i2;
        c72Var2.Z();
    }

    public void S(c72 c72Var) {
        ArrayList arrayList = (ArrayList) this.b;
        arrayList.clear();
        int size = c72Var.r0.size();
        for (int i2 = 0; i2 < size; i2++) {
            b72 b72Var = (b72) c72Var.r0.get(i2);
            a72[] a72VarArr = b72Var.U;
            a72 a72Var = a72VarArr[0];
            a72 a72Var2 = a72.MATCH_CONSTRAINT;
            if (a72Var == a72Var2 || a72VarArr[1] == a72Var2) {
                arrayList.add(b72Var);
            }
        }
        c72Var.t0.b = true;
    }

    @Override // defpackage.ea4
    public void a() {
        Thread.setDefaultUncaughtExceptionHandler((Thread.UncaughtExceptionHandler) this.d);
        ((AtomicBoolean) this.c).set(false);
    }

    @Override // defpackage.ea4
    public void b(Context context) {
        context.getClass();
        this.d = Thread.getDefaultUncaughtExceptionHandler();
        cv2 cv2Var = new cv2((yu2) this.b, context);
        cv2Var.c = Thread.getDefaultUncaughtExceptionHandler();
        Thread.setDefaultUncaughtExceptionHandler(cv2Var);
        ((AtomicBoolean) this.c).set(true);
    }

    @Override // defpackage.ye1
    public void c(String str, String str2, boolean z) {
        str.getClass();
        str2.getClass();
        mj1 mj1Var = (mj1) this.b;
        n92 n92Var = null;
        if (z) {
            vx0.c0(f76.F(mj1Var), null, null, new ij1(mj1Var, str, str2, n92Var, 0), 3);
        } else {
            vx0.c0(f76.F(mj1Var), null, null, new ij1(mj1Var, str, str2, n92Var, 3), 3);
        }
    }

    @Override // defpackage.xjc
    public void cancel() {
        ((xjc) this.b).cancel();
    }

    @Override // defpackage.xjc
    public ikc d() {
        return (yua) this.c;
    }

    public void e(aq6 aq6Var, q76 q76Var) {
        rz2 rz2Var = (rz2) this.b;
        rz2 rz2Var2 = (rz2) this.c;
        rz2 rz2Var3 = (rz2) this.d;
        int i2 = d83.a[q76Var.ordinal()];
        if (i2 == 1) {
            rz2Var.H(aq6Var);
            rz2Var3.H(aq6Var);
            return;
        }
        if (i2 == 2) {
            rz2Var2.H(aq6Var);
            rz2Var3.H(aq6Var);
            return;
        }
        if (i2 == 3) {
            if (aq6Var.h != null) {
                rz2Var3.H(aq6Var);
                return;
            } else {
                rz2Var.H(aq6Var);
                return;
            }
        }
        if (i2 != 4) {
            ygf.a();
        } else if (aq6Var.h != null) {
            rz2Var3.H(aq6Var);
        } else {
            rz2Var2.H(aq6Var);
        }
    }

    @Override // defpackage.ye1
    public void f(String str, String str2) {
        str.getClass();
        mj1 mj1Var = (mj1) this.b;
        vx0.c0(f76.F(mj1Var), null, null, new r91(mj1Var, str, null, 3), 3);
        SearchFragment searchFragment = ((htb) ((fub) this.c).b).a;
        ((p13) searchFragment.Z()).c(searchFragment.S(), str, str2);
    }

    @Override // defpackage.ye1
    public void g(String str, String str2) {
        str.getClass();
        mj1 mj1Var = (mj1) this.b;
        vx0.c0(f76.F(mj1Var), null, null, new ij1(mj1Var, str, str2, null, 2), 3);
    }

    @Override // defpackage.ea4
    public String getName() {
        return "crash";
    }

    public m21 h() {
        vj3 vj3Var = (vj3) this.b;
        if (vj3Var != null) {
            return new o21(vj3Var.a);
        }
        String str = (String) this.c;
        if (str != null) {
            return s21.u(str);
        }
        Log.e("CCL", "DimensionDescription: Null value & symbol for " + ((String) this.d) + ". Using WrapContent.");
        return s21.u("wrap");
    }

    @Override // defpackage.mic
    public float i(float f2, float f3) {
        return 0.0f;
    }

    @Override // defpackage.ye1
    public void j(rg1 rg1Var, boolean z) {
        rg1Var.getClass();
        mj1 mj1Var = (mj1) this.b;
        vx0.c0(f76.F(mj1Var), null, null, new lj1(z, mj1Var, rg1Var, (n92) null, 0), 3);
    }

    public kk0 k() {
        String strConcat = ((String) this.b) == null ? " backendName" : "";
        if (((z0a) this.d) == null) {
            strConcat = strConcat.concat(" priority");
        }
        if (strConcat.isEmpty()) {
            return new kk0((String) this.b, (byte[]) this.c, (z0a) this.d);
        }
        ygf.f("Missing required properties:".concat(strConcat));
        return null;
    }

    @Override // defpackage.ye1
    public void m(eg1 eg1Var, String str) {
        eg1Var.getClass();
        mj1 mj1Var = (mj1) this.b;
        String str2 = eg1Var.b;
        str2.getClass();
        mj1Var.g.h(str2, mj1Var.b, str, mj1Var.n);
        j7c.a((Context) this.d, eg1Var);
    }

    @Override // defpackage.ye1
    public void n(rg1 rg1Var) {
        rg1Var.getClass();
        mj1 mj1Var = (mj1) this.b;
        vx0.c0(f76.F(mj1Var), null, null, new jj1(mj1Var, rg1Var, null, 1), 3);
    }

    @Override // defpackage.ye1
    public void o(String str, String str2) {
        str.getClass();
        mj1 mj1Var = (mj1) this.b;
        if (mj1Var.p.add(str)) {
            ev6.L(mj1Var.g, str, mj1Var.b, str2, mj1Var.n);
        }
    }

    @Override // defpackage.xjc
    public bfc q() {
        return (xua) this.d;
    }

    /* JADX WARN: Removed duplicated region for block: B:34:0x00b0  */
    @Override // defpackage.mic
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public float r(float r11) {
        /*
            r10 = this;
            java.lang.Object r0 = r10.b
            ul r0 = (defpackage.ul) r0
            g49 r1 = r0.f
            float r2 = r1.g()
            boolean r2 = java.lang.Float.isNaN(r2)
            if (r2 == 0) goto L15
            java.lang.String r2 = "The offset was read before being initialized. Did you access the offset in a phase before layout, like effects or composition?"
            defpackage.e26.c(r2)
        L15:
            float r1 = r1.g()
            ry2 r2 = r0.b()
            java.lang.Object r3 = r10.c
            x45 r3 = (defpackage.x45) r3
            java.lang.Object r10 = r10.d
            ik r10 = (defpackage.ik) r10
            boolean r4 = java.lang.Float.isNaN(r1)
            r5 = 0
            if (r4 != 0) goto Lbf
            float r4 = java.lang.Math.abs(r11)
            int r4 = (r4 > r5 ? 1 : (r4 == r5 ? 0 : -1))
            r6 = 0
            r7 = 1
            if (r4 <= 0) goto L38
            r4 = r7
            goto L39
        L38:
            r4 = r6
        L39:
            if (r4 == 0) goto L41
            int r8 = (r11 > r5 ? 1 : (r11 == r5 ? 0 : -1))
            if (r8 <= 0) goto L41
            r8 = r7
            goto L42
        L41:
            r8 = r6
        L42:
            if (r4 != 0) goto L4c
            java.lang.Object r10 = r2.a(r1)
            r10.getClass()
            goto Lb1
        L4c:
            float r11 = java.lang.Math.abs(r11)
            java.lang.Object r10 = r10.invoke()
            java.lang.Number r10 = (java.lang.Number) r10
            float r10 = r10.floatValue()
            float r10 = java.lang.Math.abs(r10)
            int r10 = (r11 > r10 ? 1 : (r11 == r10 ? 0 : -1))
            if (r10 < 0) goto L6a
            java.lang.Object r10 = r2.b(r1, r8)
            r10.getClass()
            goto Lb1
        L6a:
            java.lang.Object r10 = r2.b(r1, r6)
            r10.getClass()
            float r11 = r2.c(r10)
            java.lang.Object r4 = r2.b(r1, r7)
            r4.getClass()
            float r2 = r2.c(r4)
            float r9 = r11 - r2
            float r9 = java.lang.Math.abs(r9)
            java.lang.Float r9 = java.lang.Float.valueOf(r9)
            java.lang.Object r3 = r3.invoke(r9)
            java.lang.Number r3 = (java.lang.Number) r3
            float r3 = r3.floatValue()
            float r3 = java.lang.Math.abs(r3)
            if (r8 == 0) goto L9b
            goto L9c
        L9b:
            r11 = r2
        L9c:
            float r11 = r11 - r1
            float r11 = java.lang.Math.abs(r11)
            int r11 = (r11 > r3 ? 1 : (r11 == r3 ? 0 : -1))
            if (r11 < 0) goto La6
            r6 = r7
        La6:
            if (r6 != r7) goto Lab
            if (r8 == 0) goto Lb1
            goto Lb0
        Lab:
            if (r6 != 0) goto Lbb
            if (r8 == 0) goto Lb0
            goto Lb1
        Lb0:
            r10 = r4
        Lb1:
            ry2 r11 = r0.b()
            float r10 = r11.c(r10)
            float r10 = r10 - r1
            return r10
        Lbb:
            defpackage.ygf.a()
            return r5
        Lbf:
            java.lang.String r10 = "The offset provided to computeTarget must not be NaN."
            defpackage.ay0.e(r10)
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.m50.r(float):float");
    }

    @Override // defpackage.ye1
    public void s(String str, String str2) {
        str.getClass();
        mj1 mj1Var = (mj1) this.b;
        vx0.c0(f76.F(mj1Var), null, null, new ij1(mj1Var, str, str2, null, 1), 3);
    }

    public boolean t(aq6 aq6Var) {
        return !(aq6Var.h == null) && (((hkc) ((rz2) this.b).b).contains(aq6Var) || ((hkc) ((rz2) this.c).b).contains(aq6Var));
    }

    public void u(Bundle bundle) {
        HashSet hashSet = (HashSet) this.c;
        String string = ((Context) this.d).getString(R.string.androidx_startup);
        if (bundle != null) {
            try {
                HashSet hashSet2 = new HashSet();
                for (String str : bundle.keySet()) {
                    if (string.equals(bundle.getString(str, null))) {
                        Class<?> cls = Class.forName(str);
                        if (u16.class.isAssignableFrom(cls)) {
                            hashSet.add(cls);
                        }
                    }
                }
                Iterator it2 = hashSet.iterator();
                while (it2.hasNext()) {
                    v((Class) it2.next(), hashSet2);
                }
            } catch (ClassNotFoundException e2) {
                throw new StartupException(e2);
            }
        }
    }

    public Object v(Class cls, HashSet hashSet) {
        Object objB;
        HashMap map = (HashMap) this.b;
        if (gq7.E()) {
            try {
                Trace.beginSection(gq7.X(cls.getSimpleName()));
            } finally {
                Trace.endSection();
            }
        }
        if (hashSet.contains(cls)) {
            throw new IllegalStateException("Cannot initialize " + cls.getName() + ". Cycle detected.");
        }
        if (map.containsKey(cls)) {
            objB = map.get(cls);
        } else {
            hashSet.add(cls);
            try {
                u16 u16Var = (u16) cls.getDeclaredConstructor(null).newInstance(null);
                List<Class> listA = u16Var.a();
                if (!listA.isEmpty()) {
                    for (Class cls2 : listA) {
                        if (!map.containsKey(cls2)) {
                            v(cls2, hashSet);
                        }
                    }
                }
                objB = u16Var.b((Context) this.d);
                hashSet.remove(cls);
                map.put(cls, objB);
            } catch (Throwable th) {
                throw new StartupException(th);
            }
        }
        return objB;
    }

    public float w(m21 m21Var) {
        HashMap map = (HashMap) this.b;
        HashMap map2 = (HashMap) this.c;
        if (!(m21Var instanceof s21)) {
            if (m21Var instanceof o21) {
                return ((o21) m21Var).q();
            }
            return 0.0f;
        }
        String strE = ((s21) m21Var).e();
        if (map2.containsKey(strE)) {
            return ((o62) map2.get(strE)).value();
        }
        if (map.containsKey(strE)) {
            return ((Integer) map.get(strE)).floatValue();
        }
        return 0.0f;
    }

    public e61 x() {
        return ((g61) this.d).a.c;
    }

    public m73 y() {
        return ((g61) this.d).a.a;
    }

    public void N(s2a s2aVar, boolean z) {
        s2a s2aVar2 = (s2a) this.d;
        this.d = s2aVar;
        if (z) {
            SharedPreferences sharedPreferences = ((dsc) this.c).a;
            String str = AXoTRPEGKEve.wHtMxwMEK;
            if (s2aVar != null) {
                JSONObject jSONObject = new JSONObject();
                try {
                    jSONObject.put("id", s2aVar.a);
                    jSONObject.put("first_name", s2aVar.b);
                    jSONObject.put(aJzfoQ.xCvp, s2aVar.c);
                    jSONObject.put("last_name", s2aVar.d);
                    jSONObject.put("name", s2aVar.e);
                    Uri uri = s2aVar.f;
                    if (uri != null) {
                        jSONObject.put("link_uri", uri.toString());
                    }
                    Uri uri2 = s2aVar.g;
                    if (uri2 != null) {
                        jSONObject.put("picture_uri", uri2.toString());
                    }
                } catch (JSONException unused) {
                    jSONObject = null;
                }
                if (jSONObject != null) {
                    sharedPreferences.edit().putString(str, jSONObject.toString()).apply();
                }
            } else {
                sharedPreferences.edit().remove(str).apply();
            }
        }
        if (s2aVar2 == null ? s2aVar == null : s2aVar2.equals(s2aVar)) {
            return;
        }
        Intent intent = new Intent("com.facebook.sdk.ACTION_CURRENT_PROFILE_CHANGED");
        intent.putExtra("com.facebook.sdk.EXTRA_OLD_PROFILE", s2aVar2);
        intent.putExtra("com.facebook.sdk.EXTRA_NEW_PROFILE", s2aVar);
        ((iq1) this.b).O(intent);
    }

    public /* synthetic */ m50(iq1 iq1Var, Object obj, int i2) {
        this.a = i2;
        this.b = iq1Var;
        this.c = obj;
    }

    public /* synthetic */ m50(Object obj, Object obj2, Object obj3, int i2) {
        this.a = i2;
        this.b = obj;
        this.c = obj2;
        this.d = obj3;
    }

    public m50(qi1 qi1Var, ax2 ax2Var, hx4 hx4Var) {
        this.a = 17;
        qi1Var.getClass();
        this.b = qi1Var;
        this.c = ax2Var;
        this.d = hx4Var;
    }

    public m50(gn9 gn9Var, ty2 ty2Var, hx4 hx4Var) {
        this.a = 18;
        gn9Var.getClass();
        this.b = gn9Var;
        this.c = ty2Var;
        this.d = hx4Var;
    }

    public m50(zpa zpaVar, zk2 zk2Var, FirebaseMessaging firebaseMessaging) {
        this.a = 19;
        zpaVar.getClass();
        zk2Var.getClass();
        this.b = zpaVar;
        this.c = zk2Var;
        this.d = firebaseMessaging;
    }

    public m50(yu2 yu2Var) {
        this.a = 23;
        this.b = yu2Var;
        this.c = new AtomicBoolean(false);
        this.d = Thread.getDefaultUncaughtExceptionHandler();
    }

    public m50(pkf pkfVar, f66 f66Var, rv8 rv8Var) {
        this.a = 21;
        f66Var.getClass();
        rv8Var.getClass();
        this.b = pkfVar;
        this.c = f66Var;
        this.d = rv8Var;
    }

    public m50(byte[] bArr, byte[] bArr2, BigInteger bigInteger, keg kegVar) {
        this.a = 7;
        this.d = BigInteger.ZERO;
        this.c = bigInteger;
        this.b = kegVar;
    }

    public m50(HashMap map, HashMap map2, HashMap map3, String str, String str2, String str3) {
        this.a = 4;
        this.b = map;
        this.c = map2;
        this.d = map3;
    }

    public m50(ExecutorService executorService, ExecutorService executorService2) {
        this.a = 3;
        executorService.getClass();
        executorService2.getClass();
        this.b = new ud2(executorService);
        this.c = new ud2(executorService);
        vp7.x(null);
        this.d = new ud2(executorService2);
    }

    public m50(Context context, dp1 dp1Var, dp1 dp1Var2) {
        this.a = 24;
        this.d = context;
        this.b = dp1Var;
        this.c = dp1Var2;
    }

    public m50(Drawable.Callback callback, Map map) {
        this.a = 5;
        if (TextUtils.isEmpty(null)) {
            this.b = null;
            this.c = map;
            if (!(callback instanceof View)) {
                this.d = null;
                return;
            } else {
                this.d = ((View) callback).getContext().getApplicationContext();
                return;
            }
        }
        throw null;
    }

    public m50(xjc xjcVar) {
        this.a = 12;
        this.b = xjcVar;
        this.c = wo7.i(xjcVar.d());
        this.d = wo7.h(xjcVar.q());
    }

    public m50(bh4 bh4Var) {
        this.a = 2;
        this.c = null;
        this.d = null;
        this.b = bh4Var;
    }

    public m50(FirebaseMessagingService firebaseMessagingService, my6 my6Var, ExecutorService executorService) {
        this.a = 29;
        this.b = executorService;
        this.c = firebaseMessagingService;
        this.d = my6Var;
    }

    public m50(g61 g61Var) {
        this.a = 14;
        this.d = g61Var;
        this.b = new md5(8, this);
    }

    public m50(Context context) {
        this.a = 0;
        this.d = context.getApplicationContext();
        this.c = new HashSet();
        this.b = new HashMap();
    }

    public m50(c72 c72Var) {
        this.a = 11;
        this.b = new ArrayList();
        this.c = new qo0();
        this.d = c72Var;
    }

    public /* synthetic */ m50(int i2, boolean z) {
        this.a = i2;
    }
}
