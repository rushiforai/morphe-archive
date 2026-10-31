package com.bytedance.sdk.openadsdk.dj;

import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ul {

    /* renamed from: dj, reason: collision with root package name */
    private long f26693dj;
    private long lud;
    private long sya;
    private long ycx;

    /* renamed from: zb, reason: collision with root package name */
    private long f26694zb;

    public void dj(long j11) {
        if (this.f26693dj <= 0) {
            this.f26693dj = j11;
        }
    }

    public void lud(long j11) {
        if (this.lud <= 0) {
            this.lud = j11;
        }
    }

    public void sya(long j11) {
        if (this.sya <= 0) {
            this.sya = j11;
        }
    }

    public void ycx(long j11) {
        if (this.ycx <= 0) {
            this.ycx = j11;
        }
    }

    public void zb(long j11) {
        if (this.f26694zb <= 0) {
            this.f26694zb = j11;
        }
    }

    public boolean ycx() {
        return this.ycx > 0;
    }

    public JSONObject zb() {
        return ycx((JSONObject) null);
    }

    public void ycx(long j11, float f11) {
        if (f11 > 0.0f) {
            ycx(j11);
        }
        double d5 = f11;
        if (d5 >= 0.25d) {
            ycx(j11);
            zb(j11);
        }
        if (d5 >= 0.5d) {
            ycx(j11);
            zb(j11);
            sya(j11);
        }
        if (d5 >= 0.75d) {
            ycx(j11);
            zb(j11);
            sya(j11);
            dj(j11);
        }
        if (f11 >= 1.0f) {
            ycx(j11);
            zb(j11);
            sya(j11);
            dj(j11);
            lud(j11);
        }
    }

    public JSONObject ycx(JSONObject jSONObject) throws JSONException {
        if (jSONObject == null) {
            try {
                jSONObject = new JSONObject();
            } catch (Exception e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4kHpSZP", "euoenQyrXc6NTw==", "XOs5tAePYciXft5QiQ==", 143);
                return jSONObject;
            }
        }
        long j11 = this.ycx;
        if (j11 > 0) {
            jSONObject.put("show_start", j11);
            long j12 = this.f26694zb;
            if (j12 > 0) {
                jSONObject.put("show_firstQuartile", j12);
                long j13 = this.sya;
                if (j13 > 0) {
                    jSONObject.put("show_mid", j13);
                    long j14 = this.f26693dj;
                    if (j14 > 0) {
                        jSONObject.put("show_thirdQuartile", j14);
                        long j15 = this.lud;
                        if (j15 > 0) {
                            jSONObject.put("show_full", j15);
                        }
                    }
                }
            }
        }
        return jSONObject;
    }
}
