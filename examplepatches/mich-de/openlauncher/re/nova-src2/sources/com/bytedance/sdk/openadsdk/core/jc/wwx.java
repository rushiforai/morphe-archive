package com.bytedance.sdk.openadsdk.core.jc;

import android.view.View;
import com.bytedance.sdk.openadsdk.utils.yzp;
import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: classes2.dex */
public class wwx extends com.bytedance.sdk.component.adexpress.zb.ycx<ycx> {

    /* renamed from: dj, reason: collision with root package name */
    private com.bytedance.sdk.component.adexpress.zb.sya f25506dj;

    /* renamed from: lt, reason: collision with root package name */
    private final com.bytedance.sdk.component.adexpress.zb.ry f25507lt;
    private com.bytedance.sdk.component.adexpress.zb.ul lud;
    private final View sya;
    AtomicBoolean ycx = new AtomicBoolean(false);

    /* renamed from: zb, reason: collision with root package name */
    private ycx f25508zb;

    public wwx(View view, com.bytedance.sdk.component.adexpress.zb.ry ryVar) {
        this.sya = view;
        this.f25507lt = ryVar;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zb() {
        if (this.ycx.get()) {
            return;
        }
        com.bytedance.sdk.component.adexpress.zb.sya syaVar = this.f25506dj;
        if (syaVar == null || !syaVar.ycx((thx) this.sya, 0)) {
            this.lud.ycx(107, "backup false");
            return;
        }
        this.f25507lt.lud().lt();
        ycx ycxVar = (ycx) this.sya.findViewWithTag("tt_express_backup_fl_tag_26");
        this.f25508zb = ycxVar;
        if (ycxVar == null) {
            this.lud.ycx(107, "backupview is null");
            return;
        }
        com.bytedance.sdk.component.adexpress.zb.xkz xkzVar = new com.bytedance.sdk.component.adexpress.zb.xkz();
        ycx ycxVar2 = this.f25508zb;
        float realWidth = ycxVar2 == null ? 0.0f : ycxVar2.getRealWidth();
        ycx ycxVar3 = this.f25508zb;
        float realHeight = ycxVar3 != null ? ycxVar3.getRealHeight() : 0.0f;
        xkzVar.zb(true);
        xkzVar.ycx(realWidth);
        xkzVar.zb(realHeight);
        this.lud.ycx(this.f25508zb, xkzVar);
    }

    @Override // com.bytedance.sdk.component.adexpress.zb.dj
    public void ycx(com.bytedance.sdk.component.adexpress.zb.ul ulVar) {
        this.lud = ulVar;
        yzp.ycx(new Runnable() { // from class: com.bytedance.sdk.openadsdk.core.jc.wwx.1
            @Override // java.lang.Runnable
            public void run() {
                wwx.this.zb();
            }
        });
    }

    @Override // com.bytedance.sdk.component.adexpress.zb.dj
    /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
    public ycx lud() {
        return this.f25508zb;
    }

    @Override // com.bytedance.sdk.component.adexpress.zb.ycx
    public void ycx(com.bytedance.sdk.component.adexpress.zb.sya syaVar) {
        this.f25506dj = syaVar;
    }
}
