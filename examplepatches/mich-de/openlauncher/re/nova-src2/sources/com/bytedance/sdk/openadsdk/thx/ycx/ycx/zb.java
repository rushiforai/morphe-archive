package com.bytedance.sdk.openadsdk.thx.ycx.ycx;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.net.Uri;
import android.text.TextUtils;
import com.bytedance.sdk.component.utils.htf;
import com.bytedance.sdk.openadsdk.ApmHelper;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.bytedance.sdk.openadsdk.core.dy;
import com.bytedance.sdk.openadsdk.core.jc;
import com.bytedance.sdk.openadsdk.core.model.bhi;
import com.bytedance.sdk.openadsdk.core.model.lt;
import com.bytedance.sdk.openadsdk.core.model.ry;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.core.pmi;
import com.bytedance.sdk.openadsdk.core.yzp;
import com.bytedance.sdk.openadsdk.dj.zb;
import com.bytedance.sdk.openadsdk.oem.IPBroadcastReceiver;
import com.bytedance.sdk.openadsdk.utils.dv;
import com.bytedance.sdk.openadsdk.utils.lud;
import com.bytedance.sdk.openadsdk.utils.oby;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.regex.Pattern;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class zb implements sya {
    private final WeakReference<Context> sya;
    protected String ycx;

    /* renamed from: zb, reason: collision with root package name */
    protected int f27028zb;

    public zb(Context context, String str) {
        this.sya = new WeakReference<>(context);
        this.ycx = str;
        if (pmi.ycx() == null) {
            pmi.zb(context);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void lud(tn tnVar) {
        if (zb(tnVar)) {
            tnVar.lt(true);
            lud.ycx(tnVar);
            return;
        }
        if (dj(tnVar)) {
            tnVar.lt(true);
            lud.ycx(tnVar);
            return;
        }
        if (ycx(tnVar, false)) {
            lud.ycx(tnVar);
            return;
        }
        if (sya(tnVar)) {
            tnVar.lt(true);
            lud.ycx(tnVar);
        } else {
            if (tnVar.znc() != null || tnVar.kh() == null) {
                return;
            }
            yzp.ycx(ycx(), tnVar.kh(), tnVar, oby.ycx(this.ycx), this.ycx, true);
            tnVar.lt(true);
            lud.ycx(tnVar);
        }
    }

    private static boolean zb() {
        return false;
    }

    @Override // com.bytedance.sdk.openadsdk.thx.ycx.ycx.sya
    public boolean dj(tn tnVar) {
        lt ltVarZnc;
        if (tnVar == null || (ltVarZnc = tnVar.znc()) == null || tnVar.uci() == 0) {
            return false;
        }
        String strSya = ltVarZnc.sya();
        if (TextUtils.isEmpty(strSya)) {
            return false;
        }
        return ycx(tnVar, strSya, ycx(), this.ycx, new HashMap());
    }

    @Override // com.bytedance.sdk.openadsdk.thx.ycx.ycx.sya
    public boolean sya(tn tnVar) {
        lt ltVarZnc;
        if (tnVar == null || (ltVarZnc = tnVar.znc()) == null) {
            return false;
        }
        return ycx(ycx(), tnVar, ltVarZnc.ycx(), ltVarZnc.sya());
    }

    public static boolean ycx(Context context, String str, String str2, String str3, tn tnVar) {
        String strReplace = str3;
        if (!TextUtils.isEmpty(strReplace) && strReplace.contains("_landingpage")) {
            strReplace = strReplace.replace("_landingpage", b.f42142b);
        }
        String str4 = strReplace;
        if (!TextUtils.isEmpty(str)) {
            try {
                Intent intent = new Intent("android.intent.action.VIEW", Uri.parse(str));
                intent.setFlags(268435456);
                context.startActivity(intent);
                com.bytedance.sdk.openadsdk.dj.sya.zb(tnVar, str4, "store_open", (JSONObject) null);
                lud.ycx(tnVar);
                return true;
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4MHpTpI6yyGTa9tzM5O2EqCHa8pXw==", "fN4JmhSyRciBTtJPohS3", "XOE5miSzZsCMT+dRjQiCMWvvLp4Cu2zpgUfSfIIVlTpX", 90);
            }
        }
        if (context != null && str2 != null && !TextUtils.isEmpty(str2)) {
            try {
                Intent intent2 = new Intent("android.intent.action.VIEW");
                Uri uri = Uri.parse("market://details?id=".concat(str2));
                intent2.setData(uri);
                Iterator<ResolveInfo> it = context.getPackageManager().queryIntentActivities(intent2, SQLiteDatabase.OPEN_FULLMUTEX).iterator();
                while (it.hasNext()) {
                    if (it.next().activityInfo.packageName.equals("com.android.vending") && context.getPackageManager().getLaunchIntentForPackage("com.android.vending") != null) {
                        Intent intent3 = new Intent("android.intent.action.VIEW");
                        intent3.setData(uri);
                        intent3.setPackage("com.android.vending");
                        if (!(context instanceof Activity)) {
                            intent3.setFlags(268435456);
                        }
                        context.startActivity(intent3);
                        com.bytedance.sdk.openadsdk.dj.sya.zb(tnVar, str4, "store_open", (JSONObject) null);
                        lud.ycx(tnVar);
                        return true;
                    }
                }
                return false;
            } catch (Throwable th3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4MHpTpI6yyGTa9tzM5O2EqCHa8pXw==", "fN4JmhSyRciBTtJPohS3", "XOE5miSzZsCMT+dRjQiCMWvvLp4Cu2zpgUfSfIIVlTpX", Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE);
                ApmHelper.reportCustomError("gotoGooglePlayByPackageNameAndUrl error", "gotoGooglePlay", th3);
            }
        }
        return false;
    }

    public boolean zb(tn tnVar) {
        ry ryVarSjd = tnVar.sjd();
        if (ryVarSjd == null) {
            return false;
        }
        HashMap map = new HashMap();
        ycx(tnVar, map);
        if (ycx.ycx(ycx(), ryVarSjd.ycx(), tnVar, oby.zb(tnVar), map, true)) {
            return true;
        }
        if (com.bytedance.sdk.openadsdk.dv.lud.ycx("dpl_fallback_enable", 0) != 1 || !dv.ycx(ycx(), ryVarSjd.zb(), tnVar, zb.ycx.ycx, true)) {
            return false;
        }
        com.bytedance.sdk.openadsdk.dj.sya.ycx(tnVar, this.ycx, "open_fallback_url", map);
        return true;
    }

    public static boolean zb(tn tnVar, Context context, boolean z11) {
        String strSya;
        IPBroadcastReceiver iPBroadcastReceiverYcx;
        if (tnVar != null && context != null) {
            try {
                bhi bhiVarOi = tnVar.oi();
                if (bhiVarOi != null && !TextUtils.isEmpty(bhiVarOi.jc())) {
                    if (bhiVarOi.jw() && ycx(tnVar, context, z11)) {
                        return true;
                    }
                    if (bhiVarOi.ul() || bhiVarOi.fby()) {
                        if (tnVar.uh() == 1) {
                            strSya = bhiVarOi.ycx();
                        } else {
                            strSya = (tnVar.znc() == null || TextUtils.isEmpty(tnVar.znc().sya())) ? null : tnVar.znc().sya();
                        }
                        if (!TextUtils.isEmpty(strSya) && (iPBroadcastReceiverYcx = IPBroadcastReceiver.ycx(context, tnVar)) != null) {
                            iPBroadcastReceiverYcx.ycx(strSya, tnVar);
                        }
                    }
                    final boolean zYcx = ycx.ycx(context, bhiVarOi.jc(), tnVar, oby.zb(tnVar), ycx(tnVar, z11, bhiVarOi), true);
                    com.bytedance.sdk.openadsdk.utils.yzp.sya((Runnable) new com.bytedance.sdk.component.fby.zb.sya("task_oem_store") { // from class: com.bytedance.sdk.openadsdk.thx.ycx.ycx.zb.4
                        @Override // java.lang.Runnable
                        public void run() throws JSONException {
                            if (zYcx) {
                                jc.ycx("oem_store", "1");
                            } else {
                                jc.ycx("oem_store", "-2");
                            }
                        }
                    });
                    return zYcx;
                }
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4MHpTpI6yyGTa9tzM5O2EqCHa8pXw==", "fN4JmhSyRciBTtJPohS3", "VP4omyGlRsKN", 463);
                htf.sya("GPDownLoader", th2.getMessage());
            }
        }
        return false;
    }

    public static boolean ycx(tn tnVar, String str, Context context, String str2, Map<String, Object> map) {
        Intent intentYcx;
        if (tnVar != null && tnVar.uci() == 0) {
            return false;
        }
        try {
            if (TextUtils.isEmpty(str) || (intentYcx = oby.ycx(context, str)) == null) {
                return false;
            }
            intentYcx.putExtra("START_ONLY_FOR_ANDROID", true);
            if (!(context instanceof Activity)) {
                intentYcx.addFlags(268435456);
            }
            context.startActivity(intentYcx);
            if (map == null) {
                map = new HashMap<>();
            }
            if (tnVar != null && tnVar.mm() == 0) {
                map.put("auto_click", Boolean.valueOf(!tnVar.htf()));
            }
            map.put("can_query_install", Integer.valueOf(zb() ? 1 : 0));
            com.bytedance.sdk.openadsdk.dj.sya.ycx(tnVar, str2, "click_open", map);
            return true;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4MHpTpI6yyGTa9tzM5O2EqCHa8pXw==", "fN4JmhSyRciBTtJPohS3", "WO8juhO5Z+WZetZehxCnLQ==", 167);
            return false;
        }
    }

    @Override // com.bytedance.sdk.openadsdk.thx.ycx.ycx.sya
    public void ycx(int i5) {
        this.f27028zb = i5;
    }

    public boolean ycx(Context context, tn tnVar, String str, String str2) {
        return ycx(context, str, str2, this.ycx, tnVar);
    }

    public Context ycx() {
        WeakReference<Context> weakReference = this.sya;
        return (weakReference == null || weakReference.get() == null) ? pmi.ycx() : this.sya.get();
    }

    @Override // com.bytedance.sdk.openadsdk.thx.ycx.ycx.sya
    public void ycx(final tn tnVar) {
        if (ycx() == null || tnVar == null) {
            return;
        }
        if (com.bytedance.sdk.openadsdk.dv.lud.ycx("gp_downloader_async", 0) == 1) {
            com.bytedance.sdk.openadsdk.utils.yzp.jw().execute(new Runnable() { // from class: com.bytedance.sdk.openadsdk.thx.ycx.ycx.zb.1
                @Override // java.lang.Runnable
                public void run() {
                    zb.this.lud(tnVar);
                }
            });
        } else {
            lud(tnVar);
        }
    }

    private void ycx(tn tnVar, Map<String, Object> map) {
        if (tnVar != null && tnVar.mm() == 0) {
            map.put("auto_click", Boolean.valueOf(!tnVar.htf()));
        }
        if (tnVar != null && tnVar.mm() == 0) {
            map.put("dpl_probability_jump", Boolean.valueOf(this.f27028zb >= 11));
        }
        map.put("can_query_install", Integer.valueOf(zb() ? 1 : 0));
    }

    public boolean ycx(tn tnVar, boolean z11) {
        return zb(tnVar, ycx(), z11);
    }

    private static void ycx(final JSONObject jSONObject, tn tnVar, String str, final int i5) {
        try {
            com.bytedance.sdk.openadsdk.dj.sya.ycx(System.currentTimeMillis(), tnVar, str, "gp_mini_card_status", new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.thx.ycx.ycx.zb.2
                @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
                public JSONObject ycx() {
                    try {
                        jSONObject.put("status", i5);
                    } catch (Throwable th2) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4MHpTpI6yyGTa9tzM5O2EqCHa8pXw==", "fN4JmhSyRciBTtJPohS3bAk=", "XOs5pQK7Q9SPRPNcmBA=", Sdk.SDKError.Reason.AD_CLOSED_TEMPLATE_ERROR_VALUE);
                    }
                    return jSONObject;
                }
            });
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4MHpTpI6yyGTa9tzM5O2EqCHa8pXw==", "fN4JmhSyRciBTtJPohS3", "Tv4plBe5SMmEedJTiDS2LVX6", 323);
            th2.getMessage();
        }
    }

    public static boolean ycx(tn tnVar, Context context, boolean z11) {
        if (tnVar != null && tnVar.oi() != null && tnVar.oi().jw() && !TextUtils.isEmpty(tnVar.oi().jc()) && context != null) {
            try {
                bhi bhiVarOi = tnVar.oi();
                String strYcx = oby.ycx(tnVar);
                final JSONObject jSONObjectEa = bhiVarOi.ea();
                jSONObjectEa.put("from_web", z11 ? 1 : 0);
                jSONObjectEa.put("is_w2a", tnVar.uh());
                com.bytedance.sdk.openadsdk.dj.sya.ycx(System.currentTimeMillis(), tnVar, strYcx, "gp_mini_card_status", new com.bytedance.sdk.openadsdk.dy.zb.ycx() { // from class: com.bytedance.sdk.openadsdk.thx.ycx.ycx.zb.3
                    @Override // com.bytedance.sdk.openadsdk.dy.zb.ycx, com.bytedance.sdk.openadsdk.dy.zb.zb
                    public JSONObject ycx() {
                        try {
                            jSONObjectEa.put("status", 0);
                        } catch (Throwable th2) {
                            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4MHpTpI6yyGTa9tzM5O2EqCHa8pXw==", "fN4JmhSyRciBTtJPohS3bAg=", "XOs5pQK7Q9SPRPNcmBA=", 344);
                        }
                        return jSONObjectEa;
                    }
                });
                Intent intentYcx = ycx(context, bhiVarOi);
                if (intentYcx == null) {
                    ycx(jSONObjectEa, tnVar, strYcx, -2);
                    return false;
                }
                if (context instanceof Activity) {
                    if (!dv.ycx((Activity) context)) {
                        context = null;
                    }
                } else {
                    Activity activityZb = dy.ycx().lud().zb();
                    if (activityZb != null && dv.ycx(activityZb)) {
                        context = activityZb;
                    }
                }
                if (!(context instanceof Activity)) {
                    ycx(jSONObjectEa, tnVar, strYcx, -5);
                    return false;
                }
                PackageManager packageManager = context.getPackageManager();
                if (packageManager != null && intentYcx.resolveActivity(packageManager) != null) {
                    try {
                        ((Activity) context).startActivityForResult(intentYcx, 0);
                        ycx(jSONObjectEa, tnVar, strYcx, 1);
                        return true;
                    } catch (Throwable th2) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4MHpTpI6yyGTa9tzM5O2EqCHa8pXw==", "fN4JmhSyRciBTtJPohS3", "WO8juhO5Z+WZbedwhR+pC1r8KQ==", 386);
                        ycx(jSONObjectEa, tnVar, strYcx, -3);
                        return false;
                    }
                }
                ycx(jSONObjectEa, tnVar, strYcx, -4);
                return false;
            } catch (Throwable th3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4MHpTpI6yyGTa9tzM5O2EqCHa8pXw==", "fN4JmhSyRciBTtJPohS3", "WO8juhO5Z+WZbedwhR+pC1r8KQ==", 390);
                th3.getMessage();
            }
        }
        return false;
    }

    private static Intent ycx(Context context, bhi bhiVar) {
        try {
            Intent intent = new Intent("android.intent.action.VIEW");
            String strDj = bhiVar.dj();
            if (!TextUtils.isEmpty(strDj)) {
                intent.setPackage(strDj);
            } else {
                intent.setPackage("com.android.vending");
            }
            intent.setData(Uri.parse(bhiVar.jc()));
            boolean z11 = true;
            if (bhiVar.zb() != 1) {
                z11 = false;
            }
            intent.putExtra("overlay", z11);
            if (TextUtils.isEmpty(bhiVar.sya())) {
                intent.putExtra("callerId", context.getPackageName());
            } else {
                intent.putExtra("callerId", bhiVar.sya());
            }
            bhiVar.ycx(intent);
            return intent;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4MHpTpI6yyGTa9tzM5O2EqCHa8pXw==", "fN4JmhSyRciBTtJPohS3", "XOs5sjOVZ9OFRMM=", TTAdConstant.VIDEO_URL_CODE);
            th2.getMessage();
            return null;
        }
    }

    private static Map<String, Object> ycx(tn tnVar, boolean z11, bhi bhiVar) {
        HashMap map = new HashMap();
        try {
            JSONObject jSONObject = new JSONObject();
            jSONObject.put("oem_vendor_type", bhiVar.lt());
            jSONObject.put("from_web", z11 ? 1 : 0);
            jSONObject.put("is_w2a", tnVar.uh());
            map.put("pag_json_data", jSONObject.toString());
            return map;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4MHpTpI6yyGTa9tzM5O2EqCHa8pXw==", "fN4JmhSyRciBTtJPohS3", "XOs5sBuoRMaQ", 478);
            return map;
        }
    }

    public static boolean ycx(String str, tn tnVar) {
        String queryParameter;
        if (str != null && !str.isEmpty()) {
            try {
                Uri uri = Uri.parse(str);
                String scheme = uri.getScheme();
                String host = uri.getHost();
                if ("market".equals(scheme) && "details".equals(host)) {
                    return true;
                }
                if ((!"http".equals(scheme) && !"https".equals(scheme)) || (!"play.google.com".equals(host) && !"market.android.com".equals(host))) {
                    if ("market".equals(scheme) && "webstoreredirect".equals(host) && (queryParameter = uri.getQueryParameter("uri")) != null) {
                        return ycx(queryParameter, tnVar);
                    }
                }
                return true;
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4MHpTpI6yyGTa9tzM5O2EqCHa8pXw==", "fN4JmhSyRciBTtJPohS3", "Uv0Kmgy7ZcKwRtZEowONKUnlKIE2rmU=", 519);
                th2.getMessage();
            }
        }
        return false;
    }

    public static boolean ycx(tn tnVar, String str) {
        if (tnVar == null || tnVar.oi() == null) {
            return false;
        }
        String strLud = tnVar.oi().lud();
        if (TextUtils.isEmpty(strLud)) {
            return false;
        }
        return Pattern.compile(strLud).matcher(str).matches();
    }
}
