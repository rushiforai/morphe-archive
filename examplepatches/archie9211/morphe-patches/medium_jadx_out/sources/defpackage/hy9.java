package defpackage;

import android.content.SharedPreferences;
import android.view.View;
import java.util.LinkedHashMap;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hy9 {
    public static SharedPreferences c;
    public static final hy9 a = new hy9();
    public static final LinkedHashMap b = new LinkedHashMap();
    public static final AtomicBoolean d = new AtomicBoolean(false);

    public static final void a(String str, String str2) {
        if (ec2.a.contains(hy9.class)) {
            return;
        }
        try {
            str2.getClass();
            if (!d.get()) {
                a.c();
            }
            LinkedHashMap linkedHashMap = b;
            linkedHashMap.put(str, str2);
            SharedPreferences sharedPreferences = c;
            if (sharedPreferences != null) {
                sharedPreferences.edit().putString("SUGGESTED_EVENTS_HISTORY", epe.N(ei7.W(linkedHashMap))).apply();
            } else {
                g76.g0("shardPreferences");
                throw null;
            }
        } catch (Throwable th) {
            ec2.a(hy9.class, th);
        }
    }

    public static final String b(View view, String str) {
        if (ec2.a.contains(hy9.class)) {
            return null;
        }
        try {
            str.getClass();
            JSONObject jSONObject = new JSONObject();
            try {
                jSONObject.put("text", str);
                JSONArray jSONArray = new JSONArray();
                while (view != null) {
                    jSONArray.put(view.getClass().getSimpleName());
                    view = gue.i(view);
                }
                jSONObject.put("classname", jSONArray);
            } catch (JSONException unused) {
            }
            return epe.d0(jSONObject.toString());
        } catch (Throwable th) {
            ec2.a(hy9.class, th);
            return null;
        }
    }

    public final void c() {
        String str = "";
        if (ec2.a.contains(this)) {
            return;
        }
        try {
            AtomicBoolean atomicBoolean = d;
            if (atomicBoolean.get()) {
                return;
            }
            SharedPreferences sharedPreferences = f94.a().getSharedPreferences("com.facebook.internal.SUGGESTED_EVENTS_HISTORY", 0);
            sharedPreferences.getClass();
            c = sharedPreferences;
            LinkedHashMap linkedHashMap = b;
            String string = sharedPreferences.getString("SUGGESTED_EVENTS_HISTORY", "");
            if (string != null) {
                str = string;
            }
            linkedHashMap.putAll(epe.M(str));
            atomicBoolean.set(true);
        } catch (Throwable th) {
            ec2.a(this, th);
        }
    }
}
