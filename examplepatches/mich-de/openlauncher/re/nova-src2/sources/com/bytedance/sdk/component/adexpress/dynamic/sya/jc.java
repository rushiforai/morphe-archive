package com.bytedance.sdk.component.adexpress.dynamic.sya;

import android.content.Context;
import android.text.TextUtils;
import b.c0;

/* loaded from: classes2.dex */
public class jc {
    public static ul ycx(Context context, com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lud ludVar, com.bytedance.sdk.component.adexpress.dynamic.dj.ul ulVar, com.bytedance.sdk.component.adexpress.dynamic.dj.jc jcVar, com.bytedance.sdk.component.adexpress.zb.ry ryVar) {
        String strDc;
        String strDv;
        if (context == null || ludVar == null || ulVar == null) {
            return null;
        }
        strDc = ulVar.dc();
        strDv = ryVar.dv();
        strDc.getClass();
        switch (strDc) {
            case "0":
                return new lud(context, ludVar, ulVar);
            case "1":
                return new sya(context, ludVar, ulVar);
            case "2":
                return new zb(context, ludVar, ulVar);
            case "5":
                return ulVar.yi() == 1 ? new wie(context, ludVar, ulVar, ulVar.iq()) : new dy(context, ludVar, ulVar);
            case "6":
            case "11":
                return new xkz(context, ludVar, ulVar);
            case "7":
            case "14":
                return new ok(context, ludVar, ulVar);
            case "8":
                return new ry(context, ludVar, ulVar);
            case "9":
            case "16":
                return new syc(context, ludVar, ulVar, strDc, jcVar.ycx(), jcVar.zb(), jcVar.dj(), jcVar.ul());
            case "10":
                return new dj(context, ludVar, ulVar);
            case "12":
                return new dy(context, ludVar, ulVar);
            case "13":
                return new wie(context, ludVar, ulVar);
            case "17":
            case "18":
                return new uh(context, ludVar, ulVar, strDc, jcVar);
            case "20":
                if (com.bytedance.sdk.component.adexpress.dj.zb()) {
                    return new ea(context, ludVar, ulVar, c0.E(strDv, "static/lotties/glass-swipe/glass-swipe.json"), "20");
                }
                return new ea(context, ludVar, ulVar, TextUtils.isEmpty(strDv) ? null : c0.E(strDv, "brush_mask.json"), "20");
            case "22":
                return com.bytedance.sdk.component.adexpress.dj.zb() ? new ea(context, ludVar, ulVar, c0.E(strDv, "static/lotties/202327swiper-up-star/index.json"), "22") : new pmi(context, ludVar, ulVar);
            case "23":
                if (com.bytedance.sdk.component.adexpress.dj.zb()) {
                    return new ea(context, ludVar, ulVar, c0.E(strDv, "static/lotties/202327swiper-up-star/click.json"), "23");
                }
                return null;
            case "24":
                if (com.bytedance.sdk.component.adexpress.dj.zb()) {
                    return new ycx(context, ludVar, ulVar);
                }
                return new ea(context, ludVar, ulVar, TextUtils.isEmpty(strDv) ? null : c0.E(strDv, "swiper_up_star.json"), "24");
            case "25":
                if (com.bytedance.sdk.component.adexpress.dj.zb()) {
                    return new ea(context, ludVar, ulVar, c0.E(strDv, "static/lotties/gesture-slide.json"), "25");
                }
                return null;
            case "29":
                return new lt(context, ludVar, ulVar, jcVar.ycx(), jcVar.zb(), jcVar.dj(), jcVar.ul());
            default:
                return null;
        }
    }
}
