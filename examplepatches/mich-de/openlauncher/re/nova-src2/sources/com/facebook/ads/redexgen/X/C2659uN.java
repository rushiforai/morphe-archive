package com.facebook.ads.redexgen.X;

import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.RelativeLayout;
import com.facebook.ads.RewardData;
import java.util.ArrayList;
import java.util.List;

/* renamed from: com.facebook.ads.redexgen.X.uN, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2659uN extends FrameLayout {
    public static String[] A08 = {"Lu0oG19N", "JNY", "Ev6F9eDhg42RHlCeRuJfEtiFO07AluFn", "qSbaO4FE34QcNqD1YWxCxyT8wr5s9kWw", "hZddA1hSD7Y", "v9TnLSaOxYneacolptRVdRHaZQ0ab06L", "iyW9tyIIQvF7WQz3LOxNHXxa074IcWbN", "vzh"};
    public AbstractC2452r2 A00;
    public C2482rW A01;
    public final LA A02;
    public final C0958Hi A03;
    public final InterfaceC2459r9 A04;
    public final InterfaceC2658uM A05;
    public final C0799Be A06;
    public final List<View> A07;

    public C2659uN(C0958Hi c0958Hi, AbstractC2452r2 abstractC2452r2, LA la2, C0799Be c0799Be, InterfaceC2459r9 interfaceC2459r9, InterfaceC2658uM interfaceC2658uM, View... viewArr) {
        super(c0958Hi);
        this.A07 = new ArrayList();
        this.A03 = c0958Hi;
        this.A00 = abstractC2452r2;
        this.A02 = la2;
        for (View view : viewArr) {
            if (view != null) {
                this.A07.add(view);
            }
        }
        this.A04 = interfaceC2459r9;
        this.A06 = c0799Be;
        this.A05 = interfaceC2658uM;
        A04();
    }

    public C2659uN(C2689ur c2689ur, LA la2, C0799Be c0799Be, C0781Am c0781Am, AbstractC2624to abstractC2624to, InterfaceC2459r9 interfaceC2459r9, InterfaceC2658uM interfaceC2658uM) {
        this(c2689ur, la2, c0799Be, interfaceC2459r9, interfaceC2658uM, c0781Am, abstractC2624to);
    }

    public C2659uN(C2689ur c2689ur, LA la2, C0799Be c0799Be, InterfaceC2459r9 interfaceC2459r9, InterfaceC2658uM interfaceC2658uM, View... viewArr) {
        this(c2689ur.A06(), c2689ur.A0B(), la2, c0799Be, interfaceC2459r9, interfaceC2658uM, viewArr);
    }

    private void A04() {
        String strA06;
        RewardData rewardDataA1R = this.A02.A1R();
        if (rewardDataA1R == null) {
            strA06 = this.A02.A34().A05();
        } else {
            strA06 = this.A02.A34().A06(rewardDataA1R.getCurrency(), rewardDataA1R.getQuantity());
        }
        this.A01 = new C2482rW(this.A03, -1, -16777216, strA06, null, this.A02.A34().A04(), this.A02.A34().A03(), AbstractC2438qo.A01(EnumC2437qn.REWARD_ICON));
        this.A01.A02.setOnClickListener(new ViewOnClickListenerC2656uK(this));
        this.A01.A01.setOnClickListener(new ViewOnClickListenerC2657uL(this));
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -1);
        addView(this.A01, layoutParams);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A05() {
        if (this.A06 != null) {
            this.A06.A0e(EnumC1718ex.A08);
        }
        this.A05.ADp();
        if (!this.A02.A32().A0W()) {
            this.A02.A3A(this.A04);
        }
    }

    public final void A07(ViewGroup viewGroup) {
        if (this.A06 != null && !this.A06.A0p()) {
            this.A06.A0k(false, false, 11);
            AbstractC2426qc.A0P(this.A06, 4);
        }
        AbstractC2452r2 abstractC2452r2 = this.A00;
        String[] strArr = A08;
        if (strArr[7].length() != strArr[1].length()) {
            throw new RuntimeException();
        }
        A08[0] = "vGH3jzSu";
        if (abstractC2452r2 != null) {
            AbstractC2426qc.A0I(this.A00);
        }
        for (View view : this.A07) {
            view.clearAnimation();
            AbstractC2426qc.A0P(view, 4);
        }
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -1);
        viewGroup.addView(this, layoutParams);
        this.A05.AFr();
    }
}
