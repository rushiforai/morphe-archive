package com.bytedance.adsdk.ugeno.zb.ycx;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.view.View;
import com.bytedance.adsdk.ugeno.fby.fby;
import com.bytedance.adsdk.ugeno.fby.ycx;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ycx {

    /* renamed from: dj, reason: collision with root package name */
    private int f22706dj;
    private int fby;

    /* renamed from: jw, reason: collision with root package name */
    private zb f22707jw;

    /* renamed from: lt, reason: collision with root package name */
    private float f22708lt;
    private ycx.C0015ycx lud;
    private int sya;

    /* renamed from: ul, reason: collision with root package name */
    private float f22709ul;
    private ycx.C0015ycx ycx;

    /* renamed from: zb, reason: collision with root package name */
    private ycx.C0015ycx f22710zb;

    public void dj() {
        zb zbVar = this.f22707jw;
        if (zbVar != null) {
            zbVar.zb();
        }
    }

    public void sya() {
        zb zbVar = this.f22707jw;
        if (zbVar == null || !zbVar.sya()) {
            return;
        }
        this.f22707jw.ycx();
    }

    public void ycx(String str) {
        if (com.bytedance.adsdk.ugeno.fby.ycx.sya(str)) {
            this.ycx = com.bytedance.adsdk.ugeno.fby.ycx.zb(str);
        }
    }

    public void zb(String str) {
        try {
            JSONObject jSONObject = new JSONObject(str);
            String strOptString = jSONObject.optString("gradient", null);
            if (strOptString == null || !com.bytedance.adsdk.ugeno.fby.ycx.sya(strOptString)) {
                return;
            }
            this.f22710zb = com.bytedance.adsdk.ugeno.fby.ycx.zb(strOptString);
            this.sya = jSONObject.optInt("duration", 2200);
            this.f22706dj = jSONObject.optInt("playCount", -1);
        } catch (JSONException unused) {
        }
    }

    public void ycx(String str, Context context) {
        try {
            JSONObject jSONObject = new JSONObject(str);
            String strOptString = jSONObject.optString("gradient", null);
            if (strOptString == null || !com.bytedance.adsdk.ugeno.fby.ycx.sya(strOptString)) {
                return;
            }
            this.lud = com.bytedance.adsdk.ugeno.fby.ycx.zb(strOptString);
            this.f22708lt = fby.ycx(context, (float) jSONObject.optDouble("width", 76.0d));
            this.f22709ul = (float) jSONObject.optDouble("opacity", 0.9d);
            this.fby = jSONObject.optInt("steps", 24);
        } catch (JSONException unused) {
        }
    }

    public boolean zb() {
        return (this.ycx == null && this.f22710zb == null && this.lud == null) ? false : true;
    }

    public boolean ycx() {
        return (this.ycx == null && this.f22710zb == null) ? false : true;
    }

    public void ycx(View view, Drawable drawable, float f11, float[] fArr) {
        int[] iArr;
        float[] fArr2;
        int[] iArr2;
        float[] fArr3;
        boolean z11 = ycx() && f11 > 0.0f;
        ycx.C0015ycx c0015ycx = this.lud;
        boolean z12 = c0015ycx != null;
        if (!z11 && !z12) {
            this.f22707jw = null;
            view.setBackground(drawable);
            return;
        }
        if (z11) {
            ycx.C0015ycx c0015ycx2 = this.f22710zb;
            if (c0015ycx2 != null) {
                iArr2 = c0015ycx2.f22286zb;
                fArr3 = c0015ycx2.sya;
            } else {
                ycx.C0015ycx c0015ycx3 = this.ycx;
                iArr2 = c0015ycx3.f22286zb;
                fArr3 = c0015ycx3.sya;
            }
            fArr2 = fArr3;
            iArr = iArr2;
        } else {
            iArr = null;
            fArr2 = null;
        }
        zb zbVar = new zb(drawable, iArr, fArr2, f11, fArr, this.f22710zb != null, this.sya, this.f22706dj, z12, this.f22708lt, this.f22709ul, this.fby, z12 ? c0015ycx.f22286zb : null, z12 ? c0015ycx.sya : null);
        this.f22707jw = zbVar;
        view.setBackground(zbVar);
    }
}
