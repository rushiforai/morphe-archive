package com.bytedance.sdk.openadsdk.core.jc;

import android.content.Context;
import android.text.TextUtils;
import android.view.View;
import com.bytedance.sdk.openadsdk.TTDislikeDialogAbstract;
import com.bytedance.sdk.openadsdk.activity.single.TTDelegateActivity;
import com.bytedance.sdk.openadsdk.core.rmf;
import com.bytedance.sdk.openadsdk.core.syc.zb.lt;
import com.bytedance.sdk.openadsdk.utils.dc;
import com.bytedance.sdk.openadsdk.utils.oby;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;

/* loaded from: classes2.dex */
public abstract class ycx extends com.bytedance.sdk.openadsdk.core.lt.sya {

    /* renamed from: dj, reason: collision with root package name */
    protected com.bytedance.sdk.openadsdk.sya.sya f25513dj;

    /* renamed from: ea, reason: collision with root package name */
    protected String f25514ea;
    protected int fby;

    /* renamed from: jc, reason: collision with root package name */
    protected boolean f25515jc;

    /* renamed from: jw, reason: collision with root package name */
    protected boolean f25516jw;

    /* renamed from: lt, reason: collision with root package name */
    protected String f25517lt;
    protected TTDislikeDialogAbstract lud;
    protected com.bytedance.sdk.openadsdk.core.model.tn sya;

    /* renamed from: ul, reason: collision with root package name */
    protected int f25518ul;
    private com.bytedance.sdk.openadsdk.dj.ul ycx;

    /* renamed from: zb, reason: collision with root package name */
    protected Context f25519zb;

    public ycx(Context context) {
        super(context);
        this.f25517lt = "embeded_ad";
        this.f25516jw = true;
        this.f25515jc = true;
        setTag("tt_express_backup_fl_tag_26");
    }

    public String getDescription() {
        return !TextUtils.isEmpty(this.sya.spv()) ? this.sya.spv() : !TextUtils.isEmpty(this.sya.xh()) ? this.sya.xh() : b.f42142b;
    }

    public String getNameOrSource() {
        com.bytedance.sdk.openadsdk.core.model.tn tnVar = this.sya;
        return tnVar == null ? b.f42142b : (tnVar.znc() == null || TextUtils.isEmpty(this.sya.znc().zb())) ? !TextUtils.isEmpty(this.sya.sp()) ? this.sya.sp() : b.f42142b : this.sya.znc().zb();
    }

    public float getRealHeight() {
        return dc.sya(this.f25519zb, this.fby);
    }

    public float getRealWidth() {
        return dc.sya(this.f25519zb, this.f25518ul);
    }

    @Override // android.view.View
    public Object getTag() {
        return "tt_express_backup_fl_tag_26";
    }

    public String getTitle() {
        return (this.sya.znc() == null || TextUtils.isEmpty(this.sya.znc().zb())) ? !TextUtils.isEmpty(this.sya.sp()) ? this.sya.sp() : !TextUtils.isEmpty(this.sya.spv()) ? this.sya.spv() : b.f42142b : this.sya.znc().zb();
    }

