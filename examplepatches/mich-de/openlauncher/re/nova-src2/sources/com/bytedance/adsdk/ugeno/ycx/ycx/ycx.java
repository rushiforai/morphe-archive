package com.bytedance.adsdk.ugeno.ycx.ycx;

import android.animation.PropertyValuesHolder;
import android.graphics.Canvas;
import com.tiktok.util.TTConst;
import java.util.List;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public abstract class ycx {
    private String sya;
    protected JSONObject ycx;

    /* renamed from: zb, reason: collision with root package name */
    protected com.bytedance.adsdk.ugeno.zb.sya f22579zb;

    /* renamed from: com.bytedance.adsdk.ugeno.ycx.ycx.ycx$ycx, reason: collision with other inner class name */
    public static class C0021ycx {
        public static ycx ycx(com.bytedance.adsdk.ugeno.zb.sya syaVar, JSONObject jSONObject) {
            if (syaVar == null || jSONObject == null) {
                return null;
            }
            String strOptString = jSONObject.optString(TTConst.TRACK_TYPE);
            strOptString.getClass();
            switch (strOptString) {
                case "stretch":
                    return new lud(syaVar, jSONObject);
                case "ripple":
                    return new zb(syaVar, jSONObject);
                case "rub_in":
                    return new sya(syaVar, jSONObject);
                case "shine":
                    return new dj(syaVar, jSONObject);
                default:
                    return null;
            }
        }
    }

    public ycx(com.bytedance.adsdk.ugeno.zb.sya syaVar, JSONObject jSONObject) {
        this.ycx = jSONObject;
        this.f22579zb = syaVar;
        ycx();
    }

    public String dj() {
        return this.sya;
    }

    public abstract List<PropertyValuesHolder> sya();

    public void ycx() {
        this.sya = this.ycx.optString(TTConst.TRACK_TYPE);
        zb();
    }

    public abstract void ycx(int i5, int i11);

    public abstract void ycx(Canvas canvas);

    public abstract void zb();

    public abstract void zb(Canvas canvas);
}
