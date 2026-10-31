package com.fyber.inneractive.sdk.player.ui;

import android.content.Context;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import com.fyber.inneractive.sdk.R;
import com.fyber.inneractive.sdk.external.MediaView;

/* loaded from: classes3.dex */
public final class u extends o {
    public MediaView V;
    public final View.OnLayoutChangeListener W;

    public u(Context context, h hVar, com.fyber.inneractive.sdk.config.global.r rVar) {
        super(context, null, hVar, rVar, false, null);
        this.W = new bd.a(this, 0);
    }

    @Override // com.fyber.inneractive.sdk.player.ui.s
    public final void a(com.fyber.inneractive.sdk.flow.endcard.d dVar, b bVar) {
    }

    @Override // com.fyber.inneractive.sdk.player.ui.l
    public final void b(int i5, int i11) {
    }

    @Override // com.fyber.inneractive.sdk.player.ui.s, com.fyber.inneractive.sdk.player.ui.m
    public final boolean c() {
        return false;
    }

    @Override // com.fyber.inneractive.sdk.player.ui.l, com.fyber.inneractive.sdk.player.ui.s
    public View getEndCardView() {
        return null;
    }

    @Override // com.fyber.inneractive.sdk.player.ui.o, com.fyber.inneractive.sdk.player.ui.s
    public View[] getTrackingFriendlyView() {
        ImageView imageView = this.N;
        return imageView != null ? new View[]{imageView} : new View[0];
    }

    @Override // com.fyber.inneractive.sdk.player.ui.o, com.fyber.inneractive.sdk.player.ui.s
    public View[] getTrackingFriendlyViewObstructionPurposeOther() {
        return new View[0];
    }

    @Override // com.fyber.inneractive.sdk.player.ui.l
    public final void h(boolean z11) {
    }

    @Override // com.fyber.inneractive.sdk.player.ui.e, android.view.ViewGroup, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        if (getParent() instanceof MediaView) {
            MediaView mediaView = (MediaView) getParent();
            this.V = mediaView;
            mediaView.addOnLayoutChangeListener(this.W);
        }
    }

    @Override // com.fyber.inneractive.sdk.player.ui.e, android.view.ViewGroup, android.view.View
    public final void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        MediaView mediaView = this.V;
        if (mediaView != null) {
            mediaView.removeOnLayoutChangeListener(this.W);
            this.V = null;
        }
    }

    @Override // android.view.View
    public final void onSizeChanged(int i5, int i11, int i12, int i13) {
        super.onSizeChanged(i5, i11, i12, i13);
        r();
    }

    @Override // com.fyber.inneractive.sdk.player.ui.o
    public final void q() {
        setBackgroundColor(0);
        this.f30734m = (ViewGroup) findViewById(R.id.ia_texture_view_host);
        removeView(findViewById(R.id.ia_video_progressbar));
        ImageView imageView = (ImageView) findViewById(R.id.ia_iv_mute_button);
        this.N = imageView;
        imageView.setVisibility(0);
        a(this.N, 1);
        this.R = findViewById(R.id.ia_buffering_overlay);
        TextView textView = (TextView) findViewById(R.id.ia_tv_call_to_action);
        this.M = textView;
        removeView(textView);
        this.M = null;
    }

    public final void r() {
        if (this.N == null) {
            return;
        }
        View view = this.V;
        if (view == null) {
            view = this;
        }
        int width = view.getWidth();
        int height = view.getHeight();
        if (width == 0 || height == 0) {
            return;
        }
        int iMax = Math.max((int) (Math.min(width, height) * 0.1f), (int) TypedValue.applyDimension(1, 24.0f, getResources().getDisplayMetrics()));
        ViewGroup.LayoutParams layoutParams = this.N.getLayoutParams();
        layoutParams.width = iMax;
        layoutParams.height = iMax;
        this.N.setLayoutParams(layoutParams);
    }

    @Override // com.fyber.inneractive.sdk.player.ui.o, com.fyber.inneractive.sdk.player.ui.m
    public final boolean a() {
        return false;
    }

    public final /* synthetic */ void a(View view, int i5, int i11, int i12, int i13, int i14, int i15, int i16, int i17) {
        if (i12 - i5 == i16 - i14 && i13 - i11 == i17 - i15) {
            return;
        }
        r();
    }

    @Override // com.fyber.inneractive.sdk.player.ui.s
    public final void a(boolean z11, int i5, int i11) {
        this.o = i5;
        this.f30735p = i11;
        this.f30736q = z11;
        post(new t(this));
    }
}
