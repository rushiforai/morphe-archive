package com.bytedance.sdk.openadsdk.core.ry.jw;

import android.content.Context;
import android.os.Looper;
import android.view.MotionEvent;
import android.view.View;
import com.bytedance.adsdk.ugeno.core.dy;
import com.bytedance.adsdk.ugeno.core.ea;
import com.bytedance.adsdk.ugeno.core.ok;
import com.bytedance.adsdk.ugeno.core.ry;
import com.bytedance.adsdk.ugeno.core.syc;
import com.bytedance.adsdk.ugeno.lud.lt;
import com.bytedance.adsdk.ugeno.zb.sya;
import com.bytedance.sdk.openadsdk.core.ry.ul.dj;
import com.bytedance.sdk.openadsdk.utils.yzp;
import com.vungle.ads.internal.protos.Sdk;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ycx implements dy, syc {
    private sya sya;
    private Context ycx;

    /* renamed from: zb, reason: collision with root package name */
    private ok f25922zb;

    public ycx(Context context) {
        this.ycx = context;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zb(JSONObject jSONObject, JSONObject jSONObject2, JSONObject jSONObject3, dj djVar) {
        this.f25922zb = new ok(this.ycx);
        ycx();
        this.f25922zb.ycx((syc) this);
        this.f25922zb.ycx((dy) this);
        if (jSONObject == null || jSONObject2 == null) {
            if (djVar != null) {
                djVar.ycx(Sdk.SDKError.Reason.OMSDK_JS_WRITE_FAILED_VALUE, "template or data is null");
                return;
            }
            return;
        }
        try {
            sya<View> syaVarYcx = this.f25922zb.ycx(jSONObject, jSONObject2, jSONObject3);
            this.sya = syaVarYcx;
            if (syaVarYcx != null) {
                djVar.ycx(syaVarYcx);
            } else if (djVar != null) {
                djVar.ycx(3000, "ugen render fail");
            }
        } catch (NoClassDefFoundError e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+yqQDfJ5xodP", "bskomzO9bsKyT9lZiQM=", "SesjkQauQMmUT8VTjR0=", 62);
            if (djVar != null) {
                djVar.ycx(Sdk.SDKError.Reason.CONFIG_REFRESH_FAILED_VALUE, "ugen render yoga error");
            }
        } catch (UnsatisfiedLinkError e11) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e11, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+yqQDfJ5xodP", "bskomzO9bsKyT9lZiQM=", "SesjkQauQMmUT8VTjR0=", 57);
            if (djVar != null) {
                djVar.ycx(139, "ugen render yoga error");
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+yqQDfJ5xodP", "bskomzO9bsKyT9lZiQM=", "SesjkQauQMmUT8VTjR0=", 67);
            if (djVar != null) {
                djVar.ycx(Sdk.SDKError.Reason.CONFIG_REFRESH_FAILED_VALUE, "ugen render error");
            }
        }
    }

    @Override // com.bytedance.adsdk.ugeno.core.syc
    public void ycx(ry ryVar, syc.zb zbVar, syc.ycx ycxVar) {
    }

    @Override // com.bytedance.adsdk.ugeno.core.dy
    public void ycx(sya syaVar, MotionEvent motionEvent) {
    }

    @Override // com.bytedance.adsdk.ugeno.core.syc
    public void ycx(sya syaVar, String str, lt.ycx ycxVar) {
    }

    public void ycx(final JSONObject jSONObject, final JSONObject jSONObject2, final JSONObject jSONObject3, final dj djVar) {
        if (Looper.myLooper() == Looper.getMainLooper()) {
            zb(jSONObject, jSONObject2, jSONObject3, djVar);
        } else {
            yzp.ycx(new Runnable() { // from class: com.bytedance.sdk.openadsdk.core.ry.jw.ycx.1
                @Override // java.lang.Runnable
                public void run() {
                    ycx.this.zb(jSONObject, jSONObject2, jSONObject3, djVar);
                }
            });
        }
    }

    private void ycx() {
        ea eaVar = new ea();
        eaVar.ycx(this.ycx);
        this.f25922zb.ycx("page", eaVar);
    }
}
