package com.bytedance.sdk.openadsdk.component.reward.view;

import android.app.Activity;
import android.content.Context;
import android.content.res.Resources;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import com.bytedance.sdk.component.adexpress.zb.xkz;
import com.bytedance.sdk.component.utils.wwx;
import com.bytedance.sdk.openadsdk.activity.single.IABLandingPageActivity;
import com.bytedance.sdk.openadsdk.activity.single.TTWebsiteActivity;
import com.bytedance.sdk.openadsdk.component.reward.ycx.dy;
import com.bytedance.sdk.openadsdk.core.model.av;
import com.bytedance.sdk.openadsdk.core.model.htf;
import com.bytedance.sdk.openadsdk.core.model.syc;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.core.pmi;
import com.bytedance.sdk.openadsdk.core.widget.PAGLogoView;
import com.bytedance.sdk.openadsdk.utils.dc;
import com.bytedance.sdk.openadsdk.utils.wie;
import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: classes2.dex */
public class ea {

    /* renamed from: dj, reason: collision with root package name */
    final tn f24994dj;

    /* renamed from: dv, reason: collision with root package name */
    private com.bytedance.sdk.openadsdk.core.widget.ok f24995dv;

    /* renamed from: dy, reason: collision with root package name */
    public htf f24996dy;

    /* renamed from: ea, reason: collision with root package name */
    ImageView f24997ea;
    View fby;
    private final String htf;

    /* renamed from: jc, reason: collision with root package name */
    PAGLogoView f24998jc;

    /* renamed from: jw, reason: collision with root package name */
    View f24999jw;

    /* renamed from: lt, reason: collision with root package name */
    ImageView f25000lt;
    ImageView lud;

    /* renamed from: ok, reason: collision with root package name */
    RelativeLayout f25001ok;

    /* renamed from: ry, reason: collision with root package name */
    dy f25002ry;
    protected final com.bytedance.sdk.openadsdk.component.reward.ycx.zb sya;
    private int thx;

    /* renamed from: tn, reason: collision with root package name */
    private dj f25003tn;

    /* renamed from: uh, reason: collision with root package name */
    private final boolean f25004uh;

    /* renamed from: ul, reason: collision with root package name */
    FrameLayout f25005ul;
    com.bytedance.sdk.openadsdk.core.lt.lt wie;
    private boolean wwx;

    /* renamed from: zb, reason: collision with root package name */
    final Activity f25006zb;
    int ycx = 3;
    protected int xkz = 0;
    protected final AtomicBoolean syc = new AtomicBoolean(false);
    Runnable pmi = new Runnable() { // from class: com.bytedance.sdk.openadsdk.component.reward.view.ea.2
        @Override // java.lang.Runnable
        public void run() {
            ImageView imageView;
            try {
                tn tnVar = ea.this.f24994dj;
                if ((tnVar == null || !tnVar.uhs()) && (imageView = ea.this.lud) != null) {
                    int[] iArr = new int[2];
                    imageView.getLocationOnScreen(iArr);
                    ea.this.sya.f25201xz.ycx(iArr[0]);
                }
            } catch (Exception e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erThU4CibF/J7wpdLxVnCB6ktTA==", "aes6lBG4T9KMRuFUiBSvBFr3IoAX+Ds=", "Sfsj", 458);
            }
        }
    };

    public ea(com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar) {
        this.sya = zbVar;
        this.f25006zb = zbVar.yzp;
        this.f24994dj = zbVar.f25203zb;
        this.htf = zbVar.lud;
        this.f25004uh = zbVar.f25173dj;
    }

