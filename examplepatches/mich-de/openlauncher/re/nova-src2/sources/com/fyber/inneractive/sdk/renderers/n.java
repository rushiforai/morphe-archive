package com.fyber.inneractive.sdk.renderers;

import android.content.Context;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import com.fyber.inneractive.sdk.R;
import com.fyber.inneractive.sdk.config.enums.UnitDisplayType;
import com.fyber.inneractive.sdk.config.w0;
import com.fyber.inneractive.sdk.config.x0;
import com.fyber.inneractive.sdk.external.InneractiveAdRequest;
import com.fyber.inneractive.sdk.external.InneractiveAdSpot;
import com.fyber.inneractive.sdk.external.InneractiveAdViewUnitController;
import com.fyber.inneractive.sdk.external.InneractiveFullscreenUnitController;
import com.fyber.inneractive.sdk.flow.h0;
import com.fyber.inneractive.sdk.flow.q0;
import com.fyber.inneractive.sdk.ui.IAmraidWebViewController;
import com.fyber.inneractive.sdk.ui.IFyberAdIdentifier;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.h1;
import com.fyber.inneractive.sdk.util.l0;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.regex.Pattern;

/* loaded from: classes3.dex */
public final class n extends com.fyber.inneractive.sdk.flow.b0 implements com.fyber.inneractive.sdk.interfaces.d, com.fyber.inneractive.sdk.util.a0 {
    public k A;
    public ImageView B;

    /* renamed from: l, reason: collision with root package name */
    public InneractiveAdViewUnitController f30996l;

    /* renamed from: m, reason: collision with root package name */
    public IAmraidWebViewController f30997m;
    public h n;

    /* renamed from: p, reason: collision with root package name */
    public ViewGroup f30998p;

    /* renamed from: q, reason: collision with root package name */
    public l f30999q;

    /* renamed from: s, reason: collision with root package name */
    public i f31001s;

    /* renamed from: y, reason: collision with root package name */
    public d f31007y;

    /* renamed from: z, reason: collision with root package name */
    public j f31008z;

    /* renamed from: k, reason: collision with root package name */
    public long f30995k = 0;
    public boolean o = false;

    /* renamed from: r, reason: collision with root package name */
    public long f31000r = 0;

    /* renamed from: t, reason: collision with root package name */
    public int f31002t = 0;

    /* renamed from: u, reason: collision with root package name */
    public long f31003u = 0;

    /* renamed from: v, reason: collision with root package name */
    public boolean f31004v = false;

    /* renamed from: w, reason: collision with root package name */
    public boolean f31005w = true;

    /* renamed from: x, reason: collision with root package name */
    public boolean f31006x = false;

    public final void I() {
        if (this.f31001s != null) {
            IAlog.a("%scancelling refreen runnable", IAlog.a(this));
            com.fyber.inneractive.sdk.util.r.f31216b.removeCallbacks(this.f31001s);
            this.f31001s = null;
        }
    }

    public final void J() {
        d dVar = this.f31007y;
        if (dVar != null) {
            dVar.f30978g = false;
            com.fyber.inneractive.sdk.util.r.f31216b.removeCallbacks(dVar.f30981j);
        }
        if (this.f30997m != null) {
            I();
            com.fyber.inneractive.sdk.flow.x xVar = this.f28031b;
            if (xVar != null) {
                ((q0) xVar).destroy();
            }
            this.f30997m = null;
            this.f28031b = null;
            ViewGroup viewGroup = this.f30998p;
            if (viewGroup != null) {
                viewGroup.removeView(this.f30999q);
            }
            l lVar = this.f30999q;
            if (lVar != null) {
                lVar.removeAllViews();
                this.f30999q = null;
            }
        }
        this.f31004v = false;
    }

