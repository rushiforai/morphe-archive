package com.facebook.ads.redexgen.X;

import android.content.res.Configuration;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.widget.RelativeLayout;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.HashMap;
import kotlin.Metadata;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.6M, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class C6M extends AbstractC0861Do {
    public static byte[] A0D;
    public static String[] A0E = {"UzutHhweNKA6I6XDZye6UhBKaL9x6j29", "4hoNcuDBHqhxwa87", "K9Pp3y8diVelGbM7aQpqLBr68c6UUhMz", "y3BzvMqIeQRH2aQx", "XzKBwpVR9JGJkXe", "RT6mp0SPjZzcwqF6Xr39KNrE10CRftIA", "GSsPkrMKr0cmxxP", "XUrnCKxzP99jksvK45kzmcN4iGFy0nJd"};
    public static final C1F A0F;
    public static final RelativeLayout.LayoutParams A0G;
    public FG A00;
    public ViewOnClickListenerC0884El A01;
    public C2673ub A02;
    public C2701v3 A03;
    public C2190mi A04;
    public C1814gV A05;
    public boolean A06;
    public boolean A07;
    public final int A08;
    public final C2232nO A09;
    public final AbstractC2452r2 A0A;
    public final InterfaceC2511rz A0B;
    public final boolean A0C;

    public static String A05(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0D, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            byte b11 = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 62);
            String[] strArr = A0E;
            if (strArr[2].charAt(16) == strArr[0].charAt(16)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0E;
            strArr2[3] = "4smmZYi0Af2QJONg";
            strArr2[1] = "4xmyMBYTJ6PUAhDX";
            bArrCopyOfRange[i13] = b11;
        }
        return new String(bArrCopyOfRange);
    }

    public static void A06() {
        A0D = new byte[]{118, 115, 85, 114, AbstractJsonLexerKt.TC_INVALID, 118, 97, 126, 120, 101, 69, 64, 103, 69, 71, 76, 65, 105, 69, 74, 69, 67, 65, 86, 80, 85, 114, 94, 95, 69, 84, 73, 69, 102, 67, 80, 65, 65, 84, 67, 37, 32, 0, 37, 48, 37, 6, 49, 42, 32, 40, 33, 55, 50, 19, 32, 51, 56, 34, 27, 55, 56, 55, 49, 51, 36, 113, 122, 115, 123, 124, 119, 118, 81, 122, 123, 126, 118, 83, 118, 94, 123, 97, 102, 119, 124, 119, 96, 42, 38, 39, 47, 32, 46, 59, 40, 51, 51, 56, 49, 17, 50, 58, 58, 52, 51, 58, 21, 60, 51, 57, 49, 56, 47, 24, 26, 17, 26, 13, 22, 28, 60, 62, 47, 11, 52, 41, 47, 41, 58, 50, 47, 24, 52, 55, 52, 41, 18, 53, 61, 52, 115, 117, 117, 117, 114, 86, 83, 73, 78, 95, 84, 95, 72, 19, 63, 26, 61, 17, 16, 10, 27, 6, 10, 41, 12, 31, 14, 14, 27, 12, 49, 29, 56, 24, 61, 40, 61, 30, 41, 50, 56, 48, 57, 87, 118, 83, 73, 78, 95, 84, 95, 72, 113, 105, 107, 114, 117, 105, 115, 116, 101, 99, 119, 108, 108, 111, 97, 98, 113};
    }

    static {
        A06();
        A0F = new C1F(null);
        A0G = new RelativeLayout.LayoutParams(-1, -1);
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C6M(C0958Hi c0958Hi, InterfaceC2515s3 interfaceC2515s3, int i5, InterfaceC2224nG interfaceC2224nG, LA la2, InterfaceC2459r9 interfaceC2459r9, AbstractC2452r2 abstractC2452r2, C2232nO c2232nO, C2086kz c2086kz, boolean z11, boolean z12, InterfaceC2511rz interfaceC2511rz, int i11, int i12, boolean z13) {
        super(c0958Hi, interfaceC2515s3, interfaceC2224nG, la2, i5, z11, z12, interfaceC2459r9, i12);
        C1h.A09(c0958Hi, A05(24, 16, 15));
        C1h.A09(interfaceC2515s3, A05(0, 10, 41));
        C1h.A09(interfaceC2224nG, A05(52, 14, 104));
        C1h.A09(la2, A05(40, 12, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE));
        C1h.A09(interfaceC2459r9, A05(146, 8, 4));
        C1h.A09(abstractC2452r2, A05(Sdk.SDKError.Reason.AD_IS_LOADING_VALUE, 7, 61));
        C1h.A09(c2232nO, A05(94, 20, 99));
        C1h.A09(c2086kz, A05(10, 14, 26));
        C1h.A09(interfaceC2511rz, A05(66, 22, 44));
        this.A0A = abstractC2452r2;
        this.A09 = c2232nO;
        this.A0B = interfaceC2511rz;
        this.A08 = i11;
        this.A0C = z13;
        super.A01 = this.A0C;
        if (!this.A0C && (la2 instanceof C07147g)) {
            this.A07 = true;
            this.A00 = new FG();
            FG fg2 = this.A00;
            C1h.A06(fg2);
            this.A05 = new C1814gV(c0958Hi, fg2, super.A08.A1u(), interfaceC2459r9);
        }
        A07();
        A08();
    }

    private final void A07() {
        this.A04 = new C2190mi(super.A09, super.A08, super.A0A, this.A0F, super.A0C, this.A0D, this.A0A, this.A09);
        ViewOnClickListenerC0884El regularCtaForEndCard = getRegularCtaForEndCard();
        this.A01 = regularCtaForEndCard;
        C2190mi c2190mi = this.A04;
        if (c2190mi != null) {
            c2190mi.A0q(regularCtaForEndCard);
        }
    }

    private final void A08() {
        C2190mi c2190mi = this.A04;
        if (c2190mi == null || c2190mi.A0d() == null) {
            return;
        }
        c2190mi.A0s(true);
        c2190mi.A0i();
        if (super.A01) {
            c2190mi.A0r(AbstractC0861Do.A1V(super.A07, super.A06));
        }
        ViewOnClickListenerC0884El viewOnClickListenerC0884El = this.A01;
        if (viewOnClickListenerC0884El != null) {
            c2190mi.A0p(viewOnClickListenerC0884El);
        }
        c2190mi.A0j();
        c2190mi.A0h();
        addView(c2190mi.A0d(), A0G);
        String[] strArr = A0E;
        if (strArr[3].length() != strArr[1].length()) {
            throw new RuntimeException();
        }
        String[] strArr2 = A0E;
        strArr2[3] = "lHfXLdp7I01w499Y";
        strArr2[1] = "KBmZBlGM3V5mcO8y";
        A1f();
    }

    private final void A09() {
        C2190mi c2190mi = this.A04;
        if (c2190mi != null) {
            c2190mi.A0n(this.A08, new C0859Dm(this));
        }
    }

    private final void A0A() {
        this.A0A.setToolbarActionMode(2);
        long j11 = this.A08 * 1000;
        C2190mi c2190mi = this.A04;
        if (c2190mi != null) {
            c2190mi.A0n(j11, new C0858Dl(this));
        }
    }

    private final boolean A0B() {
        C1746fP c1746fPA0K;
        String strA06;
        C1735fE c1735fEA32 = super.A08.A32();
        if (c1735fEA32 == null || (c1746fPA0K = c1735fEA32.A0K()) == null || (strA06 = c1746fPA0K.A06()) == null) {
            return false;
        }
        try {
            Uri uriA00 = AbstractC2351pP.A00(strA06);
            C1h.A06(uriA00);
            return C2141lu.A0S.A03(uriA00) == null;
        } catch (SecurityException e3) {
            super.A09.A08().ABz(A05(114, 7, 65), AbstractC2126lf.A2a, new C2127lg(e3));
            return false;
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0861Do
    public final EnumC1698ec A1a(String str) {
        EnumC1698ec enumC1698ecA0E;
        C1h.A09(str, A05(197, 6, 56));
        ViewOnClickListenerC0884El viewOnClickListenerC0884El = this.A01;
        return (viewOnClickListenerC0884El == null || (enumC1698ecA0E = viewOnClickListenerC0884El.A0E(A05(193, 4, 60))) == null) ? EnumC1698ec.A08 : enumC1698ecA0E;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0861Do
    public final void A1b() {
        super.A1b();
        C2190mi c2190mi = this.A04;
        if (c2190mi != null) {
            c2190mi.A0e();
        }
        C2673ub c2673ub = this.A02;
        if (c2673ub != null) {
            c2673ub.A0E();
        }
        this.A0F.A0V();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0861Do
    public final void A1g() {
        RelativeLayout relativeLayoutA0d;
        if (this.A0C) {
            C0958Hi c0958Hi = super.A09;
            String[] strArr = A0E;
            if (strArr[2].charAt(16) == strArr[0].charAt(16)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0E;
            strArr2[3] = "SyHgw7Sy9rEYHKXs";
            strArr2[1] = "XGzC0gT38krGJvRo";
            c0958Hi.A0F().A5W();
        }
        this.A06 = true;
        C2190mi c2190mi = this.A04;
        if (c2190mi != null) {
            c2190mi.A0l();
        }
        C2190mi c2190mi2 = this.A04;
        if (c2190mi2 != null && (relativeLayoutA0d = c2190mi2.A0d()) != null) {
            relativeLayoutA0d.removeAllViews();
        }
        if (A0B()) {
            C0958Hi c0958Hi2 = super.A09;
            C1h.A08(c0958Hi2, A05(154, 17, 64));
            LA la2 = super.A08;
            C1h.A08(la2, A05(171, 13, 98));
            C2232nO c2232nO = this.A09;
            Handler handler = new Handler(Looper.getMainLooper());
            InterfaceC2459r9 interfaceC2459r9 = this.A0D;
            C1h.A08(interfaceC2459r9, A05(184, 9, 4));
            this.A02 = new C2673ub(c0958Hi2, la2, c2232nO, handler, interfaceC2459r9);
            C2673ub c2673ub = this.A02;
            addView(c2673ub != null ? c2673ub.A0D(this.A01) : null);
        } else {
            this.A03 = new C2701v3(super.A09, super.A08, this.A09, new Handler(Looper.getMainLooper()), this.A0D);
            C2701v3 c2701v3 = this.A03;
            if (c2701v3 != null) {
                c2701v3.A0K(false);
            }
            C2701v3 c2701v32 = this.A03;
            addView(c2701v32 != null ? c2701v32.A0E(this.A01) : null);
        }
        this.A0A.bringToFront();
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x0027  */
    @Override // com.facebook.ads.redexgen.X.AbstractC0861Do
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void A1h() {
        if (this.A08 > 0) {
            if (this.A0C) {
                A09();
            } else {
                A0A();
            }
            int iA02 = super.A08.A32().A0I().A02();
            if (iA02 >= 0) {
                this.A0A.setProgressSpinnerInvisible(true);
            }
            if (iA02 != 0) {
                int secondsForNextCta = this.A08;
                if (iA02 >= secondsForNextCta) {
                    this.A0A.setToolbarActionMode(8);
                } else if (iA02 > 0) {
                    new C2370pi(iA02, new C0860Dn(this)).A07();
                }
            }
        } else {
            this.A0B.AH3(false);
        }
        A1f();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0861Do
    public final void A1j(boolean z11) {
        C2190mi c2190mi = this.A04;
        if (c2190mi != null) {
            c2190mi.A0f();
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0861Do
    public final void A1k(boolean z11) {
        C2190mi c2190mi = this.A04;
        if (c2190mi != null) {
            c2190mi.A0g();
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0861Do
    public final boolean A1o() {
        if (super.A08.A2H()) {
            boolean z11 = this.A06;
            String[] strArr = A0E;
            if (strArr[3].length() != strArr[1].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0E;
            strArr2[3] = "EMpXE7ymYpQm8ghS";
            strArr2[1] = "p1eQOWvOMAlHDzhH";
            if (!z11) {
                return true;
            }
        }
        return false;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0861Do
    public final boolean A1p() {
        return this.A06;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0861Do
    public final boolean A1q() {
        return true;
    }

    public final void A1s() {
        this.A0A.setToolbarActionMode(2);
        ViewOnClickListenerC0884El viewOnClickListenerC0884El = this.A01;
        if (viewOnClickListenerC0884El != null) {
            viewOnClickListenerC0884El.A0E(A05(193, 4, 60));
        }
    }

    public final boolean A1t() {
        if (this.A0A.getToolbarActionMode() == 0) {
            return false;
        }
        if (this.A0A.getToolbarActionMode() == 1) {
            this.A0A.setToolbarActionMode(2);
            A1g();
            this.A0A.setToolbarActionMode(0);
        }
        return true;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0861Do
    public C2597tN getFullScreenAdStyle() {
        C1744fN c1744fNA01 = super.A08.A31().A01();
        C1h.A08(c1744fNA01, A05(Sdk.SDKError.Reason.TPAT_ERROR_VALUE, 25, 101));
        return new C2597tN(false, C2597tN.A07, c1744fNA01, ViewOnClickListenerC0884El.A05(super.A08), c1744fNA01.A08(false), null);
    }

    private final ViewOnClickListenerC0884El getRegularCtaForEndCard() {
        ViewOnClickListenerC0884El button = new ViewOnClickListenerC0884El(super.A09, super.A08.A1X(), super.A08.A31().A01(), super.A0A, this.A0D, this.A0F, super.A0C, super.A08.A33());
        button.setViewShowsOverMedia(true);
        AbstractC2426qc.A0L(button);
        button.setText((CharSequence) super.A08.A32().A0K().A05());
        AbstractC2426qc.A0H(1001, button);
        button.setCta(super.A08.A32().A0K(), super.A08.A37(), new HashMap(), null);
        return button;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0861Do, android.view.View
    public final void onConfigurationChanged(Configuration configuration) {
        C1h.A09(configuration, A05(88, 6, Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE));
        super.onConfigurationChanged(configuration);
    }
}