    private void htf() {
        RelativeLayout relativeLayout;
        dj djVar = (dj) this.sya.ifb.findViewById(wie.xkz);
        this.f25003tn = djVar;
        djVar.ycx(this.sya);
        com.bytedance.sdk.openadsdk.core.widget.ok okVar = (com.bytedance.sdk.openadsdk.core.widget.ok) this.sya.ifb.findViewById(wie.f27213nc);
        this.f24995dv = okVar;
        if (okVar != null) {
            com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar = this.sya;
            okVar.ycx(zbVar.f25203zb, zbVar.lud, null);
        }
        this.f24998jc = (PAGLogoView) this.sya.ifb.findViewById(520093757);
        this.f24997ea = (ImageView) this.sya.ifb.findViewById(wie.gxx);
        this.lud = (ImageView) this.sya.ifb.findViewById(520093708);
        this.f25000lt = (ImageView) this.sya.ifb.findViewById(wie.ixr);
        this.f25005ul = (FrameLayout) this.sya.ifb.findViewById(wie.f27227ry);
        this.fby = this.sya.ifb.findViewById(wie.pmi);
        this.f24999jw = this.sya.ifb.findViewById(wie.vbt);
        this.f25001ok = (RelativeLayout) this.sya.ifb.findViewById(wie.f27222qu);
        dy dyVar = this.f25002ry;
        if (dyVar == null || dyVar.lt() == null || (relativeLayout = this.f25001ok) == null) {
            return;
        }
        relativeLayout.addView(this.f25002ry.lt(), new LinearLayout.LayoutParams(-1, -1));
        this.f25002ry.sya();
    }

    public void dj() {
        if (this.sya.f25203zb.sim() && av.sya(this.sya.f25203zb)) {
            return;
        }
        dc.ycx((View) this.f25005ul, 8);
        dc.ycx((View) this.f24995dv, 8);
        dc.ycx(this.fby, 8);
        dc.ycx(this.f24999jw, 8);
        sya(8);
        dc.ycx((View) this.lud, 8);
        dc.ycx((View) this.f25000lt, 8);
        dc.ycx((View) this.f24998jc, 8);
        dc.ycx((View) this.f25001ok, 8);
        dc.ycx((View) this.f24997ea, 8);
    }

    public void dy() {
        htf htfVar = this.f24996dy;
        if (htfVar != null) {
            htfVar.ul();
        }
    }

    public View ea() {
        return this.f25000lt;
    }

    public void fby() {
        dj djVar = this.f25003tn;
        if (djVar == null) {
            return;
        }
        djVar.ycx();
    }

    public View jc() {
        return this.lud;
    }

    public boolean jw() {
        ImageView imageView = this.lud;
        return imageView != null && imageView.getVisibility() == 0;
    }

    public FrameLayout lt() {
        return this.f25005ul;
    }

    public void lud() {
        int iPy = this.f24994dj.py();
        this.ycx = iPy;
        if (iPy == -200) {
            this.ycx = pmi.dj().dy(String.valueOf(this.f24994dj.ksy()));
        }
        if (this.ycx != -1 || ycx()) {
            return;
        }
        com.bytedance.sdk.openadsdk.component.reward.zb.zb zbVar = this.sya.f25195ur;
        if ((zbVar instanceof com.bytedance.sdk.openadsdk.component.reward.zb.dj) || (zbVar instanceof com.bytedance.sdk.openadsdk.component.reward.zb.sya)) {
            return;
        }
        sya(0);
    }

    public View ok() {
        return this.f25003tn;
    }

    public void pmi() {
        htf htfVar = this.f24996dy;
        if (htfVar != null) {
            htfVar.jw();
        }
    }

    public void ry() {
        try {
            dy dyVar = this.f25002ry;
            if (dyVar != null) {
                dyVar.dj();
            }
            RelativeLayout relativeLayout = this.f25001ok;
            if (relativeLayout != null) {
                relativeLayout.removeAllViews();
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erThU4CibF/J7wpdLxVnCB6ktTA==", "aes6lBG4T9KMRuFUiBSvBFr3IoAX", "SesgmhW5RciBTt5TiyGhL14=", 528);
            RelativeLayout relativeLayout2 = this.f25001ok;
            if (relativeLayout2 != null) {
                relativeLayout2.setAlpha(0.0f);
            }
        }
    }

    public void sya() {
        this.f25005ul.removeAllViews();
    }

    public void syc() {
        htf htfVar = this.f24996dy;
        if (htfVar != null) {
            htfVar.lt();
        }
        ImageView imageView = this.lud;
        if (imageView != null) {
            imageView.removeCallbacks(this.pmi);
        }
    }

    public void uh() {
        com.bytedance.sdk.openadsdk.core.sya.lud ludVarLud = this.sya.f25177hf.lud();
        View view = this.f25003tn;
        if (view == null) {
            view = this.sya.ifb;
        }
        ludVarLud.onClick(view);
    }

    public void ul() {
        if (this.f24997ea.getVisibility() == 0) {
            ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) this.f24997ea.getLayoutParams();
            marginLayoutParams.setMargins(0, 0, 11, 16);
            marginLayoutParams.setMarginStart(0);
            marginLayoutParams.setMarginEnd(11);
            this.f24997ea.setLayoutParams(marginLayoutParams);
        }
    }

