package com.bytedance.sdk.openadsdk.core.ry.lt;

import android.view.MotionEvent;
import android.view.View;
import com.bytedance.adsdk.ugeno.lud.ea;
import com.bytedance.adsdk.ugeno.lud.xkz;

/* loaded from: classes2.dex */
public class sya implements xkz {
    private boolean ycx = false;

    @Override // com.bytedance.adsdk.ugeno.lud.xkz
    public boolean ycx(com.bytedance.adsdk.ugeno.zb.sya syaVar, MotionEvent motionEvent, ea eaVar, com.bytedance.adsdk.ugeno.lud.dj.sya syaVar2) {
        int action = motionEvent.getAction();
        if (action == 0) {
            this.ycx = true;
        } else if ((action == 1 || action == 3) && this.ycx) {
            this.ycx = false;
            if (ycx(syaVar.ea(), motionEvent.getX(), motionEvent.getY()) && eaVar != null) {
                eaVar.ycx(syaVar, syaVar2.dj(), syaVar2.ul().zb(), syaVar2.ul());
            }
        }
        return true;
    }

    private boolean ycx(View view, float f11, float f12) {
        return f11 >= 0.0f && f11 < ((float) view.getWidth()) && f12 >= 0.0f && f12 < ((float) view.getHeight());
    }
}
