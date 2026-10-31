package com.bytedance.adsdk.ugeno;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Color;
import android.text.TextUtils;
import android.view.View;
import com.bytedance.adsdk.ugeno.core.ok;
import com.bytedance.adsdk.ugeno.fby.fby;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@Deprecated
/* loaded from: classes2.dex */
public class dj extends com.bytedance.adsdk.ugeno.zb.ycx<com.bytedance.adsdk.ugeno.ul.zb> {

    /* renamed from: ci, reason: collision with root package name */
    private String f22275ci;
    private com.bytedance.adsdk.ugeno.zb.sya ff;

    /* renamed from: kh, reason: collision with root package name */
    private float f22276kh;
    private int liq;
    private float mue;

    /* renamed from: nc, reason: collision with root package name */
    private boolean f22277nc;

    /* renamed from: pg, reason: collision with root package name */
    private float f22278pg;

    /* renamed from: qt, reason: collision with root package name */
    private String f22279qt;

    /* renamed from: sp, reason: collision with root package name */
    private boolean f22280sp;

    /* renamed from: te, reason: collision with root package name */
    private boolean f22281te;
    private int tpg;
    private float vbt;
    private float vy;

    /* renamed from: yw, reason: collision with root package name */
    private JSONArray f22282yw;
    private float yyc;

    public dj(Context context) {
        super(context);
        this.f22281te = true;
        this.f22277nc = true;
        this.vbt = 0.0f;
        this.f22278pg = 2000.0f;
        this.f22275ci = "normal";
        this.f22280sp = true;
        this.tpg = Color.parseColor("#666666");
        this.liq = Color.parseColor("#ffffff");
    }

    @Override // com.bytedance.adsdk.ugeno.zb.sya
    public void ycx(JSONObject jSONObject) {
    }

    @Override // com.bytedance.adsdk.ugeno.zb.ycx, com.bytedance.adsdk.ugeno.zb.sya
    public void zb() throws JSONException, Resources.NotFoundException {
        super.zb();
        JSONArray jSONArray = this.f22282yw;
        if (jSONArray == null || jSONArray.length() <= 0) {
            return;
        }
        ((com.bytedance.adsdk.ugeno.ul.zb) this.lud).fby((int) this.yyc).jw((int) this.mue).jc((int) this.f22276kh).sya(this.f22280sp).lt(this.liq).ul(this.tpg).sya(this.f22275ci).dj(this.f22281te).lud(this.vy).ycx(this.f22277nc).dj((int) this.f22278pg).sya(this.f22280sp);
        for (int i5 = 0; i5 < this.f22282yw.length(); i5++) {
            ok okVar = new ok(this.f22701zb);
            okVar.ycx(this.f22677py);
            com.bytedance.adsdk.ugeno.zb.sya<View> syaVarZb = okVar.zb(this.ff.rmf(), (com.bytedance.adsdk.ugeno.zb.sya<View>) null);
            okVar.zb(this.f22282yw.optJSONObject(i5));
            ((com.bytedance.adsdk.ugeno.ul.zb) this.lud).ycx((com.bytedance.adsdk.ugeno.ul.zb) syaVarZb);
        }
        if (this.f22277nc) {
            ((com.bytedance.adsdk.ugeno.ul.zb) this.lud).sya();
        }
    }

    @Override // com.bytedance.adsdk.ugeno.zb.sya
    public View ycx() {
        com.bytedance.adsdk.ugeno.ul.zb zbVar = new com.bytedance.adsdk.ugeno.ul.zb(this.f22701zb);
        this.lud = zbVar;
        zbVar.ycx((lud) this);
        return this.lud;
    }

    public void ycx(com.bytedance.adsdk.ugeno.ul.sya syaVar) {
        T t6 = this.lud;
        if (t6 != 0) {
            ((com.bytedance.adsdk.ugeno.ul.zb) t6).setOnPageChangeListener(syaVar);
        }
    }

    public void ycx(int i5) throws Resources.NotFoundException {
        T t6 = this.lud;
        if (t6 != 0) {
            ((com.bytedance.adsdk.ugeno.ul.zb) t6).xkz(i5);
        }
    }

    @Override // com.bytedance.adsdk.ugeno.zb.ycx
    public void ycx(com.bytedance.adsdk.ugeno.zb.sya syaVar) {
        this.ff = syaVar;
    }

    @Override // com.bytedance.adsdk.ugeno.zb.sya
    public void ycx(String str, String str2) {
        super.ycx(str, str2);
        if (TextUtils.isEmpty(str)) {
            return;
        }
        str.getClass();
        switch (str) {
            case "delayStart":
                this.vbt = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 0.0f);
                break;
            case "indicatorColor":
                this.tpg = com.bytedance.adsdk.ugeno.fby.ycx.ycx(str2);
                break;
            case "nextMargin":
                this.f22276kh = fby.ycx(this.f22701zb, com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 0.0f));
                break;
            case "effect":
                this.f22275ci = str2;
                break;
            case "direction":
                this.f22279qt = str2;
                break;
            case "indicator":
                this.f22280sp = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, true);
                break;
            case "previousMargin":
                this.mue = fby.ycx(this.f22701zb, com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 0.0f));
                break;
            case "loop":
                this.f22281te = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, true);
                break;
            case "speed":
                this.f22278pg = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 500.0f);
                break;
            case "pageCount":
                this.vy = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 1.0f);
                break;
            case "pageMargin":
                this.yyc = fby.ycx(this.f22701zb, com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 0.0f));
                break;
            case "indicatorSelectedColor":
                this.liq = com.bytedance.adsdk.ugeno.fby.ycx.ycx(str2);
                break;
            case "autoplay":
                this.f22277nc = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, true);
                break;
            case "dataList":
                this.f22282yw = com.bytedance.adsdk.ugeno.fby.zb.ycx(this.f22655dj, str2, null);
                break;
        }
    }
}
