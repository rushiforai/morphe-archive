package com.bytedance.adsdk.ugeno.lud.dj;

import android.content.Context;
import android.text.TextUtils;
import com.bytedance.adsdk.ugeno.lud.lt;
import java.util.Map;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public abstract class sya {

    /* renamed from: dj, reason: collision with root package name */
    protected lt.ycx f22458dj;
    protected String fby;

    /* renamed from: jc, reason: collision with root package name */
    protected Context f22459jc;

    /* renamed from: jw, reason: collision with root package name */
    protected String f22460jw;

    /* renamed from: lt, reason: collision with root package name */
    protected String f22461lt;
    protected Map<String, Object> lud;
    protected com.bytedance.adsdk.ugeno.lud.lt sya;

    /* renamed from: ul, reason: collision with root package name */
    protected String f22462ul;
    protected com.bytedance.adsdk.ugeno.lud.ea ycx;

    /* renamed from: zb, reason: collision with root package name */
    protected com.bytedance.adsdk.ugeno.zb.sya f22463zb;

    public static class ycx {
        public static sya ycx(Context context, com.bytedance.adsdk.ugeno.zb.sya syaVar, JSONObject jSONObject, JSONObject jSONObject2) {
            com.bytedance.adsdk.ugeno.lud.lt ltVarYcx;
            lt.ycx ycxVarYcx;
            if (syaVar == null || jSONObject == null || (ltVarYcx = com.bytedance.adsdk.ugeno.lud.lt.ycx(jSONObject, jSONObject2)) == null || (ycxVarYcx = ltVarYcx.ycx()) == null) {
                return null;
            }
            String strYcx = ycxVarYcx.ycx();
            if (TextUtils.equals(strYcx, "custom")) {
                dj djVar = new dj(context);
                djVar.ycx(syaVar);
                djVar.ycx(ltVarYcx);
                djVar.sya();
                return djVar;
            }
            com.bytedance.adsdk.ugeno.lud.ul ulVarYcx = (TextUtils.isEmpty(strYcx) || TextUtils.equals(strYcx, "global")) ? com.bytedance.adsdk.ugeno.lud.jc.ycx(ycxVarYcx.zb()) : com.bytedance.adsdk.ugeno.lud.jc.ycx(ycxVarYcx.lud());
            if (ulVarYcx == null) {
                return null;
            }
            sya syaVarYcx = ulVarYcx.ycx(context);
            syaVarYcx.ycx(syaVar);
            syaVarYcx.ycx(ltVarYcx);
            syaVarYcx.sya();
            return syaVarYcx;
        }
    }

    public sya(Context context) {
        this.f22459jc = context;
    }

    public String dj() {
        return this.f22461lt;
    }

    public String lt() {
        return this.f22460jw;
    }

    public String lud() {
        return this.fby;
    }

    public void sya() {
        this.f22458dj = this.sya.ycx();
        com.bytedance.adsdk.ugeno.lud.lt ltVar = this.sya;
        if (ltVar == null) {
            return;
        }
        lt.ycx ycxVarYcx = ltVar.ycx();
        this.f22458dj = ycxVarYcx;
        if (ycxVarYcx == null) {
            return;
        }
        this.lud = ycxVarYcx.sya();
        this.f22461lt = this.f22458dj.zb();
        this.f22462ul = this.f22458dj.ycx();
        this.fby = this.f22458dj.dj();
        this.f22460jw = this.f22458dj.lud();
    }

    public com.bytedance.adsdk.ugeno.lud.lt ul() {
        return this.sya;
    }

    public void ycx(com.bytedance.adsdk.ugeno.zb.sya syaVar) {
        this.f22463zb = syaVar;
    }

    public abstract boolean ycx(Object... objArr);

    public void ycx(com.bytedance.adsdk.ugeno.lud.lt ltVar) {
        this.sya = ltVar;
    }

    public void ycx(com.bytedance.adsdk.ugeno.lud.ea eaVar) {
        this.ycx = eaVar;
    }
}
