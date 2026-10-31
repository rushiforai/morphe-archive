package com.fyber.inneractive.sdk.player.ui;

import android.content.Context;
import android.os.SystemClock;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.fyber.inneractive.sdk.R;
import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.fyber.inneractive.sdk.config.global.features.v;
import com.fyber.inneractive.sdk.config.w0;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.g1;
import com.fyber.inneractive.sdk.util.h1;
import com.fyber.inneractive.sdk.util.u1;
import com.fyber.inneractive.sdk.util.w1;
import java.util.concurrent.TimeUnit;

/* loaded from: classes3.dex */
public abstract class l extends s {
    public static final g1 J;
    public final LayoutInflater A;
    public final com.fyber.inneractive.sdk.flow.g B;
    public boolean C;
    public w1 D;
    public k E;
    public int F;
    public int G;
    public View H;
    public boolean I;

    /* renamed from: z, reason: collision with root package name */
    public final a f30694z;

    static {
        g1 g1Var = new g1();
        g1Var.f31189c = true;
        J = g1Var;
    }

    public l(Context context, com.fyber.inneractive.sdk.flow.g gVar, a aVar, com.fyber.inneractive.sdk.config.global.r rVar, String str) {
        super(context, rVar, str);
        this.C = false;
        this.I = true;
        this.B = gVar;
        this.A = LayoutInflater.from(context);
        this.f30694z = aVar;
    }

    public abstract void a(int i5);

    @Override // com.fyber.inneractive.sdk.player.ui.s
    public final void a(com.fyber.inneractive.sdk.flow.endcard.b bVar, b bVar2) {
        Integer num;
        this.H = bVar2.f30664e;
        ViewGroup viewGroup = this.f30738s;
        if (viewGroup != null) {
            bVar.a(viewGroup, bVar2);
            this.f30738s.setVisibility(0);
            com.fyber.inneractive.sdk.model.vast.i iVar = bVar2.f30665f;
            com.fyber.inneractive.sdk.model.vast.i iVar2 = com.fyber.inneractive.sdk.model.vast.i.Static;
            if (iVar2 == iVar) {
                a(getEndCardView(), 4);
            }
            if ((iVar2 == iVar || iVar == com.fyber.inneractive.sdk.model.vast.i.FMP_End_Card) && (num = bVar2.f30663d) != null) {
                b(iVar != iVar2 ? 8 : 4, num.intValue());
            }
        }
    }

    public void b(int i5, int i11) {
        if (this.C || this.D != null) {
            return;
        }
        IAlog.a("Start Autoclick timer - %d seconds", Integer.valueOf(i11));
        w1 w1Var = new w1(TimeUnit.SECONDS, i11);
        this.D = w1Var;
        w1Var.f31250e = new j(this, i5);
        w1Var.f31249d = false;
        w1Var.f31248c.sendEmptyMessage(1932593528);
    }

    @Override // com.fyber.inneractive.sdk.player.ui.s
    public final void g() {
        p();
        this.C = true;
    }

    @Override // com.fyber.inneractive.sdk.player.ui.s
    public View getEndCardView() {
        return this.H;
    }

    public String getLocalizedCtaButtonText() {
        com.fyber.inneractive.sdk.config.global.r rVar = this.f30742w;
        com.fyber.inneractive.sdk.config.global.features.d dVar = rVar != null ? (com.fyber.inneractive.sdk.config.global.features.d) rVar.a(com.fyber.inneractive.sdk.config.global.features.d.class) : null;
        if (dVar != null) {
            dVar.d(IAConfigManager.Q.f27756p);
            com.fyber.inneractive.sdk.model.vast.a aVar = dVar.f27817e;
            if (aVar != null && aVar.f28566d) {
                return aVar.f28563a;
            }
        }
        return null;
    }

    @Override // com.fyber.inneractive.sdk.player.ui.s
    public int getMaxTickFactor() {
        return 1000;
    }

    public int getSingleTickTime() {
        return 1000 / getTickFraction();
    }

    public int getTickFraction() {
        return 5;
    }

    public void h(boolean z11) {
        String string = getContext().getString(R.string.ia_video_app_info_text);
        com.fyber.inneractive.sdk.config.global.r rVar = this.f30742w;
        if (rVar != null) {
            Boolean boolC = ((v) rVar.a(v.class)).c("show_ad_identifier_original_design");
            this.I = boolC != null ? boolC.booleanValue() : true;
            string = ((com.fyber.inneractive.sdk.config.global.features.o) this.f30742w.a(com.fyber.inneractive.sdk.config.global.features.o.class)).a("app_info_button_text", "App Info");
            if (string != null && string.length() > 30) {
                string = string.substring(0, 30);
            }
        }
        if (z11 && this.I) {
            b(false);
            a(true, string);
            c(true);
        } else if (z11) {
            b(false);
            a(true, string);
            c(false);
        } else if (!this.I) {
            b(true);
            c(false);
        } else {
            a(false, (String) null);
            b(false);
            c(true);
        }
    }

    @Override // com.fyber.inneractive.sdk.player.ui.s
    public final void j() {
        if (this.D != null) {
            IAlog.a("Autoclick paused", new Object[0]);
            w1 w1Var = this.D;
            w1Var.f31249d = true;
            u1 u1Var = w1Var.f31248c;
            if (u1Var != null) {
                u1Var.removeMessages(1932593528);
            }
        }
    }

    @Override // com.fyber.inneractive.sdk.player.ui.s
    public final void k() {
        if (this.D != null) {
            IAlog.a("Autoclick resumed", new Object[0]);
            w1 w1Var = this.D;
            w1Var.f31249d = false;
            w1Var.a(SystemClock.uptimeMillis());
        }
    }

    @Override // com.fyber.inneractive.sdk.player.ui.s
    public final void o() {
        this.f30740u = this.f30694z.a(this.f30683d, this.o, this.f30735p, this.f30739t, this.f30681b, this.f30734m);
    }

    @Override // com.fyber.inneractive.sdk.player.ui.e, android.view.View
    public final void onWindowFocusChanged(boolean z11) {
    }

    public final void p() {
        if (this.D != null) {
            IAlog.a("Autoclick is removed ", new Object[0]);
            this.D.f31250e = null;
            this.D = null;
        }
    }

    public void setEndCardView(View view) {
        this.H = view;
    }

    @Override // com.fyber.inneractive.sdk.player.ui.e
    public final void a(h1 h1Var, int i5, int i11) {
        this.f30694z.a(this.f30683d, this.o, this.f30735p, this.f30736q, h1Var, i5, i11, this.f30681b, ((w0) this.f30682c).f27948f.f27959f.intValue());
    }

    @Override // com.fyber.inneractive.sdk.player.ui.s
    public void a(int i5, int i11) {
        Runnable runnable = this.E;
        if (runnable != null) {
            removeCallbacks(runnable);
            this.E = null;
        }
        this.G = getMaxTickFactor() + i11;
        int maxTickFactor = (getMaxTickFactor() / getTickFractions()) + i11;
        int i12 = this.G;
        if (i12 <= 0 || i12 > i5) {
            return;
        }
        int i13 = this.F;
        if (maxTickFactor < i13 && i13 > 0) {
            a(i12);
            return;
        }
        this.F = maxTickFactor;
        a(maxTickFactor);
        k kVar = new k(this);
        this.E = kVar;
        postDelayed(kVar, this.f30733l);
    }
}