    public com.bytedance.sdk.openadsdk.core.syc.zb.lt getVideoView() {
        com.bytedance.sdk.openadsdk.core.syc.zb.lt ltVar;
        com.bytedance.sdk.openadsdk.core.model.tn tnVar = this.sya;
        if (tnVar != null && this.f25519zb != null) {
            if (com.bytedance.sdk.openadsdk.core.model.tn.lud(tnVar)) {
                try {
                    ltVar = new com.bytedance.sdk.openadsdk.core.syc.zb.lt(this.f25519zb, this.sya, this.f25517lt, true, false, this.ycx);
                    ltVar.setVideoCacheUrl(this.f25514ea);
                    ltVar.setControllerStatusCallBack(new lt.zb() { // from class: com.bytedance.sdk.openadsdk.core.jc.ycx.2
                        @Override // com.bytedance.sdk.openadsdk.core.syc.zb.lt.zb
                        public void ycx(boolean z11, long j11, long j12, long j13, boolean z12) {
                        }
                    });
                    ltVar.setIsAutoPlay(this.f25516jw);
                    ltVar.ycx(this.f25515jc, "bannerGetVideoView");
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V4CyBCqpswphaxVifAg==", "ee8unhasX86FXQ==", "XOs5owq4bMi2Q9JK", Sdk.SDKError.Reason.INVALID_GZIP_BID_PAYLOAD_VALUE);
                }
                if (!com.bytedance.sdk.openadsdk.core.model.tn.lud(this.sya) && ltVar != null && ltVar.ycx(0L, true, false)) {
                    return ltVar;
                }
            } else {
                ltVar = null;
                if (!com.bytedance.sdk.openadsdk.core.model.tn.lud(this.sya)) {
                }
            }
        }
        return null;
    }

    public void setDislikeInner(rmf rmfVar) {
        if (rmfVar instanceof com.bytedance.sdk.openadsdk.sya.sya) {
            this.f25513dj = (com.bytedance.sdk.openadsdk.sya.sya) rmfVar;
        }
    }

    public void setDislikeOuter(TTDislikeDialogAbstract tTDislikeDialogAbstract) {
        com.bytedance.sdk.openadsdk.core.model.tn tnVar;
        if (tTDislikeDialogAbstract != null && (tnVar = this.sya) != null) {
            tTDislikeDialogAbstract.setMaterialMeta(tnVar.pks(), this.sya.hti());
        }
        this.lud = tTDislikeDialogAbstract;
    }

    @Override // android.view.View
    public void setTag(Object obj) {
        super.setTag("tt_express_backup_fl_tag_26");
    }

    public void ycx() {
        TTDislikeDialogAbstract tTDislikeDialogAbstract = this.lud;
        if (tTDislikeDialogAbstract != null) {
            tTDislikeDialogAbstract.show();
            return;
        }
        com.bytedance.sdk.openadsdk.sya.sya syaVar = this.f25513dj;
        if (syaVar != null) {
            syaVar.ycx();
        } else {
            TTDelegateActivity.ycx(this.sya, (String) null);
        }
    }

    public abstract void ycx(View view, int i5, com.bytedance.sdk.openadsdk.core.model.dy dyVar);

    public void ycx(View view, boolean z11) {
        com.bytedance.sdk.openadsdk.core.sya.zb zbVar;
        if (view == null) {
            return;
        }
        if (z11) {
            Context context = this.f25519zb;
            com.bytedance.sdk.openadsdk.core.model.tn tnVar = this.sya;
            String str = this.f25517lt;
            zbVar = new com.bytedance.sdk.openadsdk.core.sya.ycx(context, tnVar, str, oby.ycx(str));
        } else {
            Context context2 = this.f25519zb;
            com.bytedance.sdk.openadsdk.core.model.tn tnVar2 = this.sya;
            String str2 = this.f25517lt;
            zbVar = new com.bytedance.sdk.openadsdk.core.sya.zb(context2, tnVar2, str2, oby.ycx(str2));
        }
        view.setOnTouchListener(zbVar);
        view.setOnClickListener(zbVar);
        zbVar.ycx(new zb() { // from class: com.bytedance.sdk.openadsdk.core.jc.ycx.1
            @Override // com.bytedance.sdk.openadsdk.core.jc.zb
            public void ycx(View view2, int i5, com.bytedance.sdk.openadsdk.core.model.dy dyVar) {
                ycx.this.ycx(view2, i5, dyVar);
            }
        });
    }

    public void ycx(View view) {
        com.bytedance.sdk.openadsdk.core.model.tn tnVar = this.sya;
        if (tnVar == null || tnVar.ci() == null || view == null) {
            return;
        }
        ycx(view, this.sya.xf() == 1 && this.f25516jw);
    }
}