    public final int K() {
        com.fyber.inneractive.sdk.config.q0 q0Var;
        int iIntValue;
        int i5 = this.f31002t;
        if (i5 == -1) {
            IAlog.a("%sreturning disable value for banner refresh", IAlog.a(this));
            return 0;
        }
        if (i5 <= 0) {
            x0 x0Var = this.f28030a.getAdContent().f28440d;
            if (x0Var != null && (q0Var = ((w0) x0Var).f27945c) != null) {
                Integer num = q0Var.f27881a;
                IAlog.a("%sreturning refreshConfig = %d", IAlog.a(this), num);
                if (num != null) {
                    iIntValue = num.intValue();
                }
            }
            IAlog.a("%sgetRefreshInterval: returning 0. Refresh is disabled", IAlog.a(this));
            return 0;
        }
        IAlog.a("%sreturning overriden refresh interval = %d", IAlog.a(this), Integer.valueOf(this.f31002t));
        iIntValue = this.f31002t;
        return iIntValue * 1000;
    }

    public final boolean L() {
        x0 x0Var;
        com.fyber.inneractive.sdk.flow.x xVar = this.f28031b;
        return (xVar == null || (x0Var = ((q0) xVar).f28440d) == null || ((w0) x0Var).f27945c == null || ((w0) x0Var).f27945c.f27882b == null || !((w0) x0Var).f27945c.f27882b.isFullscreenUnit()) ? false : true;
    }

    public final void M() {
        InneractiveAdViewUnitController inneractiveAdViewUnitController;
        IAmraidWebViewController iAmraidWebViewController = this.f30997m;
        if (iAmraidWebViewController == null || iAmraidWebViewController.f31304b == null) {
            return;
        }
        IAlog.a("%srefreshing ad", IAlog.a(this));
        if ((!this.f30997m.p() || this.f30997m.N == com.fyber.inneractive.sdk.mraid.f0.RESIZED) && (inneractiveAdViewUnitController = this.f30996l) != null) {
            this.f31000r = 0L;
            inneractiveAdViewUnitController.refreshAd();
        }
    }

    public final void N() {
        com.fyber.inneractive.sdk.web.m mVar;
        IAmraidWebViewController iAmraidWebViewController = this.f30997m;
        if (iAmraidWebViewController == null || (mVar = iAmraidWebViewController.f31304b) == null || !mVar.getIsVisible() || this.f31000r == 0 || this.f30997m.p() || this.f30997m.N == com.fyber.inneractive.sdk.mraid.f0.RESIZED) {
            return;
        }
        if (!this.f31005w) {
            if (this.f30995k < System.currentTimeMillis() - this.f31000r) {
                this.f31003u = 1L;
            } else {
                this.f31003u = this.f30995k - (System.currentTimeMillis() - this.f31000r);
            }
        }
        IAlog.a("%sresuming refresh runnable mRefreshTimeStamp %d", IAlog.a(this), Long.valueOf(this.f31003u));
        a(false, this.f31003u);
    }

    @Override // com.fyber.inneractive.sdk.interfaces.d
    public final boolean a(com.fyber.inneractive.sdk.flow.x xVar) {
        return xVar instanceof q0;
    }

    @Override // com.fyber.inneractive.sdk.interfaces.d
    public final boolean b(View view) {
        return view != null && view.equals(this.f30998p);
    }

    @Override // com.fyber.inneractive.sdk.flow.b0, com.fyber.inneractive.sdk.external.InneractiveAdRenderer
    public final boolean canRefreshAd() {
        IAmraidWebViewController iAmraidWebViewController = this.f30997m;
        if (iAmraidWebViewController != null) {
            return (iAmraidWebViewController.p() || this.f30997m.N == com.fyber.inneractive.sdk.mraid.f0.RESIZED) ? false : true;
        }
        return true;
    }

    public final void d(boolean z11) {
        if (this.f31001s != null) {
            this.f31005w = z11;
            I();
            this.f31003u = this.f30995k - (System.currentTimeMillis() - this.f31000r);
            IAlog.a("%sPause refresh time : time remaning:%d ,refreshInterval: %d", IAlog.a(this), Long.valueOf(this.f31003u), Long.valueOf(this.f30995k));
        }
    }

