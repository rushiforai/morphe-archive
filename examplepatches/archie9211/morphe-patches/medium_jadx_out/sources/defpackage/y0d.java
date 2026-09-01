package defpackage;

import android.app.Activity;
import java.io.File;
import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.Set;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONArray;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class y0d {
    public static final y0d a = new y0d();
    public static final AtomicBoolean b = new AtomicBoolean(false);
    public static final LinkedHashSet c = new LinkedHashSet();
    public static final LinkedHashSet d = new LinkedHashSet();

    public static final synchronized void a() {
        if (ec2.a.contains(y0d.class)) {
            return;
        }
        try {
            f94.c().execute(new e(16));
        } catch (Throwable th) {
            ec2.a(y0d.class, th);
        }
    }

    public static final void d(Activity activity) {
        Set set = ec2.a;
        if (set.contains(y0d.class)) {
            return;
        }
        try {
            if (b.get()) {
                boolean z = false;
                if (!set.contains(fa4.class)) {
                    try {
                        z = fa4.g;
                    } catch (Throwable th) {
                        ec2.a(fa4.class, th);
                    }
                }
                if (z) {
                    if (c.isEmpty()) {
                        if (!d.isEmpty()) {
                        }
                    }
                    HashMap map = xue.d;
                    vo7.O(activity);
                    return;
                }
            }
            HashMap map2 = xue.d;
            vo7.P(activity);
        } catch (Exception unused) {
        } catch (Throwable th2) {
            ec2.a(y0d.class, th2);
        }
    }

    public final void b() {
        String str;
        if (ec2.a.contains(this)) {
            return;
        }
        try {
            xe4 xe4VarK = af4.k(f94.b(), false);
            if (xe4VarK != null && (str = xe4VarK.k) != null) {
                c(str);
                if (c.isEmpty() && d.isEmpty()) {
                    return;
                }
                File fileD = k28.d(h28.MTML_APP_EVENT_PREDICTION);
                if (fileD == null) {
                    return;
                }
                fa4.B(fileD);
                WeakReference weakReference = u6.l;
                Activity activity = weakReference != null ? (Activity) weakReference.get() : null;
                if (activity != null) {
                    d(activity);
                }
            }
        } catch (Exception unused) {
        } catch (Throwable th) {
            ec2.a(this, th);
        }
    }

    public final void c(String str) {
        if (ec2.a.contains(this)) {
            return;
        }
        try {
            JSONObject jSONObject = new JSONObject(str);
            if (jSONObject.has("production_events")) {
                JSONArray jSONArray = jSONObject.getJSONArray("production_events");
                int length = jSONArray.length();
                for (int i = 0; i < length; i++) {
                    LinkedHashSet linkedHashSet = c;
                    String string = jSONArray.getString(i);
                    string.getClass();
                    linkedHashSet.add(string);
                }
            }
            if (jSONObject.has("eligible_for_prediction_events")) {
                JSONArray jSONArray2 = jSONObject.getJSONArray("eligible_for_prediction_events");
                int length2 = jSONArray2.length();
                for (int i2 = 0; i2 < length2; i2++) {
                    LinkedHashSet linkedHashSet2 = d;
                    String string2 = jSONArray2.getString(i2);
                    string2.getClass();
                    linkedHashSet2.add(string2);
                }
            }
        } catch (Exception unused) {
        } catch (Throwable th) {
            ec2.a(this, th);
        }
    }
}
