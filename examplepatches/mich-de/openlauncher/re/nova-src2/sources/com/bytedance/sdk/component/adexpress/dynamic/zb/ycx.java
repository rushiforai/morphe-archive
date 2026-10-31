package com.bytedance.sdk.component.adexpress.dynamic.zb;

import android.text.TextUtils;
import com.bytedance.sdk.component.adexpress.dynamic.dj.ul;

/* loaded from: classes2.dex */
public class ycx {
    public static int ycx(ul ulVar) {
        if (ulVar == null) {
            return 0;
        }
        String strYzp = ulVar.yzp();
        String strDv = ulVar.dv();
        if (TextUtils.isEmpty(strDv) || TextUtils.isEmpty(strYzp) || !strDv.equals("creative")) {
            return 0;
        }
        if (strYzp.equals("shake")) {
            return 2;
        }
        if (strYzp.equals("twist")) {
            return 3;
        }
        return strYzp.equals("slide") ? 1 : 0;
    }
}
