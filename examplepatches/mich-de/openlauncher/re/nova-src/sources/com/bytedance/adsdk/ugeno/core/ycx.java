package com.bytedance.adsdk.ugeno.core;

import android.content.Context;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import com.tiktok.util.TTConst;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ycx {

    /* renamed from: dj, reason: collision with root package name */
    private long f22244dj;

    /* renamed from: lt, reason: collision with root package name */
    private String f22245lt;
    private long lud;
    private List<C0013ycx> sya;
    private String ycx;

    /* renamed from: zb, reason: collision with root package name */
    private float f22246zb;

    /* renamed from: com.bytedance.adsdk.ugeno.core.ycx$ycx, reason: collision with other inner class name */
    public static class C0013ycx {

        /* renamed from: dj, reason: collision with root package name */
        private long f22247dj;
        private float[] fby;

        /* renamed from: jc, reason: collision with root package name */
        private String f22248jc;

        /* renamed from: jw, reason: collision with root package name */
        private String f22249jw;

        /* renamed from: lt, reason: collision with root package name */
        private float f22250lt;
        private String lud;
        private String sya;

        /* renamed from: ul, reason: collision with root package name */
        private float f22251ul;
        private long ycx;

        /* renamed from: zb, reason: collision with root package name */
        private float f22252zb;

        public long dj() {
            return this.f22247dj;
        }

        public float[] fby() {
            return this.fby;
        }

        public String jc() {
            return this.f22248jc;
        }

        public String jw() {
            return this.f22249jw;
        }

        public float lt() {
            return this.f22250lt;
        }

        public String lud() {
            return this.lud;
        }

        public String sya() {
            return this.sya;
        }

        public float ul() {
            return this.f22251ul;
        }

        public long ycx() {
            return this.ycx;
        }

        public float zb() {
            return this.f22252zb;
        }

        public void dj(String str) {
            this.f22249jw = str;
        }

        public void sya(float f11) {
            this.f22251ul = f11;
        }

        public void ycx(long j11) {
            this.ycx = j11;
        }

        public void zb(long j11) {
            this.f22247dj = j11;
        }

        public void sya(String str) {
            this.f22248jc = str;
        }

        public void ycx(float f11) {
            this.f22252zb = f11;
        }

        public void zb(String str) {
            this.lud = str;
        }

        public void ycx(String str) {
            this.sya = str;
        }

        public void zb(float f11) {
            this.f22250lt = f11;
        }

        public void ycx(float[] fArr) {
            this.fby = fArr;
        }

        public static C0013ycx ycx(JSONObject jSONObject, com.bytedance.adsdk.ugeno.zb.sya syaVar) {
            if (jSONObject == null) {
                return null;
            }
            C0013ycx c0013ycx = new C0013ycx();
            c0013ycx.ycx(jSONObject.optLong("duration"));
            String strOptString = jSONObject.optString("loop");
            if (TextUtils.equals("infinite", strOptString)) {
                c0013ycx.ycx(-1.0f);
            } else {
                try {
                    c0013ycx.ycx(Float.parseFloat(strOptString));
                } catch (NumberFormatException unused) {
                    c0013ycx.ycx(0.0f);
                }
            }
            c0013ycx.ycx(jSONObject.optString("loopMode"));
            c0013ycx.zb(jSONObject.optString(TTConst.TRACK_TYPE));
            if (TextUtils.equals(c0013ycx.lud(), "ripple")) {
                c0013ycx.sya(jSONObject.optString("rippleColor"));
            }
            View viewEa = syaVar.ea();
            Context context = viewEa != null ? viewEa.getContext() : null;
            if (TextUtils.equals(c0013ycx.lud(), "backgroundColor")) {
                String strYcx = com.bytedance.adsdk.ugeno.dj.zb.ycx(jSONObject.optString("valueTo"), syaVar.ok());
                int iYcx = com.bytedance.adsdk.ugeno.fby.ycx.ycx(jSONObject.optString("valueFrom"));
                int iYcx2 = com.bytedance.adsdk.ugeno.fby.ycx.ycx(strYcx);
                c0013ycx.zb(iYcx);
                c0013ycx.sya(iYcx2);
            } else if ((TextUtils.equals(c0013ycx.lud(), "translateX") || TextUtils.equals(c0013ycx.lud(), "translateY")) && context != null) {
                try {
                    float fYcx = com.bytedance.adsdk.ugeno.fby.fby.ycx(context, (float) jSONObject.optDouble("valueFrom"));
                    float fYcx2 = com.bytedance.adsdk.ugeno.fby.fby.ycx(context, (float) jSONObject.optDouble("valueTo"));
                    c0013ycx.zb(fYcx);
                    c0013ycx.sya(fYcx2);
                } catch (Exception unused2) {
                    Log.e("animation", "animation ");
                }
            } else {
                c0013ycx.zb((float) jSONObject.optDouble("valueFrom"));
                c0013ycx.sya((float) jSONObject.optDouble("valueTo"));
            }
            c0013ycx.dj(jSONObject.optString("interpolator"));
            c0013ycx.zb(com.bytedance.adsdk.ugeno.fby.sya.ycx(com.bytedance.adsdk.ugeno.dj.zb.ycx(jSONObject.optString("startDelay"), syaVar.ok()), 0L));
            JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray("values");
            if (jSONArrayOptJSONArray != null && jSONArrayOptJSONArray.length() > 0) {
                float[] fArr = new float[jSONArrayOptJSONArray.length()];
                int i5 = 0;
                if ((TextUtils.equals(c0013ycx.lud(), "translateX") || TextUtils.equals(c0013ycx.lud(), "translateY")) && context != null) {
                    while (i5 < jSONArrayOptJSONArray.length()) {
                        fArr[i5] = com.bytedance.adsdk.ugeno.fby.fby.ycx(context, (float) ycx.ycx(jSONArrayOptJSONArray.optString(i5), syaVar.ok()));
                        i5++;
                    }
                } else {
                    while (i5 < jSONArrayOptJSONArray.length()) {
                        fArr[i5] = (float) ycx.ycx(jSONArrayOptJSONArray.optString(i5), syaVar.ok());
                        i5++;
                    }
                }
                c0013ycx.ycx(fArr);
            }
            return c0013ycx;
        }
    }

    public long dj() {
        return this.f22244dj;
    }

    public String lt() {
        return this.f22245lt;
    }

    public long lud() {
        return this.lud;
    }

    public List<C0013ycx> sya() {
        return this.sya;
    }

    public String ycx() {
        return this.ycx;
    }

    public float zb() {
        return this.f22246zb;
    }

    public void ycx(String str) {
        this.ycx = str;
    }

    public void zb(long j11) {
        this.lud = j11;
    }

    public void ycx(float f11) {
        this.f22246zb = f11;
    }

    public void zb(String str) {
        this.f22245lt = str;
    }

    public void ycx(List<C0013ycx> list) {
        this.sya = list;
    }

    public void ycx(long j11) {
        this.f22244dj = j11;
    }

    public static ycx ycx(String str, com.bytedance.adsdk.ugeno.zb.sya syaVar) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        try {
            return ycx(new JSONObject(str), syaVar);
        } catch (JSONException unused) {
            return null;
        }
    }

    public static ycx ycx(JSONObject jSONObject, com.bytedance.adsdk.ugeno.zb.sya syaVar) {
        return ycx(jSONObject, null, syaVar);
    }

    public static ycx ycx(JSONObject jSONObject, JSONObject jSONObject2, com.bytedance.adsdk.ugeno.zb.sya syaVar) throws JSONException {
        if (jSONObject == null) {
            return null;
        }
        ycx ycxVar = new ycx();
        ycxVar.ycx(jSONObject.optString("ordering"));
        String strOptString = jSONObject.optString("loop");
        if (TextUtils.equals("infinite", strOptString)) {
            ycxVar.ycx(-1.0f);
        } else {
            try {
                ycxVar.ycx(Float.parseFloat(strOptString));
            } catch (NumberFormatException unused) {
                ycxVar.ycx(0.0f);
            }
        }
        ycxVar.ycx(jSONObject.optLong("duration", 0L));
        ycxVar.zb(com.bytedance.adsdk.ugeno.fby.sya.ycx(com.bytedance.adsdk.ugeno.dj.zb.ycx(jSONObject.optString("startDelay"), syaVar.ok()), 0L));
        ycxVar.zb(jSONObject.optString("loopMode"));
        JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray("animators");
        if (jSONArrayOptJSONArray != null) {
            ArrayList arrayList = new ArrayList();
            for (int i5 = 0; i5 < jSONArrayOptJSONArray.length(); i5++) {
                JSONObject jSONObjectOptJSONObject = jSONArrayOptJSONArray.optJSONObject(i5);
                if (jSONObject2 != null) {
                    com.bytedance.adsdk.ugeno.fby.zb.ycx(jSONObject2, jSONObjectOptJSONObject);
                }
                arrayList.add(C0013ycx.ycx(jSONObjectOptJSONObject, syaVar));
            }
            ycxVar.ycx(arrayList);
        }
        return ycxVar;
    }

    public static double ycx(Object obj, JSONObject jSONObject) {
        if (obj instanceof String) {
            return com.bytedance.adsdk.ugeno.fby.sya.ycx(com.bytedance.adsdk.ugeno.dj.zb.ycx((String) obj, jSONObject), 0.0d);
        }
        if (obj instanceof Double) {
            return ((Double) obj).doubleValue();
        }
        if (obj instanceof Long) {
            return ((Double) obj).doubleValue();
        }
        if (obj instanceof Integer) {
            return ((Double) obj).doubleValue();
        }
        return 0.0d;
    }
}
