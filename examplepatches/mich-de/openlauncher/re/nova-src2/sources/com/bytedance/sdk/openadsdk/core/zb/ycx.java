package com.bytedance.sdk.openadsdk.core.zb;

import b.c9;
import com.bytedance.sdk.openadsdk.AdSlot;
import com.bytedance.sdk.openadsdk.core.tn;
import com.bytedance.sdk.openadsdk.dv.lud;
import com.bytedance.sdk.openadsdk.pmi.dj;
import com.bytedance.sdk.openadsdk.pmi.sya;
import com.bytedance.sdk.openadsdk.utils.oby;
import com.bytedance.sdk.openadsdk.utils.yzp;

/* loaded from: classes2.dex */
public class ycx implements tn.ycx {
    private final boolean sya;
    private final tn.ycx ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final AdSlot f26512zb;

    public ycx(tn.ycx ycxVar, AdSlot adSlot, boolean z11) {
        this.ycx = ycxVar;
        this.f26512zb = adSlot;
        this.sya = z11;
    }

    @Override // com.bytedance.sdk.openadsdk.core.tn.ycx
    public void ycx(final int i5, final String str) {
        AdSlot adSlot;
        if (this.ycx != null) {
            if (yzp.lt() || !((adSlot = this.f26512zb) == null || adSlot.getDurationSlotType() == 5 || lud.ycx("getads_callback_async", 0) != 1)) {
                this.ycx.ycx(i5, str);
            } else {
                yzp.ycx(new Runnable() { // from class: com.bytedance.sdk.openadsdk.core.zb.ycx.1
                    @Override // java.lang.Runnable
                    public void run() {
                        ycx.this.ycx.ycx(i5, str);
                    }
                });
            }
            if (!this.sya || this.f26512zb == null) {
                return;
            }
            sya.sya(new dj() { // from class: com.bytedance.sdk.openadsdk.core.zb.ycx.2
                @Override // com.bytedance.sdk.openadsdk.pmi.dj
                public com.bytedance.sdk.openadsdk.pmi.zb.ycx ycx() {
                    com.bytedance.sdk.openadsdk.pmi.zb.ycx ycxVarH = c9.h("load_ad");
                    ycxVarH.sya(ycx.this.f26512zb.getCodeId());
                    ycxVarH.dj(oby.sya(ycx.this.f26512zb.getDurationSlotType()));
                    ycxVarH.ul(oby.ycx(ycx.this.f26512zb).toString());
                    return ycxVarH;
                }
            });
        }
    }

    @Override // com.bytedance.sdk.openadsdk.core.tn.ycx
    public void ycx(final com.bytedance.sdk.openadsdk.core.model.ycx ycxVar, final com.bytedance.sdk.openadsdk.core.model.sya syaVar) {
        AdSlot adSlot;
        if (this.ycx != null) {
            if (!yzp.lt() && ((adSlot = this.f26512zb) == null || adSlot.getDurationSlotType() == 5 || lud.ycx("getads_callback_async", 0) != 1)) {
                yzp.ycx(new Runnable() { // from class: com.bytedance.sdk.openadsdk.core.zb.ycx.3
                    @Override // java.lang.Runnable
                    public void run() {
                        ycx.this.ycx.ycx(ycxVar, syaVar);
                    }
                });
            } else {
                this.ycx.ycx(ycxVar, syaVar);
            }
            if (!this.sya || this.f26512zb == null) {
                return;
            }
            sya.zb(new dj() { // from class: com.bytedance.sdk.openadsdk.core.zb.ycx.4
                @Override // com.bytedance.sdk.openadsdk.pmi.dj
                public com.bytedance.sdk.openadsdk.pmi.zb.ycx ycx() {
                    com.bytedance.sdk.openadsdk.pmi.zb.ycx ycxVarH = c9.h("load_ad");
                    ycxVarH.sya(ycx.this.f26512zb.getCodeId());
                    ycxVarH.dj(oby.sya(ycx.this.f26512zb.getDurationSlotType()));
                    ycxVarH.ul(oby.ycx(ycx.this.f26512zb).toString());
                    return ycxVarH;
                }
            });
        }
    }
}
