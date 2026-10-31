package com.fyber.inneractive.sdk.web;

import android.app.Activity;
import android.content.Context;
import android.graphics.Rect;
import android.os.Build;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.webkit.URLUtil;
import android.webkit.WebView;
import android.widget.FrameLayout;
import android.widget.ImageView;
import com.fyber.inneractive.sdk.R;
import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.fyber.inneractive.sdk.config.enums.Orientation;
import com.fyber.inneractive.sdk.external.InneractiveAdRequest;
import com.fyber.inneractive.sdk.ui.IAcloseButton;
import com.fyber.inneractive.sdk.util.IAlog;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import java.net.URI;
import java.net.URLDecoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;
import org.json.JSONArray;

/* loaded from: classes3.dex */
public abstract class i0 extends i1 {

    /* renamed from: r0, reason: collision with root package name */
    public static final String[] f31321r0 = {"yyyy-MM-dd'T'HH:mm:ssZZZZZ", "yyyy-MM-dd'T'HH:mmZZZZZ"};

    /* renamed from: s0, reason: collision with root package name */
    public static final Object f31322s0 = new Object();
    public com.fyber.inneractive.sdk.mraid.f0 N;
    public final z O;
    public final d0 P;
    public final c0 Q;
    public ViewGroup R;
    public m S;
    public boolean T;
    public int U;
    public e0 V;
    public IAcloseButton W;
    public boolean X;
    public float Y;
    public int Z;

    /* renamed from: a0, reason: collision with root package name */
    public int f31323a0;

    /* renamed from: b0, reason: collision with root package name */
    public int f31324b0;

    /* renamed from: c0, reason: collision with root package name */
    public int f31325c0;

    /* renamed from: d0, reason: collision with root package name */
    public int f31326d0;

    /* renamed from: e0, reason: collision with root package name */
    public int f31327e0;

    /* renamed from: f0, reason: collision with root package name */
    public Orientation f31328f0;

    /* renamed from: g0, reason: collision with root package name */
    public int f31329g0;

    /* renamed from: h0, reason: collision with root package name */
    public FrameLayout f31330h0;

    /* renamed from: i0, reason: collision with root package name */
    public FrameLayout f31331i0;

    /* renamed from: j0, reason: collision with root package name */
    public FrameLayout f31332j0;

    /* renamed from: k0, reason: collision with root package name */
    public int f31333k0;

    /* renamed from: l0, reason: collision with root package name */
    public int f31334l0;

    /* renamed from: m0, reason: collision with root package name */
    public t f31335m0;

    /* renamed from: n0, reason: collision with root package name */
    public final p f31336n0;

    /* renamed from: o0, reason: collision with root package name */
    public com.fyber.inneractive.sdk.rtb.watermark.b f31337o0;

    /* renamed from: p0, reason: collision with root package name */
    public com.fyber.inneractive.sdk.util.h1 f31338p0;

    /* renamed from: q0, reason: collision with root package name */
    public com.fyber.inneractive.sdk.flow.x0 f31339q0;

    public i0(boolean z11, c0 c0Var, z zVar, d0 d0Var, com.fyber.inneractive.sdk.measurement.e eVar, com.fyber.inneractive.sdk.config.global.r rVar) {
        super(z11, c0Var, rVar);
        this.N = com.fyber.inneractive.sdk.mraid.f0.HIDDEN;
        this.T = false;
        this.Z = -1;
        this.f31323a0 = -1;
        this.f31324b0 = -1;
        this.f31325c0 = -1;
        this.f31326d0 = -1;
        this.f31327e0 = -1;
        this.f31328f0 = Orientation.NONE;
        this.H = eVar;
        this.Q = c0Var;
        this.O = zVar;
        this.P = d0Var;
        this.f31339q0 = com.fyber.inneractive.sdk.flow.x0.f28443c;
        this.f31336n0 = new p(this);
    }

    @Override // com.fyber.inneractive.sdk.web.i, com.fyber.inneractive.sdk.web.l
    public void a(boolean z11) {
        a(new com.fyber.inneractive.sdk.mraid.g0(z11));
        super.a(z11);
    }

    @Override // com.fyber.inneractive.sdk.web.l
    public final void b() {
        com.fyber.inneractive.sdk.util.r.f31216b.post(new r(this));
    }

    @Override // com.fyber.inneractive.sdk.web.l
    public final void c() {
        m mVar = this.f31304b;
        if (mVar != null && mVar.getViewTreeObserver() != null) {
            this.f31304b.getViewTreeObserver().removeOnPreDrawListener(this.f31336n0);
        }
        com.fyber.inneractive.sdk.util.r.f31216b.post(new s(this));
    }

    public final void d(boolean z11) {
        try {
            Activity activity = (Activity) com.fyber.inneractive.sdk.util.o.a(this.f31304b);
            if (activity != null) {
                if (!z11 || activity.getResources() == null || activity.getResources().getConfiguration() == null) {
                    activity.setRequestedOrientation(this.U);
                } else {
                    activity.setRequestedOrientation(activity.getResources().getConfiguration().orientation);
                }
            }
        } catch (Exception unused) {
            IAlog.a("Failed to modify the device orientation.", new Object[0]);
        }
    }

