package defpackage;

import android.net.TrafficStats;
import android.text.TextUtils;
import android.util.Log;
import com.drew.metadata.exif.makernotes.FujifilmMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.google.firebase.installations.FirebaseInstallationsException;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.regex.Pattern;
import org.json.JSONException;
import org.json.JSONObject;
import pushnotifications.SY.eoLmc;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class gk4 implements hk4 {
    public static final Object l = new Object();
    public final xj4 a;
    public final dk4 b;
    public final hx4 c;
    public final jpe d;
    public final wq6 e;
    public final Object f;
    public final ExecutorService g;
    public final wzb h;
    public String i;
    public final HashSet j;
    public final ArrayList k;

    static {
        new AtomicInteger(1);
    }

    public gk4(xj4 xj4Var, h8a h8aVar, ExecutorService executorService, wzb wzbVar) {
        xj4Var.a();
        dk4 dk4Var = new dk4(xj4Var.a, h8aVar);
        hx4 hx4Var = new hx4(xj4Var);
        fa4 fa4Var = fa4.t;
        if (fa4Var == null) {
            fa4Var = new fa4(24);
            fa4.t = fa4Var;
        }
        jpe jpeVar = jpe.b;
        if (jpeVar == null) {
            jpeVar = new jpe(fa4Var);
            jpe.b = jpeVar;
        }
        wq6 wq6Var = new wq6(new cz1(2, xj4Var));
        this.f = new Object();
        this.j = new HashSet();
        this.k = new ArrayList();
        this.a = xj4Var;
        this.b = dk4Var;
        this.c = hx4Var;
        this.d = jpeVar;
        this.e = wq6Var;
        this.g = executorService;
        this.h = wzbVar;
    }

    public final void a(cqc cqcVar) {
        synchronized (this.f) {
            this.k.add(cqcVar);
        }
    }

    /* JADX WARN: Finally extract failed */
    public final void b() {
        zj0 zj0VarF1;
        synchronized (l) {
            try {
                xj4 xj4Var = this.a;
                xj4Var.a();
                s26 s26VarY = s26.Y(xj4Var.a);
                try {
                    zj0VarF1 = this.c.f1();
                    g89 g89Var = zj0VarF1.b;
                    if (g89Var == g89.NOT_GENERATED || g89Var == g89.ATTEMPT_MIGRATION) {
                        String strH = h(zj0VarF1);
                        hx4 hx4Var = this.c;
                        yj0 yj0VarA = zj0VarF1.a();
                        yj0VarA.a = strH;
                        yj0VarA.b(g89.UNREGISTERED);
                        zj0VarF1 = yj0VarA.a();
                        hx4Var.X0(zj0VarF1);
                    }
                    if (s26VarY != null) {
                        s26VarY.u0();
                    }
                } catch (Throwable th) {
                    if (s26VarY != null) {
                        s26VarY.u0();
                    }
                    throw th;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        k(zj0VarF1);
        this.h.execute(new ek4(this, 2));
    }

    public final jrg d() {
        String str;
        g();
        synchronized (this) {
            str = this.i;
        }
        if (str != null) {
            return vp7.x(str);
        }
        wfd wfdVar = new wfd();
        a(new y95(wfdVar));
        jrg jrgVar = wfdVar.a;
        this.g.execute(new ek4(this, 0));
        return jrgVar;
    }

    public final jrg e() {
        g();
        wfd wfdVar = new wfd();
        a(new f95(this.d, wfdVar));
        this.g.execute(new ek4(this, 1));
        return wfdVar.a;
    }

    /* JADX WARN: Finally extract failed */
    public final void f(zj0 zj0Var) {
        synchronized (l) {
            try {
                xj4 xj4Var = this.a;
                xj4Var.a();
                s26 s26VarY = s26.Y(xj4Var.a);
                try {
                    this.c.X0(zj0Var);
                    if (s26VarY != null) {
                        s26VarY.u0();
                    }
                } catch (Throwable th) {
                    if (s26VarY != null) {
                        s26VarY.u0();
                    }
                    throw th;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final void g() {
        xj4 xj4Var = this.a;
        xj4Var.a();
        vp7.o(xj4Var.c.b, "Please set your Application ID. A valid Firebase App ID is required to communicate with Firebase server APIs: It identifies your application with Firebase.Please refer to https://firebase.google.com/support/privacy/init-options.");
        xj4Var.a();
        vp7.o(xj4Var.c.g, "Please set your Project ID. A valid Firebase Project ID is required to communicate with Firebase server APIs: It identifies your application with Firebase.Please refer to https://firebase.google.com/support/privacy/init-options.");
        xj4Var.a();
        vp7.o(xj4Var.c.a, "Please set a valid API key. A Firebase API key is required to communicate with Firebase server APIs: It authenticates your project with Google.Please refer to https://firebase.google.com/support/privacy/init-options.");
        xj4Var.a();
        String str = xj4Var.c.b;
        Pattern pattern = jpe.a;
        vp7.k("Please set your Application ID. A valid Firebase App ID is required to communicate with Firebase server APIs: It identifies your application with Firebase.Please refer to https://firebase.google.com/support/privacy/init-options.", str.contains(":"));
        xj4Var.a();
        vp7.k("Please set a valid API key. A Firebase API key is required to communicate with Firebase server APIs: It authenticates your project with Google.Please refer to https://firebase.google.com/support/privacy/init-options.", jpe.a.matcher(xj4Var.c.a).matches());
    }

    public final zj0 i(zj0 zj0Var) throws FirebaseInstallationsException {
        int responseCode;
        pj0 pj0VarE;
        String str = zj0Var.a;
        String string = null;
        if (str != null && str.length() == 11) {
            dw5 dw5Var = (dw5) this.e.get();
            synchronized (dw5Var.a) {
                try {
                    String[] strArr = dw5.c;
                    int i = 0;
                    while (true) {
                        if (i < 4) {
                            String str2 = strArr[i];
                            String string2 = dw5Var.a.getString("|T|" + dw5Var.b + "|" + str2, null);
                            if (string2 == null || string2.isEmpty()) {
                                i++;
                            } else if (string2.startsWith("{")) {
                                try {
                                    string = new JSONObject(string2).getString("token");
                                } catch (JSONException unused) {
                                }
                            } else {
                                string = string2;
                            }
                        }
                    }
                } finally {
                }
            }
        }
        dk4 dk4Var = this.b;
        xj4 xj4Var = this.a;
        xj4Var.a();
        String str3 = xj4Var.c.a;
        String str4 = zj0Var.a;
        xj4 xj4Var2 = this.a;
        xj4Var2.a();
        String str5 = xj4Var2.c.g;
        xj4 xj4Var3 = this.a;
        xj4Var3.a();
        String str6 = xj4Var3.c.b;
        zbb zbbVar = dk4Var.c;
        if (!zbbVar.b()) {
            throw new FirebaseInstallationsException("Firebase Installations Service is unavailable. Please try again later.");
        }
        URL urlA = dk4.a("projects/" + str5 + "/installations");
        for (int i2 = 0; i2 <= 1; i2++) {
            TrafficStats.setThreadStatsTag(PanasonicMakernoteDirectory.TAG_SCENE_MODE);
            HttpURLConnection httpURLConnectionC = dk4Var.c(urlA, str3);
            try {
                try {
                    httpURLConnectionC.setRequestMethod("POST");
                    httpURLConnectionC.setDoOutput(true);
                    if (string != null) {
                        httpURLConnectionC.addRequestProperty("x-goog-fis-android-iid-migration-auth", string);
                    }
                    dk4.g(httpURLConnectionC, str4, str6);
                    responseCode = httpURLConnectionC.getResponseCode();
                    zbbVar.d(responseCode);
                } catch (IOException | AssertionError unused2) {
                }
                if (responseCode >= 200 && responseCode < 300) {
                    pj0VarE = dk4.e(httpURLConnectionC);
                    httpURLConnectionC.disconnect();
                    TrafficStats.clearThreadStatsTag();
                } else {
                    dk4.b(httpURLConnectionC, str6, str3, str5);
                    if (responseCode == 429) {
                        throw new FirebaseInstallationsException("Firebase servers have received too many requests from this client in a short period of time. Please try again later.");
                    }
                    if (responseCode < 500 || responseCode >= 600) {
                        Log.e("Firebase-Installations", "Firebase Installations can not communicate with Firebase server APIs due to invalid configuration. Please update your Firebase initialization process and set valid Firebase options (API key, Project ID, Application ID) when initializing Firebase.");
                        pj0 pj0Var = new pj0(null, null, null, null, t36.BAD_CONFIG);
                        httpURLConnectionC.disconnect();
                        TrafficStats.clearThreadStatsTag();
                        pj0VarE = pj0Var;
                    }
                    httpURLConnectionC.disconnect();
                    TrafficStats.clearThreadStatsTag();
                }
                int i3 = fk4.a[pj0VarE.e.ordinal()];
                if (i3 != 1) {
                    if (i3 != 2) {
                        throw new FirebaseInstallationsException("Firebase Installations Service is unavailable. Please try again later.");
                    }
                    yj0 yj0VarA = zj0Var.a();
                    yj0VarA.g = "BAD CONFIG";
                    yj0VarA.b(g89.REGISTER_ERROR);
                    return yj0VarA.a();
                }
                String str7 = pj0VarE.b;
                String str8 = pj0VarE.c;
                long jCurrentTimeMillis = System.currentTimeMillis() / 1000;
                jk0 jk0Var = pj0VarE.d;
                String str9 = jk0Var.a;
                long j = jk0Var.b;
                yj0 yj0VarA2 = zj0Var.a();
                yj0VarA2.a = str7;
                yj0VarA2.b(g89.REGISTERED);
                yj0VarA2.c = str9;
                yj0VarA2.d = str8;
                yj0VarA2.e = j;
                byte b = (byte) (yj0VarA2.h | 1);
                yj0VarA2.f = jCurrentTimeMillis;
                yj0VarA2.h = (byte) (b | 2);
                return yj0VarA2.a();
            } finally {
                httpURLConnectionC.disconnect();
                TrafficStats.clearThreadStatsTag();
            }
        }
        throw new FirebaseInstallationsException("Firebase Installations Service is unavailable. Please try again later.");
    }

    public final void j(Exception exc) {
        synchronized (this.f) {
            try {
                Iterator it2 = this.k.iterator();
                while (it2.hasNext()) {
                    if (((cqc) it2.next()).onException(exc)) {
                        it2.remove();
                    }
                }
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public final void k(zj0 zj0Var) {
        synchronized (this.f) {
            try {
                Iterator it2 = this.k.iterator();
                while (it2.hasNext()) {
                    if (((cqc) it2.next()).a(zj0Var)) {
                        it2.remove();
                    }
                }
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public final synchronized void l(String str) {
        this.i = str;
    }

    public final synchronized void m(zj0 zj0Var, zj0 zj0Var2) {
        try {
            if (this.j.size() != 0 && !TextUtils.equals(zj0Var.a, zj0Var2.a)) {
                Iterator it2 = this.j.iterator();
                if (it2.hasNext()) {
                    if (it2.next() != null) {
                        throw new ClassCastException();
                    }
                    throw null;
                }
            }
        } finally {
        }
    }

    public final zj0 c(zj0 zj0Var) throws Throwable {
        HttpURLConnection httpURLConnection;
        int responseCode;
        jk0 jk0Var;
        jk0 jk0VarF;
        xj4 xj4Var = this.a;
        xj4Var.a();
        String str = xj4Var.c.a;
        String str2 = zj0Var.a;
        xj4Var.a();
        String str3 = xj4Var.c.g;
        String str4 = zj0Var.d;
        dk4 dk4Var = this.b;
        zbb zbbVar = dk4Var.c;
        if (!zbbVar.b()) {
            throw new FirebaseInstallationsException("Firebase Installations Service is unavailable. Please try again later.");
        }
        URL urlA = dk4.a("projects/" + str3 + "/installations/" + str2 + "/authTokens:generate");
        for (int i = 0; i <= 1; i++) {
            TrafficStats.setThreadStatsTag(FujifilmMakernoteDirectory.TAG_FRAME_NUMBER);
            HttpURLConnection httpURLConnectionC = dk4Var.c(urlA, str);
            try {
                try {
                    httpURLConnectionC.setRequestMethod(eoLmc.mAjWQMJKbC);
                    httpURLConnectionC.addRequestProperty("Authorization", "FIS_v2 " + str4);
                    httpURLConnectionC.setDoOutput(true);
                    dk4.h(httpURLConnectionC);
                    responseCode = httpURLConnectionC.getResponseCode();
                    zbbVar.d(responseCode);
                } catch (IOException | AssertionError unused) {
                    httpURLConnection = httpURLConnectionC;
                }
                if (responseCode >= 200 && responseCode < 300) {
                    jk0VarF = dk4.f(httpURLConnectionC);
                    httpURLConnectionC.disconnect();
                    TrafficStats.clearThreadStatsTag();
                } else {
                    dk4.b(httpURLConnectionC, null, str, str3);
                    httpURLConnection = httpURLConnectionC;
                    try {
                        if (responseCode == 401 || responseCode == 404) {
                            byte b = (byte) (0 | 1);
                            rnd rndVar = rnd.AUTH_ERROR;
                            if (b != 1) {
                                throw new IllegalStateException("Missing required properties: tokenExpirationTimestamp");
                            }
                            jk0Var = new jk0(null, 0L, rndVar);
                            httpURLConnection.disconnect();
                            TrafficStats.clearThreadStatsTag();
                            jk0VarF = jk0Var;
                        } else {
                            if (responseCode == 429) {
                                throw new FirebaseInstallationsException("Firebase servers have received too many requests from this client in a short period of time. Please try again later.");
                            }
                            if (responseCode < 500 || responseCode >= 600) {
                                Log.e("Firebase-Installations", "Firebase Installations can not communicate with Firebase server APIs due to invalid configuration. Please update your Firebase initialization process and set valid Firebase options (API key, Project ID, Application ID) when initializing Firebase.");
                                byte b2 = (byte) (0 | 1);
                                rnd rndVar2 = rnd.BAD_CONFIG;
                                if (b2 != 1) {
                                    throw new IllegalStateException("Missing required properties: tokenExpirationTimestamp");
                                }
                                jk0Var = new jk0(null, 0L, rndVar2);
                                httpURLConnection.disconnect();
                                TrafficStats.clearThreadStatsTag();
                                jk0VarF = jk0Var;
                            }
                            httpURLConnection.disconnect();
                            TrafficStats.clearThreadStatsTag();
                        }
                    } catch (Throwable th) {
                        th = th;
                        httpURLConnection.disconnect();
                        TrafficStats.clearThreadStatsTag();
                        throw th;
                    }
                }
                int i2 = fk4.b[jk0VarF.c.ordinal()];
                if (i2 == 1) {
                    String str5 = jk0VarF.a;
                    long j = jk0VarF.b;
                    long jCurrentTimeMillis = System.currentTimeMillis() / 1000;
                    yj0 yj0VarA = zj0Var.a();
                    yj0VarA.c = str5;
                    yj0VarA.e = j;
                    byte b3 = (byte) (yj0VarA.h | 1);
                    yj0VarA.f = jCurrentTimeMillis;
                    yj0VarA.h = (byte) (b3 | 2);
                    return yj0VarA.a();
                }
                if (i2 == 2) {
                    yj0 yj0VarA2 = zj0Var.a();
                    yj0VarA2.g = "BAD CONFIG";
                    yj0VarA2.b(g89.REGISTER_ERROR);
                    return yj0VarA2.a();
                }
                if (i2 != 3) {
                    throw new FirebaseInstallationsException("Firebase Installations Service is unavailable. Please try again later.");
                }
                l(null);
                yj0 yj0VarA3 = zj0Var.a();
                yj0VarA3.b(g89.NOT_GENERATED);
                return yj0VarA3.a();
            } catch (Throwable th2) {
                th = th2;
                httpURLConnection = httpURLConnectionC;
            }
        }
        throw new FirebaseInstallationsException("Firebase Installations Service is unavailable. Please try again later.");
    }

    /* JADX WARN: Removed duplicated region for block: B:6:0x001f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.String h(defpackage.zj0 r3) {
        /*
            r2 = this;
            xj4 r0 = r2.a
            r0.a()
            java.lang.String r0 = r0.b
            r1 = 0
            java.lang.String r1 = com.medium.android.data.catalog.KnyB.uvlZTF.xLdIrKMqXkQXc
            boolean r0 = r0.equals(r1)
            if (r0 != 0) goto L1f
            xj4 r0 = r2.a
            java.lang.String r1 = "[DEFAULT]"
            r0.a()
            java.lang.String r0 = r0.b
            boolean r0 = r1.equals(r0)
            if (r0 == 0) goto L4d
        L1f:
            g89 r3 = r3.b
            g89 r0 = defpackage.g89.ATTEMPT_MIGRATION
            if (r3 != r0) goto L4d
            wq6 r2 = r2.e
            java.lang.Object r2 = r2.get()
            dw5 r2 = (defpackage.dw5) r2
            android.content.SharedPreferences r3 = r2.a
            monitor-enter(r3)
            java.lang.String r0 = r2.a()     // Catch: java.lang.Throwable -> L38
            if (r0 == 0) goto L3a
            monitor-exit(r3)     // Catch: java.lang.Throwable -> L38
            goto L3f
        L38:
            r2 = move-exception
            goto L4b
        L3a:
            java.lang.String r0 = r2.b()     // Catch: java.lang.Throwable -> L38
            monitor-exit(r3)     // Catch: java.lang.Throwable -> L38
        L3f:
            boolean r2 = android.text.TextUtils.isEmpty(r0)
            if (r2 == 0) goto L4a
            java.lang.String r2 = defpackage.nsa.a()
            return r2
        L4a:
            return r0
        L4b:
            monitor-exit(r3)     // Catch: java.lang.Throwable -> L38
            throw r2
        L4d:
            java.lang.String r2 = defpackage.nsa.a()
            return r2
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.gk4.h(zj0):java.lang.String");
    }
}
