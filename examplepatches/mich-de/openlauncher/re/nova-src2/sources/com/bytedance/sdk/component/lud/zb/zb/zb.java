package com.bytedance.sdk.component.lud.zb.zb;

import android.text.TextUtils;
import com.bytedance.sdk.component.lud.uh;
import com.bytedance.sdk.component.utils.dy;

/* loaded from: classes2.dex */
public class zb implements lt {
    @Override // com.bytedance.sdk.component.lud.zb.zb.lt
    public boolean ycx(com.bytedance.sdk.component.lud.zb.sya.sya syaVar, uh uhVar, com.bytedance.sdk.component.lud.zb.sya.ycx ycxVar) {
        if (TextUtils.isEmpty(syaVar.fby())) {
            String strYcx = ycx(syaVar);
            syaVar.zb(strYcx);
            syaVar.ycx(strYcx);
        }
        syaVar.ycx();
        return true;
    }

    @Override // com.bytedance.sdk.component.lud.zb.zb.lt
    public String ycx() {
        return "generate_key";
    }

    private String ycx(com.bytedance.sdk.component.lud.zb.sya.sya syaVar) {
        return dy.ycx(syaVar.ycx());
    }
}
