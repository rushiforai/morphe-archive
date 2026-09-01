package defpackage;

import android.content.SharedPreferences;
import android.os.Build;
import android.os.Bundle;
import com.google.android.material.internal.It.KLTXZbnQvj;
import java.util.Arrays;
import java.util.Locale;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONArray;
import org.json.JSONObject;
import sprig.g.Hq.fiHTiFJ;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final /* synthetic */ class eq1 implements Runnable {
    public final /* synthetic */ int a;
    public final /* synthetic */ String b;

    public /* synthetic */ eq1(String str, int i) {
        this.a = i;
        this.b = str;
    }

    @Override // java.lang.Runnable
    public final void run() {
        Locale locale = null;
        switch (this.a) {
            case 0:
                String str = this.b;
                String str2 = KLTXZbnQvj.bqHsxYCzYoYpj;
                if (ec2.a.contains(fq1.class)) {
                    return;
                }
                try {
                    Bundle bundle = new Bundle();
                    ra0 ra0VarL = m40.L(f94.a());
                    JSONArray jSONArray = new JSONArray();
                    String str3 = Build.MODEL;
                    if (str3 == null) {
                        str3 = "";
                    }
                    jSONArray.put(str3);
                    if ((ra0VarL != null ? ra0VarL.a() : null) != null) {
                        jSONArray.put(ra0VarL.a());
                    } else {
                        jSONArray.put("");
                    }
                    jSONArray.put(str2);
                    if (r40.F()) {
                        str2 = fiHTiFJ.jSJIKZKWsH;
                    }
                    jSONArray.put(str2);
                    try {
                        locale = f94.a().getResources().getConfiguration().locale;
                        break;
                    } catch (Exception unused) {
                    }
                    if (locale == null) {
                        locale = Locale.getDefault();
                        locale.getClass();
                    }
                    jSONArray.put(locale.getLanguage() + '_' + locale.getCountry());
                    String string = jSONArray.toString();
                    string.getClass();
                    bundle.putString("device_session_id", fq1.a());
                    bundle.putString("extinfo", string);
                    String str4 = ff5.j;
                    boolean z = true;
                    JSONObject jSONObject = new ff5(null, String.format(Locale.US, "%s/app_indexing_session", Arrays.copyOf(new Object[]{str}, 1)), bundle, dt5.POST, null).c().b;
                    AtomicBoolean atomicBoolean = fq1.g;
                    if (jSONObject == null || !jSONObject.optBoolean("is_app_indexing_enabled", false)) {
                        z = false;
                    }
                    atomicBoolean.set(z);
                    if (atomicBoolean.get()) {
                        jue jueVar = fq1.d;
                        if (jueVar != null) {
                            jueVar.c();
                        }
                    } else {
                        fq1.e = null;
                    }
                    fq1.h = false;
                    return;
                } catch (Throwable th) {
                    ec2.a(fq1.class, th);
                    return;
                }
            default:
                String str5 = this.b;
                if (ec2.a.contains(iae.class)) {
                    return;
                }
                try {
                    if (!iae.c.get()) {
                        iae.a.b();
                    }
                    SharedPreferences sharedPreferences = iae.b;
                    if (sharedPreferences != null) {
                        sharedPreferences.edit().putString("com.facebook.appevents.UserDataStore.internalUserData", str5).apply();
                        return;
                    } else {
                        g76.g0("sharedPreferences");
                        throw null;
                    }
                } catch (Throwable th2) {
                    ec2.a(iae.class, th2);
                    return;
                }
        }
    }
}
