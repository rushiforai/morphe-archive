package com.facebook.ads.redexgen.X;

import android.content.Intent;
import android.graphics.Rect;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.RelativeLayout;
import com.facebook.ads.internal.protocol.AdPlacementType;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.HashMap;

/* renamed from: com.facebook.ads.redexgen.X.5p, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C06715p extends D8 {
    public static byte[] A0Y;
    public static String[] A0Z = {"Mriq29lS8vjEPztqvg4mnlhqPa1pf4jw", "J0ebGdEZD5oKohgNzUxMA3JiHaSF4bRJ", "IT9tvlYp44pYwsfxgtsksFS", "El43mrOkb3qqMjbYlNbneDDC3riKbt8u", "SsyQgLhJr8BA6K4Jeu0226NIXlotTSUK", "5pKSfcHcmxRzGJ6MCKbxSHPk9j0pnkgf", "vZ9Xs81YGHnjRjGsoTeSsIOHxP", "Y9Sammkz"};
    public int A00;
    public EnumC2231nN A01;
    public AbstractC2685un A02;
    public InterfaceC2393q5 A03;
    public C1814gV A04;
    public EnumC1664e4 A05;
    public boolean A06;
    public boolean A07;
    public boolean A08;
    public boolean A09;
    public boolean A0A;
    public boolean A0B;
    public boolean A0C;
    public boolean A0D;
    public boolean A0E;
    public boolean A0F;
    public boolean A0G;
    public boolean A0H;
    public boolean A0I;
    public boolean A0J;
    public final Handler A0K;
    public final View A0L;
    public final InterfaceC2004je A0M;
    public final InterfaceC2409qL A0N;
    public final C0804Bj A0O;
    public final C0799Be A0P;
    public final C5Z A0Q;
    public final BM A0R;
    public final BK A0S;
    public final BG A0T;
    public final BE A0U;
    public final BC A0V;
    public final BB A0W;
    public final C0781Am A0X;

    public static String A0A(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0Y, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 88);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0H() {
        A0Y = new byte[]{-3, 21, 7, 5, 21, -1, -54, -45, -42, -57, -55, -56, -61, -46, -40, -56, -46, -41, -35, -50, -37, -36, -35, -46, -35, -46, -54, -43, 65, 52, 70, 48, 65, 51, 52, 51, 46, 69, 56, 51, 52, 62, 46, 38, 36, 43};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    private synchronized void A0U(boolean z11, boolean z12) {
        if (this.A03 != null) {
            this.A0B = false;
            return;
        }
        if (this.A0B) {
            boolean zA2C = C2203mv.A2C(super.A05);
            if (!z11 && (!zA2C || !z12)) {
                if (z12) {
                    super.A05.A0F().AD2();
                }
                super.A05.A0F().ACm();
                super.A05.A0F().ABs();
                super.A0A.A5C(super.A0B.A7L());
                this.A04.A06();
                this.A0B = false;
                if (this.A02 != null) {
                    this.A02.A1R();
                }
                return;
            }
            this.A0B = false;
        }
    }

    static {
        A0H();
    }

    public C06715p(C0958Hi c0958Hi, InterfaceC2515s3 interfaceC2515s3, InterfaceC2224nG interfaceC2224nG, LA la2, C2086kz c2086kz, InterfaceC2459r9 interfaceC2459r9) {
        super(c0958Hi, interfaceC2515s3, interfaceC2224nG, la2, c2086kz, interfaceC2459r9);
        this.A0M = new C0830Cj(this);
        this.A0V = new BC() { // from class: com.facebook.ads.redexgen.X.5v
            /* JADX INFO: Access modifiers changed from: private */
            @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
            /* renamed from: A00, reason: merged with bridge method [inline-methods] */
            public final void A03(BD bd2) {
                this.A00.A0I = true;
                if (this.A00.A02 != null) {
                    this.A00.A02.A1Z(bd2);
                }
            }
        };
        this.A0U = new BE() { // from class: com.facebook.ads.redexgen.X.5u
            /* JADX INFO: Access modifiers changed from: private */
            @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
            /* renamed from: A00, reason: merged with bridge method [inline-methods] */
            public final void A03(BF bf2) {
                this.A00.A0J = true;
                this.A00.A0n();
                AbstractC2685un unused = this.A00.A02;
            }
        };
        this.A0T = new BG() { // from class: com.facebook.ads.redexgen.X.5t
            /* JADX INFO: Access modifiers changed from: private */
            @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
            /* renamed from: A00, reason: merged with bridge method [inline-methods] */
            public final void A03(C5W c5w) {
                AbstractC2685un unused = this.A00.A02;
            }
        };
        this.A0W = new BB() { // from class: com.facebook.ads.redexgen.X.5s
            /* JADX INFO: Access modifiers changed from: private */
            @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
            /* renamed from: A00, reason: merged with bridge method [inline-methods] */
            public final void A03(C5V c5v) {
                this.A00.A0R(c5v);
                this.A00.A0Q(c5v);
                if (this.A00.A02 != null) {
                    this.A00.A02.A1a(c5v, this.A00.A00);
                }
            }
        };
        this.A0R = new BM() { // from class: com.facebook.ads.redexgen.X.5r
            /* JADX INFO: Access modifiers changed from: private */
            @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
            /* renamed from: A00, reason: merged with bridge method [inline-methods] */
            public final void A03(C5Y c5y) {
                this.A00.A0P(c5y, this.A00.A0P.getState() != EnumC1549cC.A06, false);
            }
        };
        this.A0S = new C06725q(this);
        boolean z11 = false;
        this.A0I = false;
        this.A0J = false;
        this.A0H = false;
        this.A0G = false;
        this.A0D = false;
        this.A00 = 0;
        this.A08 = false;
        this.A06 = false;
        this.A07 = false;
        this.A0E = false;
        this.A0C = false;
        this.A0A = false;
        this.A01 = EnumC2231nN.A0c;
        this.A0K = new Handler(Looper.getMainLooper());
        this.A09 = false;
        this.A0N = new C0829Ci(this);
        this.A0P = new C0799Be(super.A05);
        this.A0P.setFunnelLoggingHandler(super.A07);
        if (A0V() && super.A03.A32().A0U()) {
            this.A0P.setBackgroundPlaybackEnabled(true);
        }
        this.A0P.getEventBus().A03(this.A0V, this.A0U, this.A0T, this.A0W, this.A0R, this.A0S);
        this.A0F = la2.A2g();
        this.A0Q = new C5Z(super.A05, super.A06, this.A0P, super.A03.A37(), 0, 0, super.A03.A32().A0V(), null, null);
        if (C2203mv.A20(super.A05)) {
            this.A0O = new C0804Bj(super.A05, super.A06, this.A0P, super.A03.A37(), super.A03.A32().A0V(), this.A0Q, null);
        } else {
            this.A0O = null;
        }
        this.A04 = new C1814gV(super.A05, super.A0B, super.A03.A1u(), interfaceC2459r9);
        if (!A0u()) {
            this.A0L = new C0786Ar(super.A05, super.A07);
        } else {
            this.A0L = new C0785Aq(super.A05, super.A07);
        }
        this.A0X = new C0781Am(super.A05, (super.A03.A2T() || A0u()) ? A02(super.A03) * 1000 : -1);
        if ((this.A0F && !super.A03.A2d()) || super.A03.A2U()) {
            this.A0X.setVisibility(8);
        }
        if (super.A03.A32().A0V() || super.A03.A2D()) {
            this.A0X.setShouldClearAnimationWhenVideoCompleted(false);
        }
        A0G();
        String strA09 = super.A03.A32().A0I().A09();
        if (strA09 != null) {
            this.A0P.setVideoURI(super.A04.A0T(strA09));
        }
        A0E();
        int iA04 = super.A03.A32().A0I().A04();
        if (C2203mv.A2R(super.A05)) {
            this.A0G = iA04 == 0;
        } else {
            this.A0G = iA04 <= 0;
        }
        if (super.A03.A32().A0T() && super.A03.A32().A0I().A03() > 0) {
            z11 = true;
        }
        this.A0B = z11;
        Integer toolbarBackgroundColor = getBackgroundColorForToolbar();
        if (toolbarBackgroundColor == null) {
            AbstractC2426qc.A0O(this, super.A03.A31().A01().A08(true));
        } else {
            AbstractC2426qc.A0O(this, toolbarBackgroundColor.intValue());
        }
        if (C2203mv.A2L(super.A05) || super.A03.A2T()) {
            super.A09.setProgressSpinnerInvisible(true);
        }
        if (super.A03.A2m()) {
            super.A05.A0F().AFa();
        }
    }

    private float A00() {
        float fA04 = super.A03.A32().A0I().A04();
        boolean isRV = super.A0B.A9O().equals(AdPlacementType.REWARDED_VIDEO.toString());
        if (fA04 == -1.0f && isRV && super.A03.A2Y()) {
            float videoDuration = this.A0P.getDuration();
            if (videoDuration <= 0.0f) {
                return 0.0f;
            }
            return videoDuration;
        }
        if (!this.A0F) {
            float serverUnskippableSeconds = this.A0P.getDuration();
            return Math.min(1000.0f * fA04, serverUnskippableSeconds);
        }
        float f11 = 1000.0f * fA04;
        if (A0Z[5].charAt(24) == 'W') {
            throw new RuntimeException();
        }
        String[] strArr = A0Z;
        strArr[0] = "0w7AakyEKCRQWNpHHPyyKzaZngxXUtrj";
        strArr[4] = "tySz9bX0dfmx3tXDjNXS5Q8B5RIoK4xE";
        return f11;
    }

    private int A01(int i5, int i11, int i12) {
        int i13 = 0;
        if (this.A0F) {
            int completedVideoCycleDuration = this.A00;
            i13 = i12 * completedVideoCycleDuration;
        }
        int completedVideoCycleDuration2 = i5 / 1000;
        return (i11 - i13) - completedVideoCycleDuration2;
    }

    public static int A02(LA la2) {
        if (la2.A1c().equals(A0A(28, 14, Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE))) {
            return la2.A32().A0I().A03();
        }
        if (la2.A1c().equals(A0A(16, 12, 17))) {
            return la2.A32().A0I().A04();
        }
        return 0;
    }

    private AbstractC2685un A06(int i5) throws SecurityException {
        C2688uq c2688uqA0M = new C2688uq(super.A05, super.A06, super.A0A, super.A03, this.A0P, super.A0C, super.A08).A0J(super.A09.getToolbarHeight()).A0P(super.A09).A0I(i5).A0K(this.A0L).A0R(this.A0X).A0M(super.A07);
        if (super.A03.A32().A0T() && C2203mv.A1d(super.A05) && super.A03.A32().A0M() != null) {
            c2688uqA0M.A0O(getPackageInstallListener());
        }
        c2688uqA0M.A0L(C1702eg.A00(super.A05, super.A06, A0A(0, 0, 25), AbstractC2351pP.A00(super.A03.A32().A0K().A06()), new HashMap(), super.A03.A33()));
        C2689ur params = c2688uqA0M.A0U();
        return AbstractC2686uo.A00(params, null, true);
    }

    private void A0B() {
        if (this.A02 == null || this.A09 || !A0Y()) {
            return;
        }
        this.A09 = true;
        this.A02.A02(new InterfaceC2643u7() { // from class: com.facebook.ads.redexgen.X.Co
            @Override // com.facebook.ads.redexgen.X.InterfaceC2643u7
            public final void AEZ() {
                this.A00.A0x();
            }
        });
    }

    private void A0C() {
        if (!A0Y()) {
            return;
        }
        if (this.A00 >= super.A03.A30() || (this.A0G && this.A08)) {
            if (A0X()) {
                super.A09.setToolbarActionMode(1);
                return;
            } else if (super.A03.A32().A0W()) {
                super.A09.setToolbarActionMode(1);
                return;
            } else {
                super.A09.setToolbarActionMode(0);
                return;
            }
        }
        if (this.A0H || this.A08 || this.A02 == null || !this.A02.A1e()) {
            return;
        }
        super.A02 = true;
        super.A09.setToolbarActionMode(8);
    }

    private void A0D() {
        this.A0P.postDelayed(new C0834Cn(this), C2203mv.A0M(super.A05));
    }

    private void A0E() {
        this.A0P.postDelayed(new C0833Cm(this), C2203mv.A0N(super.A05));
    }

    private void A0F() {
        this.A0G = true;
        super.A09.A0A();
        if (this.A02 != null) {
            this.A02.A1T();
        }
        if (A0Y() && !super.A03.A32().A0U() && !this.A08) {
            super.A02 = true;
            super.A09.setToolbarActionMode(8);
        }
    }

    private void A0G() {
        this.A0P.A0g(this.A0X);
        if (this.A0L instanceof InterfaceC1663e3) {
            this.A0P.A0g((InterfaceC1663e3) this.A0L);
        }
        if (!TextUtils.isEmpty(super.A03.A32().A0I().A08())) {
            C5B c5b = new C5B(super.A05, A0u());
            this.A0P.A0g(c5b);
            c5b.setImage(super.A03.A32().A0I().A08());
        }
        if (!A0u()) {
            AnonymousClass51 anonymousClass51 = new AnonymousClass51(super.A05, true, super.A07);
            this.A0P.A0g(anonymousClass51);
            this.A0P.A0g(new C0788At(anonymousClass51, EnumC1654du.A03, true));
        }
        this.A0P.A0g(new AnonymousClass55(super.A05));
    }

    private void A0I(EnumC2231nN enumC2231nN) {
        new C2232nO(super.A03.A37(), super.A05.A0A()).A04(enumC2231nN, null);
        super.A0A.A5C(super.A0B.A7L());
        this.A04.A06();
        if (this.A02 instanceof C06876f) {
            ((C06876f) this.A02).A1s();
        }
        if (!super.A03.A2d()) {
            this.A0K.postDelayed(new RunnableC2458r8(this), 2000L);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0J(EnumC2231nN enumC2231nN) {
        if (!this.A06) {
            this.A0C = true;
            this.A01 = enumC2231nN;
        } else {
            A0I(enumC2231nN);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00cc  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void A0P(C5Y c5y, boolean z11, boolean z12) {
        if (this.A03 != null) {
            if (z11) {
                C0958Hi c0958Hi = super.A05;
                if (A0Z[6].length() != 26) {
                    throw new RuntimeException();
                }
                String[] strArr = A0Z;
                strArr[2] = "N5ZIPH8mvSXK1CHoPTlSEsF";
                strArr[7] = "PVGkj9Ta";
                c0958Hi.A0F().AFb();
            }
            if (!z11) {
                this.A00++;
                if (this.A00 < super.A03.A30()) {
                    this.A0P.A0f(EnumC1664e4.A03, 32);
                    A0C();
                    return;
                }
            }
            super.A05.A0F().AFY();
            this.A03.AJp();
            return;
        }
        if (this.A0H) {
            return;
        }
        if (!z11 && this.A0B && this.A0F) {
            this.A00++;
            A0C();
            this.A0P.A0f(EnumC1664e4.A03, 20);
            return;
        }
        if (!this.A0G) {
            A0F();
        }
        if (!z11) {
            long j11 = this.A00;
            LA la2 = super.A03;
            String[] strArr2 = A0Z;
            if (strArr2[2].length() == strArr2[7].length()) {
                throw new RuntimeException();
            }
            String[] strArr3 = A0Z;
            strArr3[2] = "5WlMslfNSO4NdaYFrTQFrdU";
            strArr3[7] = "nA7o8u4P";
            if (j11 < la2.A32().A0H()) {
                this.A0P.A0f(EnumC1664e4.A03, 32);
            } else {
                this.A0H = true;
                if (this.A02 != null) {
                    this.A02.A1Y(c5y);
                }
            }
        }
        if (this.A00 == 0) {
            A0T(z11, z12);
        }
        this.A00++;
        A0C();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0Q(C5V c5v) {
        if (this.A0P.getState() == EnumC1549cC.A02 && C2203mv.A1e(super.A05)) {
            this.A0P.postDelayed(new C0832Cl(this, c5v), 5000L);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0R(C5V c5v) {
        float unskippableSeconds;
        int iA00 = c5v.A00();
        int totalSecondsForNextCta = super.A03.A32().A0I().A02();
        int currentPosMs = super.A03.A32().A0I().A05();
        int currentPosMs2 = A01(iA00, totalSecondsForNextCta, currentPosMs);
        if (totalSecondsForNextCta >= 0 && currentPosMs2 <= 0 && !super.A02) {
            if (super.A03.A32().A0U()) {
                A0C();
            }
            boolean zA0Y = A0Y();
            String[] strArr = A0Z;
            String str = strArr[2];
            String str2 = strArr[7];
            int totalSecondsForNextCta2 = str.length();
            int currentPosMs3 = str2.length();
            if (totalSecondsForNextCta2 == currentPosMs3) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0Z;
            strArr2[0] = "PXM0w4DTcyhv6xVVxlaJPbpxowOdlGPl";
            strArr2[4] = "ZagmJHoPVKqTZKI94Zh80WtjAbW4VeCE";
            if (!zA0Y && this.A02 != null && this.A02.A1e()) {
                super.A02 = true;
                super.A09.setToolbarActionMode(8);
            }
        }
        if (this.A0B) {
            int totalSecondsForNextCta3 = super.A03.A32().A0I().A03();
            int currentPosMs4 = super.A03.A32().A0I().A05();
            int iA01 = A01(iA00, totalSecondsForNextCta3, currentPosMs4);
            if (!ViewOnClickListenerC0884El.A05(super.A03)) {
                boolean zA2m = super.A03.A2m();
                String strA0A = A0A(0, 0, 25);
                if (!zA2m && !super.A03.A2e() && !super.A03.A2T() && iA01 > 0) {
                    super.A09.setToolbarActionMessage(super.A03.A36().A07().replace(A0A(0, 6, 74), String.valueOf(iA01)));
                } else {
                    super.A09.setToolbarActionMessage(strA0A);
                }
            }
            if (iA01 <= 0) {
                A0U(false, false);
            }
        }
        float fA00 = A00();
        float seenPercentage = iA00;
        if (this.A0F) {
            int totalSecondsForNextCta4 = this.A0P.getDuration();
            int currentPosMs5 = this.A00;
            seenPercentage += totalSecondsForNextCta4 * currentPosMs5;
        }
        if (!super.A03.A2Y() || fA00 > 0.0f) {
            unskippableSeconds = seenPercentage / fA00;
        } else {
            unskippableSeconds = 1.0f;
        }
        if (!super.A03.A2e()) {
            super.A09.setProgress(100.0f * unskippableSeconds);
        } else {
            int totalSecondsForNextCta5 = 0;
            if (fA00 - seenPercentage > 0.0f) {
                int currentPosMs6 = (int) (fA00 - seenPercentage);
                totalSecondsForNextCta5 = currentPosMs6 / 1000;
            }
            super.A09.A0C(100.0f * unskippableSeconds, totalSecondsForNextCta5);
        }
        if (unskippableSeconds >= 1.0f) {
            boolean z11 = this.A0G;
            if (A0Z[1].charAt(24) != 72) {
                A0Z[6] = "mHNt1GssQPcO8cYF0nuhoYQeR4";
                if (z11) {
                    return;
                }
            } else {
                A0Z[1] = "vYmMw1YN2p0SfEqcsof74RO3H51cScf2";
                if (z11) {
                    return;
                }
            }
            A0F();
            if (A0Y() && !super.A03.A32().A0U() && !this.A08) {
                int totalSecondsForNextCta6 = this.A00;
                int currentPosMs7 = super.A03.A30();
                if (totalSecondsForNextCta6 < currentPosMs7) {
                    return;
                }
            }
            AbstractC2452r2 abstractC2452r2 = super.A09;
            int currentPosMs8 = getCloseButtonStyle();
            abstractC2452r2.setToolbarActionMode(currentPosMs8);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0S(String str) {
        if (this.A0A) {
            return;
        }
        this.A0A = true;
        int currentPositionInMillis = 0;
        int duration = 0;
        if (this.A0P != null) {
            currentPositionInMillis = this.A0P.getCurrentPositionInMillis();
            duration = this.A0P.getDuration();
            this.A0P.A0c(3);
        }
        super.A05.A0F().A3x(str, super.A03.A32().A0I().A09());
        if (C2203mv.A1f(super.A05)) {
            A0P(new C5Y(currentPositionInMillis, duration), false, true);
        } else {
            super.A0A.A5C(super.A0B.A8c());
            super.A0A.A5C(super.A0B.A8X());
        }
    }

    private void A0T(boolean z11, boolean z12) {
        super.A09.setToolbarActionMessage(A0A(0, 0, 25));
        A0U(z11, z12);
        if (z12) {
            LA la2 = super.A03;
            if (A0Z[1].charAt(24) != 'H') {
                throw new RuntimeException();
            }
            A0Z[3] = "XTN7FCDfoUdb64gs1zMYgI4kZpqZ7S6q";
            if (la2.A32().A0U()) {
                C0958Hi c0958Hi = super.A05;
                if (A0Z[1].charAt(24) != 'H') {
                    c0958Hi.A0F().AD4();
                } else {
                    A0Z[3] = "47QzYZMXBFaMNKQWAAXNDRZZJ8BjsjJR";
                    c0958Hi.A0F().AD4();
                }
            } else {
                super.A05.A0F().AD3();
            }
            super.A09.setToolbarActionMode(0);
            return;
        }
        if (!A0Y() || super.A03.A32().A0U() || this.A08 || this.A00 >= super.A03.A30()) {
            if (this.A02 == null || !this.A02.A1f()) {
                AbstractC2452r2 abstractC2452r2 = super.A09;
                int closeButtonStyle = getCloseButtonStyle();
                if (A0Z[3].charAt(0) == 'z') {
                    throw new RuntimeException();
                }
                A0Z[1] = "xwJYO5pEYXQlWGzn44n7lg2ZHLg1iQnB";
                abstractC2452r2.setToolbarActionMode(closeButtonStyle);
            }
        }
    }

    private boolean A0V() {
        return C2301oY.A00(EnumC2303oa.A00(super.A03.A1V()), super.A05) == EnumC2299oW.A03;
    }

    private boolean A0W() {
        return AbstractC2377pp.A02(this.A03 != null, super.A03);
    }

    private boolean A0X() {
        return AbstractC2377pp.A03(this.A03 != null, super.A03);
    }

    private boolean A0Y() {
        return super.A03.A3G() || A0W();
    }

    @Override // com.facebook.ads.redexgen.X.D8
    public final AbstractC2452r2 A0l() {
        AbstractC2452r2 abstractC2452r2A0l = super.A0l();
        if (A0u() && super.A03.A3R()) {
            abstractC2452r2A0l.setOnTouchListener(new ViewOnTouchListenerC2423qZ(this));
        }
        if (super.A03.A3R()) {
            abstractC2452r2A0l.setOnClickListener(new ViewOnClickListenerC2498rm(this));
        }
        return abstractC2452r2A0l;
    }

    @Override // com.facebook.ads.redexgen.X.D8
    public final void A0m() {
        Rect requestedMargins;
        super.A0m();
        if (!super.A03.A2D() || (requestedMargins = super.A09.getRequestedMargins()) == null) {
            return;
        }
        RelativeLayout.LayoutParams layoutParams = (RelativeLayout.LayoutParams) this.A0L.getLayoutParams();
        layoutParams.setMargins(layoutParams.leftMargin, requestedMargins.top, layoutParams.rightMargin, layoutParams.bottomMargin);
        this.A0L.setLayoutParams(layoutParams);
    }

    /* JADX WARN: Code restructure failed: missing block: B:26:0x00a4, code lost:
    
        if (r4 != null) goto L27;
     */
    /* JADX WARN: Code restructure failed: missing block: B:27:0x00a6, code lost:
    
        r6.A03.AJp();
     */
    /* JADX WARN: Code restructure failed: missing block: B:29:0x00b8, code lost:
    
        if (r4 != null) goto L27;
     */
    /* JADX WARN: Code restructure failed: missing block: B:31:0x00bb, code lost:
    
        r6.A09.setToolbarActionMode(0);
     */
    /* JADX WARN: Code restructure failed: missing block: B:56:?, code lost:
    
        return;
     */
    /* JADX WARN: Code restructure failed: missing block: B:57:?, code lost:
    
        return;
     */
    @Override // com.facebook.ads.redexgen.X.D8
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void A0p() {
        if (this.A02 != null) {
            super.A07.A04(EnumC2231nN.A0Y, null);
            this.A08 = true;
            if (A0Y()) {
                boolean zA0U = super.A03.A32().A0U();
                if (A0Z[3].charAt(0) == 'z') {
                    throw new RuntimeException();
                }
                A0Z[6] = "WS6XRyojI7wRzuVEbM5ifGt6Qv";
                if (!zA0U) {
                    this.A0H = true;
                    if (!A0W() && super.A03.A32().A0W()) {
                        this.A02.A1Y(new C5Y(0, 0));
                    }
                    this.A02.A1P(A0A(6, 10, 12));
                    A0o();
                    if (A0W()) {
                        if (this.A03 != null) {
                            this.A03.AJq(true);
                            return;
                        }
                        return;
                    } else {
                        if (super.A03.A32().A0W()) {
                            return;
                        }
                        InterfaceC2393q5 interfaceC2393q5 = this.A03;
                        String[] strArr = A0Z;
                        if (strArr[0].charAt(8) != strArr[4].charAt(8)) {
                            String[] strArr2 = A0Z;
                            strArr2[0] = "XCg1OkDZUljk4loj3bMgxKpCebMdAIHS";
                            strArr2[4] = "MJC3gYMFFxcRjQpcNeHuOFYfCtR0PnIE";
                        } else {
                            String[] strArr3 = A0Z;
                            strArr3[0] = "5ZPBHlBRyJvCh0QPLFAtMk03BU0JymQL";
                            strArr3[4] = "3wgXV45N5s7NnRbzh4MqlvFervBOij8m";
                        }
                    }
                }
            }
            if (super.A03.A3K() && super.A03.A32().A0U()) {
                this.A02.A1V();
                A0o();
                return;
            }
            if (super.A03.A32().A0I().A07() != null) {
                this.A0P.A0e(EnumC1718ex.A06);
                if (C2203mv.A1G(super.A05)) {
                    super.A03.A32().A0I().A07().A0V(false);
                }
            }
            EnumC1698ec enumC1698ecA1P = this.A02.A1P(A0A(42, 4, 99));
            if (super.A03.A3H()) {
                return;
            }
            EnumC1698ec actionOutcome = EnumC1698ec.A08;
            if (enumC1698ecA1P != actionOutcome) {
                EnumC1698ec actionOutcome2 = EnumC1698ec.A05;
                if (enumC1698ecA1P != actionOutcome2) {
                    A0o();
                    return;
                }
                return;
            }
            return;
        }
        super.A07.A04(EnumC2231nN.A0Z, null);
    }

    @Override // com.facebook.ads.redexgen.X.D8
    public final void A0q() {
        AbstractC2426qc.A0M(this.A02);
        this.A0P.setVisibility(4);
        if (!super.A03.A2a()) {
            A0v();
        }
    }

    @Override // com.facebook.ads.redexgen.X.D8
    public final void A0s(C1998jY c1998jY) {
        FrameLayout.LayoutParams layoutParams;
        c1998jY.A0A(this.A0M);
        int orientation = c1998jY.A05().getResources().getConfiguration().orientation;
        this.A02 = A06(orientation);
        this.A02.setAccidentalClickCappingListener(new InterfaceC1699ed() { // from class: com.facebook.ads.redexgen.X.Cq
            @Override // com.facebook.ads.redexgen.X.InterfaceC1699ed
            public final void ADg() {
                this.A00.A0w();
            }
        });
        this.A02.setNtdHideCallback(new InterfaceC2684um() { // from class: com.facebook.ads.redexgen.X.Cp
            @Override // com.facebook.ads.redexgen.X.InterfaceC2684um
            public final void AEO(View view) {
                this.A00.A0y(view);
            }
        });
        A0B();
        A0r(this.A02);
        if (super.A01 != null) {
            addView(super.A01, D8.A0H);
        }
        boolean z11 = false;
        if (A0u()) {
            layoutParams = new FrameLayout.LayoutParams(-1, -2);
            Rect requestedMargins = super.A09.getRequestedMargins();
            if (requestedMargins == null) {
                int i5 = AbstractC2383pv.A0x;
                int orientation2 = AbstractC2383pv.A0u;
                layoutParams.setMargins(i5, orientation2, 0, 0);
            } else {
                int i11 = requestedMargins.left;
                int i12 = requestedMargins.top;
                int i13 = requestedMargins.right;
                int orientation3 = requestedMargins.bottom;
                layoutParams.setMargins(i11, i12, i13, orientation3);
            }
        } else {
            int orientation4 = super.A09.getToolbarHeight();
            layoutParams = new FrameLayout.LayoutParams(-1, orientation4);
        }
        addView(super.A09, layoutParams);
        AbstractC2426qc.A0I(this.A02);
        AbstractC2426qc.A0I(super.A09);
        if (super.A03.A2a() && (this.A02 instanceof C06876f)) {
            ((C06876f) this.A02).setVideoAdViewListener(this.A0N);
        }
        if (this.A02 != null && this.A02.A1g()) {
            z11 = true;
        }
        setUpFullscreenMode(z11);
    }

    @Override // com.facebook.ads.redexgen.X.D8
    public final boolean A0t() {
        if (A0X() && this.A03 != null) {
            this.A03.AJp();
            return true;
        }
        if (this.A02 != null) {
            boolean zA1i = this.A02.A1i(this.A0B);
            if (A0Z[1].charAt(24) != 'H') {
                throw new RuntimeException();
            }
            A0Z[5] = "PjX677y3xFaSF5oXF3qbgmTzrt0PFCCH";
            if (zA1i) {
                return true;
            }
        }
        return false;
    }

    @Override // com.facebook.ads.redexgen.X.D8
    public final boolean A0u() {
        if (super.A03.A32().A0I().A07() == null) {
            return super.A03.A2o() || super.A03.A2q() || super.A03.A2K();
        }
        return super.A03.A2Z();
    }

    public final void A0v() {
        this.A0P.setVisibility(0);
        AbstractC2426qc.A0M(super.A09);
        this.A0P.setVolume(super.A03.A32().A0I().A0A() ? 0.0f : 1.0f);
        if (A0u() && (this.A02 instanceof C06876f)) {
            ((C06876f) this.A02).A1t(getResources().getConfiguration().orientation);
            ((C06876f) this.A02).A1r();
        }
        C0799Be c0799Be = this.A0P;
        EnumC1664e4 enumC1664e4 = EnumC1664e4.A03;
        if (A0Z[3].charAt(0) == 'z') {
            throw new RuntimeException();
        }
        String[] strArr = A0Z;
        strArr[2] = "yzu62sc2dSvrPluyJul898U";
        strArr[7] = "BptueeIM";
        c0799Be.A0f(enumC1664e4, 20);
        if (this.A02 != null && this.A0B) {
            this.A02.A1S();
        }
        if (this.A02 != null && !this.A0G) {
            this.A02.A1U();
        }
        A0D();
    }

    public final /* synthetic */ void A0w() {
        A0o();
    }

    public final /* synthetic */ void A0x() {
        this.A08 = true;
        if (!super.A03.A32().A0U()) {
            A0C();
        }
    }

    public final /* synthetic */ void A0y(View view) {
        if (super.A03.A3L()) {
            A0o();
        }
        if (super.A03.A3M() && view != null) {
            view.setOnClickListener(null);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final void AGF(boolean z11) {
        this.A06 = false;
        if (this.A02 != null) {
            AbstractC2685un abstractC2685un = this.A02;
            String[] strArr = A0Z;
            if (strArr[2].length() == strArr[7].length()) {
                throw new RuntimeException();
            }
            A0Z[3] = "DxLukbpSoMpyRTcBEXGLoW65RDWaIRjT";
            abstractC2685un.A1b(z11);
        }
        if (((this.A07 || A0V()) && super.A03.A32().A0U()) || this.A0P.getVisibility() != 0 || this.A0P.A0o()) {
            return;
        }
        this.A05 = this.A0P.getVideoStartReason();
        this.A0D = z11;
        this.A0P.A0j(false, 13);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final void AGp(boolean z11) {
        this.A06 = true;
        if (this.A02 != null) {
            this.A02.A1c(z11);
        }
        if (this.A0C) {
            this.A0C = false;
            A0I(this.A01);
        }
        if (this.A0P.getVisibility() == 0 && !this.A0P.A0p()) {
            boolean z12 = this.A0H;
            String[] strArr = A0Z;
            if (strArr[0].charAt(8) != strArr[4].charAt(8)) {
                A0Z[1] = "5vrQw9TAnlgebYwA7tbvLzoGHglPMjBr";
                if (z12 || this.A0P.getState() == EnumC1549cC.A06 || this.A05 == null) {
                    return;
                }
                if (!this.A0D || z11) {
                    C0799Be c0799Be = this.A0P;
                    EnumC1664e4 enumC1664e4 = this.A05;
                    if (A0Z[5].charAt(24) != 'W') {
                        String[] strArr2 = A0Z;
                        strArr2[2] = "V4H5krvJNTMOac6aZZgfGmx";
                        strArr2[7] = "t2XfRzhW";
                        c0799Be.A0f(enumC1664e4, 19);
                        return;
                    }
                } else {
                    return;
                }
            }
            throw new RuntimeException();
        }
    }

    private int getCloseButtonStyle() {
        if (A0X()) {
            return 1;
        }
        if (this.A02 != null) {
            return this.A02.getCloseButtonStyle();
        }
        return 0;
    }

    private InterfaceC2396q8 getPackageInstallListener() {
        return new C0831Ck(this);
    }

    public int getVideoPlayCount() {
        return this.A00;
    }

    @Override // com.facebook.ads.redexgen.X.D8, com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final boolean onActivityResult(int i5, int i11, Intent intent) {
        if (this.A02 != null) {
            return this.A02.A1h(i5, i11, intent);
        }
        return false;
    }

    @Override // com.facebook.ads.redexgen.X.D8, com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final void onDestroy() {
        super.onDestroy();
        if (C2203mv.A1z(super.A05)) {
            super.A05.A0B().ALo(this.A0P);
        }
        if (this.A02 != null) {
            this.A02.A1Q();
        }
        if (this.A0P != null) {
            if (!this.A0H) {
                this.A0P.A0e(EnumC1718ex.A06);
            }
            this.A0P.getEventBus().A04(this.A0V, this.A0U, this.A0T, this.A0W, this.A0R, this.A0S);
            this.A0P.A0X();
        }
        if (this.A0O != null) {
            this.A0O.A07();
        }
        this.A0Q.A0p();
        this.A0K.removeCallbacksAndMessages(null);
    }

    @Override // com.facebook.ads.redexgen.X.D8, com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final void onStart() {
        if (!this.A0E) {
            return;
        }
        this.A0E = false;
        if (this.A0P.getVisibility() == 0 && !this.A0P.A0p() && !this.A0H && this.A0P.getState() != EnumC1549cC.A06 && this.A05 != null) {
            this.A0P.A0f(this.A05, 19);
        }
    }

    @Override // com.facebook.ads.redexgen.X.D8, com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final void onStop() {
        if ((!this.A07 && !A0V()) || !super.A03.A32().A0U() || this.A0P.getVisibility() != 0 || this.A0P.A0o()) {
            return;
        }
        this.A05 = this.A0P.getVideoStartReason();
        this.A0E = true;
        this.A0P.A0j(false, 3);
    }

    public void setCctActive(boolean z11) {
        this.A07 = z11;
    }

    public void setServerSideRewardHandler(C1814gV c1814gV) {
        this.A04 = c1814gV;
    }

    public void setVideoLeadingPlayableAdListener(InterfaceC2393q5 interfaceC2393q5) {
        this.A03 = interfaceC2393q5;
        A0B();
    }
}