    public void wie() {
        htf htfVar = this.f24996dy;
        if (htfVar != null) {
            htfVar.fby();
        }
    }

    public void xkz() {
        try {
            Activity activity = this.sya.yzp;
            Animation animationLoadAnimation = AnimationUtils.loadAnimation(activity, wwx.jw(activity, "tt_fade_out"));
            if (animationLoadAnimation == null) {
                this.sya.kgy.ry();
            } else {
                animationLoadAnimation.setAnimationListener(new Animation.AnimationListener() { // from class: com.bytedance.sdk.openadsdk.component.reward.view.ea.3
                    @Override // android.view.animation.Animation.AnimationListener
                    public void onAnimationEnd(Animation animation) {
                        ea.this.sya.kgy.ry();
                    }

                    @Override // android.view.animation.Animation.AnimationListener
                    public void onAnimationRepeat(Animation animation) {
                    }

                    @Override // android.view.animation.Animation.AnimationListener
                    public void onAnimationStart(Animation animation) {
                    }
                });
                this.sya.kgy.ycx(animationLoadAnimation);
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erThU4CibF/J7wpdLxVnCB6ktTA==", "aes6lBG4T9KMRuFUiBSvBFr3IoAX", "XuApowq4bMisRdZZhR+nGFrpKA==", 568);
            this.sya.kgy.ry();
        }
    }

    public boolean ycx() {
        return true;
    }

    public void zb() {
        if (this.wwx) {
            return;
        }
        this.wwx = true;
        this.thx = this.sya.bba;
        if (ycx()) {
            com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar = this.sya;
            if (!zbVar.hpv) {
                dy dyVar = new dy(zbVar);
                this.f25002ry = dyVar;
                dyVar.ycx();
            }
        }
        htf();
        Activity activity = this.f25006zb;
        tn tnVar = this.f24994dj;
        String str = this.htf;
        FrameLayout frameLayout = this.f25005ul;
        com.bytedance.sdk.openadsdk.component.reward.ycx.zb zbVar2 = this.sya;
        htf htfVar = new htf(activity, tnVar, str, frameLayout, zbVar2.dwi, zbVar2.ifb);
        this.f24996dy = htfVar;
        htfVar.ycx();
    }

    public void lt(int i5) {
        int i11 = this.ycx;
        if (i11 == -1 || i5 != i11 || this.syc.get()) {
            return;
        }
        sya(0);
        this.syc.set(true);
        fby();
    }

    public void sya(int i5) {
        tn tnVar = this.f24994dj;
        if (tnVar != null && tnVar.wnd() && syc.ycx(this.f24994dj)) {
            dc.ycx((View) this.f25003tn, 8);
        } else {
            dc.ycx((View) this.f25003tn, i5);
        }
    }

    public void ycx(int i5) {
        ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) this.f24998jc.getLayoutParams();
        marginLayoutParams.setMargins(16, 0, 0, i5);
        this.f24998jc.setLayoutParams(marginLayoutParams);
        ViewGroup.MarginLayoutParams marginLayoutParams2 = (ViewGroup.MarginLayoutParams) this.f24997ea.getLayoutParams();
        marginLayoutParams2.setMargins(0, 0, 7, i5);
        marginLayoutParams2.setMarginStart(0);
        marginLayoutParams2.setMarginEnd(7);
        this.f24997ea.setLayoutParams(marginLayoutParams2);
    }

