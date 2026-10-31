package com.facebook.ads.redexgen.X;

import android.animation.AnimatorListenerAdapter;
import android.os.Handler;
import android.view.View;

/* renamed from: com.facebook.ads.redexgen.X.At, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C0788At implements InterfaceC1663e3 {
    public static String[] A0B = {"82Zz8oCZg8zkkbzw8opl2Yz4CtrF2SDp", "9Qv", "sj5N5SmrmBRQmWue5o8rJw6ys3alFtJa", "lBA7odrZYL425", "CSSBUKaIJSWMhqfJuWGnuyX4cipoTk5I", "IDQP5gLMbSSnC18VVbdsGZXvkzghwpNg", "Yf1MSxzKxHs57zUlY7hI2xykX4pHUq1P", "T3bn0lMwtbok5v0PvXD6574OGDOrX6LS"};
    public View A00;
    public C0799Be A01;
    public EnumC1654du A02;
    public boolean A03;
    public final Handler A04;
    public final BM A05;
    public final BG A06;
    public final BE A07;
    public final B5 A08;
    public final boolean A09;
    public final boolean A0A;

    public C0788At(View view, EnumC1654du enumC1654du, boolean z11) {
        this(view, enumC1654du, z11, false);
    }

    public C0788At(View view, EnumC1654du enumC1654du, boolean z11, boolean z12) {
        this.A06 = new BG() { // from class: com.facebook.ads.redexgen.X.5L
            /* JADX INFO: Access modifiers changed from: private */
            @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
            /* renamed from: A00, reason: merged with bridge method [inline-methods] */
            public final void A03(C5W c5w) {
                this.A00.A06(1, 0);
            }
        };
        this.A07 = new BE() { // from class: com.facebook.ads.redexgen.X.5K
            /* JADX INFO: Access modifiers changed from: private */
            @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
            /* renamed from: A00, reason: merged with bridge method [inline-methods] */
            public final void A03(BF bf2) {
                if (!this.A00.A03) {
                    return;
                }
                if (this.A00.A02 == EnumC1654du.A03 || this.A00.A09) {
                    this.A00.A02 = null;
                    this.A00.A05();
                } else {
                    this.A00.A06(0, 8);
                }
            }
        };
        this.A05 = new BM() { // from class: com.facebook.ads.redexgen.X.5J
            /* JADX INFO: Access modifiers changed from: private */
            @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
            /* renamed from: A00, reason: merged with bridge method [inline-methods] */
            public final void A03(C5Y c5y) {
                if (this.A00.A02 == EnumC1654du.A04) {
                    return;
                }
                this.A00.A00.setAlpha(1.0f);
                this.A00.A00.setVisibility(0);
            }
        };
        this.A08 = new C5I(this);
        this.A03 = true;
        this.A04 = new Handler();
        this.A09 = z11;
        this.A0A = z12;
        A08(view, enumC1654du);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A05() {
        this.A00.animate().alpha(0.0f).setDuration(500L).setListener(new C1655dv(this));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A06(int i5, int i11) {
        this.A04.removeCallbacksAndMessages(null);
        this.A00.clearAnimation();
        this.A00.setAlpha(i5);
        this.A00.setVisibility(i11);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A07(AnimatorListenerAdapter animatorListenerAdapter) {
        this.A00.setVisibility(0);
        this.A00.animate().alpha(1.0f).setDuration(500L).setListener(animatorListenerAdapter);
    }

    private final void A08(View view, EnumC1654du enumC1654du) {
        this.A02 = enumC1654du;
        this.A00 = view;
        this.A00.clearAnimation();
        if (enumC1654du == EnumC1654du.A04) {
            this.A00.setAlpha(0.0f);
            String[] strArr = A0B;
            if (strArr[5].charAt(26) == strArr[0].charAt(26)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0B;
            strArr2[5] = "3OWa54Sl5zOXBo6RskK22JrE4LW5JWKj";
            strArr2[0] = "lt7hksMEFpJVhV2333OBcIopOVPW9bfy";
            this.A00.setVisibility(8);
            return;
        }
        this.A00.setAlpha(1.0f);
        this.A00.setVisibility(0);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1663e3
    public final void ABd(C0799Be c0799Be) {
        this.A01 = c0799Be;
        c0799Be.getEventBus().A03(this.A06, this.A07, this.A08, this.A05);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1663e3
    public final void ALp(C0799Be c0799Be) {
        A06(1, 0);
        if (c0799Be != null) {
            c0799Be.getEventBus().A04(this.A05, this.A08, this.A07, this.A06);
        }
        this.A01 = null;
    }
}
