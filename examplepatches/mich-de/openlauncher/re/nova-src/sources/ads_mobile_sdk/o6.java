package ads_mobile_sdk;

import android.os.Build;
import android.webkit.WebView;
import b.k9;
import com.amplitude.android.plugins.AndroidContextPlugin;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes.dex */
public abstract class o6 {

    /* renamed from: a, reason: collision with root package name */
    public final String f7768a;

    /* renamed from: b, reason: collision with root package name */
    public b.e2 f7769b;

    /* renamed from: c, reason: collision with root package name */
    public int f7770c;

    /* renamed from: d, reason: collision with root package name */
    public long f7771d;

    public o6(String str) {
        a$2();
        this.f7768a = str;
        this.f7769b = new b.e2(null);
    }

    public static JSONArray a(ArrayList arrayList) {
        JSONArray jSONArray = new JSONArray();
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            ((lm0) ((b.h5) it.next())).getClass();
            for (String str : Collections.singletonList("1.0")) {
                JSONObject jSONObject = new JSONObject();
                jSONObject.put("mechanism", "FireTVFOSDAT");
                jSONObject.put("executionEnvironment", "NATIVE");
                jSONObject.put("version", str);
                jSONArray.put(jSONObject);
            }
        }
        return jSONArray;
    }

    public final void a$2() {
        this.f7771d = System.nanoTime();
        this.f7770c = 1;
    }

    public void b() {
        this.f7769b.clear();
    }

    public void c() {
    }

    public void a(m6 m6Var, ae.l lVar) {
        a(m6Var, lVar, null);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final void a(m6 m6Var, ae.l lVar, JSONObject jSONObject) throws JSONException {
        String str = m6Var.f7021g;
        JSONObject jSONObject2 = new JSONObject();
        c72.a(jSONObject2, "environment", "app");
        c72.a(jSONObject2, "adSessionType", (l6) lVar.f12777g);
        JSONObject jSONObject3 = new JSONObject();
        c72.a(jSONObject3, "deviceType", Build.MANUFACTURER + "; " + Build.MODEL);
        c72.a(jSONObject3, "osVersion", Integer.toString(Build.VERSION.SDK_INT));
        c72.a(jSONObject3, "os", AndroidContextPlugin.PLATFORM);
        c72.a(jSONObject2, "deviceInfo", jSONObject3);
        c72.a(jSONObject2, "deviceCategory", k9.r(xv.a()));
        JSONArray jSONArray = new JSONArray();
        jSONArray.put("clid");
        jSONArray.put("vlid");
        c72.a(jSONObject2, "supports", jSONArray);
        JSONObject jSONObject4 = new JSONObject();
        c10.a aVar = (c10.a) lVar.f12771a;
        c72.a(jSONObject4, "partnerName", (String) aVar.f19148b);
        c72.a(jSONObject4, "partnerVersion", (String) aVar.f19149c);
        c72.a(jSONObject2, "omidNativeInfo", jSONObject4);
        JSONObject jSONObject5 = new JSONObject();
        c72.a(jSONObject5, "libraryVersion", "1.6.9-google_20260729");
        c72.a(jSONObject5, "appId", ib1.f4719b.f4720a.getApplicationContext().getPackageName());
        c72.a(jSONObject2, "app", jSONObject5);
        String str2 = (String) lVar.f12776f;
        if (str2 != null) {
            c72.a(jSONObject2, "contentUrl", str2);
        }
        String str3 = (String) lVar.f12775e;
        if (str3 != null) {
            c72.a(jSONObject2, "customReferenceData", str3);
        }
        JSONObject jSONObject6 = new JSONObject();
        Iterator it = Collections.unmodifiableList((ArrayList) lVar.f12773c).iterator();
        if (!it.hasNext()) {
            d62.f2192a.a((WebView) this.f7769b.get(), "startSession", str, jSONObject2, jSONObject6, jSONObject);
            return;
        }
        throw b.u4.e(it);
    }
}