    @Override // com.fyber.inneractive.sdk.web.i
    public final com.fyber.inneractive.sdk.util.g1 g() {
        m mVar;
        return (this.N != com.fyber.inneractive.sdk.mraid.f0.EXPANDED || (mVar = this.S) == null) ? super.g() : mVar.getLastClickedLocation();
    }

    @Override // com.fyber.inneractive.sdk.web.i
    public final void h() {
        super.h();
        FrameLayout frameLayout = this.f31331i0;
        if (frameLayout != null && this.f31332j0 != null) {
            frameLayout.removeAllViewsInLayout();
            this.f31332j0.removeAllViewsInLayout();
            ViewGroup viewGroup = this.R;
            if (viewGroup != null) {
                viewGroup.removeView(this.f31332j0);
            }
        }
        this.N = com.fyber.inneractive.sdk.mraid.f0.LOADING;
        Context contextA = com.fyber.inneractive.sdk.util.o.a(this.f31304b);
        this.U = contextA instanceof Activity ? ((Activity) contextA).getRequestedOrientation() : -1;
        this.f31331i0 = new FrameLayout(contextA);
        this.f31332j0 = new FrameLayout(contextA);
        FrameLayout frameLayout2 = new FrameLayout(contextA);
        frameLayout2.setBackgroundColor(-858993460);
        this.f31330h0 = frameLayout2;
        a(contextA, false);
        m mVar = this.f31304b;
        if (mVar != null) {
            mVar.setOnKeyListener(new q(this));
        }
    }

    @Override // com.fyber.inneractive.sdk.web.i1
    public final void j() {
        m mVar = this.f31304b;
        if (mVar != null) {
            mVar.a("window.mraidbridge.fireReadyEvent();");
        }
    }

    @Override // com.fyber.inneractive.sdk.web.i1
    public void k() {
        ArrayList arrayList = new ArrayList();
        m mVar = this.f31304b;
        if (mVar == null || mVar.getScaleX() == 1.0f || this.f31304b.getScaleY() == 1.0f) {
            arrayList.add(new com.fyber.inneractive.sdk.mraid.c0(this.Z, this.f31323a0));
            arrayList.add(new com.fyber.inneractive.sdk.mraid.a0(this.f31324b0, this.f31325c0));
        } else {
            arrayList.add(new com.fyber.inneractive.sdk.mraid.c0(this.f31304b.getWidthDp(), this.f31304b.getHeightDp()));
            arrayList.add(new com.fyber.inneractive.sdk.mraid.a0(this.f31304b.getWidthDp(), this.f31304b.getHeightDp()));
        }
        m mVar2 = this.f31304b;
        int iC = com.fyber.inneractive.sdk.util.o.c(mVar2 != null ? mVar2.getWidth() : this.f31324b0);
        m mVar3 = this.f31304b;
        arrayList.add(new com.fyber.inneractive.sdk.mraid.z(iC, com.fyber.inneractive.sdk.util.o.c(mVar3 != null ? mVar3.getHeight() : this.f31325c0)));
        a(arrayList);
        com.fyber.inneractive.sdk.mraid.f0 f0Var = com.fyber.inneractive.sdk.mraid.f0.DEFAULT;
        this.N = f0Var;
        a(new com.fyber.inneractive.sdk.mraid.d0(f0Var));
    }

