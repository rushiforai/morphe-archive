package zn;

import android.app.UiModeManager;
import android.os.Build;
import android.webkit.WebView;
import b.e2;
import com.amplitude.android.plugins.AndroidContextPlugin;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.google.android.gms.internal.consent_sdk.v;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import un.j;
import un.k;
import xn.h;
import xn.i;

/* loaded from: classes3.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public final String f98571a;

    /* renamed from: c, reason: collision with root package name */
    public un.a f98573c;

    /* renamed from: d, reason: collision with root package name */
    public vn.b f98574d;

    /* renamed from: f, reason: collision with root package name */
    public long f98576f = System.nanoTime();

    /* renamed from: e, reason: collision with root package name */
    public int f98575e = 1;

    /* renamed from: b, reason: collision with root package name */
    public e2 f98572b = new e2((Object) null);

    public a(String str) {
        this.f98571a = str;
    }

    public final void a(float f11) {
        i.f96196a.a(i(), "setDeviceVolume", Float.valueOf(f11), this.f98571a);
    }

    public final void b(String str, JSONObject jSONObject) {
        i.f96196a.a(i(), "publishMediaEvent", str, jSONObject, this.f98571a);
    }

    public final void c(Date date) throws JSONException {
        if (date == null) {
            return;
        }
        JSONObject jSONObject = new JSONObject();
        ao.b.b(jSONObject, "timestamp", Long.valueOf(date.getTime()));
        i.f96196a.a(i(), "setLastActivity", jSONObject);
    }

    public void d(k kVar, v vVar) throws JSONException {
        e(kVar, vVar, null);
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x0061  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void e(k kVar, v vVar, JSONObject jSONObject) throws JSONException {
        char c11;
        String str;
        String str2 = kVar.f91405h;
        JSONObject jSONObject2 = new JSONObject();
        ao.b.b(jSONObject2, "environment", "app");
        ao.b.b(jSONObject2, "adSessionType", (un.d) vVar.f32266h);
        JSONObject jSONObject3 = new JSONObject();
        ao.b.b(jSONObject3, "deviceType", Build.MANUFACTURER + "; " + Build.MODEL);
        ao.b.b(jSONObject3, "osVersion", Integer.toString(Build.VERSION.SDK_INT));
        ao.b.b(jSONObject3, "os", AndroidContextPlugin.PLATFORM);
        ao.b.b(jSONObject2, "deviceInfo", jSONObject3);
        UiModeManager uiModeManager = u90.b.f90710a;
        if (uiModeManager != null) {
            int currentModeType = uiModeManager.getCurrentModeType();
            c11 = 1;
            if (currentModeType == 1) {
                c11 = 2;
            } else if (currentModeType != 4) {
                c11 = 3;
            }
        }
        if (c11 == 1) {
            str = "ctv";
        } else if (c11 == 2) {
            str = "mobile";
        } else {
            if (c11 != 3) {
                throw null;
            }
            str = InneractiveMediationNameConsts.OTHER;
        }
        ao.b.b(jSONObject2, "deviceCategory", str);
        JSONArray jSONArray = new JSONArray();
        jSONArray.put("clid");
        jSONArray.put("vlid");
        ao.b.b(jSONObject2, "supports", jSONArray);
        JSONObject jSONObject4 = new JSONObject();
        un.i iVar = (un.i) vVar.f32259a;
        iVar.getClass();
        ao.b.b(jSONObject4, "partnerName", "Fyber");
        ao.b.b(jSONObject4, "partnerVersion", iVar.f91394a);
        ao.b.b(jSONObject2, "omidNativeInfo", jSONObject4);
        JSONObject jSONObject5 = new JSONObject();
        ao.b.b(jSONObject5, "libraryVersion", "1.5.4-Fyber");
        ao.b.b(jSONObject5, "appId", h.f96194b.f96195a.getApplicationContext().getPackageName());
        ao.b.b(jSONObject2, "app", jSONObject5);
        String str3 = (String) vVar.f32265g;
        if (str3 != null) {
            ao.b.b(jSONObject2, "contentUrl", str3);
        }
        String str4 = (String) vVar.f32264f;
        if (str4 != null) {
            ao.b.b(jSONObject2, "customReferenceData", str4);
        }
        JSONObject jSONObject6 = new JSONObject();
        for (j jVar : Collections.unmodifiableList((ArrayList) vVar.f32261c)) {
            ao.b.b(jSONObject6, jVar.f91395a, jVar.f91397c);
        }
        i.f96196a.a(i(), "startSession", str2, jSONObject2, jSONObject6, jSONObject);
    }

    public final void f(boolean z11) {
        if (this.f98572b.get() != 0) {
            i.f96196a.a(i(), "setState", z11 ? "foregrounded" : "backgrounded", this.f98571a);
        }
    }

    public void g() {
        this.f98572b.clear();
    }

    public final void h(boolean z11) {
        if (this.f98572b.get() != 0) {
            i.f96196a.a(i(), "setDeviceLockState", z11 ? "locked" : "unlocked");
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final WebView i() {
        return (WebView) this.f98572b.get();
    }

    public void j() {
    }
}
