package com.facebook.ads.redexgen.X;

import android.content.res.Configuration;
import android.os.Handler;
import android.os.Looper;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.HashMap;
import java.util.concurrent.atomic.AtomicBoolean;

/* renamed from: com.facebook.ads.redexgen.X.6K, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class C6K extends AbstractC0861Do {
    public static String[] A0A = {"itiy11Wl5lP7QtpB3", "v6A5WW2CB", "SYp5FzxPKMl", "MKN0lN1Uug", "IQIXhYysWoH9a5YMZx5hFMUL6lEdxT5q", "FECz3BMfLn4pJfwLFVrIm2wrzlNMsWJ3", "RmVgcuWcoU56A5AXkQhrmgSRFj76ryom", "F5uv5dts8QHAu8Ovw"};
    public static final RelativeLayout.LayoutParams A0B = new RelativeLayout.LayoutParams(-1, -1);
    public C2370pi A00;
    public C2370pi A01;
    public AbstractC2685un A02;
    public C0781Am A03;
    public final int A04;
    public final ImageView A05;
    public final C2232nO A06;
    public final AbstractC2452r2 A07;
    public final InterfaceC2511rz A08;
    public final AtomicBoolean A09;

    public C6K(C0958Hi c0958Hi, InterfaceC2515s3 interfaceC2515s3, int i5, InterfaceC2224nG interfaceC2224nG, LA la2, InterfaceC2459r9 interfaceC2459r9, AbstractC2452r2 abstractC2452r2, C2232nO c2232nO, boolean z11, boolean z12, InterfaceC2511rz interfaceC2511rz, int i11, int i12) {
        super(c0958Hi, interfaceC2515s3, interfaceC2224nG, la2, i5, z11, z12, interfaceC2459r9, i12);
        this.A09 = new AtomicBoolean(false);
        this.A04 = i11;
        this.A08 = interfaceC2511rz;
        this.A05 = new ImageView(getContext());
        this.A07 = abstractC2452r2;
        this.A06 = c2232nO;
        if (la2.A2M()) {
            this.A03 = new C0781Am(c0958Hi, this.A04);
        }
        this.A05.setScaleType(ImageView.ScaleType.CENTER);
        this.A05.setAdjustViewBounds(true);
        new AsyncTaskC0892Et(this.A05, c0958Hi).A05(la2.A32().A0I().A00(), la2.A32().A0I().A01()).A06(new C0855Di(this)).A07(la2.A32().A0I().A08());
        A09(c0958Hi.getResources().getConfiguration().orientation);
    }

    private AbstractC2685un A02(int i5) {
        if (this.A05.getParent() != null) {
            ImageView imageView = this.A05;
            if (A0A[4].charAt(16) != 'Z') {
                throw new RuntimeException();
            }
            String[] strArr = A0A;
            strArr[3] = "PnJcnL34IR";
            strArr[1] = "4gIzhBkuZ";
            AbstractC2426qc.A0K(imageView);
        }
        if (A0A[4].charAt(16) != 'Z') {
            throw new RuntimeException();
        }
        A0A[4] = "hUws06ULbo6w3OlBZNW9WYMgHjAED42u";
        boolean z11 = i5 != 2;
        C2688uq c2688uq = new C2688uq(super.A09, this.A0A, this.A0D, super.A08, this.A05, this.A0F, this.A0C);
        C2688uq interstitialLayoutParamsBuilder = c2688uq.A0J(this.A07.getToolbarHeight());
        interstitialLayoutParamsBuilder.A0P(this.A07).A0I(i5).A0T(z11).A0S(super.A00).A0M(this.A06);
        if (this.A03 != null) {
            c2688uq.A0R(this.A03);
        }
        c2688uq.A0L(C1702eg.A00(super.A09, this.A0A, b.f42142b, AbstractC2351pP.A00(super.A08.A32().A0K().A06()), new HashMap(), super.A08.A33()));
        c2688uq.A0Q(this.A08);
        return AbstractC2686uo.A00(c2688uq.A0U(), null, true);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A07() {
        if (this.A09.get()) {
            A1f();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A08() {
        int persistentForcedNtdPlays = super.A08.A30();
        this.A01 = new C2370pi(this.A04 * persistentForcedNtdPlays, new C0852Df(this));
        this.A01.A07();
    }

    private void A09(int i5) {
        AbstractC2426qc.A0K(this.A02);
        this.A02 = A02(i5);
        if (this.A02 instanceof ET) {
            ((ET) this.A02).setChildChainedAd(true);
        } else if (this.A02 instanceof EE) {
            ((EE) this.A02).setChildChainedAd(true);
        }
        addView(this.A02, 0, A0B);
        String[] strArr = A0A;
        if (strArr[5].charAt(20) != strArr[6].charAt(20)) {
            throw new RuntimeException();
        }
        String[] strArr2 = A0A;
        strArr2[0] = "NymEh23RSAOezTqdL";
        strArr2[7] = "Z0aVEFLWFgqQyxS3R";
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean A0C() {
        return super.A08.A3G() && (this.A02 instanceof C0879Eg) && !super.A08.A32().A0U();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean A0D() {
        return super.A08.A3G() && (this.A02 instanceof EE) && super.A08.A32().A0U();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0861Do
    public final EnumC1698ec A1a(String str) {
        return this.A02.A1P(str);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0861Do
    public final void A1b() {
        if (this.A01 != null) {
            this.A01.A06();
            this.A01 = null;
        }
        if (C2203mv.A1z(super.A09)) {
            super.A09.A0B().ALo(this.A05);
        }
        if (this.A02 != null) {
            this.A02.A1Q();
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0861Do
    public final void A1e() {
        this.A02.A1V();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0861Do
    public final void A1g() {
        if (this.A02 instanceof C0879Eg) {
            ((C0879Eg) this.A02).A1j();
        } else {
            if (!(this.A02 instanceof EE)) {
                return;
            }
            ((EE) this.A02).A1k(false);
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0861Do
    public final void A1h() {
        int iA02 = super.A08.A32().A0I().A02();
        int secondsForNextCta = this.A04;
        if (secondsForNextCta > 0) {
            this.A00 = new C2370pi(this.A04, 100.0f, 100L, new Handler(Looper.getMainLooper()), new C0854Dh(this));
            this.A00.A07();
            if (iA02 >= 0) {
                AbstractC2452r2 abstractC2452r2 = this.A07;
                if (A0A[2].length() != 11) {
                    throw new RuntimeException();
                }
                String[] strArr = A0A;
                strArr[5] = "5sJR643P2MO0kglA4V6nmPiOKHmDAtHO";
                strArr[6] = "LANOKlUG8RCY7vCAyDzomj5mGxVqyRh5";
                abstractC2452r2.setProgressSpinnerInvisible(true);
            }
            if (iA02 != 0) {
                int secondsForNextCta2 = this.A04;
                if (iA02 < secondsForNextCta2) {
                    if (iA02 <= 0) {
                        return;
                    }
                    new C2370pi(iA02, new C0853Dg(this)).A07();
                    return;
                }
            }
            this.A07.setToolbarActionMode(8);
            return;
        }
        this.A08.AH3(false);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0861Do
    public final void A1i(boolean z11) {
        this.A02.setChainedWatchAndBrowseSkippableStatus(z11);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0861Do
    public final void A1j(boolean z11) {
        if (this.A00 != null && this.A00.A05()) {
            this.A00.A06();
        }
        if (this.A01 != null) {
            this.A01.A06();
        }
        if (this.A02 != null) {
            this.A02.A1b(z11);
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0861Do
    public final void A1k(boolean z11) {
        if (this.A00 != null && !this.A00.A04()) {
            this.A00.A07();
        }
        if (this.A01 != null && !this.A01.A04()) {
            this.A01.A07();
        }
        if (this.A02 != null) {
            this.A02.A1c(z11);
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0861Do
    public final boolean A1o() {
        if (this.A02.A1d()) {
            if (!(this.A02 instanceof C0879Eg) || ((C0879Eg) this.A02).A1k()) {
                return (this.A02 instanceof EE) && !((EE) this.A02).A1m();
            }
            return true;
        }
        return false;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0861Do
    public final boolean A1p() {
        if (this.A02 instanceof C0879Eg) {
            return ((C0879Eg) this.A02).A1k();
        }
        if (this.A02 instanceof EE) {
            return ((EE) this.A02).A1m();
        }
        return false;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0861Do
    public final boolean A1q() {
        if (this.A02 instanceof C0879Eg) {
            return ((C0879Eg) this.A02).A1l();
        }
        if (this.A02 instanceof EE) {
            boolean zA1n = ((EE) this.A02).A1n();
            String[] strArr = A0A;
            if (strArr[3].length() == strArr[1].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0A;
            strArr2[5] = "28Vogccv9NIqO6rM4fplmtKTHGMh81ux";
            strArr2[6] = "2IsbBznITuMDsuWjFSmSm3tyrCYFg9A3";
            return zA1n;
        }
        return true;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0861Do
    public C2597tN getFullScreenAdStyle() {
        C1744fN colors = this.A02.getColors();
        return new C2597tN(this.A02.A1g(), C2597tN.A07, colors, ViewOnClickListenerC0884El.A05(super.A08), colors.A08(this.A02.A1g() || (this.A02 instanceof AbstractC0878Ef)), null);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0861Do, android.view.View
    public final void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        if (this.A02 instanceof C0879Eg) {
            this.A02.onConfigurationChanged(configuration);
        } else if (!super.A08.A32().A0U()) {
            A09(configuration.orientation);
        }
    }
}
