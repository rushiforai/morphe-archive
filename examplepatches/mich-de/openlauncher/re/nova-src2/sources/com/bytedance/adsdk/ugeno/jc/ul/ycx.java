package com.bytedance.adsdk.ugeno.jc.ul;

import android.content.Context;
import org.json.JSONException;

/* loaded from: classes2.dex */
public abstract class ycx extends com.bytedance.adsdk.ugeno.zb.ycx<com.bytedance.adsdk.ugeno.jc.zb.ycx> {
    public ycx(Context context) {
        super(context);
    }

    @Override // com.bytedance.adsdk.ugeno.zb.sya
    public void ycx(String str, String str2) {
        super.ycx(str, str2);
        str.getClass();
        switch (str) {
            case "onVideoProgress":
            case "onVideoFinish":
            case "onVideoPlay":
            case "onVideoResume":
            case "onVideoPause":
                zb(str, str2);
                break;
        }
    }

    @Override // com.bytedance.adsdk.ugeno.zb.ycx, com.bytedance.adsdk.ugeno.zb.sya
    public void zb() throws JSONException {
        super.zb();
    }
}
