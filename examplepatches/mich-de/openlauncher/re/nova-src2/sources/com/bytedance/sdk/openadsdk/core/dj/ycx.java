package com.bytedance.sdk.openadsdk.core.dj;

import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.Color;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import com.bytedance.sdk.component.utils.htf;
import com.bytedance.sdk.component.utils.wwx;
import com.bytedance.sdk.openadsdk.AdSlot;
import com.bytedance.sdk.openadsdk.activity.single.IABLandingPageActivity;
import com.bytedance.sdk.openadsdk.activity.single.TTWebsiteActivity;
import com.bytedance.sdk.openadsdk.api.banner.PAGBannerAdInteractionCallback;
import com.bytedance.sdk.openadsdk.api.banner.PAGBannerAdInteractionListener;
import com.bytedance.sdk.openadsdk.api.banner.PAGBannerAdWrapperListener;
import com.bytedance.sdk.openadsdk.core.dj.ul;
import com.bytedance.sdk.openadsdk.core.fby;
import com.bytedance.sdk.openadsdk.core.jc;
import com.bytedance.sdk.openadsdk.core.jc.thx;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.core.pmi;
import com.bytedance.sdk.openadsdk.core.sya.zb;
import com.bytedance.sdk.openadsdk.core.widget.PAGLogoView;
import com.bytedance.sdk.openadsdk.oem.IPBroadcastReceiver;
import com.bytedance.sdk.openadsdk.utils.dc;
import com.bytedance.sdk.openadsdk.utils.oby;
import com.bytedance.sdk.openadsdk.utils.sz;
import com.bytedance.sdk.openadsdk.utils.tru;
import com.bytedance.sdk.openadsdk.utils.yzp;
import java.lang.ref.WeakReference;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ycx {

    /* renamed from: dj, reason: collision with root package name */
    private tn f25304dj;

    /* renamed from: ea, reason: collision with root package name */
    private thx f25306ea;
    private final boolean fby;

    /* renamed from: jc, reason: collision with root package name */
    private com.bytedance.sdk.openadsdk.thx.ycx.ycx.sya f25307jc;

    /* renamed from: jw, reason: collision with root package name */
    private boolean f25308jw;

    /* renamed from: lt, reason: collision with root package name */
    private final Context f25309lt;
    private PAGBannerAdWrapperListener lud;

    /* renamed from: ok, reason: collision with root package name */
    private ul f25310ok;

    /* renamed from: uh, reason: collision with root package name */
    private long f25312uh;
    private boolean xkz;
    protected dj ycx;

    /* renamed from: zb, reason: collision with root package name */
    protected AdSlot f25314zb;
    private String sya = "banner_ad";

    /* renamed from: ul, reason: collision with root package name */
    private long f25313ul = 0;

    /* renamed from: ry, reason: collision with root package name */
    private final AtomicBoolean f25311ry = new AtomicBoolean(false);
    private final int syc = 1;

    /* renamed from: dy, reason: collision with root package name */
    private final int f25305dy = 0;
    private int wie = -1;
    private final View.OnAttachStateChangeListener pmi = new View.OnAttachStateChangeListener() { // from class: com.bytedance.sdk.openadsdk.core.dj.ycx.1
        @Override // android.view.View.OnAttachStateChangeListener
        public void onViewAttachedToWindow(View view) {
            if (ycx.this.wie == 0 || ycx.this.f25308jw) {
                return;
            }
            ycx ycxVar = ycx.this;
            ycxVar.ycx(ycxVar.ycx.getCurView(), ycx.this.f25304dj);
        }

        @Override // android.view.View.OnAttachStateChangeListener
        public void onViewDetachedFromWindow(View view) {
            if (ycx.this.xkz) {
                ycx.this.wie = 0;
            } else {
                ycx.this.lt();
            }
        }
    };

    /* renamed from: com.bytedance.sdk.openadsdk.core.dj.ycx$ycx, reason: collision with other inner class name */
    public static class C0059ycx extends com.bytedance.sdk.component.fby.zb.sya {
        WeakReference<ycx> sya;
        boolean ycx;

        /* renamed from: zb, reason: collision with root package name */
        tn f25321zb;

        public C0059ycx(boolean z11, tn tnVar, ycx ycxVar) {
            super("ReportWindowFocusChangedAdShow");
            this.ycx = z11;
            this.f25321zb = tnVar;
            this.sya = new WeakReference<>(ycxVar);
        }

        @Override // java.lang.Runnable
        public void run() {
            WeakReference<ycx> weakReference = this.sya;
            if (weakReference == null || weakReference.get() == null) {
                return;
            }
            this.sya.get().zb(this.ycx, this.f25321zb);
        }
    }

    public ycx(Context context, tn tnVar, AdSlot adSlot, ul ulVar, boolean z11) {
        this.xkz = false;
        this.f25309lt = context;
        this.f25304dj = tnVar;
        this.f25314zb = adSlot;
        this.f25310ok = ulVar;
        this.xkz = z11;
        ycx(context, tnVar, adSlot);
        this.fby = false;
        this.f25308jw = false;
    }

    private void ok() {
        this.f25304dj.ycx(SystemClock.elapsedRealtime());
        this.ycx.lud();
    }

    private ul.ycx ea() {
        return new ul.ycx() { // from class: com.bytedance.sdk.openadsdk.core.dj.ycx.7
            @Override // com.bytedance.sdk.openadsdk.core.dj.ul.ycx
            public void ycx() {
                int width = ycx.this.f25306ea.getWidth();
                int height = ycx.this.f25306ea.getHeight();
                View viewYcx = ycx(((double) height) >= Math.floor((((double) width) * 450.0d) / 600.0d));
                ycx.this.f25306ea.dv();
                ycx.this.f25306ea.removeAllViews();
                ycx.this.f25306ea.addView(viewYcx, new ViewGroup.LayoutParams(width, height));
                ycx.this.f25306ea.setClickCreativeListener(null);
                ycx.this.f25306ea.setClickListener(null);
                if (ycx.this.lud != null) {
                    ycx.this.lud.onAdDismissed();
                }
                ycx.this.f25308jw = true;
            }

            private View ycx(boolean z11) {
                com.bytedance.sdk.openadsdk.core.lt.sya syaVar = new com.bytedance.sdk.openadsdk.core.lt.sya(ycx.this.f25309lt);
                ViewGroup.LayoutParams layoutParams = new ViewGroup.LayoutParams(-1, -1);
                syaVar.setBackgroundColor(-1);
                syaVar.setLayoutParams(layoutParams);
                View view = new View(ycx.this.f25309lt);
                ViewGroup.LayoutParams layoutParams2 = new FrameLayout.LayoutParams(-1, -1);
                view.setAlpha(0.3f);
                view.setBackgroundColor(Color.parseColor("#F3F7F8"));
                syaVar.addView(view, layoutParams2);
                com.bytedance.sdk.openadsdk.core.lt.sya syaVar2 = new com.bytedance.sdk.openadsdk.core.lt.sya(ycx.this.f25309lt);
                ViewGroup.LayoutParams layoutParams3 = new FrameLayout.LayoutParams(-1, -1);
                if (z11) {
                    syaVar2.setBackground(wwx.sya(ycx.this.f25309lt, "tt_ad_closed_background_300_250"));
                } else {
                    syaVar2.setBackground(wwx.sya(ycx.this.f25309lt, "tt_ad_closed_background_320_50"));
                }
                syaVar.addView(syaVar2, layoutParams3);
                PAGLogoView pAGLogoViewCreatePAGLogoViewByMaterial = PAGLogoView.createPAGLogoViewByMaterial(ycx.this.f25309lt, ycx.this.f25304dj);
                pAGLogoViewCreatePAGLogoViewByMaterial.setId(520093739);
                FrameLayout.LayoutParams layoutParams4 = new FrameLayout.LayoutParams(-2, -2);
                if (z11) {
                    int iZb = dc.zb(ycx.this.f25309lt, 16.0f);
                    layoutParams4.width = dc.zb(ycx.this.f25309lt, 77.0f);
                    layoutParams4.height = dc.zb(ycx.this.f25309lt, 14.0f);
                    layoutParams4.leftMargin = iZb;
                    layoutParams4.topMargin = iZb;
                } else {
                    int iZb2 = dc.zb(ycx.this.f25309lt, 8.0f);
                    layoutParams4.width = dc.zb(ycx.this.f25309lt, 45.0f);
                    layoutParams4.height = dc.zb(ycx.this.f25309lt, 8.18f);
                    layoutParams4.leftMargin = iZb2;
                    layoutParams4.topMargin = iZb2;
                }
                syaVar2.addView(pAGLogoViewCreatePAGLogoViewByMaterial, layoutParams4);
                com.bytedance.sdk.openadsdk.core.lt.fby fbyVar = new com.bytedance.sdk.openadsdk.core.lt.fby(ycx.this.f25309lt);
                FrameLayout.LayoutParams layoutParams5 = new FrameLayout.LayoutParams(-2, -2);
                layoutParams5.gravity = 17;
                fbyVar.setAlpha(0.5f);
                fbyVar.setLines(1);
                fbyVar.setText(wwx.ycx(ycx.this.f25309lt, "tt_ad_is_closed"));
                if (z11) {
                    fbyVar.setTextSize(18.0f);
                } else {
                    fbyVar.setTextSize(12.0f);
                }
                syaVar2.addView(fbyVar, layoutParams5);
                View.OnClickListener onClickListener = new View.OnClickListener() { // from class: com.bytedance.sdk.openadsdk.core.dj.ycx.7.1
                    @Override // android.view.View.OnClickListener
                    public void onClick(View view2) {
                        if (com.bytedance.sdk.openadsdk.utils.zb.lud() && pmi.dj().av()) {
                            IABLandingPageActivity.ycx(ycx.this.f25309lt, ycx.this.f25304dj, ycx.this.sya);
                        } else {
                            TTWebsiteActivity.ycx(ycx.this.f25309lt, ycx.this.f25304dj, ycx.this.sya);
                        }
                    }
                };
                pAGLogoViewCreatePAGLogoViewByMaterial.setOnClickListener(onClickListener);
                fbyVar.setOnClickListener(onClickListener);
                return syaVar;
            }
        };
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void jc() {
        ok();
    }

    public void dj() {
        zb(this.f25304dj);
        this.f25313ul = 0L;
    }

    public void fby() {
        dj djVar = this.ycx;
        if (djVar instanceof sya) {
            ((sya) djVar).zb();
        }
    }

    public void jw() {
        dj djVar = this.ycx;
        if (djVar instanceof sya) {
            ((sya) djVar).ycx();
        }
    }

    public void lt() {
        this.wie = 1;
        this.ycx.dj();
    }

    public void lud() {
        this.f25313ul = System.currentTimeMillis();
    }

    public com.bytedance.sdk.openadsdk.uh.sya.ycx sya() {
        dj djVar = this.ycx;
        if (djVar instanceof sya) {
            return ((sya) djVar).getVideoModel();
        }
        return null;
    }

    public void ul() {
        if (this.ycx != null) {
            try {
                lt();
                this.ycx.removeOnAttachStateChangeListener(this.pmi);
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V7CybDbl7wphaxVifAg==", "ee8jmwauSNOPR/ZZ", "X+s+gRGzcA==", 586);
            }
        }
    }

    public boolean zb() {
        return this.ycx instanceof sya;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zb(boolean z11, tn tnVar) {
        try {
            if (z11) {
                this.f25313ul = System.currentTimeMillis();
            } else {
                if (this.f25313ul <= 0 || this.f25306ea == null) {
                    return;
                }
                String strValueOf = String.valueOf(System.currentTimeMillis() - this.f25313ul);
                this.f25313ul = 0L;
                com.bytedance.sdk.openadsdk.dj.sya.ycx(strValueOf, tnVar, this.sya, this.f25306ea.getAdShowTime());
            }
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V7CybDbl7wphaxVifAg==", "ee8jmwauSNOPR/ZZ", "Ses9mhGoXs6OTthKqh6jPUjNJZQNu2zDoU7kVYMG", 537);
            htf.sya("PAGBannerAdImpl", e3.getMessage());
        }
    }

    public void ycx(int i5) {
        dj djVar = this.ycx;
        if (djVar != null) {
            djVar.setCurrentIndex(i5);
        }
    }

    public void ycx(PAGBannerAdInteractionCallback pAGBannerAdInteractionCallback) {
        fby fbyVar = new fby(pAGBannerAdInteractionCallback);
        this.lud = fbyVar;
        this.ycx.setExpressInteractionListener(fbyVar);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zb(tn tnVar) {
        if (this.f25313ul <= 0 || tnVar == null) {
            return;
        }
        try {
            if (this.f25306ea != null) {
                String strValueOf = String.valueOf(System.currentTimeMillis() - this.f25313ul);
                this.f25313ul = 0L;
                com.bytedance.sdk.openadsdk.dj.sya.ycx(strValueOf, tnVar, this.sya, this.f25306ea.getAdShowTime());
            }
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V7CybDbl7wphaxVifAg==", "ee8jmwauSNOPR/ZZ", "Ses9mhGoSMOzQthKuBitLQ==", 552);
            htf.sya("PAGBannerAdImpl", e3.getMessage());
        }
    }

    public void ycx(PAGBannerAdInteractionListener pAGBannerAdInteractionListener) {
        fby fbyVar = new fby(pAGBannerAdInteractionListener);
        this.lud = fbyVar;
        this.ycx.setExpressInteractionListener(fbyVar);
    }

    public View ycx() {
        com.bytedance.sdk.openadsdk.utils.zb.ycx(this.f25304dj);
        IPBroadcastReceiver.zb(this.f25309lt, this.f25304dj);
        return this.ycx;
    }

    private void ycx(Context context, tn tnVar, AdSlot adSlot) {
        if (tnVar.ci() != null) {
            sya syaVar = new sya(context, tnVar, adSlot, this.xkz);
            this.ycx = syaVar;
            syaVar.addOnAttachStateChangeListener(this.pmi);
        } else {
            dj djVar = new dj(context, tnVar, adSlot, this.xkz);
            this.ycx = djVar;
            djVar.addOnAttachStateChangeListener(this.pmi);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ycx(boolean z11, tn tnVar) {
        if (z11 && this.f25304dj.mqm() && !this.f25304dj.bhi()) {
            this.f25304dj.ul(true);
            tn tnVar2 = this.f25304dj;
            com.bytedance.sdk.openadsdk.dj.sya.ycx(tnVar2, this.sya, tnVar2.wqq());
        }
        yzp.zb(new C0059ycx(z11, tnVar, this), 10);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ycx(View view, thx thxVar, tn tnVar, String str, ul.ycx ycxVar) throws JSONException {
        jc.zb().ycx(str, ycxVar);
        this.f25313ul = System.currentTimeMillis();
        try {
            JSONObject jSONObject = new JSONObject();
            if (thxVar != null) {
                jSONObject.put("dynamic_show_type", thxVar.getDynamicShowType());
                thxVar.ycx(jSONObject, tnVar);
            }
            if (view != null) {
                JSONObject jSONObject2 = new JSONObject();
                try {
                    jSONObject2.put("width", view.getWidth());
                    jSONObject2.put("height", view.getHeight());
                    jSONObject2.put("alpha", view.getAlpha());
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V7CybDbl7wphaxVifAg==", "ee8jmwauSNOPR/ZZ", "VOAenQyrT9KO", 188);
                }
                jSONObject.put("root_view", jSONObject2.toString());
            }
            com.bytedance.sdk.openadsdk.dj.sya.ycx(tnVar, this.sya, jSONObject, (JSONObject) null);
            com.bytedance.sdk.openadsdk.oty.ycx.sya.ycx(tnVar);
        } catch (JSONException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V7CybDbl7wphaxVifAg==", "ee8jmwauSNOPR/ZZ", "VOAenQyrT9KO", 194);
            htf.sya("PAGBannerAdImpl", "onShowFun json error");
        }
        PAGBannerAdWrapperListener pAGBannerAdWrapperListener = this.lud;
        if (pAGBannerAdWrapperListener != null) {
            pAGBannerAdWrapperListener.onAdShow(view, tnVar.liq());
        }
        if (tnVar.rt()) {
            oby.ycx(tnVar, view);
        }
    }

    private com.bytedance.sdk.openadsdk.thx.ycx.ycx.sya ycx(tn tnVar) {
        if (tnVar.liq() == 4) {
            return com.bytedance.sdk.openadsdk.thx.ycx.ycx.dj.ycx(this.f25309lt, this.sya);
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    @SuppressLint({"ClickableViewAccessibility"})
    public void ycx(final thx thxVar, final tn tnVar) {
        ycx ycxVar;
        tn tnVar2;
        final thx thxVar2;
        com.bytedance.sdk.openadsdk.core.fby fbyVar;
        if (thxVar == null || tnVar == null) {
            return;
        }
        this.f25304dj = tnVar;
        this.f25307jc = ycx(tnVar);
        this.f25306ea = thxVar;
        final String strYcx = tru.ycx();
        final ul.ycx ycxVarEa = ea();
        thxVar.setClosedListenerKey(strYcx);
        thxVar.setBannerClickClosedListener(ycxVarEa);
        thxVar.setBackupListener(new com.bytedance.sdk.component.adexpress.zb.sya() { // from class: com.bytedance.sdk.openadsdk.core.dj.ycx.2
            @Override // com.bytedance.sdk.component.adexpress.zb.sya
            public boolean ycx(ViewGroup viewGroup, int i5) {
                try {
                    thxVar.wwx();
                    if (!ycx.this.f25304dj.wnd()) {
                        zb zbVar = new zb(thxVar.getContext());
                        zbVar.setClosedListenerKey(strYcx);
                        zbVar.ycx(ycx.this.f25304dj, thxVar, ycx.this.f25307jc);
                        zbVar.setAdInteractionListener(ycx.this.lud);
                        return true;
                    }
                    jw jwVar = new jw(thxVar.getContext());
                    jwVar.setClosedListenerKey(strYcx);
                    jwVar.ycx(ycx.this.f25304dj, thxVar, ycx.this.f25307jc);
                    jwVar.setAdInteractionListener(ycx.this.lud);
                    thxVar.setVastVideoHelper(jwVar);
                    return true;
                } catch (Exception e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V7CybDbl7wphaxVifAg==", "ee8jmwauSNOPR/ZZyEM=", "Uv0YhgaeaMSLX8c=", 274);
                    return false;
                }
            }
        });
        if (!this.fby) {
            com.bytedance.sdk.openadsdk.core.fby fbyVarYcx = ycx(thxVar);
            if (fbyVarYcx == null) {
                fbyVarYcx = new com.bytedance.sdk.openadsdk.core.fby(this.f25309lt, thxVar, this.f25310ok.ycx());
                thxVar.addView(fbyVarYcx);
            }
            fbyVarYcx.setAdType(1);
            thxVar2 = thxVar;
            fbyVarYcx.setCallback(new fby.ycx() { // from class: com.bytedance.sdk.openadsdk.core.dj.ycx.3
                @Override // com.bytedance.sdk.openadsdk.core.fby.ycx
                public void ycx(boolean z11) {
                    ycx.this.ycx(z11, tnVar);
                }

                @Override // com.bytedance.sdk.openadsdk.core.fby.ycx
                public void zb() {
                    ycx ycxVar2 = ycx.this;
                    ycxVar2.zb(ycxVar2.f25304dj);
                }

                @Override // com.bytedance.sdk.openadsdk.core.fby.ycx
                public void ycx() {
                    if (ycx.this.wie != 0) {
                        ycx.this.jc();
                    }
                }

                @Override // com.bytedance.sdk.openadsdk.core.fby.ycx
                public void ycx(View view) throws JSONException {
                    if (ycx.this.f25311ry.compareAndSet(false, true)) {
                        ycx.this.ycx(view, thxVar2, tnVar, strYcx, ycxVarEa);
                    }
                    dj djVar = ycx.this.ycx;
                    if (djVar == null || djVar.getCurView() == null) {
                        return;
                    }
                    ycx.this.ycx.getCurView().ea();
                    ycx.this.ycx.getCurView().uh();
                    ycx.this.ycx.setIsShow(true);
                }
            });
            fbyVar = fbyVarYcx;
            ycxVar = this;
            tnVar2 = tnVar;
        } else {
            boolean zYcx = this.f25310ok.ycx();
            sz.zb zbVar = new sz.zb() { // from class: com.bytedance.sdk.openadsdk.core.dj.ycx.4
                @Override // com.bytedance.sdk.openadsdk.utils.sz.zb
                public void ycx(boolean z11) {
                    ycx.this.ycx(z11, tnVar);
                }

                @Override // com.bytedance.sdk.openadsdk.utils.sz.zb
                public void zb() {
                    ycx ycxVar2 = ycx.this;
                    ycxVar2.zb(ycxVar2.f25304dj);
                }

                @Override // com.bytedance.sdk.openadsdk.utils.sz.zb
                public void ycx() {
                    if (ycx.this.wie != 0) {
                        ycx.this.jc();
                    }
                }

                @Override // com.bytedance.sdk.openadsdk.utils.sz.zb
                public void ycx(View view, boolean z11) throws JSONException {
                    if (!z11) {
                        com.bytedance.sdk.openadsdk.oty.ycx.sya.ycx(ycx.this.f25304dj, 8);
                        return;
                    }
                    com.bytedance.sdk.openadsdk.oty.ycx.sya.ycx(ycx.this.f25304dj, 4);
                    if (ycx.this.f25311ry.compareAndSet(false, true)) {
                        ycx.this.ycx(view, thxVar, tnVar, strYcx, ycxVarEa);
                    }
                    dj djVar = ycx.this.ycx;
                    if (djVar == null || djVar.getCurView() == null) {
                        return;
                    }
                    ycx.this.ycx.getCurView().ea();
                    ycx.this.ycx.getCurView().uh();
                    ycx.this.ycx.setIsShow(true);
                }
            };
            ycxVar = this;
            tnVar2 = tnVar;
            sz.ycx(thxVar, true, 1, zYcx, zbVar, null);
            thxVar2 = thxVar;
            fbyVar = null;
        }
        Context contextYcx = com.bytedance.sdk.component.utils.zb.ycx(thxVar2);
        if (contextYcx == null) {
            contextYcx = ycxVar.f25309lt;
        }
        com.bytedance.sdk.openadsdk.core.jc.jc jcVar = new com.bytedance.sdk.openadsdk.core.jc.jc(contextYcx, tnVar2, ycxVar.sya, 2);
        jcVar.zb(thxVar2);
        jcVar.ycx(this);
        jcVar.ycx(ycxVar.f25307jc);
        jcVar.ycx(new zb.ycx() { // from class: com.bytedance.sdk.openadsdk.core.dj.ycx.5
            @Override // com.bytedance.sdk.openadsdk.core.sya.zb.ycx
            public void ycx(View view, int i5) {
                if (ycx.this.lud != null) {
                    ycx.this.lud.onAdClicked();
                }
            }
        });
        thxVar2.setClickListener(jcVar);
        com.bytedance.sdk.openadsdk.core.jc.jw jwVar = new com.bytedance.sdk.openadsdk.core.jc.jw(ycxVar.f25309lt, tnVar2, ycxVar.sya, 2);
        jwVar.zb(thxVar2);
        jwVar.ycx(this);
        jwVar.ycx(new zb.ycx() { // from class: com.bytedance.sdk.openadsdk.core.dj.ycx.6
            @Override // com.bytedance.sdk.openadsdk.core.sya.zb.ycx
            public void ycx(View view, int i5) {
                if (ycx.this.lud != null) {
                    ycx.this.lud.onAdClicked();
                }
            }
        });
        thx thxVar3 = ycxVar.f25306ea;
        if (thxVar3 instanceof com.bytedance.sdk.openadsdk.core.jc.htf) {
            jwVar.ycx(((com.bytedance.sdk.openadsdk.core.jc.htf) thxVar3).getVideoController());
        }
        jwVar.ycx(ycxVar.f25307jc);
        thxVar2.setClickCreativeListener(jwVar);
        if (ycxVar.fby) {
            return;
        }
        fbyVar.setNeedCheckingShow(true);
    }

    private com.bytedance.sdk.openadsdk.core.fby ycx(ViewGroup viewGroup) {
        if (viewGroup == null) {
            return null;
        }
        for (int i5 = 0; i5 < viewGroup.getChildCount(); i5++) {
            try {
                View childAt = viewGroup.getChildAt(i5);
                if (childAt instanceof com.bytedance.sdk.openadsdk.core.fby) {
                    return (com.bytedance.sdk.openadsdk.core.fby) childAt;
                }
            } catch (Exception e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V7CybDbl7wphaxVifAg==", "ee8jmwauSNOPR/ZZ", "XecjkSaxedOZfN5Ymw==", 568);
            }
        }
        return null;
    }

    public void ycx(final com.bytedance.sdk.openadsdk.ycx.ycx.zb zbVar) {
        long jCurrentTimeMillis = System.currentTimeMillis();
        if (jCurrentTimeMillis - this.f25312uh > 500) {
            this.f25312uh = jCurrentTimeMillis;
            dj djVar = this.ycx;
            if (djVar instanceof sya) {
                djVar.postDelayed(new Runnable() { // from class: com.bytedance.sdk.openadsdk.core.dj.ycx.8
                    @Override // java.lang.Runnable
                    public void run() {
                        ((sya) ycx.this.ycx).ycx(zbVar);
                    }
                }, 500L);
            }
        }
    }
}
