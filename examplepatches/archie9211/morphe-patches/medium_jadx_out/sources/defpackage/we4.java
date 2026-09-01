package defpackage;

import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import com.medium.android.data.catalog.KnyB.uvlZTF;
import j$.util.concurrent.ConcurrentHashMap;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.Executor;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class we4 {
    public static final we4 a = new we4();
    public static final AtomicBoolean b = new AtomicBoolean(false);
    public static final ConcurrentLinkedQueue c = new ConcurrentLinkedQueue();
    public static final ConcurrentHashMap d = new ConcurrentHashMap();
    public static volatile Long e;
    public static volatile c93 f;

    public static final boolean b(String str, String str2, boolean z) {
        HashMap map;
        ConcurrentHashMap concurrentHashMap;
        Boolean bool;
        str.getClass();
        we4 we4Var = a;
        ArrayList<w65> arrayList = null;
        d(null);
        if (we4Var.c(str2) == null) {
            map = new HashMap();
        } else {
            c93 c93Var = f;
            if (c93Var != null && (concurrentHashMap = (ConcurrentHashMap) c93Var.a.get(str2)) != null) {
                arrayList = new ArrayList(concurrentHashMap.size());
                Iterator it2 = concurrentHashMap.entrySet().iterator();
                while (it2.hasNext()) {
                    arrayList.add((w65) ((Map.Entry) it2.next()).getValue());
                }
            }
            if (arrayList != null) {
                map = new HashMap();
                for (w65 w65Var : arrayList) {
                    map.put(w65Var.a, Boolean.valueOf(w65Var.b));
                }
            } else {
                HashMap map2 = new HashMap();
                JSONObject jSONObjectC = we4Var.c(str2);
                if (jSONObjectC == null) {
                    jSONObjectC = new JSONObject();
                }
                Iterator<String> itKeys = jSONObjectC.keys();
                while (itKeys.hasNext()) {
                    String next = itKeys.next();
                    next.getClass();
                    map2.put(next, Boolean.valueOf(jSONObjectC.optBoolean(next)));
                }
                c93 c93Var2 = f;
                if (c93Var2 == null) {
                    c93Var2 = new c93(1);
                }
                ArrayList<w65> arrayList2 = new ArrayList(map2.size());
                for (Map.Entry entry : map2.entrySet()) {
                    arrayList2.add(new w65((String) entry.getKey(), ((Boolean) entry.getValue()).booleanValue()));
                }
                ConcurrentHashMap concurrentHashMap2 = new ConcurrentHashMap();
                for (w65 w65Var2 : arrayList2) {
                    concurrentHashMap2.put(w65Var2.a, w65Var2);
                }
                c93Var2.a.put(str2, concurrentHashMap2);
                f = c93Var2;
                map = map2;
            }
        }
        return (map.containsKey(str) && (bool = (Boolean) map.get(str)) != null) ? bool.booleanValue() : z;
    }

    public static final synchronized void d(ma4 ma4Var) {
        if (ma4Var != null) {
            try {
                c.add(ma4Var);
            } catch (Throwable th) {
                throw th;
            }
        }
        String strB = f94.b();
        we4 we4Var = a;
        Long l = e;
        if (l != null && System.currentTimeMillis() - l.longValue() < 3600000 && we4Var.c(strB) != null) {
            f();
            return;
        }
        Context contextA = f94.a();
        String str = String.format("com.facebook.internal.APP_GATEKEEPERS.%s", Arrays.copyOf(new Object[]{strB}, 1));
        JSONObject jSONObject = null;
        String string = contextA.getSharedPreferences("com.facebook.internal.preferences.APP_GATEKEEPERS", 0).getString(str, null);
        if (!epe.J(string)) {
            try {
                jSONObject = new JSONObject(string);
            } catch (JSONException unused) {
                f94 f94Var = f94.a;
            }
            if (jSONObject != null) {
                e(strB, jSONObject);
            }
        }
        Executor executorC = f94.c();
        if (b.compareAndSet(false, true)) {
            executorC.execute(new ve4(strB, contextA, str));
        }
    }

    public static final synchronized JSONObject e(String str, JSONObject jSONObject) {
        JSONObject jSONObject2;
        try {
            str.getClass();
            JSONObject jSONObjectC = a.c(str);
            jSONObject2 = jSONObjectC != null ? new JSONObject(jSONObjectC.toString()) : new JSONObject();
            JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray("data");
            JSONObject jSONObjectOptJSONObject = jSONArrayOptJSONArray != null ? jSONArrayOptJSONArray.optJSONObject(0) : null;
            if (jSONObjectOptJSONObject == null) {
                jSONObjectOptJSONObject = new JSONObject();
            }
            JSONArray jSONArrayOptJSONArray2 = jSONObjectOptJSONObject.optJSONArray("gatekeepers");
            if (jSONArrayOptJSONArray2 == null) {
                jSONArrayOptJSONArray2 = new JSONArray();
            }
            int length = jSONArrayOptJSONArray2.length();
            for (int i = 0; i < length; i++) {
                try {
                    JSONObject jSONObject3 = jSONArrayOptJSONArray2.getJSONObject(i);
                    jSONObject2.put(jSONObject3.getString("key"), jSONObject3.getBoolean("value"));
                } catch (JSONException unused) {
                    f94 f94Var = f94.a;
                }
            }
            a.g(str, jSONObject2);
        } catch (Throwable th) {
            throw th;
        }
        return jSONObject2;
    }

    public static void f() {
        Handler handler = new Handler(Looper.getMainLooper());
        while (true) {
            ConcurrentLinkedQueue concurrentLinkedQueue = c;
            if (concurrentLinkedQueue.isEmpty()) {
                return;
            }
            ma4 ma4Var = (ma4) concurrentLinkedQueue.poll();
            if (ma4Var != null) {
                handler.post(new v0(21, ma4Var));
            }
        }
    }

    public final synchronized JSONObject c(String str) {
        return (JSONObject) d.get(str);
    }

    public final synchronized void g(String str, JSONObject jSONObject) {
        d.put(str, jSONObject);
    }

    public static JSONObject a() {
        Bundle bundle = new Bundle();
        bundle.putString("platform", "android");
        f94 f94Var = f94.a;
        bundle.putString("sdk_version", "18.2.3");
        bundle.putString("fields", uvlZTF.WtRizUZIInKZKj);
        String str = ff5.j;
        ff5 ff5VarG0 = xz5.g0(null, String.format("app/%s", Arrays.copyOf(new Object[]{"mobile_sdk_gk"}, 1)), null);
        ff5VarG0.d = bundle;
        JSONObject jSONObject = ff5VarG0.c().d;
        return jSONObject == null ? new JSONObject() : jSONObject;
    }
}
