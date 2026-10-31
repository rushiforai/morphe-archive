package com.bytedance.adsdk.ugeno.core;

import android.text.TextUtils;
import b.c0;
import com.amplitude.android.migration.DatabaseConstants;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.tiktok.util.TTConst;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ul {

    /* renamed from: dj, reason: collision with root package name */
    private JSONObject f22218dj;
    private float fby;

    /* renamed from: jc, reason: collision with root package name */
    private boolean f22219jc;

    /* renamed from: jw, reason: collision with root package name */
    private float f22220jw;

    /* renamed from: lt, reason: collision with root package name */
    private JSONObject f22221lt;
    private String lud;
    private String sya;

    /* renamed from: ul, reason: collision with root package name */
    private boolean f22222ul;
    private JSONObject ycx;

    /* renamed from: zb, reason: collision with root package name */
    private JSONObject f22223zb;

    public static class ycx {

        /* renamed from: dj, reason: collision with root package name */
        private JSONObject f22224dj;

        /* renamed from: ea, reason: collision with root package name */
        private boolean f22225ea;
        private String fby;

        /* renamed from: jc, reason: collision with root package name */
        private boolean f22226jc;

        /* renamed from: jw, reason: collision with root package name */
        private boolean f22227jw;

        /* renamed from: lt, reason: collision with root package name */
        private ycx f22228lt;
        private LinkedList<ycx> lud;
        private JSONObject sya;

        /* renamed from: ul, reason: collision with root package name */
        private String f22229ul;
        private String ycx;

        /* renamed from: zb, reason: collision with root package name */
        private String f22230zb;

        public List<ycx> lt() {
            return this.lud;
        }

        public JSONObject lud() {
            return this.sya;
        }

        public String toString() {
            StringBuilder sb2 = new StringBuilder("UGNode{id='");
            sb2.append(this.ycx);
            sb2.append("', name='");
            return c0.q(sb2, this.f22230zb, "'}");
        }

        public JSONObject ul() {
            return this.f22224dj;
        }

        public String dj() {
            return this.f22230zb;
        }

        public boolean sya() {
            return this.f22227jw;
        }

        public String zb() {
            return this.f22229ul;
        }

        public void zb(boolean z11) {
            this.f22225ea = z11;
        }

        public String ycx() {
            return this.ycx;
        }

        public void zb(ycx ycxVar) {
            if (this.lud == null) {
                this.lud = new LinkedList<>();
            }
            this.lud.addLast(ycxVar);
        }

        public void ycx(String str) {
            this.f22230zb = str;
        }

        public void ycx(boolean z11) {
            this.f22226jc = z11;
        }

        public void ycx(ycx ycxVar) {
            if (this.lud == null) {
                this.lud = new LinkedList<>();
            }
            this.lud.add(ycxVar);
        }

        public void ycx(int i5, ycx ycxVar) {
            if (this.lud == null) {
                this.lud = new LinkedList<>();
            }
            this.lud.add(i5, ycxVar);
        }
    }

    public ul(JSONObject jSONObject, JSONObject jSONObject2) {
        this(jSONObject, jSONObject2, null);
    }

    private ycx lud() throws JSONException {
        if (!dj()) {
            return ycx(this.ycx, (ycx) null);
        }
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("flexDirection", "row");
            jSONObject.put("justifyContent", "flex_start");
            jSONObject.put("alignItems", "flex_start");
            jSONObject.put("clickable", false);
            jSONObject.put("width", "match_parent");
            jSONObject.put("height", "wrap_content");
            float f11 = this.fby;
            if (f11 > 0.0f) {
                jSONObject.put("width", f11);
            }
            float f12 = this.f22220jw;
            if (f12 > 0.0f) {
                jSONObject.put("height", f12);
            }
            JSONObject jSONObject2 = this.f22218dj;
            if (jSONObject2 != null) {
                String strOptString = jSONObject2.optString("xSize");
                if (!TextUtils.isEmpty(strOptString)) {
                    JSONObject jSONObject3 = new JSONObject(strOptString);
                    if (jSONObject3.optInt("width") > 0) {
                        jSONObject.put("width", jSONObject3.optInt("width"));
                    }
                    if (jSONObject3.optInt("height") > 0) {
                        jSONObject.put("height", jSONObject3.optInt("height"));
                    }
                }
            }
        } catch (JSONException unused) {
        }
        ycx ycxVar = new ycx();
        ycxVar.f22230zb = "View";
        ycxVar.ycx = "virtualNode";
        ycxVar.sya = jSONObject;
        ycxVar.f22228lt = null;
        ycxVar.f22229ul = this.sya;
        ycxVar.f22227jw = this.f22219jc;
        ycxVar.fby = this.lud;
        ycxVar.ycx(ycx(this.ycx, ycxVar));
        return ycxVar;
    }

    public boolean dj() {
        return this.f22222ul;
    }

    public List<ycx> sya() throws JSONException {
        if (this.f22223zb == null) {
            return null;
        }
        ArrayList arrayList = new ArrayList();
        Iterator<String> itKeys = this.f22223zb.keys();
        while (itKeys.hasNext()) {
            ycx ycxVarYcx = ycx(this.f22223zb.optJSONObject(itKeys.next()), (ycx) null);
            if (ycxVarYcx != null) {
                arrayList.add(ycxVarYcx);
            }
        }
        return arrayList;
    }

    public ycx ycx() {
        return lud();
    }

    public String zb() {
        return this.sya;
    }

    public ul(JSONObject jSONObject, JSONObject jSONObject2, JSONObject jSONObject3) {
        this.f22219jc = true;
        if (jSONObject != null) {
            if (jSONObject.has("body")) {
                this.ycx = jSONObject.optJSONObject("body");
            } else {
                this.ycx = jSONObject.optJSONObject("main_template");
            }
            this.f22223zb = jSONObject.optJSONObject("sub_templates");
            JSONObject jSONObjectOptJSONObject = jSONObject.has("meta") ? jSONObject.optJSONObject("meta") : jSONObject.optJSONObject("template_info");
            if (jSONObjectOptJSONObject != null) {
                if (jSONObject.has("body")) {
                    this.f22222ul = true;
                    String strOptString = jSONObjectOptJSONObject.optString("version");
                    this.sya = strOptString;
                    if (TextUtils.isEmpty(strOptString)) {
                        this.sya = "3.0";
                    }
                } else {
                    this.sya = jSONObjectOptJSONObject.optString("sdk_version");
                }
                if (jSONObjectOptJSONObject.has("adType")) {
                    this.lud = jSONObjectOptJSONObject.optString("adType");
                }
                if (jSONObjectOptJSONObject.has("gestureThrough")) {
                    this.f22219jc = com.bytedance.adsdk.ugeno.fby.sya.ycx(jSONObjectOptJSONObject.optString("gestureThrough"), true);
                }
            } else if (jSONObject.has("body")) {
                this.sya = "3.0";
                this.f22222ul = true;
            }
            this.f22218dj = jSONObject2;
            this.f22221lt = jSONObject3;
        }
    }

    public static boolean dj(ycx ycxVar) {
        return (ycxVar == null || ycxVar.sya == null) ? false : true;
    }

    public void ycx(float f11, float f12) {
        this.fby = f11;
        this.f22220jw = f12;
    }

    public boolean zb(ycx ycxVar) {
        JSONObject jSONObjectLud;
        if (ycxVar == null || (jSONObjectLud = ycxVar.lud()) == null) {
            return false;
        }
        return TextUtils.equals(jSONObjectLud.optString("height"), "match_parent");
    }

    private ycx ycx(JSONObject jSONObject, ycx ycxVar) throws JSONException {
        String strOptString;
        String strOptString2;
        ycx ycxVarYcx;
        if (jSONObject == null) {
            return null;
        }
        if (jSONObject.has(TTConst.TRACK_TYPE)) {
            strOptString = jSONObject.optString(TTConst.TRACK_TYPE);
        } else {
            strOptString = jSONObject.optString(PendingUpgradeStore.KEY_NAME);
        }
        String strOptString3 = jSONObject.optString("id");
        JSONObject jSONObject2 = new JSONObject();
        Iterator<String> itKeys = jSONObject.keys();
        while (itKeys.hasNext()) {
            String next = itKeys.next();
            if (!TextUtils.equals(next, "children")) {
                try {
                    jSONObject2.put(next, jSONObject.opt(next));
                } catch (JSONException unused) {
                }
            }
        }
        ycx ycxVar2 = new ycx();
        ycxVar2.ycx = strOptString3;
        if (!this.f22222ul || !TextUtils.equals("Video", strOptString)) {
            ycxVar2.f22230zb = strOptString;
        } else {
            ycxVar2.f22230zb = strOptString + "V3";
        }
        ycxVar2.sya = jSONObject2;
        ycxVar2.f22228lt = ycxVar;
        ycxVar2.f22229ul = this.sya;
        ycxVar2.f22227jw = this.f22219jc;
        ycxVar2.fby = this.lud;
        if (jSONObject2.has("i18n")) {
            ycxVar2.f22224dj = jSONObject2.optJSONObject("i18n");
        }
        if (TextUtils.equals(strOptString, "CustomComponent")) {
            ycx(jSONObject, ycxVar2.sya);
        }
        JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray("children");
        if (jSONArrayOptJSONArray != null && jSONArrayOptJSONArray.length() > 0) {
            int i5 = 0;
            for (int i11 = 0; i11 < jSONArrayOptJSONArray.length(); i11++) {
                JSONObject jSONObjectOptJSONObject = jSONArrayOptJSONArray.optJSONObject(i11);
                if (jSONObject.has(TTConst.TRACK_TYPE)) {
                    strOptString2 = jSONObject.optString(TTConst.TRACK_TYPE);
                } else {
                    strOptString2 = jSONObject.optString(PendingUpgradeStore.KEY_NAME);
                }
                String strYcx = com.bytedance.adsdk.ugeno.dj.zb.ycx(jSONObjectOptJSONObject.optString("id"), this.f22218dj);
                if (TextUtils.equals(strOptString2, "Template")) {
                    JSONObject jSONObject3 = this.f22223zb;
                    if (jSONObject3 != null) {
                        jSONObjectOptJSONObject = jSONObject3.optJSONObject(strYcx);
                        ycxVarYcx = ycx(jSONObjectOptJSONObject, ycxVar2);
                    } else {
                        ycxVarYcx = null;
                    }
                } else {
                    ycxVarYcx = ycx(jSONObjectOptJSONObject, ycxVar2);
                }
                if (ycxVarYcx != null) {
                    ycxVarYcx.zb(zb(ycxVarYcx));
                    ycxVarYcx.ycx(ycx(ycxVarYcx));
                }
                if (sya(ycxVarYcx)) {
                    i5++;
                    ycxVar2.zb(ycxVarYcx);
                } else if (ycxVarYcx != null) {
                    ycxVar2.ycx(i11 - i5, ycxVarYcx);
                }
            }
        }
        return ycxVar2;
    }

    public boolean sya(ycx ycxVar) {
        JSONObject jSONObjectLud;
        if (ycxVar == null || (jSONObjectLud = ycxVar.lud()) == null) {
            return false;
        }
        return TextUtils.equals(jSONObjectLud.optString("position"), "absolute");
    }

    public boolean ycx(ycx ycxVar) {
        JSONObject jSONObjectLud;
        if (ycxVar == null || (jSONObjectLud = ycxVar.lud()) == null) {
            return false;
        }
        return TextUtils.equals(jSONObjectLud.optString("width"), "match_parent");
    }

    private void ycx(JSONObject jSONObject, JSONObject jSONObject2) throws JSONException {
        if (this.f22221lt == null || jSONObject2 == null) {
            return;
        }
        try {
            String strOptString = this.f22221lt.optString(jSONObject2.optString("targetId"));
            if (TextUtils.isEmpty(strOptString)) {
                return;
            }
            JSONObject jSONObject3 = new JSONObject(strOptString);
            JSONObject jSONObjectOptJSONObject = jSONObject2.optJSONObject("targetProps");
            if (jSONObjectOptJSONObject != null) {
                Iterator<String> itKeys = jSONObjectOptJSONObject.keys();
                while (itKeys.hasNext()) {
                    String next = itKeys.next();
                    Object objOpt = jSONObjectOptJSONObject.opt(next);
                    if (TextUtils.equals(next, DatabaseConstants.EVENT_TABLE_NAME) && jSONObject3.has(DatabaseConstants.EVENT_TABLE_NAME)) {
                        if (objOpt instanceof JSONArray) {
                            com.bytedance.adsdk.ugeno.fby.zb.ycx(jSONObject3.optJSONArray(DatabaseConstants.EVENT_TABLE_NAME), (JSONArray) objOpt);
                        }
                    } else {
                        jSONObject3.put(next, objOpt);
                    }
                }
                JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray("children");
                if (jSONArrayOptJSONArray == null) {
                    jSONArrayOptJSONArray = new JSONArray();
                }
                jSONArrayOptJSONArray.put(jSONObject3);
                if (jSONObject.has("children")) {
                    return;
                }
                jSONObject.put("children", jSONArrayOptJSONArray);
            }
        } catch (JSONException unused) {
        }
    }
}