    @Override // com.fyber.inneractive.sdk.flow.b0, com.fyber.inneractive.sdk.external.InneractiveAdRenderer
    public final void destroy() {
        com.fyber.inneractive.sdk.web.m mVar;
        IAmraidWebViewController iAmraidWebViewController = this.f30997m;
        if (iAmraidWebViewController != null && (mVar = iAmraidWebViewController.f31304b) != null) {
            j jVar = this.f31008z;
            if (jVar != null) {
                mVar.removeOnLayoutChangeListener(jVar);
            }
            k kVar = this.A;
            if (kVar != null) {
                mVar.removeOnAttachStateChangeListener(kVar);
            }
        }
        this.B = null;
        I();
        J();
        this.n = null;
        com.fyber.inneractive.sdk.util.z.f31254a.f31172a.remove(this);
        i iVar = this.f31001s;
        if (iVar != null) {
            com.fyber.inneractive.sdk.util.r.f31216b.removeCallbacks(iVar);
        }
        super.destroy();
    }

    @Override // com.fyber.inneractive.sdk.flow.b0
    public final void e(View view) {
        com.fyber.inneractive.sdk.measurement.tracker.e eVar;
        xn.f fVar;
        IAmraidWebViewController iAmraidWebViewController = this.f30997m;
        if (iAmraidWebViewController == null || (eVar = iAmraidWebViewController.I) == null) {
            return;
        }
        try {
            un.b bVar = eVar.f28527a;
            if (bVar == null || view == null) {
                return;
            }
            un.k kVar = (un.k) bVar;
            if (kVar.f91404g) {
                return;
            }
            xn.g gVar = kVar.f91400c;
            gVar.getClass();
            ArrayList arrayList = gVar.f96193a;
            Pattern pattern = xn.g.f96192b;
            Iterator it = arrayList.iterator();
            while (true) {
                if (!it.hasNext()) {
                    fVar = null;
                    break;
                } else {
                    fVar = (xn.f) it.next();
                    if (fVar.f96188a.get() == view) {
                        break;
                    }
                }
            }
            if (fVar != null) {
                arrayList.remove(fVar);
            }
        } catch (Throwable unused) {
        }
    }

    @Override // com.fyber.inneractive.sdk.interfaces.d
    public final void l() {
    }

    @Override // com.fyber.inneractive.sdk.interfaces.d
    public final int n() {
        return this.f30997m.f31327e0;
    }

    @Override // com.fyber.inneractive.sdk.interfaces.d
    public final void p() {
        com.fyber.inneractive.sdk.web.m mVar;
        IAlog.a("%sgot onAdRefreshFailed", IAlog.a(this));
        IAmraidWebViewController iAmraidWebViewController = this.f30997m;
        if (iAmraidWebViewController == null || (mVar = iAmraidWebViewController.f31304b) == null) {
            return;
        }
        if (!mVar.getIsVisible() || com.fyber.inneractive.sdk.util.z.f31254a.f31173b || this.f30997m.p() || this.f30997m.N == com.fyber.inneractive.sdk.mraid.f0.RESIZED) {
            IAlog.a("%sview is not visible or screen is locked or webView is Expanded or web is Resised. Waiting for visibility change", IAlog.a(this));
            this.f31003u = 1L;
            return;
        }
        IAlog.a("%sview is visible and screen is unlocked: refreshing ad and webView is not expanded", IAlog.a(this));
        long jK = K();
        this.f30995k = jK;
        if (jK != 0) {
            a(false, com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h.f42227c);
        }
    }

    @Override // com.fyber.inneractive.sdk.interfaces.d
    public final void q() {
    }

    @Override // com.fyber.inneractive.sdk.interfaces.d
    public final void s() {
        d dVar = this.f31007y;
        if (dVar != null) {
            dVar.f30978g = false;
            com.fyber.inneractive.sdk.util.r.f31216b.removeCallbacks(dVar.f30981j);
        }
        l lVar = this.f30999q;
        if (lVar != null) {
            lVar.removeAllViews();
            this.f30999q = null;
        }
        ViewGroup viewGroup = this.f30998p;
        if (viewGroup != null) {
            viewGroup.removeAllViews();
            this.f30998p = null;
        }
    }