    @Override // com.fyber.inneractive.sdk.web.i1
    public final boolean m() {
        c0 c0Var = this.Q;
        return c0Var != null && c0Var.equals(c0.INTERSTITIAL);
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void o() {
        ViewGroup viewGroup;
        m mVar;
        ViewGroup viewGroup2;
        m mVar2;
        com.fyber.inneractive.sdk.mraid.f0 f0Var;
        ViewGroup viewGroup3 = this.R;
        ViewGroup viewGroup4 = null;
        if (viewGroup3 == null) {
            viewGroup = null;
        } else {
            View viewFindViewById = viewGroup3.findViewById(R.id.ia_identifier_overlay);
            if (viewFindViewById instanceof ViewGroup) {
                viewGroup = (ViewGroup) viewFindViewById;
            }
        }
        if (viewGroup == null) {
            m mVar3 = this.f31304b;
            if (mVar3 != null) {
                View viewFindViewById2 = mVar3.findViewById(R.id.ia_identifier_overlay);
                if (viewFindViewById2 instanceof ViewGroup) {
                    viewGroup4 = (ViewGroup) viewFindViewById2;
                }
            }
        } else {
            viewGroup4 = viewGroup;
        }
        this.T = false;
        if (p() || (f0Var = this.N) == com.fyber.inneractive.sdk.mraid.f0.RESIZED) {
            c(false);
            m mVar4 = this.f31304b;
            if (mVar4 != null) {
                com.fyber.inneractive.sdk.mraid.f0 f0Var2 = this.N;
                if (f0Var2 == com.fyber.inneractive.sdk.mraid.f0.EXPANDED) {
                    FrameLayout frameLayout = this.f31331i0;
                    if (frameLayout != null && this.f31332j0 != null) {
                        frameLayout.removeAllViewsInLayout();
                        this.f31332j0.removeAllViewsInLayout();
                        ViewGroup viewGroup5 = this.R;
                        if (viewGroup5 != null) {
                            viewGroup5.removeView(this.f31332j0);
                        }
                    }
                    FrameLayout frameLayout2 = this.f31330h0;
                    if (frameLayout2 != null && (viewGroup2 = (ViewGroup) frameLayout2.getParent()) != null) {
                        viewGroup2.addView(this.f31304b, this.f31329g0);
                        m mVar5 = this.f31304b;
                        int i5 = this.f31333k0;
                        int i11 = this.f31334l0;
                        ViewGroup.LayoutParams layoutParams = mVar5.getLayoutParams();
                        layoutParams.width = i5;
                        layoutParams.height = i11;
                        mVar5.setLayoutParams(layoutParams);
                        com.fyber.inneractive.sdk.util.o.a(this.f31304b, 17);
                        viewGroup2.removeView(this.f31330h0);
                        viewGroup2.invalidate();
                        this.f31304b.requestLayout();
                    }
                    this.f31326d0 = this.f31333k0;
                    this.f31327e0 = this.f31334l0;
                } else if (f0Var2 == com.fyber.inneractive.sdk.mraid.f0.RESIZED) {
                    int i12 = this.f31333k0;
                    this.f31326d0 = i12;
                    int i13 = this.f31334l0;
                    this.f31327e0 = i13;
                    ViewGroup.LayoutParams layoutParams2 = mVar4.getLayoutParams();
                    layoutParams2.width = i12;
                    layoutParams2.height = i13;
                    mVar4.setLayoutParams(layoutParams2);
                    com.fyber.inneractive.sdk.util.o.a(this.f31304b, 17);
                }
            }
            if (viewGroup4 != null && (mVar = this.f31304b) != null) {
                viewGroup4.setLayoutParams(mVar.getLayoutParams());
                if (p()) {
                    com.fyber.inneractive.sdk.util.v.a(viewGroup4);
                    this.f31304b.addView(viewGroup4);
                }
            }
            this.N = com.fyber.inneractive.sdk.mraid.f0.DEFAULT;
            d(false);
            a(new com.fyber.inneractive.sdk.mraid.d0(this.N));
        } else if (f0Var == com.fyber.inneractive.sdk.mraid.f0.DEFAULT) {
            com.fyber.inneractive.sdk.mraid.f0 f0Var3 = com.fyber.inneractive.sdk.mraid.f0.HIDDEN;
            this.N = f0Var3;
            a(new com.fyber.inneractive.sdk.mraid.d0(f0Var3));
        }
        if (viewGroup4 != null) {
            viewGroup4.setPadding(0, 0, 0, 0);
        }
        j1 j1Var = this.f31309g;
        if (j1Var != null) {
            ((b0) j1Var).onClose();
        }
        if (Build.VERSION.SDK_INT >= 33) {
            r();
        }
        com.fyber.inneractive.sdk.rtb.watermark.b bVar = this.f31337o0;
        if (bVar == null || bVar.f31092a == null || (mVar2 = this.f31304b) == null || mVar2.getParent() == null || this.f31338p0 == null) {
            return;
        }
        com.fyber.inneractive.sdk.util.v.a(this.f31337o0.f31092a);
        ImageView imageView = this.f31337o0.f31092a;
        com.fyber.inneractive.sdk.util.h1 h1Var = this.f31338p0;
        imageView.setLayoutParams(com.fyber.inneractive.sdk.util.v.a(h1Var.f31191a, h1Var.f31192b, 13));
        ((ViewGroup) this.f31304b.getParent()).addView(this.f31337o0.f31092a);
    }

    public final boolean p() {
        return this.N == com.fyber.inneractive.sdk.mraid.f0.EXPANDED;
    }

    public final void q() {
        com.fyber.inneractive.sdk.measurement.tracker.e bVar;
        com.fyber.inneractive.sdk.response.e eVar;
        com.fyber.inneractive.sdk.measurement.e eVar2 = this.H;
        if (eVar2 != null) {
            m mVar = this.f31304b;
            com.fyber.inneractive.sdk.flow.x xVar = this.f31319s;
            boolean z11 = false;
            IAlog.a("omsdk initMraidSession", new Object[0]);
            un.i iVar = eVar2.f28506e;
            if (iVar == null) {
                IAlog.a("omsdk partner is null", new Object[0]);
                bVar = null;
            } else {
                if (xVar != null && (eVar = xVar.f28438b) != null && eVar.G) {
                    z11 = true;
                }
                eVar2.f28507f.getClass();
                bVar = z11 ? new com.fyber.inneractive.sdk.measurement.tracker.b(iVar, mVar) : new com.fyber.inneractive.sdk.measurement.tracker.a(iVar, mVar);
                bVar.a(mVar);
            }
            this.I = bVar;
        }
        g gVar = this.f31308f;
        if (gVar != null) {
            gVar.a(this);
        }
    }

    public final void r() {
        try {
            if (!(com.fyber.inneractive.sdk.util.o.a(this.f31304b) instanceof Activity) || this.f31335m0 == null) {
                return;
            }
            ((Activity) com.fyber.inneractive.sdk.util.o.a(this.f31304b)).getOnBackInvokedDispatcher().unregisterOnBackInvokedCallback(this.f31335m0);
            this.f31335m0 = null;
        } catch (Exception e3) {
            IAlog.f("failed to unregisterOnBackInvokedCallback with error: %s", e3.getMessage());
        }
    }

    @Override // com.fyber.inneractive.sdk.web.i1
    public void setAdDefaultSize(int i5, int i11) {
        this.f31333k0 = i5;
        this.f31334l0 = i11;
        this.f31326d0 = i5;
        this.f31327e0 = i11;
    }

    public void setOrientationProperties(boolean z11, String str) {
        if ("portrait".equals(str)) {
            this.f31328f0 = Orientation.PORTRAIT;
        } else if ("landscape".equals(str)) {
            this.f31328f0 = Orientation.LANDSCAPE;
        } else {
            this.f31328f0 = Orientation.NONE;
        }
        j1 j1Var = this.f31309g;
        if (j1Var != null) {
            ((b0) j1Var).a(z11, this.f31328f0);
        }
    }

    public void setResizeProperties() {
    }

    @Override // com.fyber.inneractive.sdk.web.i
    public final void b(boolean z11) {
        m mVar = this.f31304b;
        if (mVar != null && mVar.getViewTreeObserver() != null) {
            this.f31304b.getViewTreeObserver().removeOnPreDrawListener(this.f31336n0);
        }
        com.fyber.inneractive.sdk.util.r.f31216b.post(new s(this));
        m mVar2 = this.S;
        if (mVar2 != null && mVar2.getParent() != null && (this.S.getParent() instanceof ViewGroup)) {
            ((ViewGroup) this.S.getParent()).removeView(this.S);
            this.S = null;
        }
        FrameLayout frameLayout = this.f31331i0;
        if (frameLayout != null && this.f31332j0 != null) {
            frameLayout.removeAllViewsInLayout();
            this.f31332j0.removeAllViewsInLayout();
            ViewGroup viewGroup = this.R;
            if (viewGroup != null) {
                viewGroup.removeView(this.f31332j0);
            }
        }
        this.f31331i0 = null;
        this.f31332j0 = null;
        this.f31330h0 = null;
        this.f31303a = false;
        com.fyber.inneractive.sdk.rtb.watermark.b bVar = this.f31337o0;
        if (bVar != null) {
            com.fyber.inneractive.sdk.util.v.a(bVar.f31092a);
            this.f31337o0 = null;
        }
        if (Build.VERSION.SDK_INT >= 33) {
            r();
        }
        super.b(z11);
    }

    @Override // com.fyber.inneractive.sdk.web.i, com.fyber.inneractive.sdk.web.j
    public boolean a(WebView webView, String str) {
        IAlog.a("%shandle url for: %s webView = %s", IAlog.a(this), str, webView);
        if (this.N == com.fyber.inneractive.sdk.mraid.f0.EXPANDED && !TextUtils.isEmpty(str) && webView.equals(this.S) && !this.T) {
            this.T = true;
            return false;
        }
        return super.a(webView, str);
    }

    public final void c(boolean z11) {
        if (this.R == null) {
            return;
        }
        if (z11) {
            int iB = com.fyber.inneractive.sdk.util.o.b(35);
            if (this.W == null) {
                IAcloseButton iAcloseButton = new IAcloseButton(com.fyber.inneractive.sdk.util.o.a(this.f31304b), iB);
                this.W = iAcloseButton;
                iAcloseButton.setOnClickListener(new o(this));
            }
            com.fyber.inneractive.sdk.util.v.a(this.W);
            FrameLayout frameLayout = this.f31332j0;
            if (frameLayout != null) {
                frameLayout.addView(this.W);
                IAcloseButton iAcloseButton2 = this.W;
                ViewGroup.LayoutParams layoutParams = iAcloseButton2.getLayoutParams();
                layoutParams.width = iB;
                layoutParams.height = iB;
                iAcloseButton2.setLayoutParams(layoutParams);
                com.fyber.inneractive.sdk.util.o.a(this.W, 53);
                IAcloseButton iAcloseButton3 = this.W;
                int iB2 = com.fyber.inneractive.sdk.util.o.b(10);
                int iB3 = com.fyber.inneractive.sdk.util.o.b(10);
                ViewGroup.LayoutParams layoutParams2 = iAcloseButton3.getLayoutParams();
                if (layoutParams2 instanceof ViewGroup.MarginLayoutParams) {
                    ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) layoutParams2;
                    marginLayoutParams.leftMargin = 0;
                    marginLayoutParams.topMargin = iB2;
                    marginLayoutParams.rightMargin = iB3;
                    marginLayoutParams.bottomMargin = 0;
                    iAcloseButton3.setLayoutParams(marginLayoutParams);
                }
            }
        } else {
            FrameLayout frameLayout2 = this.f31332j0;
            if (frameLayout2 != null) {
                frameLayout2.removeView(this.W);
            }
        }
        j1 j1Var = this.f31309g;
        if (j1Var != null) {
            ((b0) j1Var).b(z11);
        }
        this.X = !z11;
    }

