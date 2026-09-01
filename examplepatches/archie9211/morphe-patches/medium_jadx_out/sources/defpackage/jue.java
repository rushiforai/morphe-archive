package defpackage;

import android.app.Activity;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import java.lang.ref.WeakReference;
import java.util.Set;
import java.util.Timer;
import java.util.concurrent.RejectedExecutionException;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jue {
    public static final String e;
    public final WeakReference b;
    public Timer c;
    public String d = null;
    public final Handler a = new Handler(Looper.getMainLooper());

    static {
        String canonicalName = jue.class.getCanonicalName();
        if (canonicalName == null) {
            canonicalName = "";
        }
        e = canonicalName;
    }

    public jue(Activity activity) {
        this.b = new WeakReference(activity);
    }

    public static final String a() {
        if (ec2.a.contains(jue.class)) {
            return null;
        }
        try {
            return e;
        } catch (Throwable th) {
            ec2.a(jue.class, th);
            return null;
        }
    }

    public final void b(ff5 ff5Var, String str) {
        String str2 = e;
        Set set = ec2.a;
        if (set.contains(this) || ff5Var == null) {
            return;
        }
        try {
            if5 if5VarC = ff5Var.c();
            try {
                JSONObject jSONObject = if5VarC.b;
                if (jSONObject == null) {
                    Log.e(str2, "Error sending UI component tree to Facebook: " + if5VarC.c);
                    return;
                }
                if ("true".equals(jSONObject.optString("success"))) {
                    z46 z46Var = f87.b;
                    z46.q(i87.APP_EVENTS, str2, "Successfully send UI component tree to server");
                    this.d = str;
                }
                if (jSONObject.has("is_app_indexing_enabled")) {
                    boolean z = jSONObject.getBoolean("is_app_indexing_enabled");
                    if (set.contains(fq1.class)) {
                        return;
                    }
                    try {
                        fq1.g.set(z);
                    } catch (Throwable th) {
                        ec2.a(fq1.class, th);
                    }
                }
            } catch (JSONException e2) {
                Log.e(str2, "Error decoding server response.", e2);
            }
        } catch (Throwable th2) {
            ec2.a(this, th2);
        }
    }

    public final void c() {
        if (ec2.a.contains(this)) {
            return;
        }
        try {
            try {
                f94.c().execute(new fi2(this, 26, new iue(0, this)));
            } catch (RejectedExecutionException e2) {
                Log.e(e, "Error scheduling indexing job", e2);
            }
        } catch (Throwable th) {
            ec2.a(this, th);
        }
    }
}
