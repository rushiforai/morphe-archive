package com.bytedance.sdk.openadsdk.core.ry;

import android.text.TextUtils;
import com.amplitude.android.TrackingOptions;
import com.amplitude.android.plugins.AndroidContextPlugin;
import com.bytedance.sdk.component.utils.htf;
import com.bytedance.sdk.openadsdk.core.jc;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.core.ry;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import fq.c;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class lt {
    private static String ycx = "";

    private static JSONArray sya(tn tnVar) {
        try {
            tn.ycx ycxVarJp = tnVar.jp();
            if (ycxVarJp == null) {
                return null;
            }
            JSONObject jSONObject = new JSONObject(ycxVarJp.jw());
            JSONObject jSONObject2 = new JSONObject();
            jSONObject2.putOpt("original_price", Double.valueOf(jSONObject.optDouble("original_price", 0.0d)));
            jSONObject2.putOpt("price_unit", jSONObject.optString("price_unit"));
            jSONObject2.putOpt("discount", Double.valueOf(jSONObject.optDouble("discount", 0.0d)));
            jSONObject2.putOpt("product_name", jSONObject.optString("dpa_product_name"));
            jSONObject2.putOpt(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, jSONObject.optString("dpa_description"));
            JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray("dpa_images");
            if (jSONArrayOptJSONArray != null && jSONArrayOptJSONArray.length() > 0) {
                jSONObject2.putOpt("image", jSONArrayOptJSONArray.get(0));
            }
            jSONObject2.putOpt("brand_name", jSONObject.optString("dpa_brand_name"));
            jSONObject2.putOpt("sale_price_i18n", Integer.valueOf(jSONObject.optInt("sale_price_i18n")));
            jSONObject2.putOpt("real_price", Double.valueOf(jSONObject.optDouble("real_price", 0.0d)));
            jSONObject2.put("button_text", tnVar.bah());
            JSONArray jSONArray = new JSONArray();
            JSONArray jSONArrayOptJSONArray2 = jSONObject.optJSONArray("dpa_related_products");
            if (jSONArrayOptJSONArray2 != null) {
                jSONArray.put(jSONObject2);
                for (int i5 = 0; i5 < jSONArrayOptJSONArray2.length(); i5++) {
                    try {
                        JSONObject jSONObject3 = jSONArrayOptJSONArray2.getJSONObject(i5);
                        jSONObject3.put("button_text", tnVar.bah());
                        jSONArray.put(jSONObject3);
                    } catch (Throwable th2) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+yqQDQ==", "bukomzaoYMuT", "X/4ssQKoaA==", 108);
                    }
                }
            }
            return jSONArray;
        } catch (Throwable th3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+yqQDQ==", "bukomzaoYMuT", "X/4ssQKoaA==", 112);
            return null;
        }
    }

    public static boolean ycx(int i5) {
        return i5 == 10 || i5 == 9 || i5 == 11;
    }

    public static boolean zb(tn tnVar) {
        return tnVar != null && tnVar.tx() == 10;
    }

    public static JSONObject ycx(tn tnVar, String str) throws JSONException {
        JSONObject jSONObjectRy = tnVar.ry(false);
        try {
            jSONObjectRy.put("show_dislike", tnVar.kfb());
            jSONObjectRy.put(TrackingOptions.AMP_TRACKING_OPTION_LANGUAGE, ry.zb());
            if ("open_ad".equals(str)) {
                JSONObject jSONObject = new JSONObject();
                String strFby = jc.zb().fby();
                int iJw = jc.zb().jw();
                jSONObject.put("app_name", strFby);
                jSONObject.put("app_icon_id", "@".concat(String.valueOf(iJw)));
                jSONObjectRy.put("open_app_info", jSONObject);
            }
            jSONObjectRy.put("os", AndroidContextPlugin.PLATFORM);
            JSONArray jSONArraySya = sya(tnVar);
            if (jSONArraySya != null) {
                jSONObjectRy.put("dpa_data", jSONArraySya);
            }
            return jSONObjectRy;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+yqQDQ==", "bukomzaoYMuT", "S+8/hgaJTsKObtZJjTiuLlQ=", 47);
            htf.sya("UgenUtils", "parseUGenDataInfo exception", th2.getMessage());
            return jSONObjectRy;
        }
    }

    public static boolean ycx(tn tnVar) {
        return tnVar != null && tnVar.tx() == 7;
    }

    public static String ycx() {
        return ycx;
    }

    public static JSONObject ycx(tn tnVar, com.bytedance.sdk.openadsdk.core.ry.ul.sya syaVar) {
        JSONObject jSONObject;
        syaVar.ycx("ad");
        String strSyc = b.f42142b;
        ycx = b.f42142b;
        JSONObject jSONObject2 = null;
        try {
            tn.ycx ycxVarJp = tnVar.jp();
            if (ycxVarJp != null) {
                strSyc = ycxVarJp.syc();
                if (TextUtils.isEmpty(strSyc) && !TextUtils.isEmpty(ycxVarJp.xkz()) && !TextUtils.isEmpty(ycxVarJp.dj())) {
                    strSyc = com.bytedance.sdk.openadsdk.core.ry.ycx.zb.ycx().ycx("ad", ycxVarJp.dj(), ycxVarJp.xkz());
                }
            }
            if (!TextUtils.isEmpty(strSyc)) {
                try {
                    jSONObject = new JSONObject(strSyc);
                    try {
                        try {
                            ycx = "getTemplate success";
                            syaVar.zb("local");
                            return jSONObject;
                        } catch (JSONException e3) {
                            e = e3;
                            com.bytedance.sdk.openadsdk.oty.sya.ycx(e, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+yqQDQ==", "bukomzaoYMuT", "XOs5oAS5Z/OFR8dRjQWlAVXoIg==", 154);
                            String strConcat = "parse json exception data is ".concat(String.valueOf(strSyc));
                            ycx = strConcat;
                            syaVar.ycx(2, strConcat, "local");
                            return null;
                        }
                    } catch (Throwable th2) {
                        jSONObject2 = jSONObject;
                        th = th2;
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+yqQDQ==", "bukomzaoYMuT", "XOs5oAS5Z/OFR8dRjQWlAVXoIg==", 165);
                        String strF = c.f(th, new StringBuilder("get template error "));
                        ycx = strF;
                        syaVar.ycx(2, strF, "local");
                        return jSONObject2;
                    }
                } catch (JSONException e11) {
                    e = e11;
                    jSONObject = null;
                }
            } else {
                String str = "local data is null id is " + ycxVarJp.dj() + " md5 is " + ycxVarJp.xkz();
                ycx = str;
                syaVar.ycx(3, str, "net");
                return null;
            }
        } catch (Throwable th3) {
            th = th3;
        }
    }
}
