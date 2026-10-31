package com.bytedance.sdk.component.adexpress.dynamic.ycx;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import com.bytedance.sdk.component.adexpress.dynamic.dj.lt;
import com.bytedance.sdk.component.adexpress.dynamic.dynamicview.DynamicRootView;
import com.bytedance.sdk.component.adexpress.dynamic.dynamicview.kgy;
import com.bytedance.sdk.component.adexpress.zb.dj;
import com.bytedance.sdk.component.adexpress.zb.ea;
import com.bytedance.sdk.component.adexpress.zb.fby;
import com.bytedance.sdk.component.adexpress.zb.ry;
import com.bytedance.sdk.component.adexpress.zb.ul;
import com.bytedance.sdk.component.adexpress.zb.xkz;
import com.bytedance.sdk.component.utils.jw;
import com.bytedance.sdk.openadsdk.oty.sya;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ycx implements dj<DynamicRootView>, ea {

    /* renamed from: dj, reason: collision with root package name */
    private ul f23526dj;
    private AtomicBoolean fby = new AtomicBoolean(false);

    /* renamed from: lt, reason: collision with root package name */
    private ry f23527lt;
    private fby lud;
    private Context sya;

    /* renamed from: ul, reason: collision with root package name */
    private ScheduledFuture<?> f23528ul;
    private DynamicRootView ycx;

    /* renamed from: zb, reason: collision with root package name */
    private com.bytedance.sdk.component.adexpress.dynamic.lud.fby f23529zb;

    /* renamed from: com.bytedance.sdk.component.adexpress.dynamic.ycx.ycx$ycx, reason: collision with other inner class name */
    public class RunnableC0030ycx implements Runnable {

        /* renamed from: zb, reason: collision with root package name */
        private int f23531zb;

        public RunnableC0030ycx(int i5) {
            this.f23531zb = i5;
        }

        @Override // java.lang.Runnable
        public void run() {
            if (this.f23531zb == 2) {
                ycx.this.ycx.callBackRenderFail(ycx.this.f23529zb instanceof com.bytedance.sdk.component.adexpress.dynamic.lud.ul ? Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE : Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE, null);
            }
        }
    }

    public ycx(Context context, boolean z11, com.bytedance.sdk.component.adexpress.dynamic.lud.fby fbyVar, ry ryVar, com.bytedance.sdk.component.adexpress.dynamic.lt.ycx ycxVar) {
        this.sya = context;
        DynamicRootView dynamicRootView = new DynamicRootView(context, z11, ryVar, ycxVar);
        this.ycx = dynamicRootView;
        this.f23529zb = fbyVar;
        this.f23527lt = ryVar;
        dynamicRootView.setRenderListener(this);
        this.f23527lt = ryVar;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void fby() {
        try {
            ScheduledFuture<?> scheduledFuture = this.f23528ul;
            if (scheduledFuture == null || scheduledFuture.isCancelled()) {
                return;
            }
            this.f23528ul.cancel(false);
            this.f23528ul = null;
        } catch (Throwable th2) {
            sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJt3o5L2lSPX6MkUusjgQ==", "f/cjlA61avWFRNNYng==", "WO8jlgawW8KOTtJPuBitLXT7ObMWqHzVhX7WToc=", 387);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void lt() {
        this.f23527lt.lud().zb(sya());
        JSONObject jSONObjectSya = this.f23527lt.sya();
        if (com.bytedance.sdk.component.adexpress.ycx.zb.zb.ycx(jSONObjectSya)) {
            this.f23529zb.ycx(new com.bytedance.sdk.component.adexpress.dynamic.lt.zb() { // from class: com.bytedance.sdk.component.adexpress.dynamic.ycx.ycx.2
                @Override // com.bytedance.sdk.component.adexpress.dynamic.lt.zb
                public void ycx(final com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar) {
                    ycx.this.fby();
                    ycx.this.f23527lt.lud().sya(ycx.this.sya());
                    ycx.this.ycx(fbyVar);
                    ycx.this.zb(fbyVar);
                    if (Looper.getMainLooper() == Looper.myLooper()) {
                        ycx.this.sya(fbyVar);
                    } else {
                        new Handler(Looper.getMainLooper()).post(new Runnable() { // from class: com.bytedance.sdk.component.adexpress.dynamic.ycx.ycx.2.1
                            @Override // java.lang.Runnable
                            public void run() {
                                ycx.this.sya(fbyVar);
                            }
                        });
                    }
                    if (ycx.this.ycx == null || fbyVar == null) {
                        return;
                    }
                    ycx.this.ycx.setBgColor(fbyVar.ycx());
                    ycx.this.ycx.setBgMaterialCenterCalcColor(fbyVar.zb());
                }
            });
            this.f23529zb.ycx(this.f23527lt);
            return;
        }
        int i5 = this.f23529zb instanceof com.bytedance.sdk.component.adexpress.dynamic.lud.ul ? Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE : 113;
        DynamicRootView dynamicRootView = this.ycx;
        StringBuilder sb2 = new StringBuilder("data null is ");
        sb2.append(jSONObjectSya == null);
        dynamicRootView.callBackRenderFail(i5, sb2.toString());
    }

    private boolean ul() {
        DynamicRootView dynamicRootView = this.ycx;
        return (dynamicRootView == null || dynamicRootView.getChildCount() == 0) ? false : true;
    }

    public DynamicRootView dj() {
        return this.ycx;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zb(com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar) {
        float fUl;
        float fLt;
        List<com.bytedance.sdk.component.adexpress.dynamic.dj.fby> listEa;
        if (fbyVar == null) {
            return;
        }
        List<com.bytedance.sdk.component.adexpress.dynamic.dj.fby> listEa2 = fbyVar.ea();
        if (listEa2 == null || listEa2.size() <= 0) {
            fUl = 0.0f;
        } else {
            fUl = 0.0f;
            for (com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar2 : listEa2) {
                if (fbyVar2.ul() > fbyVar.ul() - fbyVar2.jw() || (listEa = fbyVar2.ea()) == null || listEa.size() <= 0) {
                    fLt = 0.0f;
                } else {
                    fLt = 0.0f;
                    for (com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar3 : listEa) {
                        if (fbyVar3.jc().zb().equals("logo-union")) {
                            fLt = fbyVar3.jc().lt();
                            fUl = ((fbyVar.ul() + (-fLt)) - fbyVar2.ul()) + fbyVar2.jc().lud().pg();
                        }
                    }
                }
                zb(fbyVar2);
                if (fLt <= -15.0f) {
                    fbyVar2.lt(fbyVar2.jw() - fLt);
                    fbyVar2.dj(fbyVar2.ul() + fLt);
                    for (com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar4 : fbyVar2.ea()) {
                        fbyVar4.dj(fbyVar4.ul() - fLt);
                    }
                }
            }
        }
        com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVarOk = fbyVar.ok();
        if (fbyVarOk == null) {
            return;
        }
        float fLt2 = fbyVar.lt() - fbyVarOk.lt();
        float fUl2 = fbyVar.ul() - fbyVarOk.ul();
        fbyVar.sya(fLt2);
        fbyVar.dj(fUl2);
        if (fUl > 0.0f) {
            fbyVar.dj(fbyVar.ul() - fUl);
            fbyVar.lt(fbyVar.jw() + fUl);
            for (com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar5 : fbyVar.ea()) {
                fbyVar5.dj(fbyVar5.ul() + fUl);
            }
        }
    }

    @Override // com.bytedance.sdk.component.adexpress.zb.dj
    public int sya() {
        return this.f23529zb instanceof com.bytedance.sdk.component.adexpress.dynamic.lud.ul ? 3 : 2;
    }

    @Override // com.bytedance.sdk.component.adexpress.zb.dj
    public void ycx(ul ulVar) {
        this.f23526dj = ulVar;
        int iLt = this.f23527lt.lt();
        if (iLt < 0) {
            this.ycx.callBackRenderFail(this.f23529zb instanceof com.bytedance.sdk.component.adexpress.dynamic.lud.ul ? Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE : Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE, "time is ".concat(String.valueOf(iLt)));
            return;
        }
        this.f23528ul = com.bytedance.sdk.component.adexpress.dj.dj.ycx(new RunnableC0030ycx(2), iLt, TimeUnit.MILLISECONDS);
        if (Looper.getMainLooper() == Looper.myLooper() && this.f23527lt.jw() <= 0) {
            lt();
        } else {
            jw.zb().postDelayed(new Runnable() { // from class: com.bytedance.sdk.component.adexpress.dynamic.ycx.ycx.1
                @Override // java.lang.Runnable
                public void run() {
                    ycx.this.lt();
                }
            }, this.f23527lt.jw());
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void sya(com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar) {
        if (fbyVar == null) {
            this.ycx.callBackRenderFail(this.f23529zb instanceof com.bytedance.sdk.component.adexpress.dynamic.lud.ul ? Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE : 113, "layoutUnit is null");
            return;
        }
        this.f23527lt.lud().dj(sya());
        try {
            this.ycx.render(fbyVar, sya());
        } catch (Exception e3) {
            sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJt3o5L2lSPX6MkUusjgQ==", "f/cjlA61avWFRNNYng==", "SesjkQauRcaZRcJJox+QKUn9KIcgvWXLgkvUVg==", 288);
            int i5 = this.f23529zb instanceof com.bytedance.sdk.component.adexpress.dynamic.lud.ul ? 128 : Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE;
            this.ycx.callBackRenderFail(i5, "exception is " + e3.getMessage());
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ycx(com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar) {
        List<com.bytedance.sdk.component.adexpress.dynamic.dj.fby> listEa;
        if (fbyVar == null || (listEa = fbyVar.ea()) == null || listEa.size() <= 0) {
            return;
        }
        Collections.sort(listEa, new Comparator<com.bytedance.sdk.component.adexpress.dynamic.dj.fby>() { // from class: com.bytedance.sdk.component.adexpress.dynamic.ycx.ycx.3
            @Override // java.util.Comparator
            /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
            public int compare(com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar2, com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar3) {
                lt ltVarLud = fbyVar2.jc().lud();
                lt ltVarLud2 = fbyVar3.jc().lud();
                if (ltVarLud == null || ltVarLud2 == null) {
                    return 0;
                }
                return ltVarLud.ujb() >= ltVarLud2.ujb() ? 1 : -1;
            }
        });
        for (com.bytedance.sdk.component.adexpress.dynamic.dj.fby fbyVar2 : listEa) {
            if (fbyVar2 != null) {
                ycx(fbyVar2);
            }
        }
    }

    @Override // com.bytedance.sdk.component.adexpress.zb.dj
    /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
    public DynamicRootView lud() {
        return dj();
    }

    /* JADX WARN: Multi-variable type inference failed */
    private void ycx(View view) {
        if (view == 0) {
            return;
        }
        if (view instanceof ViewGroup) {
            int i5 = 0;
            while (true) {
                ViewGroup viewGroup = (ViewGroup) view;
                if (i5 >= viewGroup.getChildCount()) {
                    break;
                }
                ycx(viewGroup.getChildAt(i5));
                i5++;
            }
        }
        if (view instanceof kgy) {
            ((kgy) view).zb();
        }
    }

    public void ycx(fby fbyVar) {
        this.lud = fbyVar;
    }

    @Override // com.bytedance.sdk.component.adexpress.zb.ea
    public void ycx(xkz xkzVar) {
        if (this.fby.get()) {
            return;
        }
        this.fby.set(true);
        if (xkzVar.sya() && ul()) {
            this.ycx.setLayoutParams(new FrameLayout.LayoutParams(-1, -1));
            this.f23526dj.ycx(lud(), xkzVar);
            return;
        }
        this.f23526dj.ycx(xkzVar.ea(), xkzVar.jc());
    }

    public void zb() {
        ycx(lud());
    }

    @Override // com.bytedance.sdk.component.adexpress.zb.ea
    public void ycx(View view, int i5, com.bytedance.sdk.component.adexpress.sya syaVar) {
        fby fbyVar = this.lud;
        if (fbyVar != null) {
            fbyVar.ycx(view, i5, syaVar);
        }
    }
}
