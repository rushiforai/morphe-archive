package com.fyber.inneractive.sdk.player.ui;

import android.content.Context;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import com.fyber.inneractive.sdk.R;
import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.fyber.inneractive.sdk.config.global.features.v;
import com.fyber.inneractive.sdk.ui.IAsmoothProgressBar;
import com.fyber.inneractive.sdk.ui.IFyberAdIdentifier;
import java.util.Locale;

/* loaded from: classes3.dex */
public class o extends l {
    public ViewGroup K;
    public TextView L;
    public TextView M;
    public ImageView N;
    public ImageView O;
    public IAsmoothProgressBar P;
    public View Q;
    public View R;
    public View S;
    public TextView T;
    public TextView U;

    public o(Context context, com.fyber.inneractive.sdk.flow.g gVar, a aVar, com.fyber.inneractive.sdk.config.global.r rVar, boolean z11, String str) {
        super(context, gVar, aVar, rVar, str);
        this.Q = null;
        this.A.inflate(R.layout.ia_layout_video_view, (ViewGroup) this, true);
        q();
        com.fyber.inneractive.sdk.flow.g gVar2 = this.B;
        if (gVar2 != null) {
            IFyberAdIdentifier.Corner corner = IFyberAdIdentifier.Corner.BOTTOM_LEFT;
            IFyberAdIdentifier iFyberAdIdentifier = gVar2.f28149d;
            iFyberAdIdentifier.f31149k = corner;
            iFyberAdIdentifier.a(this);
        }
        h(z11);
    }

    @Override // com.fyber.inneractive.sdk.player.ui.l, com.fyber.inneractive.sdk.player.ui.s
    public final void a(int i5, int i11) {
        IAsmoothProgressBar iAsmoothProgressBar = this.P;
        if (iAsmoothProgressBar == null) {
            return;
        }
        iAsmoothProgressBar.setMax(i5);
        super.a(i5, i11);
    }

    @Override // com.fyber.inneractive.sdk.player.ui.s
    public final void b(boolean z11) {
        TextView textView = this.T;
        if (textView != null) {
            textView.setVisibility(z11 ? 0 : 4);
        }
    }

    @Override // com.fyber.inneractive.sdk.player.ui.s
    public final void c(boolean z11) {
        ViewGroup viewGroup = this.K;
        if (viewGroup != null) {
            viewGroup.setVisibility(z11 ? 0 : 4);
        }
    }

    @Override // com.fyber.inneractive.sdk.player.ui.e
    public final void d() {
        this.f30687h = true;
        j();
    }

    @Override // com.fyber.inneractive.sdk.player.ui.s, com.fyber.inneractive.sdk.player.ui.m
    public final void destroy() {
        super.destroy();
        k kVar = this.E;
        if (kVar != null) {
            removeCallbacks(kVar);
            this.E = null;
        }
        p();
        ViewGroup viewGroup = this.f30734m;
        if (viewGroup != null) {
            viewGroup.removeAllViews();
        }
    }

    @Override // com.fyber.inneractive.sdk.player.ui.e
    public final void e() {
        this.f30687h = false;
        k();
    }

    @Override // com.fyber.inneractive.sdk.player.ui.s
    public final void f(boolean z11) {
        IAsmoothProgressBar iAsmoothProgressBar = this.P;
        if (iAsmoothProgressBar != null) {
            iAsmoothProgressBar.setVisibility(z11 ? 0 : 4);
        }
    }

    @Override // com.fyber.inneractive.sdk.player.ui.s
    public final void g(boolean z11) {
        TextView textView = this.U;
        if (textView != null) {
            textView.setVisibility(z11 ? 0 : 4);
        }
    }

    @Override // com.fyber.inneractive.sdk.player.ui.s
    public View[] getTrackingFriendlyView() {
        return new View[]{this.M, this.T, this.U, this.N, this.P, this.Q, this.f30741v};
    }

    @Override // com.fyber.inneractive.sdk.player.ui.s
    public View[] getTrackingFriendlyViewObstructionPurposeOther() {
        return new View[]{this.L, this.K};
    }

