package com.bytedance.sdk.openadsdk.ycx.zb;

import android.annotation.SuppressLint;
import android.content.Context;
import android.text.TextUtils;
import android.util.SparseArray;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import com.bytedance.sdk.openadsdk.activity.single.IABLandingPageActivity;
import com.bytedance.sdk.openadsdk.activity.single.TTWebsiteActivity;
import com.bytedance.sdk.openadsdk.api.nativeAd.PAGImageItem;
import com.bytedance.sdk.openadsdk.api.nativeAd.PAGMediaView;
import com.bytedance.sdk.openadsdk.api.nativeAd.PAGNativeAd;
import com.bytedance.sdk.openadsdk.api.nativeAd.PAGVideoAdListener;
import com.bytedance.sdk.openadsdk.api.nativeAd.PAGVideoMediaView;
import com.bytedance.sdk.openadsdk.core.jc.htf;
import com.bytedance.sdk.openadsdk.core.jc.jc;
import com.bytedance.sdk.openadsdk.core.jc.jw;
import com.bytedance.sdk.openadsdk.core.jc.thx;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.core.pmi;
import com.bytedance.sdk.openadsdk.core.settings.ea;
import com.bytedance.sdk.openadsdk.core.sya.sya;
import com.bytedance.sdk.openadsdk.core.widget.PAGLogoView;
import com.bytedance.sdk.openadsdk.utils.dc;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import java.lang.ref.WeakReference;
import java.util.List;

/* loaded from: classes2.dex */
public class ycx {

    /* renamed from: dj, reason: collision with root package name */
    private boolean f27468dj;

    /* renamed from: ea, reason: collision with root package name */
    private com.bytedance.sdk.openadsdk.core.sya.ycx f27469ea;
    private PAGMediaView fby;

    /* renamed from: jc, reason: collision with root package name */
    private PAGMediaView f27470jc;

    /* renamed from: jw, reason: collision with root package name */
    private thx f27471jw;

    /* renamed from: lt, reason: collision with root package name */
    private zb f27472lt;
    private WeakReference<com.bytedance.sdk.openadsdk.core.syc.zb.lt> lud;

    /* renamed from: ok, reason: collision with root package name */
    private com.bytedance.sdk.openadsdk.core.sya.zb f27473ok;

    /* renamed from: ry, reason: collision with root package name */
    private boolean f27474ry = false;
    private final String sya;

    /* renamed from: ul, reason: collision with root package name */
    private com.bytedance.sdk.openadsdk.ycx.zb.ycx.sya f27475ul;
    private WeakReference<com.bytedance.sdk.openadsdk.core.xkz.lt> xkz;
    protected final tn ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final Context f27476zb;

    public ycx(Context context, tn tnVar, String str) {
        this.f27476zb = context;
        this.ycx = tnVar;
        this.sya = str;
    }

    private PAGMediaView xkz() {
        if (!tn.lud(this.ycx)) {
            com.bytedance.sdk.openadsdk.ycx.zb.ycx.sya syaVar = this.f27475ul;
            if (syaVar == null) {
                return null;
            }
            thx thxVarDj = syaVar.dj();
            thxVarDj.setTag(520093762, Boolean.TRUE);
            if (!this.f27474ry) {
                this.f27475ul.lud();
            }
            this.f27474ry = true;
            return ycx(thxVarDj);
        }
        com.bytedance.sdk.openadsdk.ycx.zb.ycx.sya syaVar2 = this.f27475ul;
        if (syaVar2 == null || !(syaVar2 instanceof com.bytedance.sdk.openadsdk.ycx.zb.ycx.zb)) {
            return null;
        }
        htf htfVar = (htf) syaVar2.dj();
        htfVar.setTag(520093762, Boolean.TRUE);
        if (!this.f27474ry) {
            this.f27475ul.lud();
        }
        this.f27474ry = true;
        return ycx(htfVar);
    }

    public String dj() {
        tn tnVar = this.ycx;
        if (tnVar != null) {
            return ycx(tnVar);
        }
        return null;
    }

