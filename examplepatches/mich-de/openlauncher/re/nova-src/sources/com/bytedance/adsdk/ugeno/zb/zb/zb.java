package com.bytedance.adsdk.ugeno.zb.zb;

import android.content.Context;
import android.text.TextUtils;
import com.bytedance.adsdk.ugeno.fby.fby;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public final class zb {
    private final sya ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final List<dj> f22777zb;

    public static final class dj {

        /* renamed from: dj, reason: collision with root package name */
        public final float f22778dj;

        /* renamed from: ea, reason: collision with root package name */
        public final float f22779ea;
        public final float fby;

        /* renamed from: jc, reason: collision with root package name */
        public final float f22780jc;

        /* renamed from: jw, reason: collision with root package name */
        public final float f22781jw;

        /* renamed from: lt, reason: collision with root package name */
        public final float f22782lt;
        public final float lud;

        /* renamed from: ok, reason: collision with root package name */
        public final ycx f22783ok;
        public final float sya;

        /* renamed from: ul, reason: collision with root package name */
        public final float f22784ul;
        public final String ycx;

        /* renamed from: zb, reason: collision with root package name */
        public final float f22785zb;

        private dj(String str, float f11, float f12, float f13, float f14, float f15, float f16, float f17, float f18, float f19, float f21, ycx ycxVar) {
            this.ycx = str;
            this.f22785zb = f11;
            this.sya = f12;
            this.f22778dj = f13;
            this.lud = f14;
            this.f22782lt = f15;
            this.f22784ul = f16;
            this.fby = f17;
            this.f22781jw = f18;
            this.f22780jc = f19;
            this.f22779ea = f21;
            this.f22783ok = ycxVar;
        }

        public static dj ycx(Context context, JSONObject jSONObject) {
            return new dj(jSONObject.optString(PendingUpgradeStore.KEY_NAME, b.f42142b), (float) jSONObject.optDouble("birthRate", 1.0d), (float) jSONObject.optDouble("lifetime", 1.0d), (float) jSONObject.optDouble("lifetimeRange", 0.0d), (float) jSONObject.optDouble("scale", 1.0d), (float) jSONObject.optDouble("scaleRange", 0.0d), (float) jSONObject.optDouble("velocity", 0.0d), (float) jSONObject.optDouble("velocityRange", 0.0d), (float) jSONObject.optDouble("emissionRange", 0.0d), (float) jSONObject.optDouble("alphaRange", 0.0d), (float) jSONObject.optDouble("alphaSpeed", 0.0d), ycx.ycx(context, jSONObject.optJSONObject("content")));
        }
    }

    public static final class ycx {

        /* renamed from: dj, reason: collision with root package name */
        public final float f22792dj;
        public final int lud;
        public final float sya;
        public final String ycx;

        /* renamed from: zb, reason: collision with root package name */
        public final int f22793zb;

        private ycx(String str, float f11, float f12, int i5) {
            this.ycx = str;
            this.f22793zb = zb.sya(str);
            this.sya = f11;
            this.f22792dj = f12;
            this.lud = i5;
        }

        public static ycx ycx(Context context, JSONObject jSONObject) {
            return jSONObject == null ? new ycx("circle", fby.ycx(context, 6.0f), fby.ycx(context, 6.0f), -1) : new ycx(jSONObject.optString("shape", "circle"), fby.ycx(context, (float) jSONObject.optDouble("width", 6.0d)), fby.ycx(context, (float) jSONObject.optDouble("height", 6.0d)), com.bytedance.adsdk.ugeno.fby.ycx.ycx(jSONObject.optString("color", "#FFFFFF"), -1));
        }
    }

    private zb(sya syaVar, List<dj> list) {
        this.ycx = syaVar;
        this.f22777zb = list;
    }

    public static int dj(String str) {
        if ("additive".equals(str)) {
            return 1;
        }
        if ("backToFront".equals(str) || "oldestFirst".equals(str)) {
            return 3;
        }
        return "oldestLast".equals(str) ? 4 : 0;
    }

    public static int sya(String str) {
        if ("rect".equals(str)) {
            return 1;
        }
        return "star".equals(str) ? 2 : 0;
    }

    public static int ycx(String str) {
        if ("line".equals(str)) {
            return 1;
        }
        if ("rectangle".equals(str)) {
            return 2;
        }
        if ("circle".equals(str)) {
            return 3;
        }
        return "sphere".equals(str) ? 4 : 0;
    }

    public static int zb(String str) {
        if ("outline".equals(str)) {
            return 1;
        }
        return "surface".equals(str) ? 2 : 0;
    }

    public boolean sya() {
        List<dj> list = this.f22777zb;
        return (list == null || list.isEmpty()) ? false : true;
    }

    public List<dj> zb() {
        return this.f22777zb;
    }

    public sya ycx() {
        return this.ycx;
    }

    public static zb ycx(Context context, String str) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        try {
            return ycx(context, new JSONObject(str));
        } catch (Exception unused) {
            return null;
        }
    }

    /* renamed from: com.bytedance.adsdk.ugeno.zb.zb.zb$zb, reason: collision with other inner class name */
    public static final class C0025zb {
        public final float ycx;

        /* renamed from: zb, reason: collision with root package name */
        public final boolean f22794zb;

        public C0025zb(float f11, boolean z11) {
            this.ycx = f11;
            this.f22794zb = z11;
        }

        public static C0025zb ycx(Object obj, C0025zb c0025zb) {
            if (obj != null) {
                if (obj instanceof Number) {
                    return new C0025zb(((Number) obj).floatValue(), false);
                }
                String strTrim = obj.toString().trim();
                if (!TextUtils.isEmpty(strTrim)) {
                    try {
                        return strTrim.endsWith("%") ? new C0025zb(Float.parseFloat(strTrim.substring(0, strTrim.length() - 1)) / 100.0f, true) : new C0025zb(Float.parseFloat(strTrim), false);
                    } catch (NumberFormatException unused) {
                    }
                }
            }
            return c0025zb;
        }

        public float ycx(float f11) {
            return this.f22794zb ? f11 * this.ycx : this.ycx;
        }
    }

    public static zb ycx(Context context, JSONObject jSONObject) {
        if (jSONObject == null) {
            return null;
        }
        sya syaVarYcx = sya.ycx(jSONObject.optJSONObject("layer"));
        List<dj> listYcx = ycx(context, jSONObject.optJSONArray("particles"));
        if (listYcx.isEmpty()) {
            return null;
        }
        return new zb(syaVarYcx, listYcx);
    }

    public static final class sya {

        /* renamed from: dj, reason: collision with root package name */
        public final int f22786dj;
        public final C0025zb fby;

        /* renamed from: jc, reason: collision with root package name */
        public final C0025zb f22787jc;

        /* renamed from: jw, reason: collision with root package name */
        public final C0025zb f22788jw;

        /* renamed from: lt, reason: collision with root package name */
        public final int f22789lt;
        public final int lud;
        public final String sya;

        /* renamed from: ul, reason: collision with root package name */
        public final C0025zb f22790ul;
        public final String ycx;

        /* renamed from: zb, reason: collision with root package name */
        public final String f22791zb;

        private sya(String str, String str2, String str3, C0025zb c0025zb, C0025zb c0025zb2, C0025zb c0025zb3, C0025zb c0025zb4) {
            this.ycx = str;
            this.f22791zb = str2;
            this.sya = str3;
            this.f22786dj = zb.ycx(str);
            this.lud = zb.zb(str2);
            this.f22789lt = zb.dj(str3);
            this.f22790ul = c0025zb;
            this.fby = c0025zb2;
            this.f22788jw = c0025zb3;
            this.f22787jc = c0025zb4;
        }

        public static sya ycx(JSONObject jSONObject) {
            if (jSONObject == null) {
                return ycx();
            }
            String strOptString = jSONObject.optString("emitterShape", "point");
            String strOptString2 = jSONObject.optString("emitterMode", "points");
            String strOptString3 = jSONObject.optString("renderMode", "unordered");
            JSONObject jSONObjectOptJSONObject = jSONObject.optJSONObject("emitterPosition");
            C0025zb c0025zbYcx = C0025zb.ycx(jSONObjectOptJSONObject != null ? jSONObjectOptJSONObject.opt("x") : null, new C0025zb(0.5f, true));
            C0025zb c0025zbYcx2 = C0025zb.ycx(jSONObjectOptJSONObject != null ? jSONObjectOptJSONObject.opt("y") : null, new C0025zb(0.0f, true));
            JSONObject jSONObjectOptJSONObject2 = jSONObject.optJSONObject("emitterSize");
            return new sya(strOptString, strOptString2, strOptString3, c0025zbYcx, c0025zbYcx2, C0025zb.ycx(jSONObjectOptJSONObject2 != null ? jSONObjectOptJSONObject2.opt("w") : null, new C0025zb(1.0f, true)), C0025zb.ycx(jSONObjectOptJSONObject2 != null ? jSONObjectOptJSONObject2.opt("h") : null, new C0025zb(1.0f, true)));
        }

        private static sya ycx() {
            return new sya("point", "points", "unordered", new C0025zb(0.5f, true), new C0025zb(0.0f, true), new C0025zb(1.0f, true), new C0025zb(1.0f, true));
        }
    }

    private static List<dj> ycx(Context context, JSONArray jSONArray) {
        if (jSONArray != null && jSONArray.length() != 0) {
            ArrayList arrayList = new ArrayList(jSONArray.length());
            for (int i5 = 0; i5 < jSONArray.length(); i5++) {
                JSONObject jSONObjectOptJSONObject = jSONArray.optJSONObject(i5);
                if (jSONObjectOptJSONObject != null) {
                    arrayList.add(dj.ycx(context, jSONObjectOptJSONObject));
                }
            }
            return arrayList;
        }
        return Collections.EMPTY_LIST;
    }
}
