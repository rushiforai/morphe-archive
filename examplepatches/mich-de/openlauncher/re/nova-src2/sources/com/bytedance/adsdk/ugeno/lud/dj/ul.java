package com.bytedance.adsdk.ugeno.lud.dj;

import android.content.Context;
import com.tiktok.util.TTConst;
import java.util.Map;

/* loaded from: classes2.dex */
public class ul extends sya {
    public ul(Context context) {
        super(context);
    }

    @Override // com.bytedance.adsdk.ugeno.lud.dj.sya
    public boolean ycx(Object... objArr) {
        if (objArr != null && objArr.length > 0) {
            int iYcx = com.bytedance.adsdk.ugeno.fby.sya.ycx(String.valueOf(objArr[0]), 0);
            Map<String, Object> map = this.lud;
            if (map == null || map.isEmpty()) {
                this.ycx.ycx(this.f22463zb, this.f22461lt, this.sya.zb(), this.sya);
            } else {
                Object obj = this.lud.get(TTConst.TRACK_TYPE);
                if (iYcx == (obj != null ? com.bytedance.adsdk.ugeno.fby.sya.ycx(String.valueOf(obj), 0) : 0)) {
                    this.ycx.ycx(this.f22463zb, this.f22461lt, this.sya.zb(), this.sya);
                }
            }
        }
        return false;
    }
}
