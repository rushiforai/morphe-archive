package com.bytedance.adsdk.ugeno.jc.sya;

import android.content.Context;
import android.text.TextUtils;
import android.widget.ImageView;
import com.bytedance.adsdk.ugeno.jc.dj.sya;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import org.json.JSONException;

/* loaded from: classes2.dex */
public abstract class ycx extends sya {
    private int vbt;

    public ycx(Context context) {
        super(context);
        this.vbt = -16777216;
    }

    private String syc(String str) {
        String strRy = ry(str);
        return TextUtils.isEmpty(strRy) ? b.f42142b : "local://".concat(String.valueOf(strRy));
    }

    public abstract String ry(String str);

    @Override // com.bytedance.adsdk.ugeno.jc.dj.sya
    public String sya() {
        return "drawable";
    }

    @Override // com.bytedance.adsdk.ugeno.jc.dj.sya, com.bytedance.adsdk.ugeno.zb.sya
    public void ycx(String str, String str2) {
        super.ycx(str, str2);
        str.getClass();
        if (str.equals("textColor")) {
            this.vbt = com.bytedance.adsdk.ugeno.fby.ycx.ycx(str2);
        }
    }

    @Override // com.bytedance.adsdk.ugeno.jc.dj.sya, com.bytedance.adsdk.ugeno.zb.sya
    public void zb() throws JSONException, NumberFormatException {
        ((sya) this).ycx = syc(((sya) this).ycx);
        super.zb();
        ((com.bytedance.adsdk.ugeno.jc.dj.ycx) this.lud).setColorFilter(this.vbt);
        ((com.bytedance.adsdk.ugeno.jc.dj.ycx) this.lud).setScaleType(ImageView.ScaleType.FIT_CENTER);
    }
}
