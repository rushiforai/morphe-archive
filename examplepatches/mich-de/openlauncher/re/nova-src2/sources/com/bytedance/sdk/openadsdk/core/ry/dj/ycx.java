package com.bytedance.sdk.openadsdk.core.ry.dj;

import android.content.Context;
import android.os.Looper;
import android.view.MotionEvent;
import android.view.View;
import com.amplitude.android.TrackingOptions;
import com.amplitude.android.plugins.AndroidContextPlugin;
import com.bytedance.adsdk.ugeno.core.dy;
import com.bytedance.adsdk.ugeno.core.ok;
import com.bytedance.adsdk.ugeno.core.ry;
import com.bytedance.adsdk.ugeno.core.syc;
import com.bytedance.adsdk.ugeno.lud.lt;
import com.bytedance.adsdk.ugeno.zb.sya;
import com.bytedance.sdk.openadsdk.core.ry.ul.dj;
import com.bytedance.sdk.openadsdk.utils.yzp;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ycx implements dy, syc {

    /* renamed from: dj, reason: collision with root package name */
    private dy f25905dj;
    private InterfaceC0075ycx sya;
    private final Context ycx;

    /* renamed from: zb, reason: collision with root package name */
    private sya<View> f25906zb;

    /* renamed from: com.bytedance.sdk.openadsdk.core.ry.dj.ycx$ycx, reason: collision with other inner class name */
    public interface InterfaceC0075ycx {
        void ycx(ry ryVar);
    }

    public ycx(Context context) {
        this.ycx = context;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zb(JSONObject jSONObject, JSONObject jSONObject2, dj djVar) throws JSONException {
        try {
            ok okVar = new ok(this.ycx);
            sya<View> syaVarYcx = okVar.ycx(jSONObject);
            this.f25906zb = syaVarYcx;
            if (syaVarYcx == null) {
                if (djVar != null) {
                    djVar.ycx(3000, "ugen render fail");
                    return;
                }
                return;
            }
            View viewEa = syaVarYcx.ea();
            if (viewEa != null) {
                viewEa.setOnClickListener(new View.OnClickListener() { // from class: com.bytedance.sdk.openadsdk.core.ry.dj.ycx.2
                    @Override // android.view.View.OnClickListener
                    public void onClick(View view) {
                    }
                });
            }
            okVar.ycx((syc) this);
            okVar.ycx((dy) this);
            if (jSONObject2 != null) {
                try {
                    jSONObject2.put(TrackingOptions.AMP_TRACKING_OPTION_LANGUAGE, com.bytedance.sdk.openadsdk.core.ry.zb());
                    jSONObject2.put("os", AndroidContextPlugin.PLATFORM);
                } catch (JSONException e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+yqQDfJsyYRJ1k+I", "bskomyaybeSBWNNviR+kLUk=", "SesjkQauQMmUT8VTjR0=", 72);
                }
            }
            okVar.zb(jSONObject2);
            if (djVar != null) {
                djVar.ycx(this.f25906zb);
            }
        } catch (Exception e11) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e11, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+yqQDfJsyYRJ1k+I", "bskomyaybeSBWNNviR+kLUk=", "SesjkQauQMmUT8VTjR0=", 76);
            if (djVar != null) {
                djVar.ycx(3000, "ugen render fail exception is" + e11.getMessage());
            }
        }
    }

    @Override // com.bytedance.adsdk.ugeno.core.syc
    public void ycx(sya syaVar, String str, lt.ycx ycxVar) {
    }

    public void ycx(final JSONObject jSONObject, final JSONObject jSONObject2, final dj djVar) throws JSONException {
        if (Looper.myLooper() == Looper.getMainLooper()) {
            zb(jSONObject, jSONObject2, djVar);
        } else {
            yzp.ycx(new Runnable() { // from class: com.bytedance.sdk.openadsdk.core.ry.dj.ycx.1
                @Override // java.lang.Runnable
                public void run() throws JSONException {
                    ycx.this.zb(jSONObject, jSONObject2, djVar);
                }
            });
        }
    }

    public void ycx(InterfaceC0075ycx interfaceC0075ycx) {
        this.sya = interfaceC0075ycx;
    }

    public void ycx(dy dyVar) {
        this.f25905dj = dyVar;
    }

    @Override // com.bytedance.adsdk.ugeno.core.syc
    public void ycx(ry ryVar, syc.zb zbVar, syc.ycx ycxVar) {
        InterfaceC0075ycx interfaceC0075ycx;
        if (ryVar == null) {
            return;
        }
        if ((ryVar.zb() == 1 || ryVar.zb() == 4) && (interfaceC0075ycx = this.sya) != null) {
            interfaceC0075ycx.ycx(ryVar);
        }
        if (zbVar == null || ryVar.dj() == null) {
            return;
        }
        zbVar.ycx(ryVar.dj());
    }

    @Override // com.bytedance.adsdk.ugeno.core.dy
    public void ycx(sya syaVar, MotionEvent motionEvent) {
        dy dyVar = this.f25905dj;
        if (dyVar != null) {
            dyVar.ycx(syaVar, motionEvent);
        }
    }
}