    public void lud(int i5) {
        dc.ycx((View) this.f24998jc, i5);
    }

    public void ul(int i5) {
        dc.ycx((View) this.lud, i5);
    }

    public void zb(int i5) {
        if (this.wie == null) {
            this.wie = new com.bytedance.sdk.openadsdk.core.lt.lt(this.sya.yzp);
            FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(120, 120);
            layoutParams.gravity = 17;
            this.wie.setLayoutParams(layoutParams);
            this.wie.setIndeterminateDrawable(com.bytedance.sdk.openadsdk.utils.ea.ycx(this.sya.yzp, "tt_video_loading_progress_bar"));
            this.sya.kgy.lt().addView(this.wie);
        }
        this.wie.setVisibility(i5);
    }

    public void ycx(boolean z11) {
        dc.ycx((View) this.f24998jc, av.sya(this.f24994dj) ? 8 : 0);
        dc.ycx((View) this.f24997ea, (this.f24994dj.wnd() && this.f24994dj.dv()) ? 0 : 8);
        zb(z11);
        if (this.f25004uh) {
            lud();
        }
    }

    public void dj(int i5) {
        tn tnVar = this.f24994dj;
        if (tnVar != null && tnVar.sim() && av.sya(this.f24994dj)) {
            dc.ycx((View) this.f24995dv, i5);
        }
    }

    public void ycx(int i5, int i11) {
        FrameLayout frameLayout;
        if (this.f24994dj.zk() == 1 && (frameLayout = this.f25005ul) != null && (frameLayout.getLayoutParams() instanceof RelativeLayout.LayoutParams)) {
            int iDj = dc.dj((Context) this.f25006zb);
            RelativeLayout.LayoutParams layoutParams = (RelativeLayout.LayoutParams) this.f25005ul.getLayoutParams();
            layoutParams.width = iDj;
            int i12 = (iDj * 9) / 16;
            layoutParams.height = i12;
            this.f25005ul.setLayoutParams(layoutParams);
            this.xkz = (dc.lt(this.f25006zb) - i12) / 2;
        }
    }

