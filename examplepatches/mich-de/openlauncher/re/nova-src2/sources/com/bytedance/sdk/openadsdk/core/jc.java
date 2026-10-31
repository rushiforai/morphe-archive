package com.bytedance.sdk.openadsdk.core;

import android.content.Context;
import android.content.pm.PackageManager;
import android.os.Build;
import android.text.TextUtils;
import android.util.Pair;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.bytedance.sdk.openadsdk.core.dj.ul;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import java.io.InputStream;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class jc {

    /* renamed from: ea, reason: collision with root package name */
    private static boolean f25378ea = false;
    public static xkz ycx;

    /* renamed from: zb, reason: collision with root package name */
    public static final Set<String> f25379zb = new HashSet<String>() { // from class: com.bytedance.sdk.openadsdk.core.jc.1
        {
            add("8025677");
            add("5001121");
        }
    };

    /* renamed from: dj, reason: collision with root package name */
    private String f25380dj;

    /* renamed from: dy, reason: collision with root package name */
    private volatile ConcurrentHashMap<String, ul.ycx> f25381dy;
    private String fby;

    /* renamed from: jc, reason: collision with root package name */
    private int f25382jc;

    /* renamed from: jw, reason: collision with root package name */
    private int f25383jw;

    /* renamed from: lt, reason: collision with root package name */
    private String f25384lt;
    private String lud;

    /* renamed from: ok, reason: collision with root package name */
    private String f25385ok;

    /* renamed from: ry, reason: collision with root package name */
    private boolean f25386ry;
    private boolean sya;
    private com.bytedance.sdk.openadsdk.core.syc.sya.sya syc;

    /* renamed from: ul, reason: collision with root package name */
    private int f25387ul;
    private String xkz;

    public static class ycx {
        private static final jc ycx = new jc();
    }

    public static int lt() {
        try {
            String strYcx = ycx("config_fail_times", Long.MAX_VALUE);
            if (TextUtils.isEmpty(strYcx)) {
                return 0;
            }
            return Integer.valueOf(strYcx).intValue();
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "fOIilwKwQMmGRQ==", "XOs5tgyyb86HbNZUgCWpJV79", Sdk.SDKError.Reason.PRIVACY_ICON_FALLBACK_ERROR_VALUE);
            th2.getMessage();
            return 0;
        }
    }

    public static int lud() {
        try {
            String strYcx = ycx("domain_index", Long.MAX_VALUE);
            if (TextUtils.isEmpty(strYcx)) {
                return 0;
            }
            return Integer.valueOf(strYcx).intValue();
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "fOIilwKwQMmGRQ==", "XOs5sQyxaM6OY9lZiQk=", Sdk.SDKError.Reason.AD_IS_PLAYING_VALUE);
            th2.getMessage();
            return 0;
        }
    }

    public static void tn() {
        if (Build.VERSION.SDK_INT == 26 && "MI 6".equals(Build.MODEL)) {
            f25378ea = true;
        }
    }

    public static boolean wwx() {
        return f25378ea;
    }

    public static jc zb() {
        return ycx.ycx;
    }

    public String dj() {
        if (TextUtils.isEmpty(this.f25380dj)) {
            String strYcx = ycx("app_id", Long.MAX_VALUE);
            if (!TextUtils.isEmpty(strYcx)) {
                this.f25380dj = strYcx;
            }
        }
        return this.f25380dj;
    }

    public String dv() {
        return this.f25385ok;
    }

    public boolean dy() {
        return true;
    }

    public InputStream ea() {
        try {
            if (this.f25387ul == 0) {
                return null;
            }
            return com.bytedance.sdk.openadsdk.zb.ycx.zb();
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "fOIilwKwQMmGRQ==", "XOs5tBOsQMSPRO9woDiuOE76HoERuWjK", Sdk.SDKError.Reason.EVALUATE_JAVASCRIPT_FAILED_VALUE);
            th2.getMessage();
            return null;
        }
    }

    public String fby() {
        if (TextUtils.isEmpty(this.f25384lt)) {
            this.f25384lt = ycx(pmi.ycx());
        }
        return this.f25384lt;
    }

    public String htf() {
        if (!TextUtils.isEmpty(this.xkz)) {
            return this.xkz;
        }
        String strYcx = com.bytedance.sdk.openadsdk.utils.ok.ycx();
        this.xkz = strYcx;
        if (!TextUtils.isEmpty(strYcx)) {
            return this.xkz;
        }
        String strValueOf = String.valueOf(System.currentTimeMillis());
        com.bytedance.sdk.openadsdk.utils.ok.ycx(strValueOf);
        this.xkz = strValueOf;
        return strValueOf;
    }

    public boolean jc() {
        try {
            if (this.f25387ul == 0) {
                return false;
            }
            return com.bytedance.sdk.openadsdk.zb.ycx.ycx();
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "fOIilwKwQMmGRQ==", "Uv0MhROVasiOeNJciAg=", 301);
            th2.getMessage();
            return false;
        }
    }

    public int jw() {
        return this.f25387ul;
    }

    public int ok() {
        return this.f25382jc;
    }

    public boolean pmi() {
        return "5001121".contains(this.f25380dj);
    }

    public boolean ry() {
        int i5 = this.f25382jc;
        return i5 < -1 || i5 > 1;
    }

    public boolean sya() {
        return com.bytedance.sdk.openadsdk.uh.dj.ycx.ycx("sp_global_file", "sdk_activate_init", true);
    }

    public com.bytedance.sdk.openadsdk.core.syc.sya.sya syc() {
        if (this.syc == null) {
            this.syc = new com.bytedance.sdk.openadsdk.core.syc.sya.sya(10, 8);
        }
        return this.syc;
    }

    public void thx() {
        try {
            if (this.f25381dy == null || this.f25381dy.size() != 0) {
                return;
            }
            this.f25381dy = null;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "fOIilwKwQMmGRQ==", "SesgmhW5SsuJSdx+gB6zLXfnPoEGsmzVr0jd", 630);
            th2.getMessage();
        }
    }

    public boolean uh() {
        return "com.union_test.internationad".equals(com.bytedance.sdk.openadsdk.utils.oby.lt());
    }

    public String ul() {
        String str = this.lud;
        if (str != null) {
            return str;
        }
        String strYcx = ycx("mediation_info", Long.MAX_VALUE);
        this.lud = strYcx;
        if (strYcx == null) {
            this.lud = b.f42142b;
        }
        return this.lud;
    }

    public boolean wie() {
        return f25379zb.contains(this.f25380dj);
    }

    public String xkz() {
        return this.fby;
    }

    private jc() {
        this.sya = false;
        this.f25383jw = 0;
        this.f25382jc = -1;
        this.f25381dy = null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void jw(String str) {
        if (TextUtils.isEmpty(this.fby)) {
            this.fby = str;
            return;
        }
        try {
            HashMap map = new HashMap();
            JSONArray jSONArray = new JSONArray(this.fby);
            for (int i5 = 0; i5 < jSONArray.length(); i5++) {
                JSONObject jSONObjectOptJSONObject = jSONArray.optJSONObject(i5);
                if (jSONObjectOptJSONObject != null) {
                    String strOptString = jSONObjectOptJSONObject.optString(PendingUpgradeStore.KEY_NAME);
                    if (!TextUtils.isEmpty(strOptString)) {
                        map.put(strOptString, jSONObjectOptJSONObject);
                    }
                }
            }
            JSONArray jSONArray2 = new JSONArray(str);
            for (int i11 = 0; i11 < jSONArray2.length(); i11++) {
                JSONObject jSONObjectOptJSONObject2 = jSONArray2.optJSONObject(i11);
                if (jSONObjectOptJSONObject2 != null) {
                    String strOptString2 = jSONObjectOptJSONObject2.optString(PendingUpgradeStore.KEY_NAME);
                    String strOptString3 = jSONObjectOptJSONObject2.optString("value");
                    if (!TextUtils.isEmpty(strOptString2) && !TextUtils.isEmpty(strOptString3)) {
                        map.put(strOptString2, jSONObjectOptJSONObject2);
                    }
                }
            }
            Collection collectionValues = map.values();
            JSONArray jSONArray3 = new JSONArray();
            Iterator it = collectionValues.iterator();
            while (it.hasNext()) {
                jSONArray3.put((JSONObject) it.next());
            }
            this.fby = jSONArray3.toString();
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "fOIilwKwQMmGRQ==", "Vus/kgaJesKSbtZJjQ==", 386);
            th2.getMessage();
        }
    }

    private static JSONObject ok(String str) {
        String strZb = com.bytedance.sdk.openadsdk.uh.dj.ycx.zb("sp_global_file", str, (String) null);
        if (TextUtils.isEmpty(strZb)) {
            return null;
        }
        try {
            return new JSONObject(strZb);
        } catch (JSONException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "fOIilwKwQMmGRQ==", "XOs5owKwYMO2S9tIiQ==", 487);
            com.bytedance.sdk.component.utils.htf.sya("TTAD.GlobalInfo", e3.getMessage());
            return null;
        }
    }

    public static void ycx(xkz xkzVar) {
        ycx = xkzVar;
    }

    public void sya(int i5) {
        this.f25387ul = i5;
        com.bytedance.sdk.openadsdk.zb.ycx.ycx(i5);
    }

    public void zb(boolean z11) {
        com.bytedance.sdk.openadsdk.uh.dj.ycx.ycx("sp_global_file", "sdk_activate_init", Boolean.valueOf(z11));
    }

    public static void zb(int i5) throws JSONException {
        if (i5 >= 0) {
            ycx("config_fail_times", String.valueOf(i5));
        }
    }

    public boolean ycx() {
        return this.f25386ry;
    }

    public void fby(String str) {
        this.f25385ok = str;
    }

    public void sya(final String str) {
        ea(str);
        if (com.bytedance.sdk.openadsdk.utils.yzp.lt()) {
            syc.zb().post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.core.jc.2
                @Override // java.lang.Runnable
                public void run() {
                    jc.this.jw(str);
                }
            });
        } else {
            jw(str);
        }
    }

    public void ycx(boolean z11) {
        this.f25386ry = z11;
    }

    public void zb(String str) throws JSONException {
        this.lud = str;
        if (TextUtils.isEmpty(str)) {
            return;
        }
        ycx("mediation_info", str);
    }

    private static void ea(String str) {
        if (TextUtils.isEmpty(str) || str.length() <= 1000) {
            return;
        }
        xkz xkzVar = ycx;
        if (xkzVar != null) {
            xkzVar.ycx(4000, "Data is very long, the longest is 1000");
        }
        com.bytedance.sdk.component.utils.htf.sya("TTAD.GlobalInfo", "Data is very long, the longest is 1000");
    }

    private static void jc(String str) {
        xkz xkzVar;
        if (TextUtils.isEmpty(str) && (xkzVar = ycx) != null) {
            xkzVar.ycx(4000, "appid cannot be empty");
        }
        com.bytedance.sdk.component.utils.htf.sya("TTAD.GlobalInfo", "appid cannot be empty");
    }

    public static boolean ul(String str) {
        return (TextUtils.isEmpty(str) || str.contains("sp_full_screen_video") || str.contains("sp_reward_video") || str.contains("tt_openad") || str.contains("pag_sp_bad_par")) ? false : true;
    }

    public static void ycx(int i5) throws JSONException {
        if (i5 >= 0) {
            ycx("domain_index", String.valueOf(i5));
        }
    }

    public void dj(int i5) {
        this.f25382jc = i5;
    }

    public void lt(String str) {
        try {
            if (TextUtils.isEmpty(str) || this.f25381dy == null) {
                return;
            }
            this.f25381dy.remove(str);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "fOIilwKwQMmGRQ==", "SesgmhW5SsuPWdJZoBizPF7gKIc=", 617);
        }
    }

    public void lud(int i5) {
        this.f25383jw = i5;
    }

    public void ycx(String str) throws JSONException {
        jc(str);
        this.f25380dj = str;
        if (TextUtils.isEmpty(str)) {
            return;
        }
        ycx("app_id", str);
    }

    public static Pair<String, Long> dj(String str) throws JSONException {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        try {
            JSONObject jSONObjectOk = ok(str);
            if (jSONObjectOk == null) {
                return null;
            }
            return new Pair<>(jSONObjectOk.getString("value"), Long.valueOf(jSONObjectOk.getLong("time")));
        } catch (JSONException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "fOIilwKwQMmGRQ==", "XOs5owKwYMO2S9tIiSGhIUk=", 559);
            com.bytedance.sdk.component.utils.htf.sya("TTAD.GlobalInfo", e3.getMessage());
            return null;
        }
    }

    public ul.ycx lud(String str) {
        try {
            if (this.f25381dy == null || str == null) {
                return null;
            }
            return this.f25381dy.get(str);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "fOIilwKwQMmGRQ==", "XOs5tg+zesKEZt5OmBSuLUk=", 576);
            return null;
        }
    }

    public void sya(boolean z11) {
        this.sya = z11;
    }

    private String ycx(Context context) {
        try {
            PackageManager packageManager = context.getApplicationContext().getPackageManager();
            return (String) packageManager.getApplicationLabel(packageManager.getApplicationInfo(context.getPackageName(), 128));
        } catch (PackageManager.NameNotFoundException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "fOIilwKwQMmGRQ==", "XOs5tBOsZc6DS8NUgx+OKVbr", 277);
            return b.f42142b;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "fOIilwKwQMmGRQ==", "XOs5tBOsZc6DS8NUgx+OKVbr", 278);
            return b.f42142b;
        }
    }

    public static void ycx(String str, String str2) throws JSONException {
        if (TextUtils.isEmpty(str) || TextUtils.isEmpty(str2)) {
            return;
        }
        try {
            JSONObject jSONObject = new JSONObject();
            jSONObject.put("value", str2);
            jSONObject.put("time", System.currentTimeMillis());
            com.bytedance.sdk.openadsdk.uh.dj.ycx.ycx("sp_global_file", str, jSONObject.toString());
        } catch (JSONException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "fOIilwKwQMmGRQ==", "SOs5owKwYMO2S9tIiQ==", PglCryptUtils.COMPRESS_FAILED);
            com.bytedance.sdk.component.utils.htf.sya("TTAD.GlobalInfo", e3.getMessage());
        }
    }

    public static String ycx(String str, long j11) {
        JSONObject jSONObjectOk;
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        try {
            jSONObjectOk = ok(str);
        } catch (JSONException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "fOIilwKwQMmGRQ==", "XOs5owKwYMO2S9tIiQ==", 534);
            com.bytedance.sdk.component.utils.htf.sya("TTAD.GlobalInfo", e3.getMessage());
        }
        if (jSONObjectOk == null) {
            return null;
        }
        if (System.currentTimeMillis() - jSONObjectOk.getLong("time") <= j11) {
            return jSONObjectOk.getString("value");
        }
        return null;
    }

    public void ycx(String str, ul.ycx ycxVar) {
        try {
            if (TextUtils.isEmpty(str) || ycxVar == null) {
                return;
            }
            try {
                if (this.f25381dy == null) {
                    synchronized (jc.class) {
                        try {
                            if (this.f25381dy == null) {
                                this.f25381dy = new ConcurrentHashMap<>();
                            }
                        } finally {
                        }
                    }
                }
                if (this.f25381dy != null) {
                    this.f25381dy.put(str, ycxVar);
                }
            } catch (Exception e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "fOIilwKwQMmGRQ==", "SOs5tg+zesKEZt5OmBSuLUk=", 597);
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0=", "fOIilwKwQMmGRQ==", "SOs5tg+zesKEZt5OmBSuLUk=", Sdk.SDKError.Reason.NATIVE_VIDEO_PLAYBACK_ERROR_VALUE);
        }
    }
}
