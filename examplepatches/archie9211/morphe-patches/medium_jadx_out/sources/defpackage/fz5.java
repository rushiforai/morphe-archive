package defpackage;

import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.util.Log;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class fz5 {
    public static final AtomicBoolean a = new AtomicBoolean(false);
    public static Boolean b;
    public static Boolean c;
    public static ez5 d;
    public static t6 e;
    public static Intent f;
    public static Object g;
    public static vz5 h;

    public static void a(Context context, ArrayList arrayList, boolean z) {
        if (arrayList.isEmpty()) {
            return;
        }
        HashMap map = new HashMap();
        ArrayList<String> arrayList2 = new ArrayList();
        Iterator it2 = arrayList.iterator();
        while (it2.hasNext()) {
            String str = (String) it2.next();
            try {
                String string = new JSONObject(str).getString("productId");
                string.getClass();
                str.getClass();
                map.put(string, str);
                arrayList2.add(string);
            } catch (JSONException e2) {
                Log.e("fz5", "Error parsing in-app purchase data.", e2);
            }
        }
        Object obj = g;
        qz5 qz5Var = qz5.a;
        LinkedHashMap linkedHashMap = null;
        if (!ec2.a.contains(qz5.class)) {
            try {
                LinkedHashMap linkedHashMapJ = qz5Var.j(arrayList2);
                ArrayList arrayList3 = new ArrayList();
                for (String str2 : arrayList2) {
                    if (!linkedHashMapJ.containsKey(str2)) {
                        arrayList3.add(str2);
                    }
                }
                linkedHashMapJ.putAll(qz5Var.g(context, arrayList3, obj, z));
                linkedHashMap = linkedHashMapJ;
            } catch (Throwable th) {
                ec2.a(qz5.class, th);
            }
        }
        for (Map.Entry entry : linkedHashMap.entrySet()) {
            String str3 = (String) entry.getKey();
            String str4 = (String) entry.getValue();
            String str5 = (String) map.get(str3);
            if (str5 != null) {
                wk0.e(str5, str4, z, h, false);
            }
        }
    }

    public static final void b(vz5 vz5Var) {
        vz5Var.getClass();
        if (b == null) {
            Boolean boolValueOf = Boolean.valueOf(xz5.R("com.android.vending.billing.IInAppBillingService$Stub") != null);
            b = boolValueOf;
            if (!boolValueOf.equals(Boolean.FALSE)) {
                c = Boolean.valueOf(xz5.R("com.android.billingclient.api.ProxyBillingActivity") != null);
                qz5 qz5Var = qz5.a;
                if (!ec2.a.contains(qz5.class)) {
                    try {
                        long jCurrentTimeMillis = System.currentTimeMillis() / 1000;
                        SharedPreferences sharedPreferences = qz5.e;
                        long j = sharedPreferences.getLong("LAST_CLEARED_TIME", 0L);
                        if (j == 0) {
                            sharedPreferences.edit().putLong("LAST_CLEARED_TIME", jCurrentTimeMillis).apply();
                        } else if (jCurrentTimeMillis - j > 604800) {
                            sharedPreferences.edit().clear().putLong("LAST_CLEARED_TIME", jCurrentTimeMillis).apply();
                        }
                    } catch (Throwable th) {
                        ec2.a(qz5.class, th);
                    }
                }
                Intent intent = new Intent("com.android.vending.billing.InAppBillingService.BIND").setPackage("com.android.vending");
                intent.getClass();
                f = intent;
                d = new ez5();
                e = new t6(2);
            }
        }
        if (!g76.L(b, Boolean.FALSE) && wk0.d()) {
            h = vz5Var;
            if (a.compareAndSet(false, true)) {
                Context contextA = f94.a();
                if (contextA instanceof Application) {
                    Application application = (Application) contextA;
                    t6 t6Var = e;
                    if (t6Var == null) {
                        g76.g0("callbacks");
                        throw null;
                    }
                    application.registerActivityLifecycleCallbacks(t6Var);
                    Intent intent2 = f;
                    if (intent2 == null) {
                        g76.g0("intent");
                        throw null;
                    }
                    ez5 ez5Var = d;
                    if (ez5Var != null) {
                        contextA.bindService(intent2, ez5Var, 1);
                    } else {
                        g76.g0("serviceConnection");
                        throw null;
                    }
                }
            }
        }
    }
}
