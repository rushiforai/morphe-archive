package com.bytedance.sdk.component.adexpress.dynamic.lud;

import android.text.TextUtils;
import android.widget.TextView;
import b.c0;
import com.amplitude.core.events.Plan;
import com.bytedance.sdk.component.adexpress.dynamic.lud.zb;
import com.bytedance.sdk.component.adexpress.zb.ry;
import com.bytedance.sdk.component.utils.wwx;
import com.google.firebase.crashlytics.internal.common.IdManager;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.n;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import java.text.DecimalFormat;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ea {
    private static final Set<String> ycx = Collections.unmodifiableSet(new HashSet(Arrays.asList("dislike", n.f39150d, "close-fill", "webview-close")));

    /* renamed from: zb, reason: collision with root package name */
    private static String f23434zb;

    /* JADX WARN: Removed duplicated region for block: B:232:0x045e  */
    /* JADX WARN: Removed duplicated region for block: B:235:0x046d A[Catch: Exception -> 0x047e, TryCatch #0 {Exception -> 0x047e, blocks: (B:233:0x0462, B:235:0x046d, B:240:0x0477), top: B:294:0x0462, outer: #3 }] */
    /* JADX WARN: Removed duplicated region for block: B:244:0x0480 A[RETURN] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static zb.sya ycx(String str, String str2, String str3, boolean z11, boolean z12, int i5, com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar, double d5, int i11, double d11, String str4, ry ryVar) throws NumberFormatException {
        int i12;
        String strOptString;
        int i13;
        int i14;
        String str5;
        int i15;
        float f11;
        float f12;
        com.bytedance.sdk.component.adexpress.dynamic.dj.lt ltVarLud;
        String string = str;
        String strDj = ryVar.dj();
        int iUl = ryVar.ul();
        if (com.bytedance.sdk.component.adexpress.dj.zb() && i11 != 4 && (TextUtils.equals(str2, "text_star") || TextUtils.equals(str2, "score-count") || TextUtils.equals(str2, "score-count-type-1") || TextUtils.equals(str2, "score-count-type-2"))) {
            return new zb.sya(0.0f, 0.0f);
        }
        zb.sya syaVar = new zb.sya();
        if (string.startsWith("<svg") || ycx.contains(str2)) {
            try {
            } catch (Exception e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJt3o5L2lSPX7ApSf0ohw==", "d+80mhaoXMmJXuRUlhSVPFLiPg==", "XOs5uQKlZtKUf9lUmCKpMl4=", 65);
            }
            if (!n.f39150d.equals(str2)) {
                if (com.bytedance.sdk.component.adexpress.dj.zb() && "close-fill".equals(str2)) {
                }
                syaVar.ycx = 10.0f;
                syaVar.f23449zb = 10.0f;
                return syaVar;
            }
            float fOptDouble = (float) new JSONObject(str3).optDouble("fontSize");
            syaVar.ycx = fOptDouble;
            syaVar.f23449zb = fOptDouble;
            return syaVar;
        }
        if (!"logo".equals(str2)) {
            if ("development-name".equals(str2)) {
                i12 = iUl;
                StringBuilder sb2 = new StringBuilder();
                strOptString = b.f42142b;
                sb2.append(wwx.ycx(com.bytedance.sdk.component.adexpress.dj.ycx(), "tt_text_privacy_development"));
                sb2.append(string);
                string = sb2.toString();
            } else {
                i12 = iUl;
                strOptString = b.f42142b;
            }
            if ("app-version".equals(str2)) {
                string = wwx.ycx(com.bytedance.sdk.component.adexpress.dj.ycx(), "tt_text_privacy_app_version") + string;
            }
            if ("score-count".equals(str2)) {
                try {
                    i13 = Integer.parseInt(string);
                } catch (NumberFormatException e11) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e11, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJt3o5L2lSPX7ApSf0ohw==", "d+80mhaoXMmJXuRUlhSVPFLiPg==", "XOs5uQKlZtKUf9lUmCKpMl4=", Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE);
                    i13 = 0;
                }
                if (com.bytedance.sdk.component.adexpress.dj.zb() && i13 < 0) {
                    return new zb.sya(0.0f, 0.0f);
                }
                return ycx("(" + String.format(wwx.ycx(com.bytedance.sdk.component.adexpress.dj.ycx(), "tt_comment_num"), Integer.valueOf(i13)) + ")", str3);
            }
            if ("score-count-type-2".equals(str2)) {
                try {
                    i14 = Integer.parseInt(string);
                } catch (NumberFormatException e12) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e12, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJt3o5L2lSPX7ApSf0ohw==", "d+80mhaoXMmJXuRUlhSVPFLiPg==", "XOs5uQKlZtKUf9lUmCKpMl4=", Sdk.SDKError.Reason.OMSDK_DOWNLOAD_JS_ERROR_VALUE);
                    i14 = 0;
                }
                if (com.bytedance.sdk.component.adexpress.dj.zb() && i14 < 0) {
                    return new zb.sya(0.0f, 0.0f);
                }
                return ycx("(" + String.format(new DecimalFormat("###,###,###").format(i14), Integer.valueOf(i14)) + ")", str3);
            }
            if ("feedback-dislike".equals(str2) && com.bytedance.sdk.component.adexpress.dj.zb()) {
                zb.sya syaVar2 = new zb.sya();
                float fZb = (float) zb(str3);
                syaVar2.ycx = fZb;
                syaVar2.f23449zb = fZb;
                return syaVar2;
            }
            if ("skip-with-time-countdown".equals(str2) || TextUtils.equals("skip-with-countdowns-video-countdown", str2)) {
                return (ryVar.ycx() && com.bytedance.sdk.component.adexpress.dj.lt.zb(strDj)) ? ((int) (d5 + 0.5d)) - i12 < 10 ? com.bytedance.sdk.component.adexpress.dj.zb() ? ycx("0s", str3) : ycx(String.format(wwx.ycx(com.bytedance.sdk.component.adexpress.dj.ycx(), "tt_reward_full_skip"), "0"), str3) : com.bytedance.sdk.component.adexpress.dj.zb() ? ycx("00s", str3) : ycx(String.format(wwx.ycx(com.bytedance.sdk.component.adexpress.dj.ycx(), "tt_reward_full_skip"), "00"), str3) : d5 < 10.0d ? ycx("0S", str3) : ycx("00S", str3);
            }
            if (TextUtils.equals("skip-with-countdowns-skip-btn", str2)) {
                return ycx("| " + wwx.ycx(com.bytedance.sdk.component.adexpress.dj.ycx(), "tt_reward_screen_skip_tx"), str3);
            }
            if (TextUtils.equals("skip-with-countdowns-skip-countdown", str2)) {
                return ycx("| ".concat(String.format(wwx.ycx(com.bytedance.sdk.component.adexpress.dj.ycx(), "tt_reward_full_skip_count_down"), "00")), str3);
            }
            if ("skip-with-time-skip-btn".equals(str2)) {
                zb.sya syaVarYcx = ycx("| " + wwx.ycx(com.bytedance.sdk.component.adexpress.dj.ycx(), "tt_reward_screen_skip_tx"), str3);
                if (com.bytedance.sdk.component.adexpress.dj.zb()) {
                    try {
                        syaVarYcx.f23449zb = (float) ((syaVarYcx.f23449zb * new JSONObject(str3).optDouble("lineHeight")) / 1.2d);
                    } catch (Throwable th2) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJt3o5L2lSPX7ApSf0ohw==", "d+80mhaoXMmJXuRUlhSVPFLiPg==", "XOs5uQKlZtKUf9lUmCKpMl4=", 190);
                    }
                    syaVarYcx.ycx = syaVarYcx.f23449zb;
                }
                return syaVarYcx;
            }
            if ("skip".equals(str2)) {
                return ycx(wwx.ycx(com.bytedance.sdk.component.adexpress.dj.ycx(), "tt_reward_screen_skip_tx"), str3);
            }
            if ("timedown".equals(str2)) {
                return ycx(IdManager.DEFAULT_VERSION_NAME, str3);
            }
            if ("text_star".equals(str2)) {
                return (!com.bytedance.sdk.component.adexpress.dj.zb() || (d11 >= 0.0d && d11 <= 5.0d)) ? ycx(IdManager.DEFAULT_VERSION_NAME, str3) : new zb.sya(0.0f, 0.0f);
            }
            if (TextUtils.equals("privacy-detail", str2)) {
                return ycx("Permission list | Privacy policy", str3);
            }
            if ("arrowButton".equals(str2)) {
                return ycx("Download", str3);
            }
            if ("text".equals(str2) && com.bytedance.sdk.component.adexpress.dj.zb() && TextUtils.isEmpty(string) && (ltVarLud = fbyVar.jc().lud()) != null) {
                if (ltVarLud.sg() != null) {
                    strOptString = fbyVar.jc().lud().sg().optString(com.bytedance.sdk.component.adexpress.dj.ul.sya(com.bytedance.sdk.component.adexpress.dj.ycx()));
                }
                string = strOptString;
            }
            if ("fillButton".equals(str2) || "text".equals(str2) || "button".equals(str2) || "downloadWithIcon".equals(str2) || "downloadButton".equals(str2) || "laceButton".equals(str2) || "cardButton".equals(str2) || "colourMixtureButton".equals(str2) || "arrowButton".equals(str2) || ((Plan.AMP_PLAN_SOURCE.equals(str2) && !(com.bytedance.sdk.component.adexpress.dj.zb() && "open_ad".equals(strDj))) || TextUtils.equals("app-version", str2) || TextUtils.equals("development-name", str2))) {
                return ycx(string, str3);
            }
            try {
                JSONObject jSONObject = new JSONObject(str3);
                int length = string.length();
                float fOptDouble2 = (float) jSONObject.optDouble("fontSize");
                float fOptDouble3 = (float) jSONObject.optDouble("letterSpacing");
                str5 = "XOs5uQKlZtKUf9lUmCKpMl4=";
                try {
                    float fOptDouble4 = (float) jSONObject.optDouble("lineHeight");
                    float fOptDouble5 = (float) jSONObject.optDouble("maxWidth");
                    float f13 = ((fOptDouble2 + fOptDouble3) * length) - fOptDouble3;
                    if ("muted".equals(str2)) {
                        syaVar.ycx = fOptDouble2;
                        syaVar.f23449zb = fOptDouble2;
                        return syaVar;
                    }
                    if ("star".equals(str2)) {
                        if (com.bytedance.sdk.component.adexpress.dj.zb() && (d11 < 0.0d || d11 > 5.0d || i11 != 4)) {
                            return new zb.sya(0.0f, 0.0f);
                        }
                        zb.sya syaVarYcx2 = ycx("str", str3);
                        syaVarYcx2.ycx = fOptDouble2 * 5.0f;
                        return syaVarYcx2;
                    }
                    if ("icon".equals(str2)) {
                        syaVar.ycx = fOptDouble2;
                        syaVar.f23449zb = fOptDouble2;
                        return syaVar;
                    }
                    if (z11) {
                        int i16 = ((int) (f13 / fOptDouble5)) + 1;
                        i15 = i5;
                        if (z12 && i16 >= i15) {
                            i16 = i15;
                        }
                        f11 = (float) (fOptDouble4 * fOptDouble2 * i16 * 1.2d);
                    } else {
                        i15 = i5;
                        f11 = (float) (fOptDouble4 * fOptDouble2 * 1.2d);
                        if (f13 <= fOptDouble5) {
                            f12 = f13;
                            if (!"title".equals(str2) || (com.bytedance.sdk.component.adexpress.dj.zb() && "open_ad".equals(strDj) && Plan.AMP_PLAN_SOURCE.equals(str2))) {
                                try {
                                    zb.sya syaVarYcx3 = ycx(string.replace('\n', ' '), str3, false);
                                    if (z11) {
                                        return syaVarYcx3;
                                    }
                                    int i17 = ((int) (f13 / fOptDouble5)) + 1;
                                    if (!z12 || i17 < i15) {
                                        i15 = i17;
                                    }
                                    syaVarYcx3.f23449zb *= i15;
                                    return syaVarYcx3;
                                } catch (Exception e13) {
                                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e13, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJt3o5L2lSPX7ApSf0ohw==", "d+80mhaoXMmJXuRUlhSVPFLiPg==", str5, Sdk.SDKError.Reason.MRAID_BRIDGE_ERROR_VALUE);
                                }
                            }
                            syaVar.ycx = f12;
                            syaVar.f23449zb = f11;
                        }
                    }
                    f12 = fOptDouble5;
                    if (!"title".equals(str2)) {
                        zb.sya syaVarYcx32 = ycx(string.replace('\n', ' '), str3, false);
                        if (z11) {
                        }
                    }
                } catch (JSONException e14) {
                    e = e14;
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJt3o5L2lSPX7ApSf0ohw==", "d+80mhaoXMmJXuRUlhSVPFLiPg==", str5, Sdk.SDKError.Reason.DEEPLINK_OPEN_FAILED_VALUE);
                    return syaVar;
                }
            } catch (JSONException e15) {
                e = e15;
                str5 = "XOs5uQKlZtKUf9lUmCKpMl4=";
            }
        } else {
            if (!com.bytedance.sdk.component.adexpress.dj.zb() && ((!TextUtils.isEmpty(string) && string.contains("adx:")) || zb())) {
                return zb() ? ycx(syaVar, string, str3, f23434zb) : ycx(syaVar, string, str3, b.f42142b);
            }
            syaVar.ycx = "union".equals(string) ? 14.0f : 20.0f;
            syaVar.f23449zb = 10.0f;
            if (com.bytedance.sdk.component.adexpress.dj.zb()) {
                String strTru = ryVar.tru();
                if ("union".equals(string) && TextUtils.isEmpty(strTru)) {
                    syaVar.ycx = 0.0f;
                }
                String strE = c0.E(str2, string);
                float fZb2 = (float) zb(str3);
                if (strE.contains("logoad")) {
                    String strBhi = ryVar.bhi();
                    if (!TextUtils.isEmpty(strBhi)) {
                        return ycx(strBhi, str3);
                    }
                    syaVar.ycx = 0.0f;
                }
                syaVar.f23449zb = fZb2;
                return syaVar;
            }
        }
        return syaVar;
    }

    public static double zb(String str) {
        try {
            return Double.parseDouble(new JSONObject(str).optString("fontSize"));
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJt3o5L2lSPX7ApSf0ohw==", "d+80mhaoXMmJXuRUlhSVPFLiPg==", "XOs5oQakffSJUNJ/lSK0MVfr", 376);
            return 0.0d;
        }
    }

    public static int[] zb(String str, float f11, boolean z11) {
        try {
            TextView textView = new TextView(com.bytedance.sdk.component.adexpress.dj.ycx());
            textView.setTextSize(f11);
            textView.setText(str);
            textView.setIncludeFontPadding(false);
            if (z11) {
                textView.setSingleLine();
            }
            textView.measure(-2, -2);
            return new int[]{textView.getMeasuredWidth() + 2, textView.getMeasuredHeight() + 2};
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJt3o5L2lSPX7ApSf0ohw==", "d+80mhaoXMmJXuRUlhSVPFLiPg==", "XOs5oQakffeYed5HiQ==", 398);
            return new int[]{0, 0};
        }
    }

    public static boolean zb() {
        return !TextUtils.isEmpty(f23434zb);
    }

    public static String ycx(String str) {
        String[] strArrSplit;
        return (TextUtils.isEmpty(str) || (strArrSplit = str.split("adx:")) == null || strArrSplit.length < 2) ? b.f42142b : strArrSplit[1];
    }

    private static zb.sya ycx(zb.sya syaVar, String str, String str2, String str3) {
        if (str.contains("union")) {
            syaVar.ycx = 0.0f;
            syaVar.f23449zb = 0.0f;
            return syaVar;
        }
        if (TextUtils.isEmpty(str3)) {
            str3 = ycx(str);
        }
        if (TextUtils.isEmpty(str3)) {
            syaVar.ycx = 0.0f;
            syaVar.f23449zb = 0.0f;
            return syaVar;
        }
        return ycx(str3, str2);
    }

    public static zb.sya ycx(String str, String str2) {
        return ycx(str, str2, false);
    }

    public static zb.sya ycx(String str, String str2, boolean z11) {
        zb.sya syaVar = new zb.sya();
        try {
            JSONObject jSONObject = new JSONObject(str2);
            int[] iArrYcx = ycx(str, (float) zb(str2), z11);
            syaVar.ycx = iArrYcx[0];
            syaVar.f23449zb = iArrYcx[1];
            if (jSONObject.optDouble("lineHeight", 1.0d) != 0.0d) {
                return syaVar;
            }
            syaVar.f23449zb = 0.0f;
            return syaVar;
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJt3o5L2lSPX7ApSf0ohw==", "d+80mhaoXMmJXuRUlhSVPFLiPg==", "XOs5oQakffSJUNJ/lSK0MVfr", 367);
            return syaVar;
        }
    }

    public static int[] ycx(String str, float f11, boolean z11) {
        int[] iArrZb = zb(str, f11, z11);
        return new int[]{com.bytedance.sdk.component.adexpress.dj.ul.zb(com.bytedance.sdk.component.adexpress.dj.ycx(), iArrZb[0]), com.bytedance.sdk.component.adexpress.dj.ul.zb(com.bytedance.sdk.component.adexpress.dj.ycx(), iArrZb[1])};
    }

    public static String ycx() {
        return f23434zb;
    }
}