    @Override // com.fyber.inneractive.sdk.flow.b0
    public final View x() {
        IAmraidWebViewController iAmraidWebViewController = this.f30997m;
        if (iAmraidWebViewController != null) {
            return iAmraidWebViewController.f31304b;
        }
        return null;
    }

    @Override // com.fyber.inneractive.sdk.flow.b0
    public final int y() {
        IAmraidWebViewController iAmraidWebViewController = this.f30997m;
        if (iAmraidWebViewController != null) {
            return (iAmraidWebViewController.f31304b == null || !iAmraidWebViewController.p()) ? com.fyber.inneractive.sdk.util.o.c(this.f30997m.f31327e0) : com.fyber.inneractive.sdk.util.o.c(this.f30997m.f31304b.getHeight());
        }
        return -1;
    }

    @Override // com.fyber.inneractive.sdk.flow.b0
    public final int z() {
        IAmraidWebViewController iAmraidWebViewController = this.f30997m;
        if (iAmraidWebViewController != null) {
            return (iAmraidWebViewController.f31304b == null || !iAmraidWebViewController.p()) ? com.fyber.inneractive.sdk.util.o.c(this.f30997m.f31326d0) : com.fyber.inneractive.sdk.util.o.c(this.f30997m.f31304b.getWidth());
        }
        return -1;
    }

