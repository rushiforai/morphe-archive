package com.bytedance.sdk.openadsdk.core.ry.zb.lud;

import android.content.Context;
import com.bytedance.adsdk.ugeno.fby.fby;
import org.json.JSONException;

/* loaded from: classes2.dex */
public class sya extends com.bytedance.adsdk.ugeno.zb.sya<ycx> {

    /* renamed from: nc, reason: collision with root package name */
    private float f26020nc;

    /* renamed from: qt, reason: collision with root package name */
    private int f26021qt;

    /* renamed from: te, reason: collision with root package name */
    private int f26022te;
    private float vbt;
    private String ycx;

    public sya(Context context) {
        super(context);
        this.ycx = "line";
        this.f26021qt = com.bytedance.adsdk.ugeno.fby.ycx.ycx("#FFD813");
        this.f26022te = com.bytedance.adsdk.ugeno.fby.ycx.ycx("rgba(0, 0, 0, 0.5)");
        this.f26020nc = fby.ycx(this.f22701zb, 1.0f);
    }

    @Override // com.bytedance.adsdk.ugeno.zb.sya
    /* renamed from: sya, reason: merged with bridge method [inline-methods] */
    public ycx ycx() {
        ycx ycxVar = new ycx(this.f22701zb);
        ycxVar.ycx(this);
        return ycxVar;
    }

    public void ul(int i5) {
        ((ycx) this.lud).setAnimationDuration(i5);
    }

    @Override // com.bytedance.adsdk.ugeno.zb.sya
    public void zb() throws JSONException {
        super.zb();
        ((ycx) this.lud).ycx(this.ycx).ycx(this.f26021qt).zb(this.f26022te).zb(this.vbt).ycx(this.f26020nc);
    }

    public void ycx(int i5) {
        ((ycx) this.lud).setProgress(i5);
    }

    @Override // com.bytedance.adsdk.ugeno.zb.sya
    public void ycx(String str, String str2) {
        super.ycx(str, str2);
        str.getClass();
        switch (str) {
            case "progressBackgroundColor":
                this.f26022te = com.bytedance.adsdk.ugeno.fby.ycx.ycx(str2);
                break;
            case "progressSize":
                this.f26020nc = fby.ycx(this.f22701zb, com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 1.0f));
                break;
            case "progressType":
                this.ycx = str2;
                break;
            case "progressColor":
                this.f26021qt = com.bytedance.adsdk.ugeno.fby.ycx.ycx(str2);
                break;
            case "barRadius":
                if (com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 0.0f) <= 0.0f) {
                    this.vbt = 0.0f;
                    break;
                } else {
                    this.vbt = fby.ycx(this.f22701zb, com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 0.0f));
                    break;
                }
        }
    }
}