    public View ea() {
        tn tnVar;
        if (pmi.ycx() == null || (tnVar = this.ycx) == null || !tnVar.wnd() || !this.ycx.dv()) {
            return null;
        }
        ImageView imageView = new ImageView(pmi.ycx());
        com.bytedance.sdk.openadsdk.htf.zb.zb().ycx((int) dc.ycx(pmi.ycx(), 14.0f, true), imageView, this.ycx);
        return imageView;
    }

    public PAGMediaView fby() {
        return this.f27470jc;
    }

    public View jc() {
        if (pmi.ycx() == null) {
            return null;
        }
        PAGLogoView pAGLogoView = new PAGLogoView(pmi.ycx()) { // from class: com.bytedance.sdk.openadsdk.ycx.zb.ycx.4
            int ycx = 0;

            /* renamed from: zb, reason: collision with root package name */
            int f27479zb = 0;

            @Override // android.widget.LinearLayout, android.view.ViewGroup, android.view.View
            public void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
                super.onLayout(z11, i5, i11, i12, i13);
                try {
                    Object parent = getParent();
                    if (parent == null || this.ycx == 0 || this.f27479zb == 0) {
                        return;
                    }
                    int width = ((View) parent).getWidth();
                    int height = ((View) parent).getHeight();
                    int i14 = this.ycx;
                    if (width < i14 || height < this.f27479zb) {
                        float fMin = Math.min(height / this.f27479zb, width / i14);
                        int i15 = (width - this.ycx) / 2;
                        if (fMin != 1.0f) {
                            setScaleX(fMin);
                            setScaleY(fMin);
                            setTranslationX(i15);
                        }
                    }
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE40BqQFW/iHbBblsww==", "a88KsBuoe8amX9lejQWpJ1XGKJkTuXuD1A==", "VOABlBqzfNM=", 434);
                    th2.getMessage();
                }
            }

            @Override // com.bytedance.sdk.openadsdk.core.widget.PAGLogoView, android.widget.LinearLayout, android.view.View
            public void onMeasure(int i5, int i11) {
                if (this.ycx == 0) {
                    super.onMeasure(View.MeasureSpec.makeMeasureSpec(1073741823, Integer.MIN_VALUE), i11);
                    this.ycx = getMeasuredWidth();
                    this.f27479zb = this.containerHeight;
                }
                setMeasuredDimension(this.ycx, this.f27479zb);
            }
        };
        pAGLogoView.initData(this.ycx);
        pAGLogoView.setOnClickListener(new View.OnClickListener() { // from class: com.bytedance.sdk.openadsdk.ycx.zb.ycx.5
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                ycx.this.ok();
            }
        });
        return pAGLogoView;
    }

    public PAGMediaView jw() {
        View viewLud;
        if (tn.lud(this.ycx)) {
            zb zbVar = this.f27472lt;
            if (zbVar != null && (viewLud = zbVar.lud()) != null) {
                if (viewLud.getParent() instanceof ViewGroup) {
                    ((ViewGroup) viewLud.getParent()).removeView(viewLud);
                }
                PAGMediaView pAGMediaView = this.fby;
                if (pAGMediaView != null) {
                    pAGMediaView.setOnClickListener(null);
                    this.fby.setOnTouchListener(null);
                }
                PAGVideoMediaView pAGVideoMediaView = new PAGVideoMediaView(this.f27476zb, viewLud, this);
                pAGVideoMediaView.setTag(520093762, Boolean.TRUE);
                if (this.f27469ea == null || !ea.zb().dj(String.valueOf(this.ycx.ksy()))) {
                    com.bytedance.sdk.openadsdk.core.sya.sya syaVar = new com.bytedance.sdk.openadsdk.core.sya.sya() { // from class: com.bytedance.sdk.openadsdk.ycx.zb.ycx.2
                        @Override // com.bytedance.sdk.openadsdk.core.sya.sya
                        public void ycx(View view, float f11, float f12, float f13, float f14, SparseArray<sya.ycx> sparseArray, boolean z11) {
                            try {
                                ((PAGVideoMediaView) view).handleInterruptVideo();
                            } catch (Exception e3) {
                                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE40BqQFW/iHbBblsww==", "a88KsBuoe8amX9lejQWpJ1XGKJkTuXuD0g==", "VOAOmQq/Yg==", 273);
                            }
                        }
                    };
                    pAGVideoMediaView.setOnClickListener(syaVar);
                    pAGVideoMediaView.setOnTouchListener(syaVar);
                } else {
                    pAGVideoMediaView.setOnClickListener(this.f27469ea);
                    pAGVideoMediaView.setOnTouchListener(this.f27469ea);
                }
                this.fby = pAGVideoMediaView;
                pAGVideoMediaView.setLayoutParams(new ViewGroup.LayoutParams(-1, -1));
                return pAGVideoMediaView;
            }
        } else {
            List<com.bytedance.sdk.openadsdk.core.model.pmi> listCu = this.ycx.cu();
            if (listCu != null && !listCu.isEmpty()) {
                ImageView imageView = new ImageView(this.f27476zb);
                imageView.setScaleType(ImageView.ScaleType.FIT_CENTER);
                com.bytedance.sdk.openadsdk.core.model.pmi pmiVar = listCu.get(0);
                if (pmiVar != null) {
                    com.bytedance.sdk.openadsdk.jc.dj.ycx(pmiVar).sya(1).ycx(com.bytedance.sdk.openadsdk.jc.sya.ycx(this.ycx, pmiVar.ycx(), imageView));
                }
                PAGMediaView pAGMediaViewYcx = ycx(imageView);
                if (this.f27469ea == null || !ea.zb().dj(String.valueOf(this.ycx.ksy()))) {
                    pAGMediaViewYcx.setOnClickListener(null);
                    pAGMediaViewYcx.setOnTouchListener(null);
                } else {
                    pAGMediaViewYcx.setOnClickListener(this.f27469ea);
                    pAGMediaViewYcx.setOnTouchListener(this.f27469ea);
                }
                pAGMediaViewYcx.setTag(520093762, Boolean.TRUE);
                PAGMediaView pAGMediaView2 = this.fby;
                if (pAGMediaView2 != null) {
                    pAGMediaView2.setOnClickListener(null);
                    this.fby.setOnTouchListener(null);
                }
                this.fby = pAGMediaViewYcx;
                return pAGMediaViewYcx;
            }
        }
        return null;
    }

    public String lt() {
        tn tnVar = this.ycx;
        if (tnVar != null) {
            return tnVar.bah();
        }
        return null;
    }

    public String lud() {
        tn tnVar = this.ycx;
        if (tnVar != null) {
            return zb(tnVar);
        }
        return null;
    }

    public void ok() {
        if (this.f27476zb != null) {
            if (com.bytedance.sdk.openadsdk.utils.zb.lud() && pmi.dj().av()) {
                IABLandingPageActivity.ycx(this.f27476zb, this.ycx, this.sya);
            } else {
                TTWebsiteActivity.ycx(this.f27476zb, this.ycx, this.sya);
            }
        }
    }

    public void ry() {
        com.bytedance.sdk.openadsdk.core.xkz.lt ltVar;
        WeakReference<com.bytedance.sdk.openadsdk.core.xkz.lt> weakReference = this.xkz;
        if (weakReference == null || (ltVar = weakReference.get()) == null) {
            return;
        }
        ltVar.ycx(13);
    }

    public PAGImageItem sya() {
        tn tnVar = this.ycx;
        if (tnVar == null || tnVar.yyc() == null) {
            return null;
        }
        return new PAGImageItem(this.ycx.yyc().sya(), this.ycx.yyc().zb(), this.ycx.yyc().ycx(), (float) this.ycx.yyc().dj());
    }

    @SuppressLint({"ClickableViewAccessibility"})
    public PAGMediaView ul() {
        PAGMediaView pAGMediaViewJw;
        com.bytedance.sdk.openadsdk.utils.zb.ycx(this.ycx);
        if (this.ycx.aq() == 2) {
            pAGMediaViewJw = xkz();
            ycx(pAGMediaViewJw);
        } else {
            pAGMediaViewJw = jw();
        }
        if (pAGMediaViewJw != null) {
            pAGMediaViewJw.setMrcTrackerKey(com.bytedance.sdk.openadsdk.oty.zb.lud.zb(this.ycx));
        } else {
            pAGMediaViewJw = new PAGMediaView(this.f27476zb) { // from class: com.bytedance.sdk.openadsdk.ycx.zb.ycx.1
                @Override // android.view.ViewGroup, android.view.View
                public void onAttachedToWindow() {
                    super.onAttachedToWindow();
                    com.bytedance.sdk.openadsdk.utils.dj.ycx(this, ycx.this.ycx);
                }
            };
        }
        if (pAGMediaViewJw instanceof PAGVideoMediaView) {
            ((PAGVideoMediaView) pAGMediaViewJw).setMaterialMeta(this.ycx);
        }
        this.f27470jc = pAGMediaViewJw;
        return pAGMediaViewJw;
    }

    public void ycx(zb zbVar) {
        this.f27472lt = zbVar;
    }

    public thx zb() {
        return this.f27471jw;
    }

    private String zb(tn tnVar) {
        return !TextUtils.isEmpty(tnVar.spv()) ? tnVar.spv() : !TextUtils.isEmpty(tnVar.xh()) ? tnVar.xh() : b.f42142b;
    }

    public void ycx(com.bytedance.sdk.openadsdk.ycx.zb.ycx.sya syaVar) {
        this.f27475ul = syaVar;
    }

    public void ycx(com.bytedance.sdk.openadsdk.core.syc.zb.lt ltVar) {
        this.lud = new WeakReference<>(ltVar);
    }

    public void ycx(boolean z11) {
        this.f27468dj = z11;
    }

    public PAGMediaView ycx() {
        return this.fby;
    }

    public void ycx(com.bytedance.sdk.openadsdk.core.sya.ycx ycxVar) {
        this.f27469ea = ycxVar;
    }

    private String ycx(tn tnVar) {
        if (tnVar.znc() != null && !TextUtils.isEmpty(tnVar.znc().zb())) {
            return tnVar.znc().zb();
        }
        if (!TextUtils.isEmpty(tnVar.sp())) {
            return tnVar.sp();
        }
        if (!TextUtils.isEmpty(tnVar.spv())) {
            return tnVar.spv();
        }
        return b.f42142b;
    }

    private sya zb(final PAGVideoAdListener pAGVideoAdListener) {
        return new sya() { // from class: com.bytedance.sdk.openadsdk.ycx.zb.ycx.6
            @Override // com.bytedance.sdk.openadsdk.ycx.zb.sya
            public void sya(PAGNativeAd pAGNativeAd) {
                PAGVideoAdListener pAGVideoAdListener2 = pAGVideoAdListener;
                if (pAGVideoAdListener2 != null) {
                    pAGVideoAdListener2.onVideoAdComplete();
                }
            }

            @Override // com.bytedance.sdk.openadsdk.ycx.zb.sya
            public void ycx(int i5, int i11) {
                PAGVideoAdListener pAGVideoAdListener2 = pAGVideoAdListener;
                if (pAGVideoAdListener2 != null) {
                    pAGVideoAdListener2.onVideoError();
                }
            }

            @Override // com.bytedance.sdk.openadsdk.ycx.zb.sya
            public void zb(PAGNativeAd pAGNativeAd) {
                PAGVideoAdListener pAGVideoAdListener2 = pAGVideoAdListener;
                if (pAGVideoAdListener2 != null) {
                    pAGVideoAdListener2.onVideoAdPaused();
                }
            }

            @Override // com.bytedance.sdk.openadsdk.ycx.zb.sya
            public void ycx(PAGNativeAd pAGNativeAd) {
                PAGVideoAdListener pAGVideoAdListener2 = pAGVideoAdListener;
                if (pAGVideoAdListener2 != null) {
                    pAGVideoAdListener2.onVideoAdPlay();
                }
            }
        };
    }

    public void ycx(com.bytedance.sdk.openadsdk.core.sya.zb zbVar) {
        this.f27473ok = zbVar;
    }

    private void ycx(PAGMediaView pAGMediaView) {
        if (pAGMediaView == null) {
            return;
        }
        try {
            pAGMediaView.setBackgroundColor(-16777216);
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE40BqQFW/iHbBblsww==", "a88KsBuoe8amX9lejQWpJ1XGKJkTuXs=", "V+EskSG9asynWNhIghU=", Sdk.SDKError.Reason.MRAID_JS_COPY_FAILED_VALUE);
        }
    }

    private PAGMediaView ycx(final View view) {
        int i5;
        if (view == null) {
            return null;
        }
        if (view.getParent() instanceof ViewGroup) {
            ((ViewGroup) view.getParent()).removeView(view);
        }
        thx thxVar = this.f27471jw;
        if (thxVar != null) {
            thxVar.setClickListener(null);
            this.f27471jw.setClickCreativeListener(null);
        }
        com.bytedance.sdk.openadsdk.core.sya.zb zbVar = this.f27473ok;
        if (zbVar != null && (zbVar instanceof jc) && (view instanceof thx)) {
            ((thx) view).setClickListener((jc) zbVar);
        }
        com.bytedance.sdk.openadsdk.core.sya.ycx ycxVar = this.f27469ea;
        if (ycxVar != null && (ycxVar instanceof jw) && (view instanceof thx)) {
            ((thx) view).setClickCreativeListener((jw) ycxVar);
        }
        PAGMediaView pAGMediaView = new PAGMediaView(this.f27476zb) { // from class: com.bytedance.sdk.openadsdk.ycx.zb.ycx.3
            private void ycx(boolean z11) {
                Integer num = this.ycx;
                if (num != null) {
                    com.bytedance.sdk.openadsdk.oty.zb.lud.ycx(com.bytedance.sdk.openadsdk.oty.zb.lud.ycx(num), z11 ? 4 : 8);
                }
                tn tnVar = ycx.this.ycx;
                if (tnVar != null) {
                    com.bytedance.sdk.openadsdk.oty.ycx.sya.ycx(tnVar, z11);
                }
            }

            @Override // android.view.ViewGroup, android.view.View
            public void onAttachedToWindow() {
                super.onAttachedToWindow();
                com.bytedance.sdk.openadsdk.utils.dj.ycx(this, ycx.this.ycx);
            }

            @Override // android.view.View
            public void onWindowFocusChanged(boolean z11) {
                super.onWindowFocusChanged(z11);
                if (view instanceof thx) {
                    return;
                }
                ycx(z11);
            }

            @Override // com.bytedance.sdk.openadsdk.api.nativeAd.PAGMediaView
            public void setVideoAdListener(PAGVideoAdListener pAGVideoAdListener) {
                super.setVideoAdListener(pAGVideoAdListener);
                ycx.this.ycx(pAGVideoAdListener);
            }
        };
        int i11 = -1;
        pAGMediaView.setLayoutParams(new ViewGroup.LayoutParams(-1, -1));
        ViewGroup.LayoutParams layoutParams = view.getLayoutParams();
        if (layoutParams != null) {
            i11 = layoutParams.width;
            i5 = layoutParams.height;
        } else {
            i5 = -1;
        }
        FrameLayout.LayoutParams layoutParams2 = new FrameLayout.LayoutParams(i11, i5);
        layoutParams2.gravity = 17;
        pAGMediaView.addView(view, layoutParams2);
        if (view instanceof thx) {
            this.f27471jw = (thx) view;
        }
        return pAGMediaView;
    }

    public void ycx(PAGVideoAdListener pAGVideoAdListener) {
        com.bytedance.sdk.openadsdk.ycx.zb.ycx.sya syaVar;
        if (this.ycx.aq() == 2 && tn.lud(this.ycx) && (syaVar = this.f27475ul) != null && (syaVar instanceof com.bytedance.sdk.openadsdk.ycx.zb.ycx.zb)) {
            htf htfVar = (htf) syaVar.dj();
            if (htfVar != null) {
                htfVar.setVideoAdListener(zb(pAGVideoAdListener));
                return;
            }
            return;
        }
        zb zbVar = this.f27472lt;
        if (zbVar != null) {
            zbVar.ycx(zb(pAGVideoAdListener));
        }
    }

    public void ycx(com.bytedance.sdk.openadsdk.core.xkz.lt ltVar) {
        this.xkz = new WeakReference<>(ltVar);
    }
}
