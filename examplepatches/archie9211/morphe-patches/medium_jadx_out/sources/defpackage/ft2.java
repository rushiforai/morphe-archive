package defpackage;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ft2 implements ln0, vnf {
    public boolean a;
    public Object c;
    public Object f;
    public Object b = new Object();
    public Object d = new wfd();
    public Object e = new wfd();

    public ft2(xj4 xj4Var) {
        Boolean boolValueOf;
        PackageManager packageManager;
        ApplicationInfo applicationInfo;
        Bundle bundle;
        this.a = false;
        xj4Var.a();
        Context context = xj4Var.a;
        this.c = xj4Var;
        SharedPreferences sharedPreferences = context.getSharedPreferences("com.google.firebase.crashlytics", 0);
        if (sharedPreferences.contains("firebase_crashlytics_collection_enabled")) {
            this.a = false;
            boolValueOf = Boolean.valueOf(sharedPreferences.getBoolean("firebase_crashlytics_collection_enabled", true));
        } else {
            boolValueOf = null;
        }
        if (boolValueOf == null) {
            try {
                packageManager = context.getPackageManager();
            } catch (PackageManager.NameNotFoundException e) {
                Log.e("FirebaseCrashlytics", "Could not read data collection permission from manifest", e);
            }
            Boolean boolValueOf2 = (packageManager == null || (applicationInfo = packageManager.getApplicationInfo(context.getPackageName(), 128)) == null || (bundle = applicationInfo.metaData) == null || !bundle.containsKey("firebase_crashlytics_collection_enabled")) ? null : Boolean.valueOf(applicationInfo.metaData.getBoolean("firebase_crashlytics_collection_enabled"));
            if (boolValueOf2 == null) {
                this.a = false;
                boolValueOf = null;
            } else {
                this.a = true;
                boolValueOf = Boolean.valueOf(Boolean.TRUE.equals(boolValueOf2));
            }
        }
        this.f = boolValueOf;
        synchronized (this.b) {
            try {
                if (a()) {
                    ((wfd) this.d).d(null);
                }
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public synchronized boolean a() {
        boolean zJ;
        Boolean bool = (Boolean) this.f;
        if (bool != null) {
            zJ = bool.booleanValue();
        } else {
            try {
                zJ = ((xj4) this.c).j();
            } catch (IllegalStateException unused) {
                zJ = false;
            }
        }
        c(zJ);
        return zJ;
    }

    @Override // defpackage.ln0
    public void b(h42 h42Var) {
        ((ee5) this.f).m.post(new p0g(this, h42Var, false, 18));
    }

    public void c(boolean z) {
        String strY = ev6.y("Crashlytics automatic data collection ", z ? "ENABLED" : "DISABLED", " by ", ((Boolean) this.f) == null ? "global Firebase setting" : this.a ? "firebase_crashlytics_collection_enabled manifest flag" : "API", ".");
        if (Log.isLoggable("FirebaseCrashlytics", 3)) {
            Log.d("FirebaseCrashlytics", strY, null);
        }
    }

    public void d(h42 h42Var) {
        uif uifVar = (uif) ((ee5) this.f).j.get((gz) this.b);
        if (uifVar != null) {
            uifVar.m(h42Var);
        }
    }

    @Override // defpackage.vnf
    public String zza() throws JSONException {
        JSONObject jSONObject = new JSONObject();
        if (TextUtils.isEmpty((String) this.e)) {
            jSONObject.put("sessionInfo", (String) this.b);
            jSONObject.put("code", (String) this.d);
        } else {
            jSONObject.put("phoneNumber", (String) this.c);
            jSONObject.put("temporaryProof", (String) this.e);
        }
        String str = (String) this.f;
        if (str != null) {
            jSONObject.put("idToken", str);
        }
        if (!this.a) {
            jSONObject.put("operation", 2);
        }
        return jSONObject.toString();
    }
}
