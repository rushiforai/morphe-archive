package com.bytedance.sdk.openadsdk.core.ry.lud.zb;

import android.content.Context;
import com.bytedance.adsdk.ugeno.lud.ea;
import java.util.Map;

/* loaded from: classes2.dex */
public class ycx extends com.bytedance.adsdk.ugeno.lud.dj.sya {

    /* renamed from: ea, reason: collision with root package name */
    private boolean f25976ea;

    public ycx(Context context) {
        super(context);
    }

    @Override // com.bytedance.adsdk.ugeno.lud.dj.sya
    public boolean ycx(Object... objArr) {
        Map<String, Object> map = this.lud;
        if (map != null && !map.isEmpty()) {
            try {
                Object obj = objArr[0];
                if (obj == null) {
                    return false;
                }
                int iYcx = com.bytedance.adsdk.ugeno.fby.sya.ycx(obj.toString(), -1);
                if (this.lud.containsKey("remainingSeconds")) {
                    Object obj2 = this.lud.get("remainingSeconds");
                    int iYcx2 = obj2 != null ? com.bytedance.adsdk.ugeno.fby.sya.ycx(String.valueOf(obj2), -1) : -1;
                    if ((iYcx == 0 || (iYcx2 >= 0 && iYcx == iYcx2)) && !this.f25976ea) {
                        this.f25976ea = true;
                        ea eaVar = this.ycx;
                        if (eaVar != null) {
                            eaVar.ycx(this.f22463zb, this.f22461lt, this.sya.zb(), this.sya);
                        }
                    }
                }
                return true;
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+yqQDfJs0YVEwxOBHq4hT+E/", "bskOmhayfeOPXdlwgx+pPFT8", "VuEjnBezew==", 52);
            }
        }
        return false;
    }
}
