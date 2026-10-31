package com.bytedance.sdk.openadsdk.oty;

import android.text.TextUtils;
import com.bytedance.sdk.openadsdk.dv.lud;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.util.TTConst;
import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class sya {
    private static volatile JSONObject ycx;

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Type inference failed for: r14v1, types: [org.json.JSONArray] */
    /* JADX WARN: Type inference failed for: r14v10, types: [boolean] */
    /* JADX WARN: Type inference failed for: r14v11 */
    /* JADX WARN: Type inference failed for: r14v12 */
    /* JADX WARN: Type inference failed for: r14v8 */
    /* JADX WARN: Type inference failed for: r14v9 */
    public static boolean dj(JSONArray jSONArray, String str, String str2, String str3, String str4) {
        JSONObject jSONObjectOptJSONObject;
        if (jSONArray != null) {
            try {
                if (jSONArray.length() > 0 && !TextUtils.isEmpty(str) && !TextUtils.isEmpty(str2) && !TextUtils.isEmpty(str3)) {
                    Integer numValueOf = null;
                    int i5 = 0;
                    Integer numValueOf2 = null;
                    Integer numValueOf3 = null;
                    ?? Ycx = jSONArray;
                    while (i5 < Ycx.length()) {
                        try {
                            jSONObjectOptJSONObject = Ycx.optJSONObject(i5);
                        } catch (Throwable unused) {
                        }
                        if (jSONObjectOptJSONObject == null) {
                            i5++;
                            Ycx = Ycx;
                        } else {
                            String strOptString = jSONObjectOptJSONObject.optString("issue_id", b.f42142b);
                            String strOptString2 = jSONObjectOptJSONObject.optString("p", b.f42142b);
                            String strOptString3 = jSONObjectOptJSONObject.optString("c", b.f42142b);
                            String strOptString4 = jSONObjectOptJSONObject.optString(InneractiveMediationDefs.GENDER_MALE, b.f42142b);
                            int iOptInt = jSONObjectOptJSONObject.optInt("rate", 10000);
                            if (!TextUtils.isEmpty(strOptString)) {
                                try {
                                    if (TextUtils.equals(strOptString, str4)) {
                                        numValueOf = Integer.valueOf(iOptInt);
                                    }
                                } catch (Throwable unused2) {
                                }
                            } else if (ycx(strOptString2, str)) {
                                if (TextUtils.isEmpty(strOptString3) && TextUtils.isEmpty(strOptString4)) {
                                    numValueOf3 = Integer.valueOf(iOptInt);
                                } else if (TextUtils.equals(strOptString3, str2)) {
                                    if (TextUtils.isEmpty(strOptString4)) {
                                        numValueOf2 = Integer.valueOf(iOptInt);
                                    } else {
                                        try {
                                            if (TextUtils.equals(strOptString4, str3)) {
                                                Ycx = ycx(iOptInt);
                                                return Ycx;
                                            }
                                            continue;
                                        } catch (Throwable unused3) {
                                            continue;
                                        }
                                    }
                                    i5++;
                                    Ycx = Ycx;
                                } else {
                                    i5++;
                                    Ycx = Ycx;
                                }
                            }
                            i5++;
                            Ycx = Ycx;
                        }
                    }
                    if (numValueOf != null) {
                        return ycx(numValueOf.intValue());
                    }
                    if (numValueOf2 != null) {
                        return ycx(numValueOf2.intValue());
                    }
                    if (numValueOf3 != null && !ycx(numValueOf3.intValue())) {
                        return false;
                    }
                }
            } catch (Throwable unused4) {
            }
        }
        return true;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static boolean sya(JSONArray jSONArray, String str, String str2, String str3, String str4) {
        if (jSONArray != null) {
            try {
                if (jSONArray.length() > 0 && !TextUtils.isEmpty(str) && !TextUtils.isEmpty(str2) && !TextUtils.isEmpty(str3)) {
                    for (int i5 = 0; i5 < jSONArray.length(); i5++) {
                        try {
                            JSONObject jSONObjectOptJSONObject = jSONArray.optJSONObject(i5);
                            if (jSONObjectOptJSONObject != null) {
                                String strOptString = jSONObjectOptJSONObject.optString("issue_id", b.f42142b);
                                String strOptString2 = jSONObjectOptJSONObject.optString("p", b.f42142b);
                                String strOptString3 = jSONObjectOptJSONObject.optString("c", b.f42142b);
                                String strOptString4 = jSONObjectOptJSONObject.optString(InneractiveMediationDefs.GENDER_MALE, b.f42142b);
                                if (!TextUtils.isEmpty(strOptString) && TextUtils.equals(strOptString, str4)) {
                                    return true;
                                }
                                if (!TextUtils.isEmpty(strOptString2) && str.startsWith(strOptString2)) {
                                    return true;
                                }
                                String str5 = str2 + str3;
                                if (TextUtils.isEmpty(strOptString3)) {
                                    continue;
                                } else {
                                    if (str5.startsWith(strOptString3 + strOptString4)) {
                                        return true;
                                    }
                                }
                            }
                        } catch (Throwable unused) {
                        }
                    }
                }
            } catch (Throwable unused2) {
            }
        }
        return false;
    }

    public static void ycx(final Throwable th2, final String str, final String str2, final String str3, final int i5) {
        final JSONObject jSONObjectYcx;
        if (th2 != null) {
            try {
                if (TextUtils.isEmpty(str) || TextUtils.isEmpty(str2) || TextUtils.isEmpty(str3) || (jSONObjectYcx = ycx()) == null || jSONObjectYcx.optInt("enable", 0) != 1) {
                    return;
                }
                com.bytedance.sdk.openadsdk.dy.dj.ycx("try_catch_monitor", false, new com.bytedance.sdk.openadsdk.dy.zb() { // from class: com.bytedance.sdk.openadsdk.oty.sya.1
                    @Override // com.bytedance.sdk.openadsdk.dy.zb
                    public com.bytedance.sdk.openadsdk.dy.ycx.sya ycx() throws Exception {
                        try {
                            JSONObject jSONObject = new JSONObject();
                            JSONArray jSONArrayOptJSONArray = jSONObjectYcx.optJSONArray("black_list");
                            String strYcx = dj.ycx(th2);
                            String strYcx2 = dj.ycx(th2, strYcx);
                            if (sya.sya(jSONArrayOptJSONArray, str, str2, str3, strYcx2) || !sya.dj(jSONObjectYcx.optJSONArray("rate_list"), str, str2, str3, strYcx2)) {
                                return null;
                            }
                            int iOptInt = jSONObjectYcx.optInt("stack_lines", 20);
                            jSONObject.putOpt("msg", th2.getMessage());
                            jSONObject.putOpt(TTConst.TRACK_TYPE, th2.getClass().getSimpleName());
                            jSONObject.putOpt("stack", dj.zb(strYcx, iOptInt));
                            jSONObject.putOpt("issue_id", strYcx2);
                            jSONObject.putOpt("p_name", str);
                            jSONObject.putOpt("c_name", str2);
                            jSONObject.putOpt("m_name", str3);
                            jSONObject.putOpt("l_num", Integer.valueOf(i5));
                            return com.bytedance.sdk.openadsdk.dy.ycx.dj.zb().ycx("try_catch_monitor").zb(jSONObject.toString());
                        } catch (Throwable unused) {
                            return null;
                        }
                    }
                });
            } catch (Throwable unused) {
            }
        }
    }

    public static JSONObject ycx() {
        try {
            JSONObject jSONObject = ycx;
            if (jSONObject != null) {
                return jSONObject;
            }
            JSONObject jSONObject2 = (JSONObject) lud.ycx("try_catch_monitor_config", (Object) null, com.bytedance.sdk.openadsdk.dv.zb.ycx);
            if (jSONObject2 != null) {
                ycx = jSONObject2;
            }
            return jSONObject2;
        } catch (Throwable unused) {
            return null;
        }
    }

    private static boolean ycx(int i5) {
        if (i5 <= 0) {
            return false;
        }
        if (i5 >= 10000) {
            return true;
        }
        return ((int) (Math.random() * 10000.0d)) + 1 <= i5;
    }

    private static boolean ycx(String str, String str2) {
        return (TextUtils.isEmpty(str) || TextUtils.isEmpty(str2) || !str2.startsWith(str)) ? false : true;
    }
}