    @Override // com.fyber.inneractive.sdk.player.ui.s
    public final void h() {
        TextView textView = this.U;
        if (textView != null) {
            textView.setEnabled(true);
        }
    }

    @Override // com.fyber.inneractive.sdk.player.ui.s
    public final void i() {
        g(false);
        d(false);
        f(false);
        TextView textView = this.M;
        if (textView != null) {
            textView.setVisibility(4);
        }
        ImageView imageView = this.O;
        if (imageView != null) {
            imageView.setVisibility(4);
        }
        c(false);
        a(false, (String) null);
        b(false);
    }

    @Override // com.fyber.inneractive.sdk.player.ui.s
    public final boolean l() {
        return this.T == null && this.P == null;
    }

    @Override // com.fyber.inneractive.sdk.player.ui.s
    public final void m() {
        ImageView imageView = this.O;
        if (imageView != null) {
            imageView.setVisibility(0);
            this.O.setSelected(true);
        }
    }

    @Override // com.fyber.inneractive.sdk.player.ui.s
    public final void n() {
        ImageView imageView = this.O;
        if (imageView != null) {
            imageView.setVisibility(0);
            this.O.setSelected(false);
        }
    }

    public void q() {
        this.f30734m = (ViewGroup) findViewById(R.id.ia_texture_view_host);
        this.f30737r = (ViewGroup) findViewById(R.id.ia_default_endcard_video_overlay);
        this.f30738s = (ViewGroup) findViewById(R.id.ia_endcard_video_overlay);
        this.n = (Button) findViewById(R.id.ia_b_end_card_call_to_action);
        TextView textView = (TextView) findViewById(R.id.ia_endcard_tv_app_info_button);
        this.f30741v = textView;
        a(textView, 10);
        a(this.n, 8);
        a(this.f30734m, 7);
        a(this.f30737r, -1);
        this.O = (ImageView) findViewById(R.id.ia_iv_expand_collapse_button);
        this.S = findViewById(R.id.ia_paused_video_overlay);
        this.L = (TextView) findViewById(R.id.ia_tv_app_info_button);
        this.M = (TextView) findViewById(R.id.ia_tv_call_to_action);
        this.P = (IAsmoothProgressBar) findViewById(R.id.ia_video_progressbar);
        this.K = (ViewGroup) findViewById(R.id.ia_identifier_overlay);
        this.Q = findViewById(R.id.ia_click_overlay);
        this.P.setVisibility(0);
        ImageView imageView = (ImageView) findViewById(R.id.ia_iv_mute_button);
        this.N = imageView;
        imageView.setVisibility(0);
        this.R = findViewById(R.id.ia_buffering_overlay);
        this.T = (TextView) findViewById(R.id.ia_tv_remaining_time);
        this.U = (TextView) findViewById(R.id.ia_tv_skip);
        a(this, 7);
        a(this.M, 3);
        a(this.N, 1);
        a(this.L, 10);
        a(this.O, 5);
        a(this.S, 9);
        a(this.U, 6);
    }

    @Override // com.fyber.inneractive.sdk.player.ui.s
    public void setAppInfoButtonRound(TextView textView) {
        if (textView == null) {
            return;
        }
        textView.setBackgroundResource(R.drawable.ia_bg_circle_overlay);
        ViewGroup.LayoutParams layoutParams = textView.getLayoutParams();
        layoutParams.width = (int) getContext().getResources().getDimension(R.dimen.ia_image_control_size);
        layoutParams.height = (int) getContext().getResources().getDimension(R.dimen.ia_image_control_size);
        textView.setLayoutParams(layoutParams);
    }

    @Override // com.fyber.inneractive.sdk.player.ui.s
    public void setMuteButtonState(boolean z11) {
        ImageView imageView = this.N;
        if (imageView != null) {
            imageView.setSelected(z11);
        }
    }

    @Override // com.fyber.inneractive.sdk.player.ui.s
    public void setRemainingTime(String str) {
        TextView textView = this.T;
        if (textView != null) {
            textView.setText(str);
        }
    }