    @Override // com.fyber.inneractive.sdk.interfaces.d
    public final void a(ViewGroup viewGroup) {
        com.fyber.inneractive.sdk.rtb.watermark.b bVar;
        int i5;
        ViewGroup viewGroup2;
        ViewGroup viewGroup3;
        l lVar;
        InneractiveAdSpot inneractiveAdSpot = this.f28030a;
        if (inneractiveAdSpot == null) {
            IAlog.f("%sYou must set the spot to render before calling renderAd", IAlog.a(this));
            return;
        }
        this.o = false;
        this.f28034e = false;
        if (viewGroup != null) {
            this.f30998p = viewGroup;
            this.f30996l = (InneractiveAdViewUnitController) inneractiveAdSpot.getSelectedUnitController();
        } else if (!this.f31006x) {
            J();
            if (!(this.f28030a.getAdContent() instanceof q0)) {
                IAlog.f("InneractiveAdViewMraidAdRenderer.renderAd: Spot ad content is not the right content :( %s", this.f28030a.getAdContent());
                return;
            }
            this.f28031b = (q0) this.f28030a.getAdContent();
        }
        com.fyber.inneractive.sdk.flow.x xVar = this.f28031b;
        IAmraidWebViewController iAmraidWebViewController = xVar != null ? ((q0) xVar).f28277i : null;
        this.f30997m = iAmraidWebViewController;
        if (iAmraidWebViewController != null) {
            if (this.n == null) {
                this.n = new h(this);
            }
            iAmraidWebViewController.setListener(this.n);
            InneractiveAdRequest inneractiveAdRequest = ((q0) this.f28031b).f28437a;
            int i11 = -1;
            if (L()) {
                l lVar2 = new l(this.f30998p.getContext(), 1.5f);
                this.f30999q = lVar2;
                IAmraidWebViewController iAmraidWebViewController2 = this.f30997m;
                ViewGroup.LayoutParams layoutParams = new ViewGroup.LayoutParams(-1, -1);
                com.fyber.inneractive.sdk.web.m mVar = iAmraidWebViewController2.f31304b;
                if (mVar != null) {
                    lVar2.addView(mVar, layoutParams);
                    l0.f31201a.a(lVar2.getContext(), iAmraidWebViewController2.f31304b, iAmraidWebViewController2);
                    com.fyber.inneractive.sdk.web.m mVar2 = iAmraidWebViewController2.f31304b;
                    if (mVar2 != null) {
                        mVar2.setTapListener(iAmraidWebViewController2);
                    }
                }
                this.f30998p.addView(this.f30999q, new ViewGroup.LayoutParams(-2, -2));
            } else {
                this.f30999q = new l(this.f30998p.getContext(), 0.0f);
                q0 q0Var = (q0) this.f28031b;
                com.fyber.inneractive.sdk.response.f fVar = (com.fyber.inneractive.sdk.response.f) q0Var.f28438b;
                h1 h1VarA = a(fVar.f31046e, fVar.f31047f, q0Var.f28440d);
                this.f30997m.setAdDefaultSize(h1VarA.f31191a, h1VarA.f31192b);
                IAmraidWebViewController iAmraidWebViewController3 = this.f30997m;
                View view = iAmraidWebViewController3.f31304b;
                if (view != null || com.fyber.inneractive.sdk.util.o.f31210a == null) {
                    ViewParent parent = view != null ? view.getParent() : null;
                    if (parent instanceof ViewGroup) {
                        ((ViewGroup) parent).removeView(view);
                    }
                    RelativeLayout.LayoutParams layoutParamsA = com.fyber.inneractive.sdk.util.v.a(h1VarA.f31191a, h1VarA.f31192b, 13);
                    IAmraidWebViewController iAmraidWebViewController4 = this.f30997m;
                    l lVar3 = this.f30999q;
                    com.fyber.inneractive.sdk.web.m mVar3 = iAmraidWebViewController4.f31304b;
                    if (mVar3 != null) {
                        lVar3.addView(mVar3, layoutParamsA);
                        l0.f31201a.a(lVar3.getContext(), iAmraidWebViewController4.f31304b, iAmraidWebViewController4);
                        com.fyber.inneractive.sdk.web.m mVar4 = iAmraidWebViewController4.f31304b;
                        if (mVar4 != null) {
                            mVar4.setTapListener(iAmraidWebViewController4);
                        }
                    }
                    this.f30998p.addView(this.f30999q);
                    l lVar4 = this.f30999q;
                    ViewGroup.LayoutParams layoutParams2 = lVar4.getLayoutParams();
                    layoutParams2.width = -2;
                    layoutParams2.height = -2;
                    lVar4.setLayoutParams(layoutParams2);
                    InneractiveAdSpot inneractiveAdSpot2 = this.f28030a;
                    if (inneractiveAdSpot2 != null && inneractiveAdSpot2.getAdContent() != null && (viewGroup2 = this.f30998p) != null) {
                        Context context = viewGroup2.getContext();
                        com.fyber.inneractive.sdk.flow.g gVar = new com.fyber.inneractive.sdk.flow.g(context, false, this.f28030a.getAdContent().f28437a, this.f28030a.getAdContent().f28438b, this.f28030a.getAdContent().f28439c);
                        ViewGroup viewGroup4 = (ViewGroup) LayoutInflater.from(context).inflate(R.layout.ia_layout_fyber_ad_identifier_relative, this.f30998p, false);
                        IFyberAdIdentifier.Corner corner = IFyberAdIdentifier.Corner.BOTTOM_LEFT;
                        IFyberAdIdentifier iFyberAdIdentifier = gVar.f28149d;
                        iFyberAdIdentifier.f31149k = corner;
                        iFyberAdIdentifier.a(viewGroup4);
                        viewGroup4.setVisibility(0);
                        IAmraidWebViewController iAmraidWebViewController5 = this.f30997m;
                        if (iAmraidWebViewController5 == null) {
                            viewGroup3 = null;
                        } else {
                            viewGroup3 = iAmraidWebViewController5.f31304b;
                            if (viewGroup3 != null && viewGroup3.getParent() != null) {
                                viewGroup3 = (ViewGroup) viewGroup3.getParent();
                            }
                        }
                        if (viewGroup3 != null && x() != null) {
                            ViewGroup.LayoutParams layoutParams3 = x().getLayoutParams();
                            IAmraidWebViewController iAmraidWebViewController6 = this.f30997m;
                            viewGroup3.addView(viewGroup4, layoutParams3);
                            iAmraidWebViewController6.a(viewGroup4, com.fyber.inneractive.sdk.measurement.tracker.d.IdentifierView);
                        }
                    }
                    InneractiveAdSpot inneractiveAdSpot3 = this.f28030a;
                    if (inneractiveAdSpot3 != null && (inneractiveAdSpot3 instanceof h0) && this.f30997m != null && this.f30999q != null && view != null && (bVar = ((h0) inneractiveAdSpot3).f28162m) != null) {
                        ImageView imageView = bVar.f31092a;
                        this.B = imageView;
                        if (imageView != null) {
                            if (L()) {
                                i5 = -1;
                            } else {
                                i11 = h1VarA.f31191a;
                                i5 = h1VarA.f31192b;
                            }
                            if (this.f31008z == null) {
                                j jVar = new j(this);
                                this.f31008z = jVar;
                                view.addOnLayoutChangeListener(jVar);
                            }
                            if (this.A == null) {
                                k kVar = new k(this);
                                this.A = kVar;
                                view.addOnAttachStateChangeListener(kVar);
                            }
                            this.B.setLayoutParams(com.fyber.inneractive.sdk.util.v.a(i11, i5, 13));
                            this.f30999q.addView(this.B);
                            IAmraidWebViewController iAmraidWebViewController7 = this.f30997m;
                            h1 h1Var = new h1(i11, i5);
                            iAmraidWebViewController7.f31337o0 = bVar;
                            iAmraidWebViewController7.f31338p0 = h1Var;
                            ImageView imageView2 = bVar.f31092a;
                            if (imageView2 != null) {
                                iAmraidWebViewController7.a(imageView2, com.fyber.inneractive.sdk.measurement.tracker.d.Watermark);
                            }
                        }
                    }
                } else if (this.f31006x) {
                    FrameLayout frameLayout = new FrameLayout(this.f30998p.getContext());
                    frameLayout.setBackgroundResource(R.color.ia_blank_background);
                    this.f30998p.removeAllViews();
                    this.f30998p.addView(frameLayout, new FrameLayout.LayoutParams(h1VarA.f31191a, h1VarA.f31192b, 17));
                } else {
                    this.f31006x = true;
                    iAmraidWebViewController3.f31304b = iAmraidWebViewController3.a(((q0) this.f28031b).f28439c);
                    try {
                        iAmraidWebViewController3.h();
                        iAmraidWebViewController3.f31304b.loadDataWithBaseURL(iAmraidWebViewController3.f31316p, iAmraidWebViewController3.f31317q, "text/html", "utf-8", null);
                    } catch (Throwable unused) {
                        FrameLayout frameLayout2 = new FrameLayout(this.f30998p.getContext());
                        frameLayout2.setBackgroundResource(R.color.ia_blank_background);
                        this.f30998p.removeAllViews();
                        this.f30998p.addView(frameLayout2, new FrameLayout.LayoutParams(h1VarA.f31191a, h1VarA.f31192b, 17));
                    }
                }
            }
            com.fyber.inneractive.sdk.flow.x xVar2 = this.f28031b;
            com.fyber.inneractive.sdk.response.f fVar2 = xVar2 != null ? (com.fyber.inneractive.sdk.response.f) ((q0) xVar2).f28438b : null;
            if (fVar2 != null && (lVar = this.f30999q) != null) {
                d dVar = new d(fVar2, lVar, new g(this));
                this.f31007y = dVar;
                dVar.f30979h = false;
                dVar.f30975d = 1;
                dVar.f30976e = 0.0f;
                int i12 = fVar2.f31058s;
                if (i12 >= 1) {
                    dVar.f30975d = Math.min(i12, 100);
                }
                float f11 = fVar2.f31059t;
                if (f11 >= -1.0f) {
                    dVar.f30976e = f11;
                }
                if (dVar.f30976e >= 0.0f) {
                    IAlog.a("IAVisibilityTracker: startTrackingVisibility", new Object[0]);
                    dVar.f30974c = 0.0f;
                    dVar.f30977f = System.currentTimeMillis();
                    dVar.f30978g = true;
                    dVar.a();
                }
            }
        } else {
            IAlog.f("InneractiveAdViewMraidAdRenderer.renderAd: Spot ad content is not the right content :( %s", xVar);
        }
        com.fyber.inneractive.sdk.util.b0 b0Var = com.fyber.inneractive.sdk.util.z.f31254a;
        if (b0Var.f31172a.contains(this)) {
            return;
        }
        b0Var.f31172a.add(this);
    }

