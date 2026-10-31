package com.bytedance.sdk.component.adexpress.ycx.sya;

import android.text.TextUtils;
import android.util.Pair;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ycx {

    /* renamed from: dj, reason: collision with root package name */
    private List<C0036ycx> f23659dj;

    /* renamed from: lt, reason: collision with root package name */
    private String f23660lt;
    private zb lud;
    private String sya;

    /* renamed from: ul, reason: collision with root package name */
    private Map<String, ycx> f23661ul = new ConcurrentHashMap();
    private String ycx;

    /* renamed from: zb, reason: collision with root package name */
    private String f23662zb;

    /* renamed from: com.bytedance.sdk.component.adexpress.ycx.sya.ycx$ycx, reason: collision with other inner class name */
    public static class C0036ycx {
        private int sya;
        private String ycx;

        /* renamed from: zb, reason: collision with root package name */
        private String f23663zb;

        public boolean equals(Object obj) {
            String str;
            if (!(obj instanceof C0036ycx)) {
                return super.equals(obj);
            }
            String str2 = this.ycx;
            if (str2 != null) {
                C0036ycx c0036ycx = (C0036ycx) obj;
                if (str2.equals(c0036ycx.ycx()) && (str = this.f23663zb) != null && str.equals(c0036ycx.zb())) {
                    return true;
                }
            }
            return false;
        }

        public int sya() {
            return this.sya;
        }

        public String ycx() {
            return this.ycx;
        }

        public String zb() {
            return this.f23663zb;
        }

        public void ycx(String str) {
            this.ycx = str;
        }

        public void zb(String str) {
            this.f23663zb = str;
        }

        public void ycx(int i5) {
            this.sya = i5;
        }
    }

    public static class zb {
        private List<Pair<String, String>> sya;
        private String ycx;

        /* renamed from: zb, reason: collision with root package name */
        private String f23664zb;

        public String ycx() {
            return this.ycx;
        }

        public void zb(String str) {
            this.f23664zb = str;
        }

        public void ycx(String str) {
            this.ycx = str;
        }

        public List<Pair<String, String>> zb() {
            return this.sya;
        }

        public void ycx(List<Pair<String, String>> list) {
            this.sya = list;
        }
    }

    public String dj() {
        return this.sya;
    }

    public boolean fby() {
        return (TextUtils.isEmpty(dj()) || TextUtils.isEmpty(sya()) || TextUtils.isEmpty(zb())) ? false : true;
    }

    public String jc() {
        JSONObject jSONObjectJw;
        if (!fby() || (jSONObjectJw = jw()) == null) {
            return null;
        }
        return jSONObjectJw.toString();
    }

    public JSONObject jw() {
        try {
            JSONObject jSONObject = new JSONObject();
            jSONObject.putOpt(PendingUpgradeStore.KEY_NAME, zb());
            jSONObject.putOpt("version", sya());
            jSONObject.putOpt("main", dj());
            if (!TextUtils.isEmpty(this.f23660lt)) {
                jSONObject.put("template_fetch_url", this.f23660lt);
            }
            JSONArray jSONArray = new JSONArray();
            if (lt() != null) {
                for (C0036ycx c0036ycx : lt()) {
                    JSONObject jSONObject2 = new JSONObject();
                    jSONObject2.putOpt(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, c0036ycx.ycx());
                    jSONObject2.putOpt("md5", c0036ycx.zb());
                    jSONObject2.putOpt("level", Integer.valueOf(c0036ycx.sya()));
                    jSONArray.put(jSONObject2);
                }
            }
            jSONObject.putOpt("resources", jSONArray);
            if (!this.f23661ul.isEmpty()) {
                JSONObject jSONObject3 = new JSONObject();
                boolean z11 = false;
                for (String str : this.f23661ul.keySet()) {
                    ycx ycxVar = this.f23661ul.get(str);
                    if (ycxVar != null) {
                        jSONObject3.put(str, ycxVar.jw());
                        z11 = true;
                    }
                }
                if (z11) {
                    jSONObject.put("engines", jSONObject3);
                }
            }
            zb zbVarLud = lud();
            if (zbVarLud != null) {
                JSONObject jSONObject4 = new JSONObject();
                jSONObject4.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, zbVarLud.ycx);
                jSONObject4.put("md5", zbVarLud.f23664zb);
                JSONObject jSONObject5 = new JSONObject();
                List<Pair<String, String>> listZb = zbVarLud.zb();
                if (listZb != null) {
                    for (Pair<String, String> pair : listZb) {
                        jSONObject5.put((String) pair.first, pair.second);
                    }
                }
                jSONObject4.put("map", jSONObject5);
                jSONObject.putOpt("resources_archive", jSONObject4);
            }
            return jSONObject;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJsyYdD2VjCHK8sXuI=", "b+sghTO3buqPTtJR", "T+EAmge5Ze2TRdk=", 233);
            return null;
        }
    }

    public List<C0036ycx> lt() {
        if (this.f23659dj == null) {
            this.f23659dj = new ArrayList();
        }
        return this.f23659dj;
    }

    public zb lud() {
        return this.lud;
    }

    public String sya() {
        return this.f23662zb;
    }

    public String ul() {
        return this.f23660lt;
    }

    public Map<String, ycx> ycx() {
        return this.f23661ul;
    }

    public String zb() {
        return this.ycx;
    }

    public static ycx lud(String str) {
        if (str == null) {
            return null;
        }
        try {
            return ycx(new JSONObject(str));
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJsyYdD2VjCHK8sXuI=", "b+sghTO3buqPTtJR", "S+8/hgau", 327);
            return null;
        }
    }

    public void dj(String str) {
        this.f23660lt = str;
    }

    public void sya(String str) {
        this.sya = str;
    }

    public void ycx(String str) {
        this.ycx = str;
    }

    public void zb(String str) {
        this.f23662zb = str;
    }

    public void ycx(zb zbVar) {
        this.lud = zbVar;
    }

    public void ycx(List<C0036ycx> list) {
        if (list == null) {
            list = new ArrayList<>();
        }
        this.f23659dj = list;
    }

    public static ycx ycx(JSONObject jSONObject) {
        JSONObject jSONObjectOptJSONObject;
        if (jSONObject == null) {
            return null;
        }
        ycx ycxVar = new ycx();
        ycxVar.ycx(jSONObject.optString(PendingUpgradeStore.KEY_NAME));
        ycxVar.zb(jSONObject.optString("version"));
        ycxVar.sya(jSONObject.optString("main"));
        ycxVar.dj(jSONObject.optString("template_fetch_url", b.f42142b));
        JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray("resources");
        ArrayList arrayList = new ArrayList();
        if (jSONArrayOptJSONArray != null && jSONArrayOptJSONArray.length() > 0) {
            for (int i5 = 0; i5 < jSONArrayOptJSONArray.length(); i5++) {
                JSONObject jSONObjectOptJSONObject2 = jSONArrayOptJSONArray.optJSONObject(i5);
                C0036ycx c0036ycx = new C0036ycx();
                c0036ycx.ycx(jSONObjectOptJSONObject2.optString(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL));
                c0036ycx.zb(jSONObjectOptJSONObject2.optString("md5"));
                c0036ycx.ycx(jSONObjectOptJSONObject2.optInt("level"));
                arrayList.add(c0036ycx);
            }
        }
        ycxVar.ycx(arrayList);
        try {
            JSONObject jSONObjectOptJSONObject3 = jSONObject.optJSONObject("engines");
            if (jSONObjectOptJSONObject3 != null) {
                Iterator<String> itKeys = jSONObjectOptJSONObject3.keys();
                while (itKeys.hasNext()) {
                    String next = itKeys.next();
                    ycx ycxVarYcx = ycx(jSONObjectOptJSONObject3.optJSONObject(next));
                    if (ycxVarYcx != null) {
                        ycxVar.ycx().put(next, ycxVarYcx);
                    }
                }
            }
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJsyYdD2VjCHK8sXuI=", "b+sghTO3buqPTtJR", "S+8/hgau", 373);
            e3.getMessage();
        }
        if (jSONObject.has("resources_archive") && (jSONObjectOptJSONObject = jSONObject.optJSONObject("resources_archive")) != null) {
            zb zbVar = new zb();
            zbVar.ycx(jSONObjectOptJSONObject.optString(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL));
            zbVar.zb(jSONObjectOptJSONObject.optString("md5"));
            JSONObject jSONObjectOptJSONObject4 = jSONObjectOptJSONObject.optJSONObject("map");
            if (jSONObjectOptJSONObject4 != null) {
                Iterator<String> itKeys2 = jSONObjectOptJSONObject4.keys();
                ArrayList arrayList2 = new ArrayList();
                while (itKeys2.hasNext()) {
                    String next2 = itKeys2.next();
                    arrayList2.add(new Pair(next2, jSONObjectOptJSONObject4.optString(next2)));
                }
                zbVar.ycx(arrayList2);
            }
            ycxVar.ycx(zbVar);
        }
        if (ycxVar.fby()) {
            return ycxVar;
        }
        return null;
    }
}