    @Override // com.fyber.inneractive.sdk.player.ui.s
    public void setSkipText(String str) {
        Integer numValueOf;
        if (this.U != null) {
            if (TextUtils.isEmpty(str)) {
                numValueOf = null;
            } else {
                try {
                    numValueOf = Integer.valueOf(Integer.parseInt(str));
                } catch (Exception unused) {
                }
            }
            if (numValueOf != null) {
                str = String.format(Locale.US, IAConfigManager.Q.f27762v.a().getString(R.string.ia_video_before_skip_format), numValueOf);
            }
            this.U.setText(str);
        }
    }

    @Override // com.fyber.inneractive.sdk.player.ui.s
    public final void d(boolean z11) {
        ImageView imageView = this.N;
        if (imageView != null) {
            imageView.setVisibility(z11 ? 0 : 4);
        }
    }

    @Override // com.fyber.inneractive.sdk.player.ui.s
    public final void e(boolean z11) {
        View view = this.S;
        if (view != null) {
            view.setVisibility(z11 ? 0 : 8);
        }
    }

    @Override // com.fyber.inneractive.sdk.player.ui.l
    public final void a(int i5) {
        IAsmoothProgressBar iAsmoothProgressBar = this.P;
        if (iAsmoothProgressBar != null) {
            iAsmoothProgressBar.setProgress(i5);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x0048  */
    @Override // com.fyber.inneractive.sdk.player.ui.s
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void a(boolean z11, com.fyber.inneractive.sdk.ignite.m mVar) {
        String localizedCtaButtonText;
        Boolean boolC;
        TextView textView = this.M;
        if (textView != null) {
            com.fyber.inneractive.sdk.config.global.r rVar = this.f30742w;
            textView.setAllCaps((rVar == null || rVar.a(v.class) == null || (boolC = ((v) this.f30742w.a(v.class)).c("cta_text_all_caps")) == null) ? false : boolC.booleanValue());
            TextView textView2 = this.M;
            if (IAConfigManager.Q.F.n()) {
                mVar.getClass();
                if (mVar == com.fyber.inneractive.sdk.ignite.m.TRUE_SINGLE_TAP) {
                    localizedCtaButtonText = getContext().getString(R.string.ia_video_instant_install_text);
                } else {
                    localizedCtaButtonText = getLocalizedCtaButtonText();
                    if (TextUtils.isEmpty(localizedCtaButtonText)) {
                        localizedCtaButtonText = getContext().getString(R.string.ia_video_install_now_text);
                    }
                }
            }
            if (!TextUtils.isEmpty(this.f30743x)) {
                localizedCtaButtonText = this.f30743x;
            }
            textView2.setText(localizedCtaButtonText);
            this.M.setVisibility(z11 ? 0 : 4);
        }
    }

    @Override // com.fyber.inneractive.sdk.player.ui.s
    public final void a(boolean z11, String str) {
        TextView textView;
        TextView textView2 = this.L;
        if (textView2 != null) {
            textView2.setText(str);
            if (str != null && str.length() == 1) {
                setAppInfoButtonRound(this.L);
            }
            if (z11 && (textView = this.M) != null) {
                ViewGroup.LayoutParams layoutParams = textView.getLayoutParams();
                layoutParams.width = -2;
                this.M.setLayoutParams(layoutParams);
                this.M.setTextSize(0, getResources().getDimension(R.dimen.ia_video_overlay_text_large_for_cta));
            }
            this.L.setVisibility(z11 ? 0 : 8);
        }
    }

    @Override // com.fyber.inneractive.sdk.player.ui.s
    public final void a(boolean z11) {
        View view = this.R;
        if (view != null) {
            view.setVisibility(z11 ? 0 : 8);
        }
    }

    @Override // com.fyber.inneractive.sdk.player.ui.m
    public boolean a() {
        TextView textView = this.U;
        return textView != null && textView.getVisibility() == 0 && this.U.isEnabled();
    }
}