    @Override // com.fyber.inneractive.sdk.interfaces.d
    public final int d() {
        return this.f30997m.f31326d0;
    }

    @Override // com.fyber.inneractive.sdk.flow.b0
    public final void d(View view) {
        IAmraidWebViewController iAmraidWebViewController = this.f30997m;
        if (iAmraidWebViewController != null) {
            iAmraidWebViewController.a(view, com.fyber.inneractive.sdk.measurement.tracker.d.ProgressOverlay);
        }
    }

    public final void a(boolean z11, long j11) {
        IAmraidWebViewController iAmraidWebViewController;
        com.fyber.inneractive.sdk.web.m mVar;
        if (!TextUtils.isEmpty(this.f28030a.getMediationNameString()) || j11 == 0 || (this.f28030a.getSelectedUnitController() instanceof InneractiveFullscreenUnitController) || this.f31002t == -1 || (iAmraidWebViewController = this.f30997m) == null || (mVar = iAmraidWebViewController.f31304b) == null) {
            return;
        }
        if (!mVar.getIsVisible()) {
            IAlog.a("%sstartRefreshTimer called but ad is not visible", IAlog.a(this));
            return;
        }
        this.f31000r = System.currentTimeMillis();
        this.f30995k = z11 ? this.f30995k : j11;
        IAlog.a("%sstartRefreshTimer in %d msec, mRefreshInterval = %d", IAlog.a(this), Long.valueOf(j11), Long.valueOf(this.f30995k));
        if (j11 > 1) {
            i iVar = this.f31001s;
            if (iVar != null) {
                com.fyber.inneractive.sdk.util.r.f31216b.removeCallbacks(iVar);
            }
            I();
            i iVar2 = new i(this);
            this.f31001s = iVar2;
            com.fyber.inneractive.sdk.util.r.f31216b.postDelayed(iVar2, j11);
            return;
        }
        M();
    }

