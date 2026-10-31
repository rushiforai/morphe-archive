package com.bytedance.sdk.component.lud.zb.zb;

import android.graphics.Bitmap;
import com.bytedance.sdk.component.lud.uh;

/* loaded from: classes2.dex */
public class ycx<T> implements lt {
    @Override // com.bytedance.sdk.component.lud.zb.zb.lt
    public boolean ycx(com.bytedance.sdk.component.lud.zb.sya.sya syaVar, uh uhVar, com.bytedance.sdk.component.lud.zb.sya.ycx ycxVar) {
        Bitmap bitmapYcx;
        String strFby = syaVar.fby();
        syaVar.ycx();
        com.bytedance.sdk.component.lud.zb zbVarWie = syaVar.wie();
        com.bytedance.sdk.component.lud.zb.sya.lt ltVarDy = syaVar.dy();
        if (zbVarWie == null || ltVarDy == null || !zbVarWie.lud() || !ycx(syaVar) || (bitmapYcx = ltVarDy.ycx(zbVarWie).ycx(strFby)) == null) {
            return true;
        }
        syaVar.ycx();
        ycxVar.ycx(new com.bytedance.sdk.component.lud.zb.sya.dj().ycx(syaVar, bitmapYcx, null, false));
        return false;
    }

    private boolean ycx(com.bytedance.sdk.component.lud.zb.sya.sya syaVar) {
        int iEa = syaVar.ea();
        return iEa == 1 || iEa == 2;
    }

    @Override // com.bytedance.sdk.component.lud.zb.zb.lt
    public String ycx() {
        return "bitmap_cache";
    }
}
