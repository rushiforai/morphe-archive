package com.bytedance.sdk.openadsdk.core.jc.zb;

import android.text.TextUtils;
import androidx.recyclerview.widget.n0;
import com.amplitude.android.TrackingOptions;
import com.amplitude.core.events.Plan;
import com.bykv.vk.openvk.ycx.ycx.ycx.sya.c;
import com.bytedance.sdk.component.utils.htf;
import com.bytedance.sdk.openadsdk.component.reward.sya.fby;
import com.bytedance.sdk.openadsdk.core.jc;
import com.bytedance.sdk.openadsdk.core.kgy;
import com.bytedance.sdk.openadsdk.core.model.pmi;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.core.model.uh;
import com.bytedance.sdk.openadsdk.core.model.xz;
import com.bytedance.sdk.openadsdk.core.ry;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.instabridge.ai.proactive.AiDatabase;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import com.vungle.ads.internal.protos.Sdk;
import h6.c1;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class sya {
    public static String ycx = "https://pag_open_icon_id/appicon.png";

    /* renamed from: zb, reason: collision with root package name */
    private static String f25535zb = "";

    public static boolean sya() {
        return true;
    }

    public static String ycx() {
        return f25535zb;
    }

    public static JSONObject zb() throws JSONException {
        JSONObject jSONObject = new JSONObject();
        JSONObject jSONObject2 = new JSONObject();
        try {
            jSONObject2.put(TrackingOptions.AMP_TRACKING_OPTION_LANGUAGE, ry.zb());
            jSONObject.put("xSetting", jSONObject2);
            JSONObject jSONObject3 = new JSONObject();
            kgy.zb(jSONObject3);
            jSONObject3.put(TrackingOptions.AMP_TRACKING_OPTION_PLATFORM, "android");
            jSONObject.put("xAppInfo", jSONObject3);
            return jSONObject;
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4CyBCqpswphaxVifAu49T+chhg==", "b+sghQ+9fcK1Xt5Rnw==", "XOs5pQK7bOOBXtY=", 270);
            htf.sya("TemplateUtils", e3.getMessage());
            return jSONObject;
        }
    }

    private static JSONObject sya(tn tnVar) {
        JSONObject jSONObject = new JSONObject();
        try {
            kgy.ycx(jSONObject, tnVar);
            return jSONObject;
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4CyBCqpswphaxVifAu49T+chhg==", "b+sghQ+9fcK1Xt5Rnw==", "XOs5tAeVZ8GP", 365);
            return jSONObject;
        }
    }

    public static JSONObject ycx(float f11, float f12, boolean z11, tn tnVar) throws JSONException {
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put(TrackingOptions.AMP_TRACKING_OPTION_PLATFORM, "android");
            JSONObject jSONObject2 = new JSONObject();
            jSONObject2.put("width", f11);
            jSONObject2.put("height", f12);
            if (z11) {
                jSONObject2.put("isLandscape", true);
            }
            jSONObject.put("AdSize", jSONObject2);
            jSONObject.put("creative", ycx(false, tnVar));
            jSONObject.put("template_Plugin", zb(tnVar.jp()));
            jSONObject.put("diff_template_Plugin", ycx(tnVar.jp()));
            return jSONObject;
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4CyBCqpswphaxVifAu49T+chhg==", "b+sghQ+9fcK1Xt5Rnw==", "XOs5oQaxecuBXtJ0ghev", 76);
            return null;
        }
    }

    private static String zb(tn.ycx ycxVar) {
        com.bytedance.sdk.component.adexpress.ycx.sya.zb zbVarSya;
        if (ycxVar != null) {
            String strUl = ycxVar.ul();
            return (!TextUtils.isEmpty(strUl) || (zbVarSya = com.bytedance.sdk.component.adexpress.ycx.zb.zb.sya(ycxVar.dj())) == null) ? strUl : zbVarSya.lud();
        }
        return b.f42142b;
    }

    public static JSONObject ycx(tn tnVar) {
        return ycx(tnVar, false, (JSONObject) null);
    }

    public static JSONObject ycx(tn tnVar, boolean z11, JSONObject jSONObject) {
        JSONObject jSONObjectYcx = null;
        if (tnVar == null) {
            return null;
        }
        try {
            jSONObjectYcx = ycx(tnVar, false, z11);
            if (jSONObjectYcx == null) {
                jSONObjectYcx = new JSONObject();
            }
            JSONObject jSONObject2 = new JSONObject();
            kgy.zb(jSONObject2);
            jSONObject2.put(TrackingOptions.AMP_TRACKING_OPTION_PLATFORM, "android");
            jSONObjectYcx.put("xAppInfo", jSONObject2);
            if (jSONObject != null) {
                Iterator<String> itKeys = jSONObject.keys();
                while (itKeys.hasNext()) {
                    String next = itKeys.next();
                    jSONObjectYcx.put(next, jSONObject.get(next));
                }
            }
            JSONObject jSONObjectZb = kgy.zb(tnVar);
            jSONObjectZb.put(TrackingOptions.AMP_TRACKING_OPTION_LANGUAGE, ry.zb());
            jSONObjectYcx.put("xSetting", jSONObjectZb);
            return jSONObjectYcx;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4CyBCqpswphaxVifAu49T+chhg==", "b+sghQ+9fcK1Xt5Rnw==", "XOs5sQKoaO6OZcNViQOTK17gKA==", 114);
            th2.getMessage();
            return jSONObjectYcx;
        }
    }

    public static Map<String, String> zb(tn tnVar) {
        HashMap map = null;
        if (tnVar == null) {
            return null;
        }
        List<pmi> listCu = tnVar.cu();
        if (listCu != null && listCu.size() > 0) {
            map = new HashMap();
            for (pmi pmiVar : listCu) {
                if (pmiVar != null) {
                    map.put(pmiVar.ycx(), pmiVar.ul());
                }
            }
            pmi pmiVarYyc = tnVar.yyc();
            if (pmiVarYyc != null) {
                map.put(pmiVarYyc.ycx(), pmiVarYyc.ul());
            }
        }
        return map;
    }

    private static JSONObject ycx(tn tnVar, boolean z11, boolean z12) {
        JSONObject jSONObjectOptJSONObject;
        JSONObject jSONObject = null;
        if (tnVar != null) {
            try {
                String strYbg = tnVar.ybg();
                if (strYbg != null) {
                    JSONObject jSONObject2 = new JSONObject(strYbg);
                    JSONArray jSONArrayOptJSONArray = jSONObject2.optJSONArray("creatives");
                    if (!z11 && !z12) {
                        jSONObject = new JSONObject();
                    } else {
                        JSONObject jSONObject3 = (jSONArrayOptJSONArray == null || jSONArrayOptJSONArray.length() <= tnVar.sya() || (jSONObjectOptJSONObject = jSONArrayOptJSONArray.optJSONObject(tnVar.sya())) == null) ? null : new JSONObject(jSONObjectOptJSONObject.toString());
                        if (jSONObject3 == null) {
                            return null;
                        }
                        jSONObject = jSONObject3;
                    }
                    if (jSONArrayOptJSONArray != null && jSONArrayOptJSONArray.length() > 1) {
                        jSONArrayOptJSONArray.remove(0);
                        jSONObject.put("xRestCreatives", jSONArrayOptJSONArray);
                    }
                    jSONObject2.remove("creatives");
                    jSONObject.put("xRestResponse", jSONObject2);
                }
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4CyBCqpswphaxVifAu49T+chhg==", "b+sghQ+9fcK1Xt5Rnw==", "S/s5sxawZeqFXtZ0ggWvAkjhIw==", 151);
                htf.ycx("TemplateUtils", "filterTemplateInfo", th2);
                return jSONObject;
            }
        }
        return jSONObject;
    }

    public static JSONObject ycx(float f11, float f12, boolean z11, tn tnVar, String str, com.bytedance.sdk.openadsdk.core.ry.ul.sya syaVar) throws JSONException {
        f25535zb = b.f42142b;
        if (tnVar == null) {
            return null;
        }
        try {
            JSONObject jSONObjectYcx = ycx(f11, f12, z11, tnVar, str);
            if (syaVar != null) {
                syaVar.ycx("adv3");
            }
            xz xzVarNc = tnVar.nc();
            if (xzVarNc != null) {
                String strDj = xzVarNc.dj();
                if (!TextUtils.isEmpty(strDj)) {
                    jSONObjectYcx.put("xTemplate", new JSONObject(strDj));
                    f25535zb = "getTemplate success by local data";
                    if (syaVar != null) {
                        syaVar.zb("local");
                        return jSONObjectYcx;
                    }
                } else {
                    String strYcx = com.bytedance.sdk.openadsdk.core.ry.ycx.zb.ycx().ycx("adv3", xzVarNc.ycx(), xzVarNc.zb());
                    if (!TextUtils.isEmpty(strYcx)) {
                        jSONObjectYcx.put("xTemplate", new JSONObject(strYcx));
                        f25535zb = "getTemplate success by db data";
                        if (syaVar != null) {
                            syaVar.zb("local");
                            return jSONObjectYcx;
                        }
                    } else {
                        String str2 = "local db data is null id is " + xzVarNc.ycx() + " md5 is " + xzVarNc.zb();
                        f25535zb = str2;
                        if (syaVar != null) {
                            syaVar.ycx(3, str2, "net");
                        }
                    }
                }
            }
            return jSONObjectYcx;
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4CyBCqpswphaxVifAu49T+chhg==", "b+sghQ+9fcK1Xt5Rnw==", "XOs5oQaxecuBXtJ0ghevHgg=", Sdk.SDKError.Reason.AD_IS_LOADING_VALUE);
            String strS = c1.s(e3, new StringBuilder("load template exception "));
            f25535zb = strS;
            if (syaVar != null) {
                syaVar.ycx(3, strS, "net");
            }
            return null;
        }
    }

    public static JSONObject ycx(float f11, float f12, boolean z11, tn tnVar, String str) {
        JSONObject jSONObject = null;
        if (tnVar == null) {
            return null;
        }
        try {
            JSONObject jSONObjectYcx = ycx(tnVar, true, true);
            if (jSONObjectYcx == null) {
                return null;
            }
            try {
                if (!fby.ycx(tnVar)) {
                    ycx(jSONObjectYcx, tnVar, str);
                }
                JSONObject jSONObjectZb = kgy.zb(tnVar);
                jSONObjectZb.put(TrackingOptions.AMP_TRACKING_OPTION_LANGUAGE, ry.zb());
                jSONObjectYcx.put("xSetting", jSONObjectZb);
                jSONObjectYcx.put("xAdInfo", ycx(str, sya(tnVar), tnVar));
                JSONObject jSONObject2 = new JSONObject();
                kgy.zb(jSONObject2);
                jSONObject2.put(TrackingOptions.AMP_TRACKING_OPTION_PLATFORM, "android");
                jSONObjectYcx.put("xAppInfo", jSONObject2);
                JSONObject jSONObject3 = new JSONObject();
                jSONObject3.put("width", f11);
                jSONObject3.put("height", f12);
                if (z11) {
                    jSONObject3.put("isLandscape", true);
                }
                jSONObjectYcx.put("xSize", jSONObject3);
                return jSONObjectYcx;
            } catch (Throwable th2) {
                th = th2;
                jSONObject = jSONObjectYcx;
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4CyBCqpswphaxVifAu49T+chhg==", "b+sghQ+9fcK1Xt5Rnw==", "XOs5oAS5Z+OBXtY=", n0.DEFAULT_SWIPE_ANIMATION_DURATION);
                return jSONObject;
            }
        } catch (Throwable th3) {
            th = th3;
        }
    }

    private static void ycx(JSONObject jSONObject, tn tnVar, String str) throws JSONException {
        if (tnVar == null || jSONObject == null) {
            return;
        }
        try {
            if (jSONObject.has("h265_video")) {
                jSONObject.remove("h265_video");
            }
            c cVarCi = tnVar.ci();
            if (cVarCi != null) {
                JSONObject jSONObjectA = cVarCi.a();
                jSONObjectA.put("video_duration", cVarCi.f22186d * cVarCi.f22198r);
                jSONObject.put("video", jSONObjectA);
            } else if ("open_ad".equals(str)) {
                JSONObject jSONObject2 = new JSONObject();
                jSONObject2.put("video_duration", com.bytedance.sdk.openadsdk.core.pmi.dj().dv(String.valueOf(tnVar.ksy())));
                jSONObject.put("video", jSONObject2);
            }
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4CyBCqpswphaxVifAu49T+chhg==", "b+sghQ+9fcK1Xt5Rnw==", "WOYsmwS5RMaUT8VUjR2EKU/v", 294);
            e3.getMessage();
        }
    }

    private static JSONObject ycx(String str, JSONObject jSONObject, tn tnVar) throws JSONException {
        if (tnVar != null) {
            try {
                if ("open_ad".equals(str)) {
                    JSONObject jSONObject2 = new JSONObject();
                    jSONObject2.put("app_name", jc.zb().fby());
                    int iJw = jc.zb().jw();
                    if (iJw != 0) {
                        int iTx = tnVar.tx();
                        if (9 == iTx || 11 == iTx) {
                            if (jc.zb().jc()) {
                                jSONObject2.put("app_icon", ycx);
                            }
                        } else if (10 == iTx) {
                            jSONObject2.put("app_icon", "@".concat(String.valueOf(iJw)));
                        }
                    }
                    jSONObject.put("open_app_info", jSONObject2);
                }
            } catch (Exception e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4CyBCqpswphaxVifAu49T+chhg==", "b+sghQ+9fcK1Xt5Rnw==", "XechmSKsee6OTNg=", Sdk.SDKError.Reason.SILENT_MODE_MONITOR_ERROR_VALUE);
                return jSONObject;
            }
        }
        return jSONObject;
    }

    public static JSONObject ycx(JSONObject jSONObject, JSONObject jSONObject2) {
        if (jSONObject2 == null) {
            return jSONObject;
        }
        JSONObject jSONObject3 = new JSONObject();
        if (jSONObject == null) {
            return jSONObject3;
        }
        try {
            JSONArray jSONArrayOptJSONArray = jSONObject2.optJSONArray(UserMetadata.KEYDATA_FILENAME);
            if (jSONArrayOptJSONArray != null && jSONArrayOptJSONArray.length() > 0) {
                for (int i5 = 0; i5 < jSONArrayOptJSONArray.length(); i5++) {
                    String strOptString = jSONArrayOptJSONArray.optString(i5);
                    if (jSONObject.has(strOptString)) {
                        jSONObject3.put(strOptString, jSONObject.opt(strOptString));
                    }
                }
                jSONObject3.put("xSetting", jSONObject.opt("xSetting"));
                jSONObject3.put("xAdInfo", jSONObject.opt("xAdInfo"));
                jSONObject3.put("xAppInfo", jSONObject.opt("xAppInfo"));
                jSONObject3.put("xSize", jSONObject.opt("xSize"));
                jSONObject3.put("dynamic_configs", jSONObject.opt("dynamic_configs"));
                jSONObject3.put("xTemplate", jSONObject.opt("xTemplate"));
                jSONObject3.put("xRestCreatives", jSONObject.opt("xRestCreatives"));
                jSONObject3.put("xRestResponse", jSONObject.opt("xRestResponse"));
                return jSONObject3;
            }
            return jSONObject;
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4CyBCqpswphaxVifAu49T+chhg==", "b+sghQ+9fcK1Xt5Rnw==", "XechgQauXcKNWttcmBSJJl3h", 353);
            return jSONObject;
        }
    }

    private static String ycx(tn.ycx ycxVar) {
        if (ycxVar != null) {
            return ycxVar.fby();
        }
        return b.f42142b;
    }

    public static JSONObject ycx(boolean z11, tn tnVar) throws JSONException {
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("button_text", tnVar.bah());
            if (tnVar.yyc() != null) {
                if (tnVar.yyc() != null && !TextUtils.isEmpty(tnVar.yyc().ycx())) {
                    jSONObject.put("icon", tnVar.yyc().ycx());
                } else {
                    jSONObject.put("icon", b.f42142b);
                }
            }
            JSONArray jSONArray = new JSONArray();
            if (tnVar.cu() != null) {
                for (int i5 = 0; i5 < tnVar.cu().size(); i5++) {
                    pmi pmiVar = tnVar.cu().get(i5);
                    JSONObject jSONObject2 = new JSONObject();
                    jSONObject2.put("height", pmiVar.sya());
                    jSONObject2.put("width", pmiVar.zb());
                    jSONObject2.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, pmiVar.ycx());
                    jSONArray.put(jSONObject2);
                }
            }
            jSONObject.put("image", jSONArray);
            jSONObject.put("image_mode", tnVar.pk());
            jSONObject.put("interaction_type", tnVar.liq());
            jSONObject.put("interaction_method", tnVar.dqs());
            jSONObject.put("is_compliance_template", sya());
            jSONObject.put("title", tnVar.spv());
            jSONObject.put(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, tnVar.xh());
            jSONObject.put(Plan.AMP_PLAN_SOURCE, tnVar.sp());
            JSONObject jSONObject3 = new JSONObject();
            uh uhVarTru = tnVar.tru();
            if (uhVarTru == null) {
                uhVarTru = new uh();
            }
            jSONObject3.put("ceiling_time", uhVarTru.dj());
            jSONObject3.put("ceiling_ratio", uhVarTru.lud());
            jSONObject3.put("expand_ratio", uhVarTru.lt());
            jSONObject.put("interaction_params", jSONObject3);
            if (tnVar.znc() != null) {
                jSONObject.put("comment_num", tnVar.znc().lud());
                jSONObject.put(AiDatabase.COL_INSIGHT_SCORE, tnVar.znc().dj());
                jSONObject.put("app_size", tnVar.znc().lt());
                jSONObject.put("app", tnVar.znc().fby());
            }
            c cVarCi = tnVar.ci();
            if (cVarCi != null) {
                JSONObject jSONObjectA = cVarCi.a();
                jSONObjectA.put("video_duration", cVarCi.f22186d * cVarCi.f22198r);
                jSONObject.put("video", jSONObjectA);
            }
            if (tnVar.jp() != null) {
                jSONObject.put("dynamic_creative", tnVar.jp().jw());
            }
            return jSONObject;
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4CyBCqpswphaxVifAu49T+chhg==", "b+sghQ+9fcK1Xt5Rnw==", "XOs5thG5aNOJXNJ3nx6u", 461);
            return null;
        }
    }

    public static String ycx(tn tnVar, String str) {
        List<pmi> listCu;
        if (tnVar != null && (listCu = tnVar.cu()) != null && listCu.size() > 0) {
            for (pmi pmiVar : listCu) {
                if (pmiVar != null && TextUtils.equals(str, pmiVar.ycx())) {
                    return pmiVar.ul();
                }
            }
        }
        return null;
    }
}
