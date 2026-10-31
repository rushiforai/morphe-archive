package com.bytedance.sdk.component.adexpress.dynamic.lud;

import android.text.TextUtils;
import com.amplitude.core.events.Plan;
import com.bytedance.sdk.component.adexpress.dynamic.lud.lud;
import com.bytedance.sdk.component.adexpress.zb.ry;
import com.google.android.gms.internal.measurement.k2;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import com.tiktok.util.TTConst;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class lt {

    /* renamed from: ul, reason: collision with root package name */
    private static HashMap<String, String> f23435ul;

    /* renamed from: dj, reason: collision with root package name */
    private ycx f23436dj;

    /* renamed from: lt, reason: collision with root package name */
    private com.bytedance.sdk.component.adexpress.dynamic.dj.dj f23437lt;
    private sya lud;
    private com.bytedance.sdk.component.adexpress.dynamic.dj.sya sya;
    private JSONObject ycx;

    /* renamed from: zb, reason: collision with root package name */
    private JSONObject f23438zb;

    public static class ycx {
        boolean sya;
        float ycx;

        /* renamed from: zb, reason: collision with root package name */
        float f23439zb;

        public static ycx ycx(JSONObject jSONObject) {
            ycx ycxVar = new ycx();
            if (jSONObject != null) {
                ycxVar.ycx = (float) jSONObject.optDouble("width");
                ycxVar.f23439zb = (float) jSONObject.optDouble("height");
                ycxVar.sya = jSONObject.optBoolean("isLandscape");
            }
            return ycxVar;
        }
    }

    static {
        HashMap<String, String> map = new HashMap<>();
        f23435ul = map;
        map.put("subtitle", TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION);
        f23435ul.put(Plan.AMP_PLAN_SOURCE, "source|app.app_name");
        f23435ul.put("screenshot", "dynamic_creative.screenshot");
    }

    public lt(JSONObject jSONObject, JSONObject jSONObject2, JSONObject jSONObject3, JSONObject jSONObject4) {
        this.ycx = jSONObject;
        this.f23438zb = jSONObject2;
        this.sya = new com.bytedance.sdk.component.adexpress.dynamic.dj.sya(jSONObject2);
        this.f23436dj = ycx.ycx(jSONObject3);
        this.f23437lt = com.bytedance.sdk.component.adexpress.dynamic.dj.dj.ycx(jSONObject4);
    }

    private void zb(com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar) {
        com.bytedance.sdk.component.adexpress.dynamic.dj.sya syaVar;
        Object objYcx;
        Object objYcx2;
        Object objYcx3;
        Object objYcx4;
        if (fbyVar == null || (syaVar = this.sya) == null || (objYcx = syaVar.ycx("image.0.url")) == null) {
            return;
        }
        String strValueOf = String.valueOf(objYcx);
        if (TextUtils.isEmpty(strValueOf) || (objYcx2 = this.sya.ycx("title")) == null) {
            return;
        }
        String strValueOf2 = String.valueOf(objYcx2);
        if (TextUtils.isEmpty(strValueOf2) || (objYcx3 = this.sya.ycx(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION)) == null) {
            return;
        }
        String strValueOf3 = String.valueOf(objYcx3);
        if (TextUtils.isEmpty(strValueOf3) || (objYcx4 = this.sya.ycx("icon")) == null) {
            return;
        }
        String strValueOf4 = String.valueOf(objYcx4);
        if (TextUtils.isEmpty(strValueOf4)) {
            return;
        }
        Object objYcx5 = this.sya.ycx("app.app_name");
        Object objYcx6 = this.sya.ycx(Plan.AMP_PLAN_SOURCE);
        if (objYcx5 == null && objYcx6 == null) {
            return;
        }
        if (objYcx5 == null) {
            objYcx5 = objYcx6;
        }
        String strValueOf5 = String.valueOf(objYcx5);
        if (TextUtils.isEmpty(strValueOf5)) {
            return;
        }
        fbyVar.ycx("imageUrl", strValueOf);
        fbyVar.ycx("title", strValueOf2);
        fbyVar.ycx(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, strValueOf3);
        fbyVar.ycx("icon", strValueOf4);
        fbyVar.ycx("app_name", strValueOf5);
        fbyVar.ycx(true);
    }

    public com.bytedance.sdk.component.adexpress.dynamic.dj.fby ycx(double d5, int i5, double d11, String str, ry ryVar) throws JSONException {
        JSONObject jSONObject;
        this.sya.ycx();
        try {
            jSONObject = new JSONObject(this.f23437lt.f23301zb);
        } catch (JSONException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJt3o5L2lSPX7ApSf0ohw==", "f/cjlA61auuBU9hImDiuLlfvOZAR", "UuArmQKobOOZRNZQhRKMKULhOIE=", 76);
            jSONObject = null;
        }
        com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVarYcx = ycx(dj.ycx(this.ycx, jSONObject), (com.bytedance.sdk.component.adexpress.dynamic.dj.fby) null);
        ycx(fbyVarYcx);
        lud ludVar = new lud(d5, i5, d11, str, ryVar);
        lud.ycx ycxVar = new lud.ycx();
        ycx ycxVar2 = this.f23436dj;
        ycxVar.ycx = ycxVar2.ycx;
        ycxVar.f23442zb = ycxVar2.f23439zb;
        ycxVar.sya = 0.0f;
        ludVar.ycx(ycxVar);
        ludVar.ycx(fbyVarYcx, 0.0f, 0.0f);
        ludVar.ycx();
        com.bytedance.sdk.component.adexpress.dynamic.dj.zb zbVar = ludVar.ycx;
        if (zbVar.f23385dj == 65536.0f) {
            return null;
        }
        return zbVar.f23388lt;
    }

    private void ycx(com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar) {
        int iYcx;
        if (fbyVar == null) {
            return;
        }
        if (com.bytedance.sdk.component.adexpress.ycx.ycx.ycx.ycx().sya() != null) {
            iYcx = com.bytedance.sdk.component.adexpress.ycx.ycx.ycx.ycx().sya().dy();
        } else {
            iYcx = com.bytedance.sdk.component.adexpress.dj.ul.ycx(com.bytedance.sdk.component.adexpress.dj.ycx());
        }
        int iZb = com.bytedance.sdk.component.adexpress.dj.ul.zb(com.bytedance.sdk.component.adexpress.dj.ycx(), iYcx);
        ycx ycxVar = this.f23436dj;
        float fMin = ycxVar.sya ? ycxVar.ycx : Math.min(ycxVar.ycx, iZb);
        if (this.f23436dj.f23439zb == 0.0f) {
            fbyVar.lud(fMin);
            fbyVar.jc().lud().jc(TTConst.TRACK_TYPE_AUTO);
            fbyVar.lt(0.0f);
        } else {
            fbyVar.lud(fMin);
            int iZb2 = com.bytedance.sdk.component.adexpress.dj.ul.zb(com.bytedance.sdk.component.adexpress.dj.ycx(), com.bytedance.sdk.component.adexpress.dj.ul.zb(com.bytedance.sdk.component.adexpress.dj.ycx()));
            ycx ycxVar2 = this.f23436dj;
            fbyVar.lt(ycxVar2.sya ? ycxVar2.f23439zb : Math.min(ycxVar2.f23439zb, iZb2));
            fbyVar.jc().lud().jc("fixed");
        }
    }

    public com.bytedance.sdk.component.adexpress.dynamic.dj.fby ycx(JSONObject jSONObject, com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar) throws JSONException {
        int length;
        if (jSONObject == null) {
            return null;
        }
        String strOptString = jSONObject.optString(TTConst.TRACK_TYPE);
        if (TextUtils.equals(strOptString, "custom-component-vessel")) {
            int iOptInt = jSONObject.optInt("componentId");
            if (this.f23437lt != null) {
                sya syaVar = new sya();
                this.lud = syaVar;
                JSONObject jSONObjectYcx = syaVar.ycx(this.f23437lt.ycx, iOptInt, jSONObject);
                if (jSONObjectYcx != null) {
                    jSONObject = jSONObjectYcx;
                }
            }
        }
        com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVarYcx = ycx(jSONObject);
        fbyVarYcx.ycx(fbyVar);
        JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray("children");
        if (jSONArrayOptJSONArray == null) {
            fbyVarYcx.ycx((List<com.bytedance.sdk.component.adexpress.dynamic.dj.fby>) null);
            return fbyVarYcx;
        }
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        for (int i5 = 0; i5 < jSONArrayOptJSONArray.length(); i5++) {
            JSONArray jSONArrayOptJSONArray2 = jSONArrayOptJSONArray.optJSONArray(i5);
            if (jSONArrayOptJSONArray2 != null) {
                ArrayList arrayList3 = new ArrayList();
                if (TextUtils.equals(strOptString, "tag-group")) {
                    length = fbyVarYcx.jc().lud().bh();
                } else {
                    length = jSONArrayOptJSONArray2.length();
                }
                for (int i11 = 0; i11 < length; i11++) {
                    com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVarYcx2 = ycx(jSONArrayOptJSONArray2.optJSONObject(i11), fbyVarYcx);
                    if (com.bytedance.sdk.component.adexpress.dj.zb() && "skip-with-time".equals(fbyVarYcx.jc().zb()) && !"transparent".equals(fbyVarYcx.tn()) && !TextUtils.isEmpty(fbyVarYcx.tn())) {
                        fbyVarYcx2.sya(fbyVarYcx.tn());
                    }
                    arrayList.add(fbyVarYcx2);
                    arrayList3.add(fbyVarYcx2);
                }
                arrayList2.add(arrayList3);
            }
        }
        if (arrayList.size() > 0) {
            fbyVarYcx.ycx(arrayList);
        }
        if (arrayList2.size() > 0) {
            fbyVarYcx.zb(arrayList2);
        }
        return fbyVarYcx;
    }

    public com.bytedance.sdk.component.adexpress.dynamic.dj.fby ycx(JSONObject jSONObject) throws JSONException {
        String strYcx;
        JSONObject jSONObject2;
        String strOptString = jSONObject.optString(TTConst.TRACK_TYPE);
        String strOptString2 = jSONObject.optString("id");
        JSONObject jSONObjectOptJSONObject = jSONObject.optJSONObject("values");
        jw.ycx(strOptString, jSONObjectOptJSONObject);
        JSONObject jSONObjectYcx = jw.ycx(strOptString, jw.ycx(jSONObject.optJSONArray("sceneValues")), jSONObjectOptJSONObject);
        com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar = new com.bytedance.sdk.component.adexpress.dynamic.dj.fby();
        if (TextUtils.isEmpty(strOptString2)) {
            fbyVar.zb(String.valueOf(fbyVar.hashCode()));
        } else {
            fbyVar.zb(strOptString2);
        }
        if (jSONObjectOptJSONObject != null) {
            zb(fbyVar);
            fbyVar.sya((float) jSONObjectOptJSONObject.optDouble("x"));
            fbyVar.dj((float) jSONObjectOptJSONObject.optDouble("y"));
            fbyVar.lud((float) jSONObjectOptJSONObject.optDouble("width"));
            fbyVar.lt((float) jSONObjectOptJSONObject.optDouble("height"));
            fbyVar.ul(jSONObjectOptJSONObject.optInt("remainWidth"));
            com.bytedance.sdk.component.adexpress.dynamic.dj.lud ludVar = new com.bytedance.sdk.component.adexpress.dynamic.dj.lud();
            ludVar.ycx(strOptString);
            ludVar.zb(jSONObjectOptJSONObject.optString("data"));
            ludVar.sya(jSONObjectOptJSONObject.optString("dataExtraInfo"));
            com.bytedance.sdk.component.adexpress.dynamic.dj.lt ltVarYcx = com.bytedance.sdk.component.adexpress.dynamic.dj.lt.ycx(jSONObjectOptJSONObject);
            ludVar.ycx(ltVarYcx);
            com.bytedance.sdk.component.adexpress.dynamic.dj.lt ltVarYcx2 = com.bytedance.sdk.component.adexpress.dynamic.dj.lt.ycx(jSONObjectYcx);
            if (ltVarYcx2 == null) {
                ludVar.zb(ltVarYcx);
            } else {
                ludVar.zb(ltVarYcx2);
            }
            ycx(ltVarYcx);
            ycx(ltVarYcx2);
            if (TextUtils.equals(strOptString, "video-image-budget") && (jSONObject2 = this.f23438zb) != null) {
                ycx(ludVar, jSONObject2.optInt("image_mode"));
            }
            String strZb = ludVar.zb();
            com.bytedance.sdk.component.adexpress.dynamic.dj.lt ltVarLud = ludVar.lud();
            if (f23435ul.containsKey(strZb) && !ltVarLud.duz()) {
                ltVarLud.htf(f23435ul.get(strZb));
            }
            if (ltVarLud.duz()) {
                strYcx = ludVar.sya();
            } else {
                strYcx = ycx(ludVar.sya());
            }
            if (com.bytedance.sdk.component.adexpress.dj.zb()) {
                if (TextUtils.equals(strZb, "star") || TextUtils.equals(strZb, "text_star")) {
                    strYcx = ycx("dynamic_creative.score_exact_i18n|");
                }
                if (TextUtils.equals(strZb, "score-count") || TextUtils.equals(strZb, "score-count-type-1") || TextUtils.equals(strZb, "score-count-type-2")) {
                    strYcx = ycx("dynamic_creative.comment_num_i18n|");
                }
                if ("root".equals(strZb) && ltVarYcx.liq()) {
                    strYcx = ycx("image.0.url");
                }
            }
            if (!TextUtils.isEmpty(ycx()) && (TextUtils.equals("logo-union", strOptString) || TextUtils.equals("logo", strOptString))) {
                StringBuilder sbK = k2.k(strYcx, "adx:");
                sbK.append(ycx());
                ludVar.zb(sbK.toString());
            } else {
                ludVar.zb(strYcx);
            }
            fbyVar.ycx(ludVar);
        }
        return fbyVar;
    }

    private void ycx(com.bytedance.sdk.component.adexpress.dynamic.dj.lud ludVar, int i5) throws JSONException {
        int iLastIndexOf;
        if (i5 != 5 && i5 != 15 && i5 != 50 && i5 != 154) {
            ludVar.ycx("image");
            String strYcx = jw.ycx("image");
            com.bytedance.sdk.component.adexpress.dynamic.dj.lt ltVarLud = ludVar.lud();
            ltVarLud.htf(strYcx);
            ludVar.ul().htf(strYcx);
            String strYcx2 = jw.ycx("image", "clickArea");
            if (!TextUtils.isEmpty(strYcx2)) {
                ltVarLud.syc(strYcx2);
                ludVar.ul().syc(strYcx2);
            }
            JSONObject jSONObjectCu = ltVarLud.cu();
            if (jSONObjectCu != null) {
                ltVarLud.tn(jSONObjectCu.optString("imageLottieTosPath"));
                ltVarLud.ok(jSONObjectCu.optBoolean("animationsLoop"));
                ltVarLud.hf(jSONObjectCu.optInt("lottieAppNameMaxLength"));
                ltVarLud.bhi(jSONObjectCu.optInt("lottieAdDescMaxLength"));
                ltVarLud.tru(jSONObjectCu.optInt("lottieAdTitleMaxLength"));
            }
            ludVar.zb(strYcx);
            if (strYcx != null && (iLastIndexOf = strYcx.lastIndexOf(".")) > 0) {
                String strSubstring = strYcx.substring(0, iLastIndexOf);
                JSONObject jSONObject = new JSONObject();
                try {
                    jSONObject.put("width", ycx(strSubstring + ".width"));
                    jSONObject.put("height", ycx(strSubstring + ".height"));
                } catch (JSONException e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJt3o5L2lSPX7ApSf0ohw==", "f/cjlA61auuBU9hImDiuLlfvOZAR", "S/wilgaveu6NS9BYuhikLVTMOJEEuX0=", 394);
                }
                ludVar.sya(jSONObject.toString());
            }
            ltVarLud.hfd();
            return;
        }
        ludVar.ycx("video");
        String strYcx3 = jw.ycx("video");
        ludVar.lud().htf(strYcx3);
        String strYcx4 = jw.ycx("video", "clickArea");
        if (!TextUtils.isEmpty(strYcx4)) {
            ludVar.lud().syc(strYcx4);
            ludVar.ul().syc(strYcx4);
        }
        ludVar.ul().htf(strYcx3);
        ludVar.zb(strYcx3);
        ludVar.lud().skm();
    }

    private String ycx(String str) {
        if (TextUtils.isEmpty(str)) {
            return b.f42142b;
        }
        for (String str2 : str.split("\\|")) {
            if (this.sya.zb(str2)) {
                String strValueOf = String.valueOf(this.sya.ycx(str2));
                if (!TextUtils.isEmpty(strValueOf)) {
                    return strValueOf;
                }
            }
        }
        return b.f42142b;
    }

    private String ycx() {
        Object objYcx;
        com.bytedance.sdk.component.adexpress.dynamic.dj.sya syaVar = this.sya;
        return (syaVar == null || (objYcx = syaVar.ycx("adx_name")) == null) ? b.f42142b : String.valueOf(objYcx);
    }

    private void ycx(com.bytedance.sdk.component.adexpress.dynamic.dj.lt ltVar) {
        if (ltVar == null) {
            return;
        }
        String strAv = ltVar.av();
        if (com.bytedance.sdk.component.adexpress.dj.zb()) {
            String strSya = com.bytedance.sdk.component.adexpress.dj.ul.sya(com.bytedance.sdk.component.adexpress.dj.ycx());
            if ("zh".equals(strSya)) {
                strSya = "cn";
            }
            if (!TextUtils.isEmpty(strSya) && ltVar.lt() != null) {
                String strOptString = ltVar.lt().optString(strSya);
                if (!TextUtils.isEmpty(strOptString)) {
                    strAv = strOptString;
                }
            }
        }
        if (TextUtils.isEmpty(strAv)) {
            return;
        }
        int iIndexOf = strAv.indexOf("{{");
        int iIndexOf2 = strAv.indexOf("}}");
        if (iIndexOf >= 0 && iIndexOf2 >= 0 && iIndexOf2 >= iIndexOf) {
            String strYcx = ycx(strAv.substring(iIndexOf + 2, iIndexOf2));
            StringBuilder sb2 = new StringBuilder(strAv.substring(0, iIndexOf));
            if (!TextUtils.isEmpty(strYcx)) {
                sb2.append(strYcx);
            }
            sb2.append(strAv.substring(iIndexOf2 + 2));
            ltVar.ok(sb2.toString());
            return;
        }
        ltVar.ok(strAv);
    }
}
