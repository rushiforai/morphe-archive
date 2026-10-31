package com.facebook.ads.redexgen.X;

import android.graphics.Rect;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.view.ViewTreeObserver;
import android.widget.FrameLayout;
import android.widget.ImageView;
import com.facebook.ads.NativeAdLayout;

/* renamed from: com.facebook.ads.redexgen.X.t5, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2579t5 extends ImageView {
    public Handler A00;
    public View.OnLayoutChangeListener A01;
    public ViewTreeObserver.OnScrollChangedListener A02;
    public ImageView A03;
    public boolean A04;
    public final View A05;
    public final NativeAdLayout A06;
    public final LA A07;
    public final C0958Hi A08;
    public final EnumC2437qn A09;
    public final InterfaceC2567st A0A;

    public C2579t5(C0958Hi c0958Hi, EnumC2569sv enumC2569sv, LA la2, View view, EnumC2437qn enumC2437qn, NativeAdLayout nativeAdLayout, InterfaceC2567st interfaceC2567st) {
        super(c0958Hi);
        this.A05 = view;
        this.A09 = enumC2437qn;
        this.A08 = c0958Hi;
        this.A06 = nativeAdLayout;
        this.A0A = interfaceC2567st;
        this.A07 = la2;
        AbstractC2568su.A03(c0958Hi, enumC2569sv);
        A02();
    }

    private int A00(Rect rect) {
        return this.A08.getResources().getDisplayMetrics().widthPixels - rect.left;
    }

    private void A02() {
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-2, -2);
        this.A03 = new ImageView(this.A08);
        this.A03.setImageBitmap(AbstractC2438qo.A01(this.A09));
        this.A03.setLayoutParams(layoutParams);
        this.A06.addView(this.A03);
        AbstractC2426qc.A0P(this.A03, 4);
        this.A03.setOnClickListener(new View.OnClickListener() { // from class: com.facebook.ads.redexgen.X.t0
            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                this.A00.A0C(view);
            }
        });
        this.A00 = new Handler(Looper.getMainLooper());
        this.A01 = new View.OnLayoutChangeListener() { // from class: com.facebook.ads.redexgen.X.t1
            @Override // android.view.View.OnLayoutChangeListener
            public final void onLayoutChange(View view, int i5, int i11, int i12, int i13, int i14, int i15, int i16, int i17) {
                this.A00.A0D(view, i5, i11, i12, i13, i14, i15, i16, i17);
            }
        };
        this.A02 = new ViewTreeObserver.OnScrollChangedListener() { // from class: com.facebook.ads.redexgen.X.t2
            @Override // android.view.ViewTreeObserver.OnScrollChangedListener
            public final void onScrollChanged() {
                this.A00.A05();
            }
        };
        this.A03.addOnAttachStateChangeListener(new ViewOnAttachStateChangeListenerC2578t4(this));
    }

    private void A03() {
        if (this.A01 != null) {
            this.A06.removeOnLayoutChangeListener(this.A01);
            this.A01 = null;
        }
        if (this.A02 != null) {
            this.A06.getViewTreeObserver().removeOnScrollChangedListener(this.A02);
            this.A02 = null;
        }
    }

    private void A04() {
        this.A00.postDelayed(new Runnable() { // from class: com.facebook.ads.redexgen.X.t3
            @Override // java.lang.Runnable
            public final void run() {
                this.A00.A09();
            }
        }, this.A07.A2z());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A05() {
        FrameLayout.LayoutParams layoutParams = (FrameLayout.LayoutParams) this.A03.getLayoutParams();
        Rect rect = new Rect();
        this.A05.getGlobalVisibleRect(rect);
        Rect nativeAdLayoutLocation = new Rect();
        this.A06.getGlobalVisibleRect(nativeAdLayoutLocation);
        layoutParams.leftMargin = rect.left - nativeAdLayoutLocation.left;
        layoutParams.topMargin = rect.top - nativeAdLayoutLocation.top;
        if (rect.left > A00(nativeAdLayoutLocation) / 2) {
            layoutParams.leftMargin = (layoutParams.leftMargin - this.A03.getWidth()) + this.A05.getWidth();
        }
        layoutParams.topMargin += (this.A05.getHeight() - this.A03.getHeight()) / 2;
        this.A03.setLayoutParams(layoutParams);
        AbstractC2426qc.A0P(this.A03, 0);
        this.A03.bringToFront();
        if (!this.A04) {
            this.A04 = true;
            A04();
        }
    }

    private void A06(int i5, int i11) {
        AbstractC2426qc.A0P(this.A03, i5);
        AbstractC2426qc.A0P(this.A05, i11);
    }

    public final void A09() {
        A03();
        A06(8, 0);
        this.A00.removeCallbacksAndMessages(null);
        this.A04 = false;
    }

    public final void A0A() {
        A06(4, 4);
        this.A03.post(new Runnable() { // from class: com.facebook.ads.redexgen.X.sz
            @Override // java.lang.Runnable
            public final void run() {
                this.A00.A05();
            }
        });
        if (this.A01 != null) {
            this.A06.addOnLayoutChangeListener(this.A01);
        }
        if (this.A02 != null) {
            this.A06.getViewTreeObserver().addOnScrollChangedListener(this.A02);
        }
    }

    public final void A0B() {
        A06(4, 4);
        A05();
    }

    public final /* synthetic */ void A0C(View view) {
        A03();
        this.A0A.AEX(view);
    }

    public final /* synthetic */ void A0D(View view, int i5, int i11, int i12, int i13, int i14, int i15, int i16, int i17) {
        A05();
    }
}
