package rp;

import android.content.Context;
import android.content.SharedPreferences;
import b50.d;
import com.android.billingclient.api.Purchase;
import java.io.IOException;
import java.lang.reflect.Method;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import sp.e0;
import sp.m0;
import sp.r0;
import sp.t;

/* loaded from: classes4.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public static m0 f86129a;

    /* renamed from: b, reason: collision with root package name */
    public static boolean f86130b;

    static {
        new d(a.class.getSimpleName());
        f86130b = false;
    }

    public static boolean a(Object... objArr) {
        try {
            if (!e()) {
                m0.a("e29");
                return false;
            }
            if (r0.l("__iap__")) {
                m0.a("e34");
                return false;
            }
            if (objArr.length % 2 != 0) {
                m0.a("e33");
                return false;
            }
            try {
                JSONObject jSONObject = new JSONObject();
                for (int i5 = 0; i5 < objArr.length; i5 += 2) {
                    jSONObject.put((String) objArr[i5], objArr[i5 + 1]);
                }
                return b("__iap__", jSONObject);
            } catch (JSONException unused) {
                m0.a("e35");
                return false;
            }
        } catch (Throwable unused2) {
            m0.a("e36");
            return false;
        }
    }

    public static boolean b(String str, JSONObject jSONObject) {
        try {
            if (!e()) {
                m0.a("e37");
                return false;
            }
            if (r0.l(str)) {
                m0.a("e38");
                return false;
            }
            return f86129a.f(str, jSONObject.toString());
        } catch (Throwable unused) {
            m0.a("e60");
            return false;
        }
    }

    public static Object c(Purchase purchase) {
        Method methodE = r0.e(purchase, "getProducts", new Class[0]);
        if (methodE != null) {
            return new JSONArray(methodE.invoke(purchase, null).toString());
        }
        Method methodE2 = r0.e(purchase, "getSku", new Class[0]);
        if (methodE2 != null) {
            return (String) methodE2.invoke(purchase, null);
        }
        Method methodE3 = r0.e(purchase, "getSkus", new Class[0]);
        if (methodE3 != null) {
            return new JSONArray(methodE3.invoke(purchase, null).toString());
        }
        return null;
    }

    public static boolean d(Context context, c cVar) {
        try {
        } catch (IOException e3) {
            r0.c(e3);
            m0.a("e24");
            f86129a = null;
        } catch (Throwable th2) {
            m0.a("e25");
            r0.c(th2);
        }
        if (context == null) {
            m0.a("e23");
            return false;
        }
        String str = cVar.f86132a;
        f86130b = f86129a != null;
        if (str.endsWith("_sl")) {
            r0.f87656c = str;
        }
        f86129a = m0.b(context, c.a(cVar));
        if (f86130b) {
            e0.a().getClass();
            f86129a.f87619d.getClass();
            if (br.c.f18431b == null) {
                br.c.f18431b = new br.c();
            }
            br.c.f18431b.getClass();
        }
        return e();
    }

    public static boolean e() {
        return f86129a != null;
    }

    public static void f(double d5, Purchase purchase, String str) {
        if (purchase.getClass().getName().equals("com.android.billingclient.api.Purchase")) {
            try {
                Class<?> cls = purchase.getClass();
                a("pcc", str, "r", Double.valueOf(d5), "pk", c(purchase), "receipt", (String) cls.getDeclaredMethod("getOriginalJson", null).invoke(purchase, null), "receipt_signature", (String) cls.getDeclaredMethod("getSignature", null).invoke(purchase, null), "is_revenue_event", Boolean.TRUE);
                return;
            } catch (Throwable unused) {
                m0.a("e40");
            }
        }
        a("pcc", str, "r", Double.valueOf(d5), "is_revenue_event", Boolean.TRUE);
    }

    public static void g(String str) {
        try {
            if (!e()) {
                m0.a("e43");
                return;
            }
            m0 m0Var = f86129a;
            SharedPreferences.Editor editorEdit = m0Var.c().edit();
            editorEdit.putString("fcm_device_token_key", str);
            editorEdit.commit();
            t tVar = m0Var.f87621f;
            if (tVar != null) {
                tVar.f87683w = str;
            }
        } catch (Throwable th2) {
            m0.a("e77");
            r0.c(th2);
        }
    }
}
