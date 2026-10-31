package com.bytedance.adsdk.ugeno.lud.zb;

import android.text.TextUtils;
import com.bytedance.adsdk.ugeno.lud.lt;
import java.util.Map;
import org.json.JSONException;

/* loaded from: classes2.dex */
public class lt extends ycx {
    public lt(com.bytedance.adsdk.ugeno.zb.sya syaVar, String str, lt.ycx ycxVar) {
        super(syaVar, str, ycxVar);
    }

    @Override // com.bytedance.adsdk.ugeno.lud.zb.ycx
    public void ycx() throws JSONException {
        Map<String, Object> map = this.f22485lt;
        if (map == null || map.size() <= 0) {
            return;
        }
        Object obj = this.f22485lt.get("id");
        if (obj == null) {
            ycx(this.sya);
            return;
        }
        String strValueOf = String.valueOf(obj);
        if (TextUtils.isEmpty(strValueOf)) {
            ycx(this.sya);
            return;
        }
        com.bytedance.adsdk.ugeno.zb.sya syaVar = this.sya;
        com.bytedance.adsdk.ugeno.zb.sya syaVarZb = syaVar.zb(syaVar);
        if (syaVarZb == null) {
            return;
        }
        ycx(syaVarZb.lud(strValueOf));
    }

    private void ycx(com.bytedance.adsdk.ugeno.zb.sya syaVar) throws JSONException {
        Object obj;
        if (syaVar == null) {
            return;
        }
        for (String str : this.f22485lt.keySet()) {
            if (!TextUtils.isEmpty(str) && !TextUtils.equals(str, "id") && (obj = this.f22485lt.get(str)) != null) {
                syaVar.ycx(str, String.valueOf(obj));
            }
        }
        syaVar.ycx(this.f22485lt.containsKey("width"), this.f22485lt.containsKey("height"));
        syaVar.zb();
    }
}
