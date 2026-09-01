package defpackage;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;
import j$.util.Objects;
import java.util.Locale;
import java.util.UUID;
import java.util.concurrent.TimeUnit;
import java.util.regex.Pattern;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sv5 {
    public static final Pattern g = Pattern.compile("[^\\p{Alnum}]");
    public static final String h = Pattern.quote("/");
    public final d1g a;
    public final Context b;
    public final String c;
    public final hk4 d;
    public final ft2 e;
    public oj0 f;

    public sv5(Context context, String str, hk4 hk4Var, ft2 ft2Var) {
        if (context == null) {
            ay0.e("appContext must not be null");
            throw null;
        }
        if (str == null) {
            ay0.e("appIdentifier must not be null");
            throw null;
        }
        this.b = context;
        this.c = str;
        this.d = hk4Var;
        this.e = ft2Var;
        this.a = new d1g(14);
    }

    public final synchronized String a(SharedPreferences sharedPreferences, String str) {
        String lowerCase;
        lowerCase = g.matcher(UUID.randomUUID().toString()).replaceAll("").toLowerCase(Locale.US);
        String str2 = "Created new Crashlytics installation ID: " + lowerCase + " for FID: " + str;
        if (Log.isLoggable("FirebaseCrashlytics", 2)) {
            Log.v("FirebaseCrashlytics", str2, null);
        }
        sharedPreferences.edit().putString("crashlytics.installation.id", lowerCase).putString("firebase.installation.id", str).apply();
        return lowerCase;
    }

    public final ck4 b(boolean z) {
        String str;
        String str2 = null;
        if (!((Boolean) new gu1(0, m50.k, vd2.class, "isNotMainThread", "isNotMainThread()Z", 0, 3).invoke()).booleanValue()) {
            String str3 = "Must not be called on a main thread, was called on " + Thread.currentThread().getName() + '.';
            if (Log.isLoggable("FirebaseCrashlytics", 3)) {
                Log.d("FirebaseCrashlytics", str3, null);
            }
        }
        TimeUnit timeUnit = TimeUnit.MILLISECONDS;
        hk4 hk4Var = this.d;
        if (z) {
            try {
                str = ((qj0) vp7.i(((gk4) hk4Var).e(), 10000L, timeUnit)).a;
            } catch (Exception e) {
                Log.w("FirebaseCrashlytics", "Error getting Firebase authentication token.", e);
                str = null;
            }
        } else {
            str = null;
        }
        try {
            str2 = (String) vp7.i(((gk4) hk4Var).d(), 10000L, timeUnit);
        } catch (Exception e2) {
            Log.w("FirebaseCrashlytics", "Error getting Firebase installation id.", e2);
        }
        return new ck4(str2, str);
    }

    public final synchronized oj0 c() {
        String str;
        oj0 oj0Var = this.f;
        if (oj0Var != null && (oj0Var.b != null || !this.e.a())) {
            return this.f;
        }
        uob uobVar = uob.e;
        uobVar.p("Determining Crashlytics installation ID...");
        SharedPreferences sharedPreferences = this.b.getSharedPreferences("com.google.firebase.crashlytics", 0);
        String string = sharedPreferences.getString("firebase.installation.id", null);
        uobVar.p("Cached Firebase Installation ID: " + string);
        if (this.e.a()) {
            ck4 ck4VarB = b(false);
            uobVar.p("Fetched Firebase Installation ID: " + ck4VarB.a);
            if (ck4VarB.a == null) {
                if (string == null) {
                    str = "SYN_" + UUID.randomUUID().toString();
                } else {
                    str = string;
                }
                ck4VarB = new ck4(str, null);
            }
            if (Objects.equals(ck4VarB.a, string)) {
                this.f = new oj0(sharedPreferences.getString("crashlytics.installation.id", null), ck4VarB.a, ck4VarB.b);
            } else {
                this.f = new oj0(a(sharedPreferences, ck4VarB.a), ck4VarB.a, ck4VarB.b);
            }
        } else if (string == null || !string.startsWith("SYN_")) {
            this.f = new oj0(a(sharedPreferences, "SYN_" + UUID.randomUUID().toString()), null, null);
        } else {
            this.f = new oj0(sharedPreferences.getString("crashlytics.installation.id", null), null, null);
        }
        uobVar.p("Install IDs: " + this.f);
        return this.f;
    }

    public final String d() {
        String str;
        d1g d1gVar = this.a;
        Context context = this.b;
        synchronized (d1gVar) {
            try {
                String str2 = d1gVar.b;
                if (str2 == null) {
                    String installerPackageName = context.getPackageManager().getInstallerPackageName(context.getPackageName());
                    if (installerPackageName == null) {
                        installerPackageName = "";
                    }
                    str2 = installerPackageName;
                    d1gVar.b = str2;
                }
                str = "".equals(str2) ? null : d1gVar.b;
            } finally {
            }
        }
        return str;
    }
}
