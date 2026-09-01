package defpackage;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.text.TextUtils;
import com.facebook.FacebookActivity;
import com.facebook.FacebookException;
import com.google.android.gms.internal.fido.Hg.kSWQKWZ;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class aa7 {
    public static final cd7 e = new cd7();
    public static final Set f = k80.S0(new String[]{"ads_management", "create_event", "rsvp_event"});
    public static final String g;
    public static volatile aa7 h;
    public final SharedPreferences c;
    public final l87 a = l87.NATIVE_WITH_FALLBACK;
    public final dx2 b = dx2.FRIENDS;
    public final ea7 d = ea7.FACEBOOK;

    static {
        String string = aa7.class.toString();
        string.getClass();
        g = string;
    }

    public aa7() {
        hk7.G();
        SharedPreferences sharedPreferences = f94.a().getSharedPreferences("com.facebook.loginManager", 0);
        sharedPreferences.getClass();
        this.c = sharedPreferences;
        if (!f94.n || dm2.H() == null) {
            return;
        }
        cm2 cm2Var = new cm2();
        Context contextA = f94.a();
        cm2Var.a = contextA.getApplicationContext();
        Intent intent = new Intent("android.support.customtabs.action.CustomTabsService");
        if (!TextUtils.isEmpty("com.android.chrome")) {
            intent.setPackage("com.android.chrome");
        }
        contextA.bindService(intent, cm2Var, 33);
        Context contextA2 = f94.a();
        String packageName = f94.a().getPackageName();
        if (packageName == null) {
            return;
        }
        Context applicationContext = contextA2.getApplicationContext();
        em2 em2Var = new em2(applicationContext);
        try {
            em2Var.a = applicationContext.getApplicationContext();
            Intent intent2 = new Intent("android.support.customtabs.action.CustomTabsService");
            if (!TextUtils.isEmpty(packageName)) {
                intent2.setPackage(packageName);
            }
            applicationContext.bindService(intent2, em2Var, 33);
        } catch (SecurityException unused) {
        }
    }

    public static void b(Activity activity, n87 n87Var, Map map, FacebookException facebookException, boolean z, m87 m87Var) {
        w97 w97VarS = dq1.g.s(activity);
        if (m87Var == null) {
            ScheduledExecutorService scheduledExecutorService = w97.d;
            if (ec2.a.contains(w97.class)) {
                return;
            }
            try {
                w97VarS.a("fb_mobile_login_complete", "");
                return;
            } catch (Throwable th) {
                ec2.a(w97.class, th);
                return;
            }
        }
        HashMap map2 = new HashMap();
        map2.put("try_login_activity", z ? "1" : "0");
        String str = m87Var.g;
        String str2 = m87Var.o ? "foa_mobile_login_complete" : "fb_mobile_login_complete";
        ScheduledExecutorService scheduledExecutorService2 = w97.d;
        if (ec2.a.contains(w97VarS)) {
            return;
        }
        try {
            Bundle bundleW0 = ht2.w0(str);
            if (n87Var != null) {
                bundleW0.putString("2_result", n87Var.getLoggingValue());
            }
            if ((facebookException != null ? facebookException.getMessage() : null) != null) {
                bundleW0.putString("5_error_message", facebookException.getMessage());
            }
            JSONObject jSONObject = map2.isEmpty() ? null : new JSONObject(map2);
            if (map != null) {
                if (jSONObject == null) {
                    jSONObject = new JSONObject();
                }
                try {
                    for (Map.Entry entry : map.entrySet()) {
                        String str3 = (String) entry.getKey();
                        String str4 = (String) entry.getValue();
                        if (str3 != null) {
                            jSONObject.put(str3, str4);
                        }
                    }
                } catch (JSONException unused) {
                }
            }
            if (jSONObject != null) {
                bundleW0.putString("6_extras", jSONObject.toString());
            }
            w97VarS.b.s(str2, bundleW0);
            if (n87Var != n87.SUCCESS || ec2.a.contains(w97VarS)) {
                return;
            }
            try {
                w97.d.schedule(new fi2(w97VarS, 17, ht2.w0(str)), 5L, TimeUnit.SECONDS);
            } catch (Throwable th2) {
                ec2.a(w97VarS, th2);
            }
        } catch (Throwable th3) {
            ec2.a(w97VarS, th3);
        }
    }

    public static void f(o41 o41Var) {
        o41Var.a.remove(Integer.valueOf(n41.Login.toRequestCode()));
    }

    public static void g(Collection collection) {
        if (collection == null) {
            return;
        }
        Iterator it2 = collection.iterator();
        while (it2.hasNext()) {
            String str = (String) it2.next();
            if (cd7.x(str)) {
                throw new FacebookException(ev6.x("Cannot pass a publish or manage permission (", str, ") to a request for read authorization"));
            }
        }
    }

    public final m87 a(ku3 ku3Var) {
        String strC;
        String str = (String) ku3Var.d;
        pp1 pp1Var = pp1.S256;
        try {
            strC = ek7.C(str, pp1Var);
        } catch (FacebookException unused) {
            pp1Var = pp1.PLAIN;
            strC = str;
        }
        pp1 pp1Var2 = pp1Var;
        Set setQ1 = bu1.q1((Set) ku3Var.b);
        String strB = f94.b();
        String string = UUID.randomUUID().toString();
        string.getClass();
        String str2 = (String) ku3Var.c;
        hk7.G();
        String str3 = f94.f;
        String str4 = str3 == null ? "" : str3;
        hk7.G();
        String str5 = f94.g;
        m87 m87Var = new m87(this.a, setQ1, this.b, strB, string, this.d, str2, str, strC, pp1Var2, str4, str5 == null ? "" : str5);
        Date date = w3.l;
        m87Var.h = wgf.B();
        m87Var.l = null;
        m87Var.m = false;
        m87Var.o = false;
        m87Var.p = false;
        return m87Var;
    }

    public final void d(o41 o41Var, final w84 w84Var) {
        int requestCode = n41.Login.toRequestCode();
        m41 m41Var = new m41() { // from class: x97
            @Override // defpackage.m41
            public final void a(int i, Intent intent) {
                this.a.c(i, intent, w84Var);
            }
        };
        o41Var.a.put(Integer.valueOf(requestCode), m41Var);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:19:0x0057  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void c(int r11, android.content.Intent r12, defpackage.w84 r13) {
        /*
            Method dump skipped, instruction units count: 261
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.aa7.c(int, android.content.Intent, w84):void");
    }

    public final void e(qnc qncVar, m87 m87Var) {
        String str;
        w97 w97VarS = dq1.g.s(qncVar.f());
        if (m87Var.o) {
            str = "foa_mobile_login_start";
        } else {
            str = "fb_mobile_login_start";
        }
        if (!ec2.a.contains(w97VarS)) {
            try {
                ScheduledExecutorService scheduledExecutorService = w97.d;
                Bundle bundleW0 = ht2.w0(m87Var.g);
                try {
                    JSONObject jSONObject = new JSONObject();
                    jSONObject.put(kSWQKWZ.fOq, m87Var.a.toString());
                    jSONObject.put("request_code", n41.Login.toRequestCode());
                    jSONObject.put("permissions", TextUtils.join(",", m87Var.b));
                    jSONObject.put("default_audience", m87Var.c.toString());
                    jSONObject.put("isReauthorize", m87Var.h);
                    String str2 = w97VarS.c;
                    if (str2 != null) {
                        jSONObject.put("facebookVersion", str2);
                    }
                    ea7 ea7Var = m87Var.n;
                    if (ea7Var != null) {
                        jSONObject.put("target_app", ea7Var.toString());
                    }
                    bundleW0.putString("6_extras", jSONObject.toString());
                } catch (JSONException unused) {
                }
                w97VarS.b.s(str, bundleW0);
            } catch (Throwable th) {
                ec2.a(w97VarS, th);
            }
        }
        h1c h1cVar = o41.b;
        n41 n41Var = n41.Login;
        int requestCode = n41Var.toRequestCode();
        m41 m41Var = new m41() { // from class: y97
            @Override // defpackage.m41
            public final void a(int i, Intent intent) {
                this.a.c(i, intent, null);
            }
        };
        synchronized (h1cVar) {
            HashMap map = o41.c;
            if (!map.containsKey(Integer.valueOf(requestCode))) {
                map.put(Integer.valueOf(requestCode), m41Var);
            }
        }
        Intent intent = new Intent();
        intent.setClass(f94.a(), FacebookActivity.class);
        intent.setAction(m87Var.a.toString());
        Bundle bundle = new Bundle();
        bundle.putParcelable("request", m87Var);
        intent.putExtra("com.facebook.LoginFragment:Request", bundle);
        if (f94.a().getPackageManager().resolveActivity(intent, 0) != null) {
            try {
                qncVar.d(intent, n41Var.toRequestCode());
                return;
            } catch (ActivityNotFoundException unused2) {
            }
        }
        FacebookException facebookException = new FacebookException("Log in attempt failed: FacebookActivity could not be started. Please make sure you added FacebookActivity to the AndroidManifest.");
        b(qncVar.f(), n87.ERROR, null, facebookException, false, m87Var);
        throw facebookException;
    }
}