    public void zb(boolean z11) {
        int iYcx;
        int iYcx2;
        if (this.thx != 1 && z11) {
            ImageView imageView = this.lud;
            ViewGroup.LayoutParams layoutParams = imageView != null ? imageView.getLayoutParams() : null;
            ImageView imageView2 = this.f25000lt;
            ViewGroup.LayoutParams layoutParams2 = imageView2 != null ? imageView2.getLayoutParams() : null;
            if ((layoutParams instanceof ViewGroup.MarginLayoutParams) && (iYcx2 = ycx("navigation_bar_height")) > 0) {
                ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) layoutParams;
                if (iYcx2 > marginLayoutParams.rightMargin) {
                    marginLayoutParams.rightMargin = iYcx2;
                }
            }
            if ((layoutParams2 instanceof ViewGroup.MarginLayoutParams) && (iYcx = ycx("navigation_bar_height")) > 0) {
                ViewGroup.MarginLayoutParams marginLayoutParams2 = (ViewGroup.MarginLayoutParams) layoutParams2;
                if (iYcx > marginLayoutParams2.rightMargin) {
                    marginLayoutParams2.rightMargin = iYcx;
                }
            }
        }
        com.bytedance.sdk.openadsdk.component.reward.zb.zb zbVar = this.sya.f25195ur;
        if ((zbVar instanceof com.bytedance.sdk.openadsdk.component.reward.zb.dj) || (zbVar instanceof com.bytedance.sdk.openadsdk.component.reward.zb.sya)) {
            return;
        }
        sya(0);
    }

    public void ycx(com.bytedance.sdk.openadsdk.core.sya.sya syaVar, View.OnTouchListener onTouchListener, View.OnClickListener onClickListener) {
        View view;
        View view2;
        tn tnVar;
        if (this.f25005ul != null && (tnVar = this.f24994dj) != null && tnVar.ujb() != null) {
            if (this.f24994dj.ujb().f25637lt && !htf.zb(this.f24994dj)) {
                ycx((View.OnClickListener) syaVar);
                ycx(syaVar);
            } else {
                ycx(onClickListener);
            }
        }
        tn tnVar2 = this.f24994dj;
        if (tnVar2 != null && tnVar2.zk() == 1) {
            if (this.f24994dj.ujb() != null && (view2 = this.fby) != null) {
                dc.ycx(view2, 0);
                RelativeLayout.LayoutParams layoutParams = (RelativeLayout.LayoutParams) this.fby.getLayoutParams();
                layoutParams.height = this.xkz;
                this.fby.setLayoutParams(layoutParams);
                if (this.f24994dj.ujb().f25638zb) {
                    this.fby.setOnClickListener(syaVar);
                    this.fby.setOnTouchListener(onTouchListener);
                } else {
                    this.fby.setOnClickListener(onClickListener);
                }
            }
            if (this.f24994dj.ujb() != null && (view = this.f24999jw) != null) {
                dc.ycx(view, 0);
                RelativeLayout.LayoutParams layoutParams2 = (RelativeLayout.LayoutParams) this.f24999jw.getLayoutParams();
                layoutParams2.height = this.xkz;
                this.f24999jw.setLayoutParams(layoutParams2);
                if (this.f24994dj.ujb().f25636dj) {
                    this.f24999jw.setOnClickListener(syaVar);
                    this.f24999jw.setOnTouchListener(onTouchListener);
                } else {
                    this.f24999jw.setOnClickListener(onClickListener);
                }
            }
        }
        PAGLogoView pAGLogoView = this.f24998jc;
        if (pAGLogoView != null) {
            pAGLogoView.setOnClickListener(new View.OnClickListener() { // from class: com.bytedance.sdk.openadsdk.component.reward.view.ea.1
                @Override // android.view.View.OnClickListener
                public void onClick(View view3) {
                    try {
                        if (com.bytedance.sdk.openadsdk.utils.zb.lud() && pmi.dj().av()) {
                            ea eaVar = ea.this;
                            IABLandingPageActivity.ycx(eaVar.f25006zb, eaVar.f24994dj, eaVar.htf);
                        } else {
                            ea eaVar2 = ea.this;
                            TTWebsiteActivity.ycx(eaVar2.f25006zb, eaVar2.f24994dj, eaVar2.htf);
                        }
                    } catch (Throwable th2) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erThU4CibF/J7wpdLxVnCB6ktTA==", "aes6lBG4T9KMRuFUiBSvBFr3IoAX+Dg=", "VOAOmQq/Yg==", 287);
                        com.bytedance.sdk.component.utils.htf.sya("TTAD.RFullVideoLayout", th2.getMessage());
                    }
                }
            });
        }
        ImageView imageView = this.f24997ea;
        if (imageView != null) {
            imageView.setClickable(true);
            com.bytedance.sdk.openadsdk.htf.zb.zb().ycx((int) dc.ycx(pmi.ycx(), 14.0f, true), this.f24997ea, this.sya.f25203zb);
        }
    }

    private int ycx(String str) {
        Resources resources = this.f25006zb.getResources();
        if (resources != null) {
            return resources.getDimensionPixelSize(resources.getIdentifier(str, "dimen", "android"));
        }
        return 0;
    }

    public void ycx(View.OnClickListener onClickListener) {
        dc.ycx(this.f25005ul, onClickListener, "TTBaseVideoActivity#mVideoNativeFrame");
    }

    private void ycx(com.bytedance.sdk.openadsdk.core.sya.sya syaVar) {
        dc.ycx((View) this.f25005ul, (View.OnTouchListener) syaVar, "TTBaseVideoActivity#mVideoNativeFrame");
    }

    public void ycx(float f11) {
        dc.ycx(this.lud, f11);
    }

    public void ycx(Animation animation) {
        RelativeLayout relativeLayout = this.f25001ok;
        if (relativeLayout != null) {
            relativeLayout.startAnimation(animation);
        }
    }

    public void ycx(int i5, xkz xkzVar) {
        htf htfVar = this.f24996dy;
        if (htfVar != null) {
            htfVar.ycx(i5, xkzVar);
        }
    }
}
