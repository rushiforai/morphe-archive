package com.facebook.ads.redexgen.X;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.util.DisplayMetrics;
import android.view.View;
import android.widget.RelativeLayout;
import com.vungle.ads.internal.protos.Sdk;

/* renamed from: com.facebook.ads.redexgen.X.51, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class AnonymousClass51 extends BP {
    public final Paint A00;
    public final C0958Hi A01;
    public final C2232nO A02;
    public final BM A03;
    public final BG A04;
    public final BE A05;
    public final C1639de A06;

    public AnonymousClass51(C0958Hi c0958Hi, boolean z11, C2232nO c2232nO) {
        super(c0958Hi);
        this.A04 = new BG() { // from class: com.facebook.ads.redexgen.X.54
            /* JADX INFO: Access modifiers changed from: private */
            @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
            /* renamed from: A00, reason: merged with bridge method [inline-methods] */
            public final void A03(C5W c5w) {
                this.A00.A06.setChecked(true);
            }
        };
        this.A05 = new BE() { // from class: com.facebook.ads.redexgen.X.53
            /* JADX INFO: Access modifiers changed from: private */
            @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
            /* renamed from: A00, reason: merged with bridge method [inline-methods] */
            public final void A03(BF bf2) {
                this.A00.A06.setChecked(false);
            }
        };
        this.A03 = new BM() { // from class: com.facebook.ads.redexgen.X.52
            /* JADX INFO: Access modifiers changed from: private */
            @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
            /* renamed from: A00, reason: merged with bridge method [inline-methods] */
            public final void A03(C5Y c5y) {
                this.A00.A06.setChecked(true);
            }
        };
        this.A02 = c2232nO;
        this.A01 = c0958Hi;
        this.A06 = new C1639de(c0958Hi, z11);
        DisplayMetrics displayMetrics = getResources().getDisplayMetrics();
        RelativeLayout.LayoutParams btnLayout = new RelativeLayout.LayoutParams((int) (displayMetrics.density * 23.76d), (int) (displayMetrics.density * 23.76d));
        btnLayout.addRule(13);
        this.A06.setLayoutParams(btnLayout);
        this.A06.setChecked(true);
        this.A06.setClickable(false);
        this.A00 = new Paint();
        this.A00.setStyle(Paint.Style.FILL);
        if (z11) {
            this.A00.setColor(-1728053248);
        } else {
            this.A00.setColor(-1);
            this.A00.setAlpha(Sdk.SDKError.Reason.AD_ALREADY_LOADED_VALUE);
        }
        AbstractC2426qc.A0O(this, 0);
        addView(this.A06);
        setGravity(17);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams((int) (displayMetrics.density * 72.0d), (int) (displayMetrics.density * 72.0d));
        layoutParams.addRule(13);
        setLayoutParams(layoutParams);
        AbstractC2426qc.A0H(1004, this);
    }

    @Override // com.facebook.ads.redexgen.X.BP
    public final void A07() {
        super.A07();
        if (getVideoView() != null) {
            getVideoView().getEventBus().A03(this.A04, this.A05, this.A03);
        }
        View.OnClickListener clickListener = new Cdo(this);
        setOnClickListener(clickListener);
    }

    @Override // com.facebook.ads.redexgen.X.BP
    public final void A08() {
        setOnClickListener(null);
        if (getVideoView() != null) {
            getVideoView().getEventBus().A04(this.A03, this.A05, this.A04);
        }
        super.A08();
    }

    @Override // android.view.View
    public final void onDraw(Canvas canvas) {
        int width = (getWidth() - getPaddingLeft()) - getPaddingRight();
        int height = getHeight();
        int width2 = getPaddingTop();
        int i5 = height - width2;
        int width3 = getPaddingBottom();
        int height2 = i5 - width3;
        int width4 = Math.min(width, height2);
        int centerY = width4 / 2;
        int height3 = width4 / 2;
        int width5 = getPaddingLeft();
        float f11 = width5 + centerY;
        int width6 = getPaddingTop();
        canvas.drawCircle(f11, width6 + height3, centerY, this.A00);
        super.onDraw(canvas);
    }
}
