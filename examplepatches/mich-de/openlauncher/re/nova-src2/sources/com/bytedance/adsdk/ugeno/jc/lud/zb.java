package com.bytedance.adsdk.ugeno.jc.lud;

import android.content.Context;
import android.graphics.Color;
import com.bytedance.adsdk.ugeno.zb.sya;
import org.json.JSONException;

/* loaded from: classes2.dex */
public class zb extends sya<ycx> {

    /* renamed from: nc, reason: collision with root package name */
    private float f22342nc;

    /* renamed from: qt, reason: collision with root package name */
    private int f22343qt;

    /* renamed from: te, reason: collision with root package name */
    private float f22344te;
    private float vbt;
    private int ycx;

    /* renamed from: pg, reason: collision with root package name */
    private static final int f22341pg = Color.parseColor("#FFC642");

    /* renamed from: ci, reason: collision with root package name */
    private static final int f22340ci = Color.parseColor("#e3e3e4");

    public zb(Context context) {
        super(context);
        this.ycx = f22341pg;
        this.f22343qt = f22340ci;
        this.f22344te = 4.0f;
        this.f22342nc = 20.0f;
    }

    @Override // com.bytedance.adsdk.ugeno.zb.sya
    /* renamed from: sya, reason: merged with bridge method [inline-methods] */
    public ycx ycx() {
        ycx ycxVar = new ycx(this.f22701zb);
        ycxVar.ycx(this);
        return ycxVar;
    }

    @Override // com.bytedance.adsdk.ugeno.zb.sya
    public void zb() throws JSONException {
        super.zb();
        if (aeu()) {
            ((ycx) this.lud).ycx(this.f22344te, this.ycx, this.f22343qt, this.f22342nc, (int) this.vbt);
        } else {
            ((ycx) this.lud).ycx(this.f22344te, this.ycx, this.f22343qt, this.f22342nc, 5);
        }
    }

    @Override // com.bytedance.adsdk.ugeno.zb.sya
    public void ycx(String str, String str2) {
        super.ycx(str, str2);
        str.getClass();
        switch (str) {
            case "highLightColor":
            case "highlightColor":
                this.ycx = com.bytedance.adsdk.ugeno.fby.ycx.ycx(str2);
                break;
            case "lowLightColor":
            case "lowlightColor":
                this.f22343qt = com.bytedance.adsdk.ugeno.fby.ycx.ycx(str2, f22340ci);
                break;
            case "gap":
                this.vbt = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 0.0f);
                break;
            case "size":
                this.f22342nc = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 20.0f);
                break;
            case "score":
                this.f22344te = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 4.0f);
                break;
        }
    }
}
