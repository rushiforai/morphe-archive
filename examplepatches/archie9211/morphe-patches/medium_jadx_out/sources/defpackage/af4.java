package defpackage;

import android.content.Context;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import j$.util.concurrent.ConcurrentHashMap;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.atomic.AtomicReference;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import sprig.b.VPIE.dpBiLjNeNsiASg;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class af4 {
    public static final af4 a = new af4();
    public static final List b = d46.R("supports_implicit_sdk_logging", "gdpv4_nux_content", "gdpv4_nux_enabled", "android_dialog_configs", "android_sdk_error_categories", "app_events_session_timeout", "app_events_feature_bitmask", "auto_event_mapping_android", "seamless_login", "smart_login_bookmark_icon_url", "smart_login_menu_icon_url", "restrictive_data_filter_params", "aam_rules", "suggested_events_setting", "protected_mode_rules", "auto_log_app_events_default", "auto_log_app_events_enabled", ev6.z(new StringBuilder("app_events_config.os_version("), Build.VERSION.RELEASE, ')'));
    public static final ConcurrentHashMap c = new ConcurrentHashMap();
    public static final AtomicReference d = new AtomicReference(ze4.NOT_LOADED);
    public static final ConcurrentLinkedQueue e = new ConcurrentLinkedQueue();
    public static volatile boolean f;

    public static JSONObject a() {
        Bundle bundle = new Bundle();
        ArrayList arrayList = new ArrayList();
        arrayList.addAll(b);
        bundle.putString("fields", TextUtils.join(",", arrayList));
        String str = ff5.j;
        ff5 ff5VarG0 = xz5.g0(null, "app", null);
        ff5VarG0.i = true;
        ff5VarG0.d = bundle;
        JSONObject jSONObject = ff5VarG0.c().d;
        return jSONObject == null ? new JSONObject() : jSONObject;
    }

    public static final xe4 b(String str) {
        return (xe4) c.get(str);
    }

    public static final HashMap c() {
        JSONObject jSONObject;
        String string = f94.a().getSharedPreferences("com.facebook.internal.preferences.APP_SETTINGS", 0).getString(String.format("com.facebook.internal.APP_SETTINGS.%s", Arrays.copyOf(new Object[]{f94.b()}, 1)), null);
        if (!epe.J(string)) {
            if (string != null) {
                try {
                    jSONObject = new JSONObject(string);
                } catch (JSONException unused) {
                    f94 f94Var = f94.a;
                    jSONObject = null;
                }
                if (jSONObject != null) {
                    return h(jSONObject);
                }
            } else {
                ygf.f("Required value was null.");
            }
        }
        return null;
    }

    public static final void d() {
        Context contextA = f94.a();
        String strB = f94.b();
        boolean zJ = epe.J(strB);
        af4 af4Var = a;
        AtomicReference atomicReference = d;
        if (zJ) {
            atomicReference.set(ze4.ERROR);
            af4Var.j();
            return;
        }
        if (c.containsKey(strB)) {
            atomicReference.set(ze4.SUCCESS);
            af4Var.j();
            return;
        }
        ze4 ze4Var = ze4.NOT_LOADED;
        ze4 ze4Var2 = ze4.LOADING;
        while (true) {
            if (atomicReference.compareAndSet(ze4Var, ze4Var2)) {
                break;
            }
            if (atomicReference.get() != ze4Var) {
                ze4 ze4Var3 = ze4.ERROR;
                ze4 ze4Var4 = ze4.LOADING;
                while (!atomicReference.compareAndSet(ze4Var3, ze4Var4)) {
                    if (atomicReference.get() != ze4Var3) {
                        af4Var.j();
                        return;
                    }
                }
            }
        }
        f94.c().execute(new ve4(contextA, String.format("com.facebook.internal.APP_SETTINGS.%s", Arrays.copyOf(new Object[]{strB}, 1)), strB));
    }

    public static ArrayList f(String str, JSONObject jSONObject) {
        JSONArray jSONArray;
        if (jSONObject != null) {
            try {
                jSONArray = jSONObject.getJSONArray("iap_manual_and_auto_log_dedup_keys");
            } catch (Exception unused) {
            }
        } else {
            jSONArray = null;
        }
        if (jSONArray != null) {
            int length = jSONArray.length();
            for (int i = 0; i < length; i++) {
                JSONObject jSONObject2 = jSONArray.getJSONObject(i);
                if (g76.L(jSONObject2.getString("key"), "prod_keys")) {
                    JSONArray jSONArray2 = jSONObject2.getJSONArray("value");
                    int length2 = jSONArray2.length();
                    for (int i2 = 0; i2 < length2; i2++) {
                        JSONObject jSONObject3 = jSONArray2.getJSONObject(i2);
                        if (g76.L(jSONObject3.getString("key"), str)) {
                            JSONArray jSONArray3 = jSONObject3.getJSONArray("value");
                            ArrayList arrayList = new ArrayList();
                            int length3 = jSONArray3.length();
                            for (int i3 = 0; i3 < length3; i3++) {
                                arrayList.add(jSONArray3.getJSONObject(i3).getString("value"));
                            }
                            ArrayList arrayList2 = new ArrayList();
                            arrayList2.addAll(arrayList);
                            return arrayList2;
                        }
                    }
                }
            }
        }
        return null;
    }

    public static HashMap h(JSONObject jSONObject) {
        HashMap map = new HashMap();
        if (!jSONObject.isNull("auto_log_app_events_default")) {
            try {
                map.put("auto_log_app_events_default", Boolean.valueOf(jSONObject.getBoolean("auto_log_app_events_default")));
            } catch (JSONException unused) {
                f94 f94Var = f94.a;
            }
        }
        if (!jSONObject.isNull("auto_log_app_events_enabled")) {
            try {
                map.put("auto_log_app_events_enabled", Boolean.valueOf(jSONObject.getBoolean("auto_log_app_events_enabled")));
            } catch (JSONException unused2) {
                f94 f94Var2 = f94.a;
            }
        }
        if (map.isEmpty()) {
            return null;
        }
        return map;
    }

    public static JSONArray i(String str, JSONObject jSONObject) {
        if (jSONObject != null) {
            return jSONObject.optJSONArray(str);
        }
        return null;
    }

    public static final xe4 k(String str, boolean z) {
        str.getClass();
        if (!z) {
            ConcurrentHashMap concurrentHashMap = c;
            if (concurrentHashMap.containsKey(str)) {
                return (xe4) concurrentHashMap.get(str);
            }
        }
        xe4 xe4VarE = e(str, a());
        if (str.equals(f94.b())) {
            d.set(ze4.SUCCESS);
            a.j();
        }
        return xe4VarE;
    }

    public final synchronized void j() {
        ze4 ze4Var = (ze4) d.get();
        if (ze4.NOT_LOADED != ze4Var && ze4.LOADING != ze4Var) {
            xe4 xe4Var = (xe4) c.get(f94.b());
            Handler handler = new Handler(Looper.getMainLooper());
            if (ze4.ERROR == ze4Var) {
                while (true) {
                    ConcurrentLinkedQueue concurrentLinkedQueue = e;
                    if (concurrentLinkedQueue.isEmpty()) {
                        return;
                    } else {
                        handler.post(new ye4((j50) concurrentLinkedQueue.poll()));
                    }
                }
            } else {
                while (true) {
                    ConcurrentLinkedQueue concurrentLinkedQueue2 = e;
                    if (concurrentLinkedQueue2.isEmpty()) {
                        return;
                    } else {
                        handler.post(new ye4((j50) concurrentLinkedQueue2.poll(), xe4Var));
                    }
                }
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:46:0x0106  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static defpackage.xe4 e(java.lang.String r45, org.json.JSONObject r46) {
        /*
            Method dump skipped, instruction units count: 601
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.af4.e(java.lang.String, org.json.JSONObject):xe4");
    }

    public static ArrayList g(JSONObject jSONObject, boolean z) {
        JSONArray jSONArray;
        if (jSONObject != null) {
            try {
                jSONArray = jSONObject.getJSONArray("iap_manual_and_auto_log_dedup_keys");
            } catch (Exception unused) {
            }
        } else {
            jSONArray = null;
        }
        if (jSONArray == null) {
            return null;
        }
        int length = jSONArray.length();
        ArrayList arrayList = null;
        for (int i = 0; i < length; i++) {
            JSONObject jSONObject2 = jSONArray.getJSONObject(i);
            String string = jSONObject2.getString("key");
            if ((!g76.L(string, "prod_keys") || !z) && (!g76.L(string, "test_keys") || z)) {
                JSONArray jSONArray2 = jSONObject2.getJSONArray("value");
                int length2 = jSONArray2.length();
                for (int i2 = 0; i2 < length2; i2++) {
                    JSONObject jSONObject3 = jSONArray2.getJSONObject(i2);
                    String string2 = jSONObject3.getString("key");
                    if (!g76.L(string2, "_valueToSum") && !g76.L(string2, dpBiLjNeNsiASg.evhBWcSR)) {
                        JSONArray jSONArray3 = jSONObject3.getJSONArray("value");
                        ArrayList arrayList2 = new ArrayList();
                        int length3 = jSONArray3.length();
                        for (int i3 = 0; i3 < length3; i3++) {
                            try {
                                arrayList2.add(jSONArray3.getJSONObject(i3).getString("value"));
                            } catch (Exception unused2) {
                                return null;
                            }
                        }
                        if (arrayList == null) {
                            arrayList = new ArrayList();
                        }
                        arrayList.add(new f09(string2, arrayList2));
                    }
                }
            }
        }
        return arrayList;
    }
}
