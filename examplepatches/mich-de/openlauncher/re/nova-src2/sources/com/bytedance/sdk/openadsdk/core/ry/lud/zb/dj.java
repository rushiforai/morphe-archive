package com.bytedance.sdk.openadsdk.core.ry.lud.zb;

import android.content.Context;
import com.bytedance.adsdk.ugeno.lud.ea;
import java.util.Map;

/* loaded from: classes2.dex */
public class dj extends com.bytedance.adsdk.ugeno.lud.dj.sya {

    /* renamed from: ea, reason: collision with root package name */
    private boolean f25975ea;

    public dj(Context context) {
        super(context);
    }

    @Override // com.bytedance.adsdk.ugeno.lud.dj.sya
    public boolean ycx(Object... objArr) {
        Map<String, Object> map = this.lud;
        if (map == null || map.isEmpty()) {
            return false;
        }
        long jLongValue = ((Long) objArr[0]).longValue() / 1000;
        long jLongValue2 = ((Long) objArr[1]).longValue() / 1000;
        if (jLongValue <= 0) {
            this.f25975ea = false;
        }
        if (this.lud.containsKey("percent")) {
            Object obj = this.lud.get("percent");
            float fYcx = obj != null ? com.bytedance.adsdk.ugeno.fby.sya.ycx(String.valueOf(obj), -1.0f) : -1.0f;
            if (fYcx >= 0.0f && jLongValue >= (fYcx / 100.0f) * jLongValue2 && !this.f25975ea) {
                this.f25975ea = true;
                ea eaVar = this.ycx;
                if (eaVar != null) {
                    eaVar.ycx(this.f22463zb, this.f22461lt, this.sya.zb(), this.sya);
                }
            }
        } else {
            if (this.lud.containsKey("remainingSeconds")) {
                Object obj2 = this.lud.get("remainingSeconds");
                int iYcx = obj2 != null ? com.bytedance.adsdk.ugeno.fby.sya.ycx(String.valueOf(obj2), -1) : -1;
                long j11 = jLongValue2 - jLongValue;
                if (iYcx >= 0 && j11 <= iYcx && !this.f25975ea) {
                    this.f25975ea = true;
                    ea eaVar2 = this.ycx;
                    if (eaVar2 != null) {
                        eaVar2.ycx(this.f22463zb, this.f22461lt, this.sya.zb(), this.sya);
                    }
                }
            } else {
                if (jLongValue >= (this.lud.get("interval") != null ? com.bytedance.adsdk.ugeno.fby.sya.ycx(String.valueOf(r9), -1) : -1) && !this.f25975ea) {
                    this.f25975ea = true;
                    ea eaVar3 = this.ycx;
                    if (eaVar3 != null) {
                        eaVar3.ycx(this.f22463zb, this.f22461lt, this.sya.zb(), this.sya);
                    }
                }
            }
        }
        return true;
    }
}
