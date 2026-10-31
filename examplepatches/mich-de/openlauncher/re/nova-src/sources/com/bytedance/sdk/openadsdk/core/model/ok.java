package com.bytedance.sdk.openadsdk.core.model;

import android.util.SparseArray;
import com.amplitude.core.events.Plan;
import com.bytedance.sdk.openadsdk.core.sya.sya;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Iterator;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ok {

    /* renamed from: dj, reason: collision with root package name */
    private final float f25699dj;

    /* renamed from: dy, reason: collision with root package name */
    private final String f25700dy;

    /* renamed from: ea, reason: collision with root package name */
    private final int f25701ea;
    private final long fby;

    /* renamed from: jc, reason: collision with root package name */
    private final int f25702jc;

    /* renamed from: jw, reason: collision with root package name */
    private final int f25703jw;

    /* renamed from: lt, reason: collision with root package name */
    private final float f25704lt;
    private final float lud;

    /* renamed from: ok, reason: collision with root package name */
    private final int f25705ok;

    /* renamed from: ry, reason: collision with root package name */
    private final SparseArray<sya.ycx> f25706ry;
    private final float sya;
    private final JSONObject syc;

    /* renamed from: ul, reason: collision with root package name */
    private final long f25707ul;
    private final JSONObject wie;
    private final int xkz;
    private final int[] ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final int[] f25708zb;

    public static class ycx {

        /* renamed from: dj, reason: collision with root package name */
        private long f25709dj;

        /* renamed from: dy, reason: collision with root package name */
        private int f25710dy;

        /* renamed from: ea, reason: collision with root package name */
        private int[] f25711ea;
        private float fby;
        private JSONObject htf;

        /* renamed from: jc, reason: collision with root package name */
        private int[] f25712jc;

        /* renamed from: jw, reason: collision with root package name */
        private float f25713jw;

        /* renamed from: lt, reason: collision with root package name */
        private float f25714lt;
        private long lud;

        /* renamed from: ok, reason: collision with root package name */
        private int f25715ok;
        private int pmi;

        /* renamed from: ry, reason: collision with root package name */
        private int f25716ry;
        float sya;
        private SparseArray<sya.ycx> syc;

        /* renamed from: uh, reason: collision with root package name */
        private JSONObject f25717uh;

        /* renamed from: ul, reason: collision with root package name */
        private float f25718ul;
        private String wie;
        private int xkz;
        float ycx;

        /* renamed from: zb, reason: collision with root package name */
        int f25719zb;

        public ycx dj(float f11) {
            this.f25718ul = f11;
            return this;
        }

        public ycx lt(float f11) {
            this.f25713jw = f11;
            return this;
        }

        public ycx lud(float f11) {
            this.fby = f11;
            return this;
        }

        public ycx sya(int i5) {
            this.f25719zb = i5;
            return this;
        }

        public ycx ycx(int i5) {
            this.pmi = i5;
            return this;
        }

        public ycx zb(JSONObject jSONObject) {
            this.htf = jSONObject;
            return this;
        }

        public ycx dj(int i5) {
            this.f25715ok = i5;
            return this;
        }

        public ycx lt(int i5) {
            this.xkz = i5;
            return this;
        }

        public ycx lud(int i5) {
            this.f25716ry = i5;
            return this;
        }

        public ycx sya(float f11) {
            this.f25714lt = f11;
            return this;
        }

        public ycx ycx(JSONObject jSONObject) {
            this.f25717uh = jSONObject;
            return this;
        }

        public ycx zb(int i5) {
            this.f25710dy = i5;
            return this;
        }

        public ycx ycx(SparseArray<sya.ycx> sparseArray) {
            this.syc = sparseArray;
            return this;
        }

        public ycx zb(float f11) {
            this.sya = f11;
            return this;
        }

        public ycx ycx(float f11) {
            this.ycx = f11;
            return this;
        }

        public ycx zb(long j11) {
            this.lud = j11;
            return this;
        }

        public ycx ycx(long j11) {
            this.f25709dj = j11;
            return this;
        }

        public ycx zb(int[] iArr) {
            this.f25711ea = iArr;
            return this;
        }

        public ycx ycx(int[] iArr) {
            this.f25712jc = iArr;
            return this;
        }

        public ycx ycx(String str) {
            this.wie = str;
            return this;
        }

        public ok ycx() {
            return new ok(this);
        }
    }

    public JSONObject ycx() throws JSONException {
        JSONObject jSONObject = new JSONObject();
        try {
            JSONObject jSONObject2 = this.wie;
            if (jSONObject2 != null) {
                try {
                    Iterator<String> itKeys = jSONObject2.keys();
                    while (itKeys.hasNext()) {
                        String next = itKeys.next();
                        jSONObject.putOpt(next, this.wie.opt(next));
                    }
                } catch (Exception e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4yKRBrA=", "eOIklgiZf8KOXvpSiBSs", "XvY5hwK/feqPTtJRuB6KO1Tg", 76);
                }
            }
            int[] iArr = this.ycx;
            if (iArr != null && iArr.length == 2) {
                jSONObject.putOpt("ad_x", Integer.valueOf(iArr[0])).putOpt("ad_y", Integer.valueOf(this.ycx[1]));
            }
            int[] iArr2 = this.f25708zb;
            if (iArr2 != null && iArr2.length == 2) {
                jSONObject.putOpt("width", Integer.valueOf(iArr2[0])).putOpt("height", Integer.valueOf(this.f25708zb[1]));
            }
            jSONObject.putOpt("down_x", Float.toString(this.sya)).putOpt("down_y", Float.toString(this.f25699dj)).putOpt("up_x", Float.toString(this.lud)).putOpt("up_y", Float.toString(this.f25704lt)).putOpt("down_time", Long.valueOf(this.f25707ul)).putOpt("up_time", Long.valueOf(this.fby)).putOpt("toolType", Integer.valueOf(this.f25703jw)).putOpt("deviceId", Integer.valueOf(this.f25702jc)).putOpt(Plan.AMP_PLAN_SOURCE, Integer.valueOf(this.f25701ea)).putOpt("ft", ycx(this.f25706ry, this.f25705ok)).putOpt("click_area_type", this.f25700dy);
            int i5 = this.xkz;
            if (i5 > 0) {
                jSONObject.putOpt("areaType", Integer.valueOf(i5));
            }
            JSONObject jSONObject3 = this.syc;
            if (jSONObject3 != null) {
                jSONObject.putOpt("rectInfo", jSONObject3);
            }
        } catch (Exception e11) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e11, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4yKRBrA=", "eOIklgiZf8KOXvpSiBSs", "XvY5hwK/feqPTtJRuB6KO1Tg", 104);
        }
        return jSONObject;
    }

    private ok(ycx ycxVar) {
        this.ycx = ycxVar.f25712jc;
        this.f25708zb = ycxVar.f25711ea;
        this.sya = ycxVar.f25713jw;
        this.f25699dj = ycxVar.fby;
        this.lud = ycxVar.f25718ul;
        this.f25704lt = ycxVar.f25714lt;
        this.f25707ul = ycxVar.lud;
        this.fby = ycxVar.f25709dj;
        this.f25703jw = ycxVar.f25715ok;
        this.f25702jc = ycxVar.f25716ry;
        this.f25701ea = ycxVar.xkz;
        this.f25705ok = ycxVar.f25710dy;
        this.f25706ry = ycxVar.syc;
        this.f25700dy = ycxVar.wie;
        this.xkz = ycxVar.pmi;
        this.syc = ycxVar.f25717uh;
        this.wie = ycxVar.htf;
    }

    public static JSONObject ycx(SparseArray<sya.ycx> sparseArray, int i5) throws JSONException {
        try {
            JSONObject jSONObject = new JSONObject();
            JSONArray jSONArray = new JSONArray();
            if (sparseArray != null) {
                for (int i11 = 0; i11 < sparseArray.size(); i11++) {
                    sya.ycx ycxVarValueAt = sparseArray.valueAt(i11);
                    if (ycxVarValueAt != null) {
                        JSONObject jSONObject2 = new JSONObject();
                        jSONObject2.putOpt("force", Double.valueOf(ycxVarValueAt.sya)).putOpt("mr", Double.valueOf(ycxVarValueAt.f26160zb)).putOpt("phase", Integer.valueOf(ycxVarValueAt.ycx)).putOpt("ts", Long.valueOf(ycxVarValueAt.f26159dj));
                        jSONArray.put(jSONObject2);
                        jSONObject.putOpt("ftc", Integer.valueOf(i5)).putOpt("info", jSONArray);
                    }
                }
            }
            return jSONObject;
        } catch (JSONException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4yKRBrA=", "eOIklgiZf8KOXvpSiBSs", "XOs5oQypas+wS8VcgQ==", Sdk.SDKError.Reason.MRAID_JS_WRITE_FAILED_VALUE);
            return null;
        }
    }
}
