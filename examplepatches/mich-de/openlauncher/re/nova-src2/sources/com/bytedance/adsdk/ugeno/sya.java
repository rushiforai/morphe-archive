package com.bytedance.adsdk.ugeno;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Color;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import com.bytedance.adsdk.ugeno.core.ok;
import com.bytedance.adsdk.ugeno.fby.fby;
import com.bytedance.adsdk.ugeno.lud.jw;
import com.bytedance.adsdk.ugeno.lud.lt;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class sya extends com.bytedance.adsdk.ugeno.zb.ycx<com.bytedance.adsdk.ugeno.ul.zb> implements com.bytedance.adsdk.ugeno.ul.sya {
    private int bah;

    /* renamed from: ci, reason: collision with root package name */
    private float f22489ci;

    /* renamed from: cu, reason: collision with root package name */
    private String f22490cu;
    private float ff;
    private float hfd;

    /* renamed from: if, reason: not valid java name */
    private boolean f3if;

    /* renamed from: kh, reason: collision with root package name */
    private int f22491kh;

    /* renamed from: ko, reason: collision with root package name */
    private boolean f22492ko;
    private float liq;
    private int mue;

    /* renamed from: nc, reason: collision with root package name */
    private boolean f22493nc;

    /* renamed from: nq, reason: collision with root package name */
    private float f22494nq;

    /* renamed from: pg, reason: collision with root package name */
    private float f22495pg;
    private float pyn;

    /* renamed from: qt, reason: collision with root package name */
    private int f22496qt;
    private boolean rzo;
    private JSONArray skm;

    /* renamed from: sp, reason: collision with root package name */
    private String f22497sp;
    private float spv;

    /* renamed from: te, reason: collision with root package name */
    private boolean f22498te;
    private String tpg;
    private float vbt;
    private float vy;
    private int xh;

    /* renamed from: yl, reason: collision with root package name */
    private boolean f22499yl;

    /* renamed from: yw, reason: collision with root package name */
    private float f22500yw;
    private boolean yyc;
    private int znc;

    public sya(Context context) {
        super(context);
        this.f22496qt = 0;
        this.f22498te = true;
        this.f22493nc = true;
        this.vbt = 500.0f;
        this.f22495pg = -1.0f;
        this.f22489ci = 2000.0f;
        this.f22497sp = "slide";
        this.tpg = "dot";
        this.liq = 8.0f;
        this.vy = 8.0f;
        this.f22500yw = 50.0f;
        this.ff = 90.0f;
        this.yyc = false;
        this.mue = Color.parseColor("#666666");
        this.f22491kh = Color.parseColor("#ffffff");
        this.f22490cu = "row";
        this.pyn = 1.0f;
        this.hfd = 0.0f;
        this.f22494nq = 0.0f;
        this.spv = 0.0f;
        this.xh = 0;
        this.bah = 0;
        this.rzo = true;
        this.f3if = false;
        this.f22492ko = true;
        float fYcx = fby.ycx(this.f22701zb, 8.0f);
        this.liq = fYcx;
        this.vy = fYcx;
    }

    private void fby(int i5) {
        jw jwVar = this.f22649ag;
        if (jwVar == null) {
            return;
        }
        jwVar.ycx("SwiperView://slide", Integer.valueOf(this.znc), Integer.valueOf(i5), Integer.valueOf(!this.f22499yl ? 1 : 0));
    }

    private void lv() throws JSONException {
        for (int i5 = 0; i5 < ((com.bytedance.adsdk.ugeno.zb.ycx) this).ycx.size(); i5++) {
            com.bytedance.adsdk.ugeno.zb.sya<View> syaVar = ((com.bytedance.adsdk.ugeno.zb.ycx) this).ycx.get(i5);
            if (syaVar != null) {
                ok okVar = new ok(this.f22701zb);
                ycx(okVar);
                okVar.ycx(this.f22677py);
                ((com.bytedance.adsdk.ugeno.ul.zb) this.lud).ycx((com.bytedance.adsdk.ugeno.ul.zb) okVar.ycx(syaVar.rmf(), this.f22655dj, (JSONObject) null));
            }
        }
    }

    private int ui() {
        if (this.xh == 1) {
            List<com.bytedance.adsdk.ugeno.zb.sya<View>> list = ((com.bytedance.adsdk.ugeno.zb.ycx) this).ycx;
            if (list != null) {
                return list.size();
            }
            return 0;
        }
        JSONArray jSONArray = this.skm;
        if (jSONArray != null) {
            return jSONArray.length();
        }
        return 0;
    }

    private void ul(int i5) {
        if (this.f22649ag == null) {
            return;
        }
        if (this.znc == 0 && i5 == ui() - 1) {
            this.f22649ag.ycx("SwiperView://reloop", 1);
        }
        if (this.znc == ui() - 1 && i5 == 0) {
            this.f22649ag.ycx("SwiperView://reloop", 0);
        }
    }

    private void uz() {
        List<com.bytedance.adsdk.ugeno.zb.sya<View>> list = ((com.bytedance.adsdk.ugeno.zb.ycx) this).ycx;
        if (list == null || list.isEmpty()) {
            return;
        }
        com.bytedance.adsdk.ugeno.zb.sya<View> syaVar = ((com.bytedance.adsdk.ugeno.zb.ycx) this).ycx.get(0);
        if (this.skm == null) {
            return;
        }
        for (int i5 = 0; i5 < this.skm.length(); i5++) {
            ok okVar = new ok(this.f22701zb);
            ycx(okVar);
            okVar.ycx(this.f22677py);
            try {
                JSONObject jSONObjectOptJSONObject = this.skm.optJSONObject(i5);
                if (jSONObjectOptJSONObject != null) {
                    if (jSONObjectOptJSONObject.has("$chunk")) {
                        this.f22655dj.put("$item", jSONObjectOptJSONObject.optJSONArray("$chunk"));
                    } else {
                        this.f22655dj.put("$item", jSONObjectOptJSONObject);
                    }
                    ((com.bytedance.adsdk.ugeno.ul.zb) this.lud).ycx((com.bytedance.adsdk.ugeno.ul.zb) okVar.ycx(syaVar.rmf(), this.f22655dj, (JSONObject) null));
                }
            } catch (Throwable unused) {
            }
        }
    }

    public void dj() throws Resources.NotFoundException {
        ((com.bytedance.adsdk.ugeno.ul.zb) this.lud).xkz(((com.bytedance.adsdk.ugeno.ul.zb) this.lud).getCurrentItem() - 1);
    }

    public void sya() throws Resources.NotFoundException {
        ((com.bytedance.adsdk.ugeno.ul.zb) this.lud).xkz(((com.bytedance.adsdk.ugeno.ul.zb) this.lud).getCurrentItem() + 1);
    }

    @Override // com.bytedance.adsdk.ugeno.zb.sya
    public View ycx() {
        com.bytedance.adsdk.ugeno.ul.zb zbVar = new com.bytedance.adsdk.ugeno.ul.zb(this.f22701zb);
        this.lud = zbVar;
        zbVar.ycx((lud) this);
        return this.lud;
    }

    @Override // com.bytedance.adsdk.ugeno.zb.ycx, com.bytedance.adsdk.ugeno.zb.sya
    public void zb() throws JSONException, Resources.NotFoundException {
        super.zb();
        ((com.bytedance.adsdk.ugeno.ul.zb) this.lud).sya((int) this.vbt).lud(this.f3if).ycx(this.tpg).ycx(this.liq).zb(this.vy).sya(this.f22500yw).dj(this.ff).zb(this.f22490cu).ycx(this.f22496qt).zb().dj(this.f22498te).ycx(this.f22493nc).zb((int) this.vbt).dj((int) this.f22489ci).lud((int) this.f22495pg).zb(this.rzo).sya(this.yyc).ul(this.mue).lt(this.f22491kh).jw((int) this.f22494nq).jc((int) this.spv).fby((int) this.hfd).lud(this.pyn).sya(this.f22497sp).xkz(this.bah);
        ((com.bytedance.adsdk.ugeno.ul.zb) this.lud).setOnPageChangeListener(this);
        if (this.xh == 1) {
            lv();
        } else {
            uz();
        }
        ((com.bytedance.adsdk.ugeno.ul.zb) this.lud).sya();
    }

    @Override // com.bytedance.adsdk.ugeno.zb.ycx
    public void ycx(com.bytedance.adsdk.ugeno.zb.sya syaVar) {
        if (syaVar == null) {
            return;
        }
        ((com.bytedance.adsdk.ugeno.zb.ycx) this).ycx.add(syaVar);
    }

    @Override // com.bytedance.adsdk.ugeno.zb.ycx
    public void ycx(com.bytedance.adsdk.ugeno.zb.sya syaVar, ViewGroup.LayoutParams layoutParams) {
        if (syaVar == null) {
            return;
        }
        ((com.bytedance.adsdk.ugeno.zb.ycx) this).ycx.add(syaVar);
    }

    @Override // com.bytedance.adsdk.ugeno.zb.sya
    public void ycx(String str, String str2) {
        super.ycx(str, str2);
        if (TextUtils.isEmpty(str)) {
            return;
        }
        str.getClass();
        switch (str) {
            case "startDelay":
                this.f22495pg = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, -1.0f);
                break;
            case "startIndex":
                this.bah = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 0);
                break;
            case "indicatorColor":
                this.mue = com.bytedance.adsdk.ugeno.fby.ycx.ycx(str2, this.mue);
                break;
            case "indicatorStyle":
                this.tpg = str2;
                break;
            case "indicatorWidth":
                this.liq = fby.ycx(this.f22701zb, com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 8.0f));
                break;
            case "indicatorHeight":
                this.vy = fby.ycx(this.f22701zb, com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 8.0f));
                break;
            case "nextMargin":
                this.spv = fby.ycx(this.f22701zb, com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 0.0f));
                break;
            case "driveMode":
                this.xh = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 0);
                break;
            case "effect":
                this.f22497sp = str2;
                break;
            case "direction":
                if (TextUtils.equals(str2, "vertical")) {
                    this.f22496qt = 1;
                    break;
                } else {
                    this.f22496qt = 0;
                    break;
                }
            case "disableOnInteraction":
                this.f3if = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, false);
                break;
            case "indicator":
                this.yyc = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, false);
                break;
            case "indicatorX":
                this.f22500yw = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 50.0f);
                break;
            case "indicatorY":
                this.ff = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 90.0f);
                break;
            case "previousMargin":
                this.f22494nq = fby.ycx(this.f22701zb, com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 0.0f));
                break;
            case "loop":
                this.f22498te = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, true);
                break;
            case "delay":
                this.f22489ci = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 2000.0f);
                break;
            case "speed":
                this.vbt = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 500.0f);
                break;
            case "indicatorDirection":
                this.f22490cu = str2;
                break;
            case "allowTouchMove":
                this.rzo = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, true);
                break;
            case "pageCount":
                this.pyn = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 1.0f);
                break;
            case "pageMargin":
                this.hfd = fby.ycx(this.f22701zb, com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 0.0f));
                break;
            case "indicatorSelectedColor":
                this.f22491kh = com.bytedance.adsdk.ugeno.fby.ycx.ycx(str2, this.f22491kh);
                break;
            case "autoplay":
                this.f22493nc = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, true);
                break;
            case "dataList":
                this.skm = com.bytedance.adsdk.ugeno.fby.zb.ycx(this.f22655dj, str2, null);
                break;
        }
    }

    public void ycx(int i5) throws Resources.NotFoundException {
        if (((com.bytedance.adsdk.ugeno.ul.zb) this.lud).getCurrentItem() != i5) {
            ((com.bytedance.adsdk.ugeno.ul.zb) this.lud).xkz(i5);
        }
    }

    @Override // com.bytedance.adsdk.ugeno.ul.sya
    public void ycx(boolean z11, int i5, float f11, int i11) {
        ycx(z11, i5, f11);
    }

    @Override // com.bytedance.adsdk.ugeno.ul.sya
    public void ycx(boolean z11, int i5, int i11, boolean z12, boolean z13) {
        if (this.znc != i5) {
            ul(i5);
            fby(i5);
            this.znc = i5;
        }
    }

    @Override // com.bytedance.adsdk.ugeno.ul.sya
    public void ycx(boolean z11, int i5) {
        if (i5 != 0) {
            if (i5 != 1) {
                return;
            }
            this.f22499yl = true;
        } else {
            if (!z11) {
                this.f22492ko = true;
            }
            this.f22499yl = false;
        }
    }

    private void ycx(boolean z11, int i5, float f11) {
        if (this.f22649ag != null && !z11 && i5 == ui() - 1 && f11 == 0.0f && this.f22492ko) {
            this.f22649ag.ycx("SwiperView://finish", new Object[0]);
            this.f22492ko = false;
        }
    }

    private void ycx(ok okVar) {
        if (this.f3if) {
            okVar.ycx(new com.bytedance.adsdk.ugeno.core.lud() { // from class: com.bytedance.adsdk.ugeno.sya.1
                @Override // com.bytedance.adsdk.ugeno.core.lud
                public void ycx(com.bytedance.adsdk.ugeno.zb.sya syaVar, String str, List<lt.ycx> list) {
                    if ((TextUtils.equals(str, "tap") || TextUtils.equals(str, "slide") || TextUtils.equals(str, "touchStart") || TextUtils.equals(str, "touchEnd")) && ((com.bytedance.adsdk.ugeno.zb.sya) sya.this).lud != null) {
                        ((com.bytedance.adsdk.ugeno.ul.zb) ((com.bytedance.adsdk.ugeno.zb.sya) sya.this).lud).lt();
                    }
                }
            });
        }
    }
}
