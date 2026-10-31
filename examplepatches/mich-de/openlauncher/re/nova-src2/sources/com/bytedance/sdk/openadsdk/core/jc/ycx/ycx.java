package com.bytedance.sdk.openadsdk.core.jc.ycx;

import android.app.Activity;
import android.content.Context;
import android.util.SparseArray;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import com.bytedance.sdk.openadsdk.AdSlot;
import com.bytedance.sdk.openadsdk.api.PAGExpressAdWrapperListener;
import com.bytedance.sdk.openadsdk.core.jc.dv;
import com.bytedance.sdk.openadsdk.core.jc.jc;
import com.bytedance.sdk.openadsdk.core.jc.jw;
import com.bytedance.sdk.openadsdk.core.jc.lud;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.core.sya.sya;
import com.bytedance.sdk.openadsdk.core.sya.zb;
import com.bytedance.sdk.openadsdk.utils.dc;
import com.bytedance.sdk.openadsdk.utils.oby;
import java.util.HashMap;

/* loaded from: classes2.dex */
public class ycx {

    /* renamed from: dj, reason: collision with root package name */
    protected String f25520dj;

    /* renamed from: ea, reason: collision with root package name */
    private PAGExpressAdWrapperListener f25521ea;
    protected Context fby;

    /* renamed from: jc, reason: collision with root package name */
    private com.bytedance.sdk.openadsdk.thx.ycx.ycx.sya f25522jc;

    /* renamed from: jw, reason: collision with root package name */
    protected AdSlot f25523jw;

    /* renamed from: lt, reason: collision with root package name */
    protected float f25524lt;
    protected float lud;

    /* renamed from: ok, reason: collision with root package name */
    private com.bytedance.sdk.openadsdk.component.reward.sya.zb f25525ok;
    protected ViewGroup sya;

    /* renamed from: ul, reason: collision with root package name */
    protected Activity f25526ul;
    protected dv ycx;

    /* renamed from: zb, reason: collision with root package name */
    protected tn f25527zb;

    public ycx(ViewGroup viewGroup, tn tnVar, String str, Activity activity, Context context, com.bytedance.sdk.openadsdk.component.reward.sya.zb zbVar) {
        this.sya = viewGroup;
        this.f25527zb = tnVar;
        this.f25520dj = str;
        this.f25526ul = activity;
        this.fby = context;
        this.f25525ok = zbVar;
    }

    public void dj() {
        dv dvVar = this.ycx;
        if (dvVar != null) {
            dvVar.ok();
        }
    }

    public void lt() {
        dv dvVar = this.ycx;
        if (dvVar != null) {
            dvVar.ry();
        }
    }

    public void lud() {
        dv dvVar = this.ycx;
        if (dvVar != null) {
            dvVar.ea();
        }
    }

    public void sya() {
        Activity activity = this.f25526ul;
        tn tnVar = this.f25527zb;
        String str = this.f25520dj;
        jc jcVar = new jc(activity, tnVar, str, oby.ycx(str));
        jcVar.ycx(new zb.ycx() { // from class: com.bytedance.sdk.openadsdk.core.jc.ycx.ycx.1
            @Override // com.bytedance.sdk.openadsdk.core.sya.zb.ycx
            public void ycx(View view, int i5) {
                ycx.this.f25525ok.jc();
            }
        });
        HashMap map = new HashMap();
        map.put("click_scence", 1);
        jcVar.ycx(map);
        Activity activity2 = this.f25526ul;
        tn tnVar2 = this.f25527zb;
        String str2 = this.f25520dj;
        jw jwVar = new jw(activity2, tnVar2, str2, oby.ycx(str2)) { // from class: com.bytedance.sdk.openadsdk.core.jc.ycx.ycx.2
            @Override // com.bytedance.sdk.openadsdk.core.sya.ycx, com.bytedance.sdk.openadsdk.core.sya.zb, com.bytedance.sdk.openadsdk.core.sya.sya
            public void ycx(View view, float f11, float f12, float f13, float f14, SparseArray<sya.ycx> sparseArray, boolean z11) {
                super.ycx(view, f11, f12, f13, f14, sparseArray, z11);
            }
        };
        jwVar.ycx(new zb.ycx() { // from class: com.bytedance.sdk.openadsdk.core.jc.ycx.ycx.3
            @Override // com.bytedance.sdk.openadsdk.core.sya.zb.ycx
            public void ycx(View view, int i5) {
                ycx.this.f25525ok.jc();
            }
        });
        HashMap map2 = new HashMap();
        map2.put("click_scence", 1);
        jwVar.ycx(map2);
        ycx(jcVar, jwVar);
    }

    public boolean ul() {
        dv dvVar = this.ycx;
        if (dvVar != null) {
            return dvVar.syc();
        }
        return false;
    }

    public dv zb() {
        return this.ycx;
    }

    public void ycx(float[] fArr) {
        if (fArr == null || fArr.length != 2) {
            return;
        }
        ycx(fArr[0], fArr[1]);
    }

    public void ycx(float f11, float f12) {
        this.lud = f11;
        this.f25524lt = f12;
        this.f25523jw = new AdSlot.Builder().setCodeId(String.valueOf(this.f25527zb.ksy())).setExpressViewAcceptedSize(this.lud, this.f25524lt).build();
        this.ycx = new dv(this.f25526ul, this.fby, this.f25527zb, this.f25523jw, this.f25520dj);
    }

    public void ycx(float[] fArr, boolean z11) {
        int iZb;
        int iZb2;
        dv dvVar = this.ycx;
        if (dvVar == null) {
            return;
        }
        dvVar.setExpressInteractionListener(this.f25521ea);
        sya();
        if (!z11 || fArr == null || fArr.length < 2 || fArr[0] <= 0.0f || fArr[1] <= 0.0f) {
            iZb = -1;
            iZb2 = -1;
        } else {
            iZb = dc.zb(this.sya.getContext(), fArr[0]);
            iZb2 = dc.zb(this.sya.getContext(), fArr[1]);
        }
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(iZb, iZb2);
        layoutParams.gravity = 17;
        this.sya.addView(this.ycx, layoutParams);
        this.ycx.thx();
        this.ycx.ea();
    }

    public void ycx(PAGExpressAdWrapperListener pAGExpressAdWrapperListener) {
        this.f25521ea = pAGExpressAdWrapperListener;
    }

    public void ycx(lud ludVar) {
        this.ycx.setDislikeClickListener(ludVar);
    }

    public void ycx(jc jcVar, jw jwVar) {
        tn tnVar;
        if (this.ycx == null || (tnVar = this.f25527zb) == null) {
            return;
        }
        this.f25522jc = ycx(tnVar);
        jcVar.zb(this.ycx);
        jcVar.ycx(this.f25522jc);
        this.ycx.setClickListener(jcVar);
        jwVar.zb(this.ycx);
        jwVar.ycx(this.f25522jc);
        this.ycx.setClickCreativeListener(jwVar);
    }

    private com.bytedance.sdk.openadsdk.thx.ycx.ycx.sya ycx(tn tnVar) {
        if (tnVar.liq() == 4) {
            return com.bytedance.sdk.openadsdk.thx.ycx.ycx.dj.ycx(this.f25526ul, this.f25520dj);
        }
        return null;
    }
}