    @Override // com.fyber.inneractive.sdk.web.i1
    public final void a(Context context, boolean z11) {
        Window window;
        Window window2;
        DisplayMetrics displayMetrics = new DisplayMetrics();
        ((WindowManager) IAConfigManager.Q.f27762v.a().getSystemService("window")).getDefaultDisplay().getRealMetrics(displayMetrics);
        this.Y = displayMetrics.density;
        Rect rect = new Rect();
        boolean z12 = context instanceof Activity;
        if (z12 && (window2 = ((Activity) context).getWindow()) != null) {
            window2.getDecorView().getWindowVisibleDisplayFrame(rect);
        }
        int i5 = rect.top;
        View viewFindViewById = (!z12 || (window = ((Activity) context).getWindow()) == null) ? null : window.findViewById(16908290);
        int top = viewFindViewById != null ? viewFindViewById.getTop() - i5 : 0;
        int i11 = displayMetrics.widthPixels;
        int i12 = displayMetrics.heightPixels;
        double d5 = i11;
        double d11 = 160.0d / displayMetrics.densityDpi;
        int widthDp = (int) (d11 * d5);
        int heightDp = (int) (d11 * i12);
        int i13 = (i12 - i5) - top;
        m mVar = this.f31304b;
        if (mVar != null && mVar.getScaleX() != 1.0f && this.f31304b.getScaleY() != 1.0f) {
            widthDp = this.f31304b.getWidthDp();
            heightDp = this.f31304b.getHeightDp();
            int iB = (com.fyber.inneractive.sdk.util.o.b(this.f31304b.getHeightDp()) - i5) - top;
            this.f31324b0 = this.Z;
            this.f31325c0 = (int) ((160.0d / displayMetrics.densityDpi) * iB);
        } else {
            double d12 = 160.0d / displayMetrics.densityDpi;
            this.f31324b0 = (int) (d5 * d12);
            this.f31325c0 = (int) (d12 * i13);
        }
        if (this.Z == widthDp && this.f31323a0 == heightDp) {
            return;
        }
        this.Z = widthDp;
        this.f31323a0 = heightDp;
        if (z11) {
            a(new com.fyber.inneractive.sdk.mraid.c0(widthDp, heightDp));
            a(new com.fyber.inneractive.sdk.mraid.a0(this.f31324b0, this.f31325c0));
            a(new com.fyber.inneractive.sdk.mraid.z(this.f31324b0, this.f31325c0));
            int i14 = this.f31326d0;
            if (i14 > 0 && this.f31327e0 > 0) {
                a(new com.fyber.inneractive.sdk.mraid.x(com.fyber.inneractive.sdk.util.o.c(i14), com.fyber.inneractive.sdk.util.o.c(this.f31327e0)));
                return;
            }
            m mVar2 = this.f31304b;
            if (mVar2 == null || mVar2.getWidth() <= 0 || this.f31304b.getHeight() <= 0) {
                return;
            }
            a(new com.fyber.inneractive.sdk.mraid.x(com.fyber.inneractive.sdk.util.o.c(this.f31304b.getWidth()), com.fyber.inneractive.sdk.util.o.c(this.f31304b.getHeight())));
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:41:0x00ab  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void a(String str, int i5, int i11, boolean z11, boolean z12) {
        ViewGroup viewGroup;
        ViewGroup viewGroup2;
        ImageView imageView;
        if (this.f31304b == null || this.O == z.DISABLED || this.N != com.fyber.inneractive.sdk.mraid.f0.DEFAULT) {
            return;
        }
        if (str != null && !URLUtil.isValidUrl(str)) {
            a(com.fyber.inneractive.sdk.mraid.k.EXPAND, "URL passed to expand() was invalid.");
            return;
        }
        try {
            ViewGroup viewGroup3 = (ViewGroup) this.f31304b.getRootView().findViewById(16908290);
            this.R = viewGroup3;
            if (viewGroup3 == null) {
                IAlog.f("Couldn't find content in the view tree", new Object[0]);
                a(com.fyber.inneractive.sdk.mraid.k.RESIZE, "Ad can be resized only if it's state is default or resized.");
                return;
            }
            if (Build.VERSION.SDK_INT >= 33) {
                this.f31335m0 = new t(this);
                if (com.fyber.inneractive.sdk.util.o.a(this.f31304b) instanceof Activity) {
                    ((Activity) com.fyber.inneractive.sdk.util.o.a(this.f31304b)).getOnBackInvokedDispatcher().registerOnBackInvokedCallback(0, this.f31335m0);
                }
            }
            this.X = z11;
            j1 j1Var = this.f31309g;
            if (j1Var != null) {
                ((b0) j1Var).b(z11);
            }
            d(z12);
            if (this.f31327e0 >= 0) {
                this.f31327e0 = com.fyber.inneractive.sdk.util.o.b(i11);
            }
            if (this.f31326d0 >= 0) {
                this.f31326d0 = com.fyber.inneractive.sdk.util.o.b(i5);
            }
            m mVar = this.f31304b;
            ViewGroup viewGroup4 = (ViewGroup) mVar.getParent();
            if (viewGroup4 == null) {
                viewGroup = null;
            } else {
                View viewFindViewById = viewGroup4.findViewById(R.id.ia_identifier_overlay);
                if (viewFindViewById instanceof ViewGroup) {
                    viewGroup = (ViewGroup) viewFindViewById;
                }
            }
            if (str != null) {
                m mVar2 = new m();
                this.S = mVar2;
                mVar2.setId(R.id.ia_inneractive_webview_mraid);
                this.S.loadUrl(str);
                this.S.setWebChromeClient(this.f31305c);
                this.S.setWebViewClient(this.f31306d);
                mVar = this.S;
                mVar.setOnKeyListener(new u(this));
            } else {
                m mVar3 = this.f31304b;
                if (mVar3 != null && (viewGroup2 = (ViewGroup) mVar3.getParent()) != null) {
                    int childCount = viewGroup2.getChildCount();
                    int i12 = 0;
                    while (i12 < childCount && viewGroup2.getChildAt(i12) != this.f31304b) {
                        i12++;
                    }
                    ViewGroup viewGroup5 = (ViewGroup) viewGroup2.findViewById(R.id.ia_identifier_overlay);
                    this.f31329g0 = i12;
                    com.fyber.inneractive.sdk.util.v.a(viewGroup5);
                    FrameLayout frameLayout = this.f31330h0;
                    if (frameLayout != null) {
                        com.fyber.inneractive.sdk.util.v.a(frameLayout);
                        viewGroup2.addView(this.f31330h0, i12);
                        FrameLayout frameLayout2 = this.f31330h0;
                        int width = this.f31304b.getWidth();
                        int height = this.f31304b.getHeight();
                        ViewGroup.LayoutParams layoutParams = frameLayout2.getLayoutParams();
                        layoutParams.width = width;
                        layoutParams.height = height;
                        frameLayout2.setLayoutParams(layoutParams);
                        com.fyber.inneractive.sdk.util.o.a(this.f31330h0, 17);
                    }
                    viewGroup2.removeView(this.f31304b);
                }
            }
            float f11 = this.Y;
            int i13 = (int) ((50.0f * f11) + 0.5f);
            if (i11 >= 0 && i5 >= 0) {
                i5 = (int) (i5 * f11);
                i11 = (int) (i11 * f11);
                if (i5 < i13) {
                    i5 = i13;
                }
                if (i11 < i13) {
                    i11 = i13;
                }
            }
            if (this.f31332j0 != null && this.f31331i0 != null) {
                View view = new View(com.fyber.inneractive.sdk.util.o.a(this.f31304b));
                view.setBackgroundColor(com.fyber.inneractive.sdk.util.o.a(this.f31304b).getResources().getColor(R.color.ia_mraid_expanded_dimmed_bk));
                view.setOnTouchListener(new n());
                this.f31332j0.addView(view);
                ViewGroup.LayoutParams layoutParams2 = view.getLayoutParams();
                layoutParams2.width = -1;
                layoutParams2.height = -1;
                view.setLayoutParams(layoutParams2);
                com.fyber.inneractive.sdk.util.v.a(mVar);
                this.f31331i0.addView(mVar);
                ViewGroup.LayoutParams layoutParams3 = mVar.getLayoutParams();
                layoutParams3.width = -1;
                layoutParams3.height = -1;
                mVar.setLayoutParams(layoutParams3);
                com.fyber.inneractive.sdk.util.v.a(this.f31331i0);
                this.f31332j0.addView(this.f31331i0);
                FrameLayout frameLayout3 = this.f31331i0;
                ViewGroup.LayoutParams layoutParams4 = frameLayout3.getLayoutParams();
                layoutParams4.width = i5;
                layoutParams4.height = i11;
                frameLayout3.setLayoutParams(layoutParams4);
                com.fyber.inneractive.sdk.util.o.a(this.f31331i0, 17);
            }
            FrameLayout frameLayout4 = this.f31332j0;
            if (frameLayout4 != null) {
                com.fyber.inneractive.sdk.util.v.a(frameLayout4);
                com.fyber.inneractive.sdk.rtb.watermark.b bVar = this.f31337o0;
                if (bVar != null && (imageView = bVar.f31092a) != null) {
                    com.fyber.inneractive.sdk.util.v.a(imageView);
                    ImageView imageView2 = this.f31337o0.f31092a;
                    ViewGroup.LayoutParams layoutParams5 = imageView2.getLayoutParams();
                    layoutParams5.width = -1;
                    layoutParams5.height = -1;
                    imageView2.setLayoutParams(layoutParams5);
                    this.f31332j0.addView(this.f31337o0.f31092a);
                }
                this.R.addView(this.f31332j0);
                FrameLayout frameLayout5 = this.f31332j0;
                ViewGroup.LayoutParams layoutParams6 = frameLayout5.getLayoutParams();
                layoutParams6.width = -1;
                layoutParams6.height = -1;
                frameLayout5.setLayoutParams(layoutParams6);
            }
            if (!mVar.hasFocus()) {
                mVar.requestFocus();
            }
            d0 d0Var = this.P;
            if (d0Var == d0.ALWAYS_VISIBLE || (!this.X && d0Var != d0.ALWAYS_HIDDEN)) {
                c(true);
            }
            com.fyber.inneractive.sdk.mraid.f0 f0Var = com.fyber.inneractive.sdk.mraid.f0.EXPANDED;
            this.N = f0Var;
            a(new com.fyber.inneractive.sdk.mraid.d0(f0Var));
            int i14 = this.f31326d0;
            if (i14 != -1 && this.f31327e0 != -1) {
                a(new com.fyber.inneractive.sdk.mraid.x(com.fyber.inneractive.sdk.util.o.c(i14), com.fyber.inneractive.sdk.util.o.c(this.f31327e0)));
            }
            a(com.fyber.inneractive.sdk.mraid.k.EXPAND);
            if (viewGroup != null) {
                int dimension = (int) viewGroup.getContext().getResources().getDimension(R.dimen.ia_identifier_padding);
                viewGroup.setPadding(dimension, 0, 0, dimension);
                viewGroup.setLayoutParams(this.R.getLayoutParams());
                this.R.addView(viewGroup);
            }
            j1 j1Var2 = this.f31309g;
            if (j1Var2 != null) {
                ((b0) j1Var2).d();
            }
        } catch (Exception unused) {
            IAlog.f("Couldn't find content in the view tree", new Object[0]);
            a(com.fyber.inneractive.sdk.mraid.k.RESIZE, "Ad can be resized only if it's state is default or resized.");
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:41:0x00f0  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x010b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final HashMap a(Map map) throws NumberFormatException, ParseException {
        int i5;
        String str;
        HashMap map2 = new HashMap();
        if (map.containsKey(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION) && map.containsKey("start")) {
            map2.put("title", map.get(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION));
            if (map.containsKey("start") && map.get("start") != null) {
                Date dateA = a((String) map.get("start"));
                if (dateA != null) {
                    map2.put("beginTime", Long.valueOf(dateA.getTime()));
                    if (map.containsKey("end") && map.get("end") != null) {
                        Date dateA2 = a((String) map.get("end"));
                        if (dateA2 != null) {
                            map2.put("endTime", Long.valueOf(dateA2.getTime()));
                        } else {
                            throw new IllegalArgumentException("Invalid calendar event: end time is malformed. Date format expecting (yyyy-MM-DDTHH:MM:SS-xx:xx) or (yyyy-MM-DDTHH:MM-xx:xx) i.e. 2013-08-14T09:00:01-08:00");
                        }
                    }
                    if (map.containsKey("location")) {
                        map2.put("eventLocation", map.get("location"));
                    }
                    if (map.containsKey("summary")) {
                        map2.put(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, map.get("summary"));
                    }
                    if (map.containsKey("transparency")) {
                        map2.put("availability", Integer.valueOf("transparent".equals(map.get("transparency")) ? 1 : 0));
                    }
                    StringBuilder sb2 = new StringBuilder();
                    if (map.containsKey("frequency")) {
                        String str2 = (String) map.get("frequency");
                        if (map.containsKey("interval")) {
                            try {
                                i5 = Integer.parseInt((String) map.get("interval"));
                            } catch (NumberFormatException e3) {
                                IAlog.a("%sparseRecurrenceRule failed to parse params.get(\"interval\")", e3, IAlog.a(this));
                            }
                            if (!"daily".equals(str2)) {
                                sb2.append("FREQ=DAILY;");
                                if (i5 != -1) {
                                    sb2.append("INTERVAL=" + i5 + ";");
                                }
                            } else {
                                if ("weekly".equals(str2)) {
                                    sb2.append("FREQ=WEEKLY;");
                                    if (i5 != -1) {
                                        sb2.append("INTERVAL=" + i5 + ";");
                                    }
                                    if (map.containsKey("daysInWeek")) {
                                        String str3 = (String) map.get("daysInWeek");
                                        StringBuilder sb3 = new StringBuilder();
                                        boolean[] zArr = new boolean[7];
                                        String[] strArrSplit = str3.split(",");
                                        for (int i11 = 0; i11 < strArrSplit.length; i11++) {
                                            try {
                                                int i12 = Integer.parseInt(strArrSplit[i11]);
                                                if (i12 == 7) {
                                                    i12 = 0;
                                                }
                                                if (!zArr[i12]) {
                                                    StringBuilder sb4 = new StringBuilder();
                                                    switch (i12) {
                                                        case 0:
                                                            str = "SU";
                                                            break;
                                                        case 1:
                                                            str = "MO";
                                                            break;
                                                        case 2:
                                                            str = "TU";
                                                            break;
                                                        case 3:
                                                            str = "WE";
                                                            break;
                                                        case 4:
                                                            str = "TH";
                                                            break;
                                                        case 5:
                                                            str = "FR";
                                                            break;
                                                        case 6:
                                                            str = "SA";
                                                            break;
                                                        default:
                                                            throw new IllegalArgumentException(com.fyber.inneractive.sdk.player.exoplayer2.m.a("invalid day of week ", i12));
                                                    }
                                                    sb4.append(str);
                                                    sb4.append(",");
                                                    sb3.append(sb4.toString());
                                                    zArr[i12] = true;
                                                }
                                            } catch (NumberFormatException e11) {
                                                throw new IllegalArgumentException("invalid day of week value: " + strArrSplit[i11], e11);
                                            }
                                        }
                                        if (strArrSplit.length != 0) {
                                            sb3.deleteCharAt(sb3.length() - 1);
                                            String string = sb3.toString();
                                            if (string == null) {
                                                throw new IllegalArgumentException("invalid ");
                                            }
                                            sb2.append("BYDAY=" + string + ";");
                                        } else {
                                            throw new IllegalArgumentException("must have at least 1 day of the week if specifying repeating weekly");
                                        }
                                    }
                                } else if ("monthly".equals(str2)) {
                                    sb2.append("FREQ=MONTHLY;");
                                    if (i5 != -1) {
                                        sb2.append("INTERVAL=" + i5 + ";");
                                    }
                                    if (map.containsKey("daysInMonth")) {
                                        String str4 = (String) map.get("daysInMonth");
                                        StringBuilder sb5 = new StringBuilder();
                                        boolean[] zArr2 = new boolean[63];
                                        String[] strArrSplit2 = str4.split(",");
                                        for (int i13 = 0; i13 < strArrSplit2.length; i13++) {
                                            try {
                                                int i14 = Integer.parseInt(strArrSplit2[i13]);
                                                int i15 = i14 + 31;
                                                if (!zArr2[i15]) {
                                                    StringBuilder sb6 = new StringBuilder();
                                                    if (i14 != 0 && i14 >= -31 && i14 <= 31) {
                                                        sb6.append(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b + i14);
                                                        sb6.append(",");
                                                        sb5.append(sb6.toString());
                                                        zArr2[i15] = true;
                                                    } else {
                                                        throw new IllegalArgumentException(com.fyber.inneractive.sdk.player.exoplayer2.m.a("invalid day of month ", i14));
                                                    }
                                                }
                                            } catch (NumberFormatException e12) {
                                                throw new IllegalArgumentException("invalid day of month value: " + strArrSplit2[i13], e12);
                                            }
                                        }
                                        if (strArrSplit2.length != 0) {
                                            sb5.deleteCharAt(sb5.length() - 1);
                                            String string2 = sb5.toString();
                                            if (string2 == null) {
                                                throw new IllegalArgumentException();
                                            }
                                            sb2.append("BYMONTHDAY=" + string2 + ";");
                                        } else {
                                            throw new IllegalArgumentException("must have at least 1 day of the month if specifying repeating weekly");
                                        }
                                    }
                                } else {
                                    throw new IllegalArgumentException("frequency is only supported for daily, weekly, and monthly.");
                                }
                            }
                        } else {
                            i5 = -1;
                            if (!"daily".equals(str2)) {
                            }
                        }
                    }
                    String string3 = sb2.toString();
                    if (!TextUtils.isEmpty(string3)) {
                        map2.put("rrule", string3);
                    }
                    return map2;
                }
                throw new IllegalArgumentException("Invalid calendar event: start time is malformed. Date format expecting (yyyy-MM-DDTHH:MM:SS-xx:xx) or (yyyy-MM-DDTHH:MM-xx:xx) i.e. 2013-08-14T09:00:01-08:00");
            }
            throw new IllegalArgumentException("Invalid calendar event: start is null.");
        }
        throw new IllegalArgumentException("Missing start and description fields");
    }

    public static Date a(String str) throws ParseException {
        Date date = null;
        int i5 = 0;
        while (true) {
            String[] strArr = f31321r0;
            if (i5 >= 2) {
                break;
            }
            try {
                date = new SimpleDateFormat(strArr[i5], Locale.getDefault()).parse(str);
            } catch (ParseException unused) {
            }
            if (date != null) {
                break;
            }
            i5++;
        }
        return date;
    }

    public final void a(com.fyber.inneractive.sdk.mraid.k kVar, String str) {
        String strA = kVar.a();
        m mVar = this.f31304b;
        if (mVar != null) {
            mVar.a(b.c0.n("window.mraidbridge.fireErrorEvent('", strA, "', '", str, "');"));
        }
    }

    public static LinkedHashMap a(URI uri) {
        int i5;
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        String rawQuery = uri.getRawQuery();
        if (rawQuery != null && rawQuery.length() > 0) {
            for (String str : rawQuery.split("&")) {
                int iIndexOf = str.indexOf("=");
                linkedHashMap.put(iIndexOf > 0 ? URLDecoder.decode(str.substring(0, iIndexOf), "UTF-8") : str, (iIndexOf <= 0 || str.length() <= (i5 = iIndexOf + 1)) ? null : URLDecoder.decode(str.substring(i5), "UTF-8"));
            }
        }
        return linkedHashMap;
    }

    public final void a(View view, com.fyber.inneractive.sdk.measurement.tracker.d dVar) {
        com.fyber.inneractive.sdk.measurement.tracker.e eVar;
        if (view == null || (eVar = this.I) == null) {
            return;
        }
        try {
            un.b bVar = eVar.f28527a;
            if (bVar != null) {
                if (dVar == com.fyber.inneractive.sdk.measurement.tracker.d.CloseButton) {
                    bVar.a(view, un.f.f91381b, dVar.name());
                } else if (dVar == com.fyber.inneractive.sdk.measurement.tracker.d.Watermark) {
                    bVar.a(view, un.f.f91382c, dVar.name());
                } else {
                    bVar.a(view, un.f.f91383d, dVar.name());
                }
            }
        } catch (Throwable unused) {
        }
    }

    public final void a(com.fyber.inneractive.sdk.mraid.k kVar) {
        com.fyber.inneractive.sdk.config.global.r rVar;
        com.fyber.inneractive.sdk.network.u uVar = com.fyber.inneractive.sdk.network.u.BANNER_RESIZE_EXPAND;
        InneractiveAdRequest inneractiveAdRequest = this.f31318r;
        com.fyber.inneractive.sdk.flow.x xVar = this.f31319s;
        com.fyber.inneractive.sdk.response.e eVar = xVar != null ? xVar.f28438b : null;
        JSONArray jSONArrayB = (xVar == null || (rVar = xVar.f28439c) == null) ? null : rVar.b();
        com.fyber.inneractive.sdk.network.w wVar = new com.fyber.inneractive.sdk.network.w(eVar);
        wVar.f28820c = uVar;
        wVar.f28818a = inneractiveAdRequest;
        wVar.f28821d = jSONArrayB;
        wVar.a("action", kVar.a()).a((String) null);
    }
}
