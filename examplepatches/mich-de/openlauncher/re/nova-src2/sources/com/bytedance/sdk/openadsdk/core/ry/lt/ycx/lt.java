package com.bytedance.sdk.openadsdk.core.ry.lt.ycx;

import android.content.Context;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import com.bytedance.sdk.openadsdk.core.jc.tru;
import com.bytedance.sdk.openadsdk.core.model.av;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.core.model.xz;
import com.bytedance.sdk.openadsdk.core.ry.lt.ul;
import com.bytedance.sdk.openadsdk.core.ry.lt.ycx.zb;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class lt extends ul {

    /* renamed from: av, reason: collision with root package name */
    private static Boolean f25959av;
    private final zb bhi;

    /* renamed from: hf, reason: collision with root package name */
    private float f25960hf;
    private float oty;
    private boolean tru;

    public lt(Context context, tn tnVar, boolean z11, com.bytedance.sdk.openadsdk.core.ry.lt.ycx ycxVar, ViewGroup viewGroup, float f11, float f12, boolean z12, String str) {
        super(context, tnVar, z11, ycxVar, viewGroup);
        this.bhi = zb.ycx.ycx(tnVar, ycxVar);
        this.wwx = str;
        this.oty = f11;
        this.f25960hf = f12;
        this.tru = z12;
    }

    private boolean ry() {
        return this.lud != null && xkz() && av.sya(this.lud);
    }

    private boolean xkz() {
        tn tnVar = this.lud;
        if (tnVar == null) {
            return false;
        }
        int iTz = tnVar.tz();
        boolean z11 = iTz == 7 || iTz == 8;
        int iIq = this.lud.iq();
        return z11 && (iIq == 43 || iIq == 44);
    }

    private JSONObject ycx(float f11, float f12, boolean z11, tn tnVar, String str) throws JSONException {
        JSONObject jSONObjectYcx = com.bytedance.sdk.openadsdk.core.jc.zb.sya.ycx(f11, f12, z11, tnVar, str);
        this.f25927dv = jSONObjectYcx;
        if (jSONObjectYcx == null) {
            return null;
        }
        try {
            JSONObject jSONObjectOptJSONObject = jSONObjectYcx.optJSONObject("xSize");
            if (jSONObjectOptJSONObject != null) {
                jSONObjectOptJSONObject.put("imageModeRatio", ok());
            }
            JSONObject jSONObjectOptJSONObject2 = this.f25927dv.optJSONObject("xAdInfo");
            if (jSONObjectOptJSONObject2 != null) {
                jSONObjectOptJSONObject2.put("isVideoImageMode", tn.lud(this.lud));
                jSONObjectOptJSONObject2.put("feed_draw_purePlayable", ry());
                jSONObjectOptJSONObject2.put("isFeedDraw", xkz());
            }
            zb zbVar = this.bhi;
            if (zbVar != null) {
                zbVar.ycx(this.f25927dv);
            }
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+yqQDfJs35BY0k6fX6IpWOU4hQ==", "bskomyG9asyVWuVYghWlOg==", "UuAkgSe9fcY=", 73);
        }
        return this.f25927dv;
    }

    @Override // com.bytedance.sdk.openadsdk.core.ry.lt.ul, com.bytedance.sdk.openadsdk.core.ry.lt.dj
    public com.bytedance.adsdk.ugeno.zb.sya fby() {
        com.bytedance.adsdk.ugeno.zb.sya<View> syaVar = this.sya;
        if (syaVar == null) {
            return null;
        }
        return syaVar.ul("VideoV3");
    }

    public float ok() {
        tn tnVar = this.lud;
        if (tnVar == null) {
            return 1.0f;
        }
        int iPk = tnVar.pk();
        if (iPk == 3) {
            return 1.91f;
        }
        if (iPk == 5) {
            return 1.78f;
        }
        if (iPk == 15 || iPk == 173) {
            return 0.5625f;
        }
        if (iPk != 33 && iPk != 50) {
            if (iPk == 1010) {
                return 1.2f;
            }
            if (iPk == 1011) {
                return 6.4f;
            }
            if (iPk == 1012) {
                return 3.2f;
            }
        }
        return 1.0f;
    }

    @Override // com.bytedance.sdk.openadsdk.core.ry.lt.dj, com.bytedance.sdk.component.adexpress.zb.dj
    public int sya() {
        return 1;
    }

    @Override // com.bytedance.sdk.openadsdk.core.ry.lt.ul, com.bytedance.sdk.openadsdk.core.ry.lt.dj
    public JSONObject zb() {
        return ycx(this.oty, this.f25960hf, this.tru, this.lud, this.wwx);
    }

    @Override // com.bytedance.sdk.openadsdk.core.ry.lt.ul, com.bytedance.sdk.openadsdk.core.ry.lt.dj
    public JSONObject ycx() {
        zb zbVar = this.bhi;
        if (zbVar != null) {
            try {
                return new JSONObject(zbVar.ycx());
            } catch (Exception e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+yqQDfJs35BY0k6fX6IpWOU4hQ==", "bskomyG9asyVWuVYghWlOg==", "XOs5oCS5Z/OFR8dRjQWlAVXoIg==", 87);
            }
        }
        return null;
    }

    @Override // com.bytedance.sdk.openadsdk.core.ry.lt.ul
    public JSONObject ycx(xz xzVar) {
        zb zbVar = this.bhi;
        if (zbVar != null) {
            return zbVar.zb();
        }
        return null;
    }

    public static boolean ycx(String str) {
        if (f25959av == null) {
            f25959av = Boolean.valueOf(com.bytedance.sdk.openadsdk.dv.lud.ycx("express_backup_type", 0) == 1);
        }
        return f25959av.booleanValue() && (TextUtils.equals(str, "fullscreen_interstitial_ad") || TextUtils.equals(str, "rewarded_video") || tru.zb(str) || (TextUtils.equals(str, "open_ad") && com.bytedance.sdk.openadsdk.component.ul.ycx.ea()));
    }
}
