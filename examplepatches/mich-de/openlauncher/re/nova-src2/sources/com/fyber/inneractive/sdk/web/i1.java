package com.fyber.inneractive.sdk.web;

import android.app.Activity;
import android.content.Context;
import android.graphics.Rect;
import android.util.DisplayMetrics;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import com.fyber.inneractive.sdk.util.IAlog;
import java.util.ArrayList;

/* loaded from: classes3.dex */
public abstract class i1 extends i {
    public boolean A;
    public boolean B;
    public boolean C;
    public boolean D;
    public boolean E;
    public boolean F;
    public final c0 G;
    public com.fyber.inneractive.sdk.measurement.e H;
    public com.fyber.inneractive.sdk.measurement.tracker.e I;
    public final e1 J;
    public final f1 K;
    public final g1 L;
    public final h1 M;

    /* renamed from: u, reason: collision with root package name */
    public int f31340u;

    /* renamed from: v, reason: collision with root package name */
    public int f31341v;

    /* renamed from: w, reason: collision with root package name */
    public int f31342w;

    /* renamed from: x, reason: collision with root package name */
    public int f31343x;

    /* renamed from: y, reason: collision with root package name */
    public int f31344y;

    /* renamed from: z, reason: collision with root package name */
    public int f31345z;

    public i1(boolean z11, c0 c0Var, com.fyber.inneractive.sdk.config.global.r rVar) {
        super(z11, rVar);
        this.f31340u = -1;
        this.f31341v = -1;
        this.f31342w = -1;
        this.f31343x = -1;
        this.f31344y = -1;
        this.f31345z = -1;
        this.A = false;
        this.B = true;
        this.C = false;
        this.D = false;
        this.E = false;
        this.I = null;
        this.J = new e1(this);
        this.K = new f1(this);
        this.L = new g1(this);
        this.M = new h1(this);
        this.G = c0Var;
    }

    public final void a(ArrayList arrayList) {
        if (this.f31304b != null) {
            String string = arrayList.toString();
            if (string.length() < 2) {
                return;
            }
            String str = "{" + string.substring(1, string.length() - 1) + "}";
            this.f31304b.a("window.mraidbridge.fireChangeEvent(" + str + ");");
            IAlog.e("Fire changes: %s", str);
        }
    }

    public void j() {
        m mVar = this.f31304b;
        if (mVar != null) {
            mVar.a("window.mraidbridge.fireReadyEvent();");
        }
    }

    public void k() {
        ArrayList arrayList = new ArrayList();
        m mVar = this.f31304b;
        if (mVar == null || mVar.getScaleX() == 1.0f || this.f31304b.getScaleY() == 1.0f) {
            arrayList.add(new com.fyber.inneractive.sdk.mraid.c0(this.f31342w, this.f31343x));
            arrayList.add(new com.fyber.inneractive.sdk.mraid.a0(this.f31340u, this.f31341v));
        } else {
            int widthDp = this.f31304b.getWidthDp();
            int heightDp = this.f31304b.getHeightDp();
            arrayList.add(new com.fyber.inneractive.sdk.mraid.c0(widthDp, heightDp));
            arrayList.add(new com.fyber.inneractive.sdk.mraid.a0(widthDp, heightDp));
        }
        m mVar2 = this.f31304b;
        int iC = com.fyber.inneractive.sdk.util.o.c(mVar2 != null ? mVar2.getWidth() : this.f31340u);
        m mVar3 = this.f31304b;
        arrayList.add(new com.fyber.inneractive.sdk.mraid.z(iC, com.fyber.inneractive.sdk.util.o.c(mVar3 != null ? mVar3.getHeight() : this.f31341v)));
        a(arrayList);
        a(new com.fyber.inneractive.sdk.mraid.d0(com.fyber.inneractive.sdk.mraid.f0.DEFAULT));
    }

    public final void l() {
        m mVar = this.f31304b;
        if (mVar != null) {
            this.C = true;
            if (this.A) {
                mVar.getSettings().setMediaPlaybackRequiresUserGesture(false);
            }
            com.fyber.inneractive.sdk.util.r.f31216b.postDelayed(this.J, 0L);
        }
    }

    public boolean m() {
        c0 c0Var = this.G;
        return c0Var != null && c0Var.equals(c0.INTERSTITIAL);
    }

    public void n() {
        m mVar;
        if (this.C && this.D && this.A && (mVar = this.f31304b) != null) {
            mVar.a("FyberMraidVideoController.play()");
            h1 h1Var = this.M;
            if (h1Var != null) {
                com.fyber.inneractive.sdk.util.r.f31216b.postDelayed(h1Var, 5000L);
            }
            if (this.E) {
                this.f31304b.a("FyberMraidVideoController.mute(true)");
            }
        }
    }

    public void setAdDefaultSize(int i5, int i11) {
        this.f31344y = i5;
        this.f31345z = i11;
    }

    public void setAutoplayMRAIDVideos(boolean z11) {
        this.A = z11;
    }

    public void setCenteringTagsRequired(boolean z11) {
        this.B = z11;
    }

    public void setMuteMraidVideo(boolean z11) {
        this.E = z11;
    }

    public final void a(com.fyber.inneractive.sdk.mraid.y yVar) {
        if (this.f31304b != null) {
            String str = "{" + yVar.toString() + "}";
            this.f31304b.a("window.mraidbridge.fireChangeEvent(" + str + ");");
            IAlog.e("Fire changes: %s", str);
        }
    }

    public void a(Context context, boolean z11) {
        Window window;
        Window window2;
        DisplayMetrics displayMetrics = new DisplayMetrics();
        if (context != null) {
            ((WindowManager) context.getSystemService("window")).getDefaultDisplay().getRealMetrics(displayMetrics);
        }
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
        int iB = (i12 - i5) - top;
        m mVar = this.f31304b;
        if (mVar != null && mVar.getScaleX() != 1.0f && this.f31304b.getScaleY() != 1.0f) {
            widthDp = this.f31304b.getWidthDp();
            heightDp = this.f31304b.getHeightDp();
            iB = (com.fyber.inneractive.sdk.util.o.b(this.f31304b.getHeightDp()) - i5) - top;
            this.f31340u = this.f31342w;
        } else {
            this.f31340u = (int) ((160.0d / displayMetrics.densityDpi) * d5);
        }
        this.f31341v = (int) ((160.0d / displayMetrics.densityDpi) * iB);
        if (this.f31342w == widthDp && this.f31343x == heightDp) {
            return;
        }
        this.f31342w = widthDp;
        this.f31343x = heightDp;
        a(new com.fyber.inneractive.sdk.mraid.c0(widthDp, heightDp));
        a(new com.fyber.inneractive.sdk.mraid.a0(this.f31340u, this.f31341v));
        a(new com.fyber.inneractive.sdk.mraid.z(this.f31340u, this.f31341v));
        int i13 = this.f31344y;
        if (i13 > 0 && this.f31345z > 0) {
            a(new com.fyber.inneractive.sdk.mraid.x(com.fyber.inneractive.sdk.util.o.c(i13), com.fyber.inneractive.sdk.util.o.c(this.f31345z)));
            return;
        }
        m mVar2 = this.f31304b;
        if (mVar2 == null || mVar2.getWidth() <= 0 || this.f31304b.getHeight() <= 0) {
            return;
        }
        a(new com.fyber.inneractive.sdk.mraid.x(com.fyber.inneractive.sdk.util.o.c(this.f31304b.getWidth()), com.fyber.inneractive.sdk.util.o.c(this.f31304b.getHeight())));
    }
}