    public static h1 a(int i5, int i11, x0 x0Var) {
        int iA;
        int iA2;
        com.fyber.inneractive.sdk.config.q0 q0Var;
        IAlog.a("View layout params: response width and height: %d, %d", Integer.valueOf(i5), Integer.valueOf(i11));
        if (i5 > 0 && i11 > 0) {
            iA = com.fyber.inneractive.sdk.util.o.a(i5);
            iA2 = com.fyber.inneractive.sdk.util.o.a(i11);
        } else {
            UnitDisplayType unitDisplayType = UnitDisplayType.BANNER;
            if (x0Var != null && (q0Var = ((w0) x0Var).f27945c) != null) {
                unitDisplayType = q0Var.f27882b;
            }
            if (unitDisplayType.equals(UnitDisplayType.MRECT)) {
                iA = com.fyber.inneractive.sdk.util.o.a(m.RECTANGLE_WIDTH.value);
                iA2 = com.fyber.inneractive.sdk.util.o.a(m.RECTANGLE_HEIGHT.value);
            } else if (com.fyber.inneractive.sdk.util.k.j()) {
                iA = com.fyber.inneractive.sdk.util.o.a(m.BANNER_TABLET_WIDTH.value);
                iA2 = com.fyber.inneractive.sdk.util.o.a(m.BANNER_TABLET_HEIGHT.value);
            } else {
                iA = com.fyber.inneractive.sdk.util.o.a(m.BANNER_WIDTH.value);
                iA2 = com.fyber.inneractive.sdk.util.o.a(m.BANNER_HEIGHT.value);
            }
        }
        IAlog.e("View layout params: final scaled width and height: %d, %d", Integer.valueOf(iA), Integer.valueOf(iA2));
        return new h1(iA, iA2);
    }

    @Override // com.fyber.inneractive.sdk.interfaces.d
    public final void a(int i5) {
        this.f31002t = i5;
    }
}
