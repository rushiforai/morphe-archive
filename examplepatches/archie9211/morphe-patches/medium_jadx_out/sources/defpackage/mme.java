package defpackage;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.util.Log;
import com.facebook.FacebookSdkNotInitializedException;
import java.util.Set;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mme {
    public static final mme a = new mme();
    public static final AtomicBoolean b = new AtomicBoolean(false);
    public static final AtomicBoolean c = new AtomicBoolean(false);
    public static final tp4 d = new tp4(true, "com.facebook.sdk.AutoInitEnabled");
    public static final tp4 e = new tp4(true, "com.facebook.sdk.AutoLogAppEventsEnabled");
    public static final tp4 f = new tp4(true, "com.facebook.sdk.AdvertiserIDCollectionEnabled");
    public static final tp4 g = new tp4(false, "auto_event_setup_enabled");
    public static final tp4 h = new tp4(true, "com.facebook.sdk.MonitorEnabled");
    public static SharedPreferences i;

    public static final boolean b() {
        if (ec2.a.contains(mme.class)) {
            return false;
        }
        try {
            a.e();
            return f.a();
        } catch (Throwable th) {
            ec2.a(mme.class, th);
            return false;
        }
    }

    public static final boolean c() {
        if (ec2.a.contains(mme.class)) {
            return false;
        }
        try {
            mme mmeVar = a;
            mmeVar.e();
            return mmeVar.a();
        } catch (Throwable th) {
            ec2.a(mme.class, th);
            return false;
        }
    }

    public static final Boolean j() {
        String str = "";
        if (!ec2.a.contains(mme.class)) {
            try {
                a.l();
                try {
                    SharedPreferences sharedPreferences = i;
                    if (sharedPreferences == null) {
                        g76.g0("userSettingPref");
                        throw null;
                    }
                    String string = sharedPreferences.getString((String) e.c, "");
                    if (string != null) {
                        str = string;
                    }
                    if (str.length() > 0) {
                        return Boolean.valueOf(new JSONObject(str).getBoolean("value"));
                    }
                } catch (JSONException unused) {
                    f94 f94Var = f94.a;
                }
            } catch (Throwable th) {
                ec2.a(mme.class, th);
                return null;
            }
        }
        return null;
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x003e A[PHI: r0
      0x003e: PHI (r0v7 java.lang.Boolean) = (r0v5 java.lang.Boolean), (r0v6 java.lang.Boolean) binds: [B:21:0x003c, B:24:0x0044] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean a() {
        /*
            r5 = this;
            java.util.Set r0 = defpackage.ec2.a
            boolean r1 = r0.contains(r5)
            r2 = 0
            if (r1 == 0) goto La
            return r2
        La:
            java.util.HashMap r1 = defpackage.af4.c()     // Catch: java.lang.Throwable -> L2e
            if (r1 == 0) goto L5b
            boolean r3 = r1.isEmpty()     // Catch: java.lang.Throwable -> L2e
            if (r3 == 0) goto L17
            goto L5b
        L17:
            java.lang.String r3 = "auto_log_app_events_enabled"
            java.lang.Object r3 = r1.get(r3)     // Catch: java.lang.Throwable -> L2e
            java.lang.Boolean r3 = (java.lang.Boolean) r3     // Catch: java.lang.Throwable -> L2e
            java.lang.String r4 = "auto_log_app_events_default"
            java.lang.Object r1 = r1.get(r4)     // Catch: java.lang.Throwable -> L2e
            java.lang.Boolean r1 = (java.lang.Boolean) r1     // Catch: java.lang.Throwable -> L2e
            if (r3 == 0) goto L30
            boolean r5 = r3.booleanValue()     // Catch: java.lang.Throwable -> L2e
            return r5
        L2e:
            r0 = move-exception
            goto L62
        L30:
            boolean r0 = r0.contains(r5)     // Catch: java.lang.Throwable -> L2e
            r3 = 0
            if (r0 == 0) goto L38
            goto L4b
        L38:
            java.lang.Boolean r0 = j()     // Catch: java.lang.Throwable -> L47
            if (r0 == 0) goto L40
        L3e:
            r3 = r0
            goto L4b
        L40:
            java.lang.Boolean r0 = r5.f()     // Catch: java.lang.Throwable -> L47
            if (r0 == 0) goto L4b
            goto L3e
        L47:
            r0 = move-exception
            defpackage.ec2.a(r5, r0)     // Catch: java.lang.Throwable -> L2e
        L4b:
            if (r3 == 0) goto L52
            boolean r5 = r3.booleanValue()     // Catch: java.lang.Throwable -> L2e
            return r5
        L52:
            if (r1 == 0) goto L59
            boolean r5 = r1.booleanValue()     // Catch: java.lang.Throwable -> L2e
            return r5
        L59:
            r5 = 1
            return r5
        L5b:
            tp4 r0 = defpackage.mme.e     // Catch: java.lang.Throwable -> L2e
            boolean r5 = r0.a()     // Catch: java.lang.Throwable -> L2e
            return r5
        L62:
            defpackage.ec2.a(r5, r0)
            return r2
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mme.a():boolean");
    }

    public final void d() {
        if (ec2.a.contains(this)) {
            return;
        }
        try {
            tp4 tp4Var = g;
            k(tp4Var);
            final long jCurrentTimeMillis = System.currentTimeMillis();
            if (((Boolean) tp4Var.d) == null || jCurrentTimeMillis - tp4Var.b >= 604800000) {
                tp4Var.d = null;
                tp4Var.b = 0L;
                if (c.compareAndSet(false, true)) {
                    f94.c().execute(new Runnable() { // from class: lme
                        @Override // java.lang.Runnable
                        public final void run() {
                            xe4 xe4VarK;
                            long j = jCurrentTimeMillis;
                            if (ec2.a.contains(mme.class)) {
                                return;
                            }
                            try {
                                if (mme.f.a() && (xe4VarK = af4.k(f94.b(), false)) != null && xe4VarK.g) {
                                    ra0 ra0VarL = m40.L(f94.a());
                                    String strA = (ra0VarL == null || ra0VarL.a() == null) ? null : ra0VarL.a();
                                    if (strA != null) {
                                        Bundle bundle = new Bundle();
                                        bundle.putString("advertiser_id", strA);
                                        bundle.putString("fields", "auto_event_setup_enabled");
                                        String str = ff5.j;
                                        ff5 ff5VarG0 = xz5.g0(null, "app", null);
                                        ff5VarG0.d = bundle;
                                        JSONObject jSONObject = ff5VarG0.c().b;
                                        if (jSONObject != null) {
                                            tp4 tp4Var2 = mme.g;
                                            tp4Var2.d = Boolean.valueOf(jSONObject.optBoolean("auto_event_setup_enabled", false));
                                            tp4Var2.b = j;
                                            mme.a.m(tp4Var2);
                                        }
                                    }
                                }
                                mme.c.set(false);
                            } catch (Throwable th) {
                                ec2.a(mme.class, th);
                            }
                        }
                    });
                }
            }
        } catch (Throwable th) {
            ec2.a(this, th);
        }
    }

    public final void e() {
        Set set = ec2.a;
        if (set.contains(this)) {
            return;
        }
        try {
            if (f94.q.get()) {
                if (b.compareAndSet(false, true)) {
                    SharedPreferences sharedPreferences = f94.a().getSharedPreferences("com.facebook.sdk.USER_SETTINGS", 0);
                    sharedPreferences.getClass();
                    i = sharedPreferences;
                    tp4[] tp4VarArr = {e, f, d};
                    if (!set.contains(this)) {
                        for (int i2 = 0; i2 < 3; i2++) {
                            try {
                                tp4 tp4Var = tp4VarArr[i2];
                                if (tp4Var == g) {
                                    d();
                                } else if (((Boolean) tp4Var.d) == null) {
                                    k(tp4Var);
                                    if (((Boolean) tp4Var.d) == null) {
                                        g(tp4Var);
                                    }
                                } else {
                                    m(tp4Var);
                                }
                            } catch (Throwable th) {
                                ec2.a(this, th);
                                d();
                                i();
                                h();
                            }
                        }
                    }
                    d();
                    i();
                    h();
                }
            }
        } catch (Throwable th2) {
            ec2.a(this, th2);
        }
    }

    public final Boolean f() {
        if (!ec2.a.contains(this)) {
            try {
                l();
                try {
                    Context contextA = f94.a();
                    ApplicationInfo applicationInfo = contextA.getPackageManager().getApplicationInfo(contextA.getPackageName(), 128);
                    applicationInfo.getClass();
                    Bundle bundle = applicationInfo.metaData;
                    if (bundle != null) {
                        tp4 tp4Var = e;
                        if (bundle.containsKey((String) tp4Var.c)) {
                            return Boolean.valueOf(applicationInfo.metaData.getBoolean((String) tp4Var.c));
                        }
                    }
                } catch (PackageManager.NameNotFoundException unused) {
                    f94 f94Var = f94.a;
                }
            } catch (Throwable th) {
                ec2.a(this, th);
                return null;
            }
        }
        return null;
    }

    public final void g(tp4 tp4Var) {
        String str = (String) tp4Var.c;
        if (ec2.a.contains(this)) {
            return;
        }
        try {
            l();
            try {
                Context contextA = f94.a();
                ApplicationInfo applicationInfo = contextA.getPackageManager().getApplicationInfo(contextA.getPackageName(), 128);
                applicationInfo.getClass();
                Bundle bundle = applicationInfo.metaData;
                if (bundle == null || !bundle.containsKey(str)) {
                    return;
                }
                tp4Var.d = Boolean.valueOf(applicationInfo.metaData.getBoolean(str, tp4Var.a));
                return;
            } catch (PackageManager.NameNotFoundException unused) {
                f94 f94Var = f94.a;
                return;
            }
        } catch (Throwable th) {
            ec2.a(this, th);
        }
        ec2.a(this, th);
    }

    public final void h() {
        int i2;
        int i3;
        ApplicationInfo applicationInfo;
        if (ec2.a.contains(this)) {
            return;
        }
        try {
            if (b.get() && f94.q.get()) {
                Context contextA = f94.a();
                int i4 = (d.a() ? 1 : 0) | ((e.a() ? 1 : 0) << 1) | ((f.a() ? 1 : 0) << 2) | ((h.a() ? 1 : 0) << 3);
                SharedPreferences sharedPreferences = i;
                if (sharedPreferences == null) {
                    g76.g0("userSettingPref");
                    throw null;
                }
                int i5 = sharedPreferences.getInt("com.facebook.sdk.USER_SETTINGS_BITMASK", 0);
                if (i5 != i4) {
                    SharedPreferences sharedPreferences2 = i;
                    if (sharedPreferences2 == null) {
                        g76.g0("userSettingPref");
                        throw null;
                    }
                    sharedPreferences2.edit().putInt("com.facebook.sdk.USER_SETTINGS_BITMASK", i4).apply();
                    try {
                        applicationInfo = contextA.getPackageManager().getApplicationInfo(contextA.getPackageName(), 128);
                        applicationInfo.getClass();
                    } catch (PackageManager.NameNotFoundException unused) {
                    }
                    if (applicationInfo.metaData != null) {
                        String[] strArr = {"com.facebook.sdk.AutoInitEnabled", "com.facebook.sdk.AutoLogAppEventsEnabled", "com.facebook.sdk.AdvertiserIDCollectionEnabled", "com.facebook.sdk.MonitorEnabled"};
                        boolean[] zArr = {true, true, true, true};
                        i2 = 0;
                        i3 = 0;
                        for (int i6 = 0; i6 < 4; i6++) {
                            try {
                                i3 |= (applicationInfo.metaData.containsKey(strArr[i6]) ? 1 : 0) << i6;
                                i2 |= (applicationInfo.metaData.getBoolean(strArr[i6], zArr[i6]) ? 1 : 0) << i6;
                            } catch (PackageManager.NameNotFoundException unused2) {
                            }
                        }
                    } else {
                        i2 = 0;
                        i3 = 0;
                    }
                    g50 g50Var = new g50(contextA, (String) null);
                    Bundle bundle = new Bundle();
                    bundle.putInt("usage", i3);
                    bundle.putInt("initial", i2);
                    bundle.putInt("previous", i5);
                    bundle.putInt("current", i4);
                    if (!((bundle.getInt("previous") & 2) != 0)) {
                        f94 f94Var = f94.a;
                        if (!c()) {
                            return;
                        }
                    }
                    g50Var.g("fb_sdk_settings_changed", bundle);
                }
            }
        } catch (Throwable th) {
            ec2.a(this, th);
        }
    }

    public final void i() {
        if (ec2.a.contains(this)) {
            return;
        }
        try {
            Context contextA = f94.a();
            ApplicationInfo applicationInfo = contextA.getPackageManager().getApplicationInfo(contextA.getPackageName(), 128);
            applicationInfo.getClass();
            Bundle bundle = applicationInfo.metaData;
            if (bundle != null) {
                if (!bundle.containsKey("com.facebook.sdk.AdvertiserIDCollectionEnabled")) {
                    Log.w("mme", "You haven't set a value for AdvertiserIDCollectionEnabled. Set the flag to TRUE if you want to collect Advertiser ID for better advertising and analytics results. To request user consent before collecting data, set the flag value to FALSE, then change to TRUE once user consent is received. Learn more: https://developers.facebook.com/docs/app-events/getting-started-app-events-android#disable-auto-events.");
                }
                if (b()) {
                    return;
                }
                Log.w("mme", "The value for AdvertiserIDCollectionEnabled is currently set to FALSE so you're sending app events without collecting Advertiser ID. This can affect the quality of your advertising and analytics results.");
            }
        } catch (PackageManager.NameNotFoundException unused) {
        } catch (Throwable th) {
            ec2.a(this, th);
        }
    }

    public final void k(tp4 tp4Var) {
        String str = "";
        if (ec2.a.contains(this)) {
            return;
        }
        try {
            l();
            try {
                SharedPreferences sharedPreferences = i;
                if (sharedPreferences == null) {
                    g76.g0("userSettingPref");
                    throw null;
                }
                String string = sharedPreferences.getString((String) tp4Var.c, "");
                if (string != null) {
                    str = string;
                }
                if (str.length() > 0) {
                    JSONObject jSONObject = new JSONObject(str);
                    tp4Var.d = Boolean.valueOf(jSONObject.getBoolean("value"));
                    tp4Var.b = jSONObject.getLong("last_timestamp");
                }
            } catch (JSONException unused) {
                f94 f94Var = f94.a;
            }
        } catch (Throwable th) {
            ec2.a(this, th);
        }
    }

    public final void l() {
        if (ec2.a.contains(this)) {
            return;
        }
        try {
            if (b.get()) {
            } else {
                throw new FacebookSdkNotInitializedException("The UserSettingManager has not been initialized successfully");
            }
        } catch (Throwable th) {
            ec2.a(this, th);
        }
    }

    public final void m(tp4 tp4Var) {
        if (ec2.a.contains(this)) {
            return;
        }
        try {
            l();
            try {
                JSONObject jSONObject = new JSONObject();
                jSONObject.put("value", (Boolean) tp4Var.d);
                jSONObject.put("last_timestamp", tp4Var.b);
                SharedPreferences sharedPreferences = i;
                if (sharedPreferences == null) {
                    g76.g0("userSettingPref");
                    throw null;
                }
                sharedPreferences.edit().putString((String) tp4Var.c, jSONObject.toString()).apply();
                h();
            } catch (Exception unused) {
                f94 f94Var = f94.a;
            }
        } catch (Throwable th) {
            ec2.a(this, th);
        }
    }
}
