package com.facebook.ads.redexgen.X;

import android.app.Activity;
import android.content.Intent;
import android.content.res.Configuration;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.MotionEvent;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.RelativeLayout;
import com.facebook.ads.internal.view.FullScreenAdToolbar;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;

/* loaded from: assets/audience_network/classes.dex */
public final class D2 extends FrameLayout implements InterfaceC2460rA {
    public static byte[] A0L;
    public static String[] A0M = {"n8b1XAz0kHAkpiWEmzC3t1pF5U", "eWK394xXCAUBfgpESuKIG56NqbrNFWJq", "5CdOn8t3diym6HDjOq5Y6uNvOx4lt5g3", "HN0pIlpAYl374dQUYji0gU", "nPJn2NzIeBIJ0ob92wkGV5", "7vv965TmOe", "OL6PAd", "N5PSCRASy1"};
    public static final RelativeLayout.LayoutParams A0N;
    public int A00;
    public int A01;
    public int A02;
    public C2650uE A03;
    public AbstractC0861Do A04;
    public C1814gV A05;
    public boolean A06;
    public boolean A07;
    public boolean A08;
    public boolean A09;
    public final C1048Kz A0A;
    public final InterfaceC2004je A0B;
    public final C2086kz A0C;
    public final C0958Hi A0D;
    public final InterfaceC2224nG A0E;
    public final C2232nO A0F;
    public final ViewOnSystemUiVisibilityChangeListenerC2412qO A0G;
    public final AbstractC2452r2 A0H;
    public final InterfaceC2459r9 A0I;
    public final InterfaceC2515s3 A0J;
    public final ArrayList<C2597tN> A0K;

    public static String A0D(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0L, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 39);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0I() {
        A0L = new byte[]{113, -64, -73, 113, -62, -27, -95};
        String[] strArr = A0M;
        if (strArr[3].length() != strArr[4].length()) {
            throw new RuntimeException();
        }
        A0M[2] = "BvaU1dA3vF4hXYIjQV5InfWnSlZ4OmYy";
    }

    static {
        A0I();
        A0N = new RelativeLayout.LayoutParams(-1, -1);
    }

    public D2(C0958Hi c0958Hi, InterfaceC2515s3 interfaceC2515s3, InterfaceC2224nG interfaceC2224nG, C1048Kz c1048Kz, C2086kz c2086kz, InterfaceC2459r9 interfaceC2459r9) {
        FrameLayout.LayoutParams layoutParams;
        super(c0958Hi);
        this.A0K = new ArrayList<>();
        this.A09 = false;
        this.A07 = false;
        this.A08 = false;
        this.A06 = true;
        this.A02 = 1;
        this.A00 = 0;
        this.A01 = 0;
        this.A0B = new D5(this);
        this.A0D = c0958Hi;
        this.A0J = interfaceC2515s3;
        this.A0E = interfaceC2224nG;
        this.A0A = c1048Kz;
        this.A0C = c2086kz;
        this.A0I = interfaceC2459r9;
        this.A0F = new C2232nO(this.A0A.A2z(0).A37(), this.A0E);
        this.A0G = new ViewOnSystemUiVisibilityChangeListenerC2412qO(this);
        this.A0G.A05(EnumC2411qN.A03);
        this.A05 = new C1814gV(this.A0D, this.A0J, this.A0A.A1u(), interfaceC2459r9);
        this.A0H = A07();
        if (this.A0A.A2M()) {
            layoutParams = new FrameLayout.LayoutParams(-1, -2);
            layoutParams.setMargins(AbstractC2383pv.A0x, AbstractC2383pv.A0u, 0, 0);
        } else {
            layoutParams = new FrameLayout.LayoutParams(-1, this.A0H.getToolbarHeight());
        }
        addView(this.A0H, layoutParams);
    }

    /* JADX WARN: Code restructure failed: missing block: B:48:0x00eb, code lost:
    
        if (r7.A04.A1o() != false) goto L57;
     */
    /* JADX WARN: Removed duplicated region for block: B:103:0x01f3  */
    /* JADX WARN: Removed duplicated region for block: B:18:0x0051  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x00a4  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x00b2  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x00fd  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x011c  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x011e  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x013b  */
    /* JADX WARN: Removed duplicated region for block: B:69:0x015c  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x0162  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private int A00() {
        String[] strArr;
        if (!this.A09) {
            if (this.A04 != null && this.A04.A1p() && this.A0A.A2u() == 1) {
                AbstractC0861Do abstractC0861Do = this.A04;
                String[] strArr2 = A0M;
                if (strArr2[7].length() == strArr2[5].length()) {
                    A0M[1] = "h3DELnp0sNRc9bbpqXLt3U6CPzizCup7";
                    if (abstractC0861Do.A1q()) {
                        A0X(false, this.A02);
                        return 1;
                    }
                }
            }
            return 0;
        }
        AbstractC0861Do abstractC0861Do2 = this.A04;
        String[] strArr3 = A0M;
        if (strArr3[6].length() != strArr3[0].length()) {
            A0M[2] = "PfeCIYv3PZ6V9ed6Ac8a5BK1jHBlhn63";
            if (abstractC0861Do2 != null) {
                if (this.A04.A1m() && this.A04.A1n()) {
                    return 0;
                }
            }
            if (this.A04 == null && this.A04.A1p() && this.A0A.A2u() == 1 && !this.A04.A1q()) {
                return 0;
            }
            boolean zA0Y = A0Y();
            strArr = A0M;
            if (strArr[7].length() == strArr[5].length()) {
                String[] strArr4 = A0M;
                strArr4[7] = "WXNlvihF6x";
                strArr4[5] = "o912A6Q9Ul";
                if (zA0Y) {
                    if (this.A04 != null) {
                        if (!this.A04.A1p()) {
                            C1048Kz c1048Kz = this.A0A;
                            String[] strArr5 = A0M;
                            if (strArr5[6].length() == strArr5[0].length()) {
                                throw new RuntimeException();
                            }
                            String[] strArr6 = A0M;
                            strArr6[6] = "4cWKRp";
                            strArr6[0] = "mDqcFWF9PWFdOJ8RIxKoy3CWob";
                            if (c1048Kz.A2u() != 2) {
                            }
                        }
                        if (!this.A0A.A3B()) {
                            this.A08 = true;
                        }
                        A0X(false, this.A02);
                        return 2;
                    }
                }
                AbstractC0861Do abstractC0861Do3 = this.A04;
                if (A0M[2].charAt(7) == '3') {
                    if (abstractC0861Do3 != null) {
                        if (this.A04.A1o()) {
                            this.A0H.setToolbarActionMode(0);
                            this.A0D.A0F().A5W();
                            this.A04.A1g();
                            return 3;
                        }
                    }
                    boolean zA0a = A0a();
                    if (A0M[2].charAt(7) == '3') {
                        throw new RuntimeException();
                    }
                    String[] strArr7 = A0M;
                    strArr7[6] = "v0x8V0";
                    strArr7[0] = "soUJXmOXH5U0PJ4YtYEaGeQSFd";
                    if (zA0a && !A0c()) {
                        A0H();
                        return 4;
                    }
                    if ((this.A04 instanceof C6K) && A0Y()) {
                        A0X(false, this.A02);
                        return 5;
                    }
                    if (this.A04 instanceof C6M) {
                        boolean zA0Y2 = A0Y();
                        String[] strArr8 = A0M;
                        if (strArr8[7].length() == strArr8[5].length()) {
                            String[] strArr9 = A0M;
                            strArr9[3] = "XJhhEL6jXJrwogLRIRcVTk";
                            strArr9[4] = "WgylZXzpMJFVIRR7bK1WqY";
                            if (zA0Y2) {
                                A0X(false, this.A02);
                                return 7;
                            }
                        }
                    }
                    AbstractC0861Do abstractC0861Do4 = this.A04;
                    String[] strArr10 = A0M;
                    if (strArr10[3].length() == strArr10[4].length()) {
                        A0M[2] = "UpxCSR43Yr3zU0AmXPPzzYDiQ3dPm4uY";
                        if (abstractC0861Do4 instanceof C6J) {
                        }
                    } else if (abstractC0861Do4 instanceof C6J) {
                        if (A0Y()) {
                            A0X(false, this.A02);
                            return 7;
                        }
                    }
                    this.A0F.A04(EnumC2231nN.A07, null);
                    A0M(4);
                    return 6;
                }
                String[] strArr11 = A0M;
                strArr11[6] = "m8cXZ3";
                strArr11[0] = "vuCqBh4GGcmIEOdpzcwHlLdLjb";
                if (abstractC0861Do3 != null) {
                }
                boolean zA0a2 = A0a();
                if (A0M[2].charAt(7) == '3') {
                }
            } else {
                String[] strArr12 = A0M;
                strArr12[6] = "k1GkOW";
                strArr12[0] = "qLDA821jW6HqSaxZ9bsBLZCHN0";
                if (zA0Y) {
                }
                AbstractC0861Do abstractC0861Do32 = this.A04;
                if (A0M[2].charAt(7) == '3') {
                }
            }
        } else {
            String[] strArr13 = A0M;
            strArr13[7] = "uk3hUwbnz5";
            strArr13[5] = "FBSNZaACy9";
            if (abstractC0861Do2 != null) {
            }
            if (this.A04 == null) {
            }
            boolean zA0Y3 = A0Y();
            strArr = A0M;
            if (strArr[7].length() == strArr[5].length()) {
            }
        }
        throw new RuntimeException();
    }

    private int A01(int i5) {
        if (this.A0A.A3B() && i5 < this.A0A.A33().size() && i5 >= 0) {
            return this.A0A.A33().get(i5).intValue();
        }
        return this.A0A.A1M();
    }

    public static /* synthetic */ int A03(D2 d22, int i5) {
        int i11 = d22.A01 + i5;
        d22.A01 = i11;
        return i11;
    }

    private AbstractC2452r2 A07() {
        AbstractC2452r2 c0910Fl;
        if (!this.A0A.A2M()) {
            c0910Fl = new FullScreenAdToolbar(this.A0D, this.A0I, this.A0F, 2, -1, false);
        } else {
            c0910Fl = new C0910Fl(this.A0D, this.A0A.A2z(this.A00), 2);
        }
        c0910Fl.setFullscreen(true);
        c0910Fl.setToolbarListener(new D3(this));
        return c0910Fl;
    }

    private AbstractC0861Do A0C(boolean z11, int i5) {
        int i11;
        D4 d42 = new D4(this, i5);
        LA laA2z = this.A0A.A2z(this.A00);
        Activity activityA0E = this.A0D.A0E();
        if (activityA0E != null) {
            boolean zA2R = laA2z.A2R();
            String[] strArr = A0M;
            if (strArr[3].length() != strArr[4].length()) {
                throw new RuntimeException();
            }
            A0M[2] = "bDB0WKM3tjeRkIfEXbhmbXqmjWoJ3lp1";
            if (!zA2R) {
                C0958Hi c0958Hi = this.A0D;
                if (A0M[1].charAt(22) != '6') {
                    AbstractC2448qy.A02(activityA0E, -1, c0958Hi);
                } else {
                    String[] strArr2 = A0M;
                    strArr2[6] = "kND67a";
                    strArr2[0] = "muWswOX35m7UhHe3NR7FnsVKJl";
                    AbstractC2448qy.A02(activityA0E, -1, c0958Hi);
                }
            } else {
                AbstractC2448qy.A02(activityA0E, 1, this.A0D);
            }
        }
        if (laA2z.A3R()) {
            this.A0H.setOnClickListener(new ViewOnClickListenerC2512s0(this));
        }
        boolean z12 = this.A0A.A38() && this.A00 > 0;
        boolean z13 = this.A0A.A37() && this.A00 > 0;
        String strA31 = this.A0A.A31();
        if (!laA2z.A2Q()) {
            if (laA2z.A39().size() > 1) {
                int iA01 = A01(this.A00);
                if (iA01 == 0) {
                    setUnskippableSecondsComplete(true);
                }
                this.A0D.A0F().ALB(EnumC1651dr.A05);
                this.A0D.A0F().AKd(this.A00);
                this.A0D.A0F().A5U(strA31);
                if (laA2z.A2K()) {
                    return new C6M(this.A0D, this.A0J, this.A00, this.A0E, laA2z, this.A0I, this.A0H, this.A0F, this.A0C, z12, z13, d42, iA01, this.A0A.A2v(), true);
                }
                return new C6J(this.A0D, this.A0J, this.A00, this.A0E, laA2z, this.A0I, this.A0H, this.A0F, this.A0C, z12, z13, d42, iA01, this.A0A.A2v());
            }
            if (A0d(laA2z)) {
                int iA012 = A01(this.A00);
                if (iA012 == 0) {
                    setUnskippableSecondsComplete(true);
                }
                this.A0D.A0F().ALB(EnumC1651dr.A06);
                this.A0D.A0F().AKd(this.A00);
                this.A0D.A0F().A5U(strA31);
                return new C6K(this.A0D, this.A0J, this.A00, this.A0E, laA2z, this.A0I, this.A0H, this.A0F, z12, z13, d42, iA012, this.A0A.A2v());
            }
            if (laA2z.A32().A0U()) {
                this.A0D.A0F().ALB(EnumC1651dr.A07);
                this.A0D.A0F().AKd(this.A00);
                this.A0D.A0F().A5U(strA31);
                if (this.A0A.A2M()) {
                    return new C06805y(this.A0D, this.A0E, this.A0H, laA2z, this.A0C, this.A0J, this.A00, this.A0I, this.A0F, i5, z12, z13, d42, A01(this.A00), this.A0A.A2v());
                }
                return new AnonymousClass65(this.A0D, this.A0E, this.A0H, laA2z, this.A0C, this.A0J, this.A00, this.A0I, this.A0F, i5, z12, z13, d42, A01(this.A00), this.A0A.A2v());
            }
            this.A0D.A0F().ALB(EnumC1651dr.A07);
            this.A0D.A0F().AKd(this.A00);
            this.A0D.A0F().A5U(strA31);
            return new C6C(this.A0D, this.A0E, laA2z, this.A0C, this.A0J, this.A00, this.A0I, this.A0F, this.A0H, this.A0A.A1M(), i5, this.A0A.A2u(), z11, this.A0A.A2w(), this.A0A.A3B(), z12, z13, d42, A01(this.A00), this.A0A.A2v());
        }
        if (this.A0J instanceof FG) {
            i11 = 0;
        } else {
            i11 = 1;
        }
        this.A0D.A0F().ALB(EnumC1651dr.A07);
        this.A0D.A0F().AKd(this.A00);
        this.A0D.A0F().A5U(strA31);
        int i12 = this.A0A.A3B() ? 0 : this.A01;
        C0958Hi c0958Hi2 = this.A0D;
        InterfaceC2515s3 interfaceC2515s3 = this.A0J;
        InterfaceC2224nG interfaceC2224nG = this.A0E;
        int forcedViewTimeCompletedForChild = this.A00;
        return new C6L(c0958Hi2, interfaceC2515s3, interfaceC2224nG, laA2z, forcedViewTimeCompletedForChild, z12, z13, this.A0I, d42, this.A0A.A2v(), i11, A01(this.A00), i12);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0E() {
        int iA00 = A00();
        if (iA00 != 0) {
            this.A0D.A0F().A5X(iA00);
        }
    }

    private void A0F() {
        if (this.A00 > 0 && !TextUtils.isEmpty(this.A0A.A2z(this.A00 - 1).A37())) {
            this.A0E.ABt(this.A0A.A2z(this.A00 - 1).A37(), new C2618ti().A05(this.A04 != null ? this.A04.getAdViewabilityChecker() : null).A04(this.A04 != null ? this.A04.getTouchDataRecorder() : null).A07());
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:18:0x004c  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x0096  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void A0G() {
        if (this.A0H.getToolbarActionMode() == 8) {
            if (this.A09) {
                if (A0a()) {
                    boolean zA0Y = A0Y();
                    if (A0M[1].charAt(22) != '6') {
                        throw new RuntimeException();
                    }
                    String[] strArr = A0M;
                    strArr[6] = "TvtNav";
                    strArr[0] = "7cv5ylY9IM1pTqkWAPRPJldmHk";
                    boolean z11 = (zA0Y || A0c()) ? false : true;
                    if (this.A04 != null) {
                        boolean willShowCombinedEndCards = this.A04.A1o();
                        boolean canShowEndCard = willShowCombinedEndCards;
                        boolean willShowCombinedEndCards2 = A0Y();
                        if (!willShowCombinedEndCards2 && !z11 && !canShowEndCard) {
                            this.A0H.setToolbarActionMode(0);
                        } else {
                            this.A0H.setToolbarActionMode(1);
                        }
                    }
                }
            } else {
                this.A0H.setToolbarActionMode(2);
            }
        }
        int i5 = this.A00 - 1;
        if (this.A0A.A3C(i5)) {
            LA laA2z = this.A0A.A2z(i5);
            this.A0H.setProgressSpinnerInvisible(true ^ laA2z.A3Q());
            laA2z.A3D(false);
            laA2z.A32().A0N(-1);
        }
    }

    private void A0H() {
        this.A0D.A0F().A5V();
        this.A07 = true;
        this.A03 = new C2650uE(this.A0D, this.A0A, this.A0E, this.A0I, this.A0H.getToolbarHeight(), this.A02);
        C2597tN c2597tN = null;
        Iterator<C2597tN> it = this.A0K.iterator();
        while (true) {
            boolean zHasNext = it.hasNext();
            if (A0M[1].charAt(22) == '6') {
                String[] strArr = A0M;
                strArr[7] = "ZPnrdglx3i";
                strArr[5] = "Z92DtyKnO3";
                if (!zHasNext) {
                    break;
                }
                C2597tN next = it.next();
                if (next.A00 == C2597tN.A06) {
                    c2597tN = next;
                    break;
                }
            } else {
                throw new RuntimeException();
            }
        }
        if (c2597tN != null) {
            A0N(this.A03, c2597tN);
        } else if (!this.A0K.isEmpty()) {
            C2650uE c2650uE = this.A03;
            C2597tN c2597tN2 = this.A0K.get(0);
            String[] strArr2 = A0M;
            if (strArr2[3].length() != strArr2[4].length()) {
                throw new RuntimeException();
            }
            A0M[1] = "QrfYDlJd0rSqFpmMPkZz6N62c1xeqnJu";
            A0N(c2650uE, c2597tN2);
        }
        A0W(true);
        if (this.A0H instanceof FullScreenAdToolbar) {
            ((FullScreenAdToolbar) this.A0H).setOnlyPageDetails(null);
        }
        if (this.A04 != null) {
            AbstractC2426qc.A0K(this.A04);
            this.A04.A1b();
            this.A04 = null;
        }
        AbstractC2426qc.A0K(this.A03);
        AbstractC2426qc.A0H(1102, this.A03);
        addView(this.A03, 0, new FrameLayout.LayoutParams(-1, -1));
    }

    private final void A0J() {
        this.A0G.A05(EnumC2411qN.A04);
    }

    private synchronized void A0K() {
        this.A0D.A0F().ACm();
        this.A0D.A0F().ABs();
        this.A0I.A5C(this.A0J.A7L());
        this.A05.A06();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0L(float f11) {
        float f12;
        float fA01 = A01(this.A00 - 1);
        float f13 = (this.A0A.A3B() ? 0 : this.A01) + f11;
        if (fA01 > 0.0f) {
            f12 = f13 / fA01;
        } else {
            f12 = 1.0f;
        }
        if (this.A06 && this.A0A.A3B()) {
            this.A06 = false;
            this.A0H.setProgressImmediate(0.0f);
        }
        float unskippableSeconds = 100.0f * f12;
        this.A0H.setProgress(unskippableSeconds);
        if (f12 >= 1.0f && !this.A09) {
            setUnskippableSecondsComplete(true);
            if (!A0Z()) {
                this.A0H.setToolbarActionMode(1);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0M(int i5) {
        this.A0D.A0F().A5S(i5);
        setUnskippableSecondsComplete(true);
        A0K();
        A0F();
        this.A0D.A0F().ABl();
        this.A0I.A5C(this.A0J.A8X());
    }

    private void A0N(ViewGroup viewGroup, C2597tN c2597tN) {
        if (c2597tN.A00 == C2597tN.A06 && c2597tN.A03 != null) {
            AbstractC2668uW.A00(this.A0D, viewGroup, c2597tN.A03);
        } else {
            AbstractC2426qc.A0O(viewGroup, c2597tN.A01);
        }
        this.A0H.setFullscreen(c2597tN.A05);
        this.A0H.A0D(c2597tN.A02, c2597tN.A04);
    }

    private void A0O(LA la2) {
        if (this.A0H instanceof FullScreenAdToolbar) {
            boolean zA0d = A0d(la2);
            if (A0M[2].charAt(7) != '3') {
                throw new RuntimeException();
            }
            A0M[2] = "vyv5r133RkdgG8M1gH7WIgZDBjsgq9Je";
            if (zA0d && this.A02 == 2) {
                ((FullScreenAdToolbar) this.A0H).setOnlyPageDetails(la2.A35());
            } else {
                ((FullScreenAdToolbar) this.A0H).setOnlyPageDetails(null);
            }
        }
    }

    private final void A0P(C1998jY c1998jY) {
        c1998jY.A0A(this.A0B);
        int i5 = c1998jY.A05().getResources().getConfiguration().orientation;
        this.A02 = i5;
        A0X(this.A0A.A35(), i5);
        A0J();
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:13:0x002e  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x0074  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void A0W(boolean z11) {
        boolean z12;
        boolean z13;
        if (A0Z()) {
            return;
        }
        if (!A0a() || A0Y()) {
            z12 = false;
        } else {
            boolean zA0c = A0c();
            if (A0M[1].charAt(22) != '6') {
                throw new RuntimeException();
            }
            String[] strArr = A0M;
            strArr[7] = "fhNsXNJVUA";
            strArr[5] = "wXa0tVX5fv";
            if (!zA0c) {
                z12 = true;
            }
        }
        if (this.A04 != null) {
            boolean willShowCombinedEndCards = this.A04.A1o();
            z13 = willShowCombinedEndCards;
        }
        boolean willShowCombinedEndCards2 = A0Y();
        if (!willShowCombinedEndCards2 && !z12 && !z13) {
            setUnskippableSecondsComplete(true);
            if (z11) {
                this.A0H.setToolbarActionMessage(A0D(0, 0, 66));
            }
            this.A0H.setToolbarActionMode(0);
            return;
        }
        this.A0H.setToolbarActionMode(1);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0X(boolean z11, int i5) {
        if (this.A04 != null) {
            this.A04.A1b();
            if (A0M[1].charAt(22) != '6') {
                throw new RuntimeException();
            }
            A0M[2] = "W3TlfOl3oEXDpQnuuCTH10eCcUmU4b3A";
            this.A04.removeAllViews();
            AbstractC2426qc.A0K(this.A04);
        }
        if (this.A0A.A2M()) {
            AbstractC2426qc.A0K(this.A0H);
            FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-1, -2);
            layoutParams.setMargins(AbstractC2383pv.A0x, AbstractC2383pv.A0u, 0, 0);
            addView(this.A0H, layoutParams);
        }
        if (!A0Y()) {
            setUnskippableSecondsComplete(true);
            if (A0a()) {
                A0H();
                return;
            } else {
                A0M(1);
                return;
            }
        }
        if (this.A0A.A3B()) {
            setUnskippableSecondsComplete(false);
            this.A0H.setProgressImmediate(0.0f);
        }
        boolean isLoaded = this.A0D.A01().AB4(this.A0A.A2z(this.A00).A37(), this.A0A.A30());
        if (!isLoaded) {
            this.A0D.A0F().A5T();
            A0M(2);
            return;
        }
        AbstractC0861Do abstractC0861DoA0C = A0C(z11, i5);
        this.A04 = abstractC0861DoA0C;
        AbstractC0861Do abstractC0861Do = this.A04;
        boolean isLoaded2 = this.A09;
        abstractC0861Do.A1i(isLoaded2);
        setupToolbarForAd(abstractC0861DoA0C);
        addView(this.A04, 0, A0N);
        this.A00++;
        this.A04.A1h();
    }

    private boolean A0Y() {
        return this.A00 < this.A0A.A2v();
    }

    private boolean A0Z() {
        if (this.A04 == null || this.A0H.getToolbarActionMode() != 8) {
            return false;
        }
        int i5 = this.A00 - 1;
        if (!this.A0A.A3C(i5)) {
            return false;
        }
        LA laA2z = this.A0A.A2z(i5);
        if (!laA2z.A3G() || !this.A04.A1l()) {
            return false;
        }
        int currentPlayCount = this.A04.getCurrentPlayCount();
        int curIdx = laA2z.A30();
        return currentPlayCount < curIdx;
    }

    private boolean A0a() {
        return this.A0A.A2u() == 2;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean A0b() {
        if (this.A0H.getToolbarActionMode() != 8) {
            return false;
        }
        int i5 = this.A00 - 1;
        if (this.A0A.A3C(i5)) {
            return this.A0A.A2z(i5).A3J();
        }
        return false;
    }

    private final boolean A0c() {
        return this.A07;
    }

    public static boolean A0d(LA la2) {
        return TextUtils.isEmpty(la2.A32().A0I().A09());
    }

    public final void A0h() {
        A0X(false, this.A02);
    }

    public final boolean A0i() {
        boolean z11 = this.A00 < this.A0A.A2v() && this.A0A.A39();
        if (z11) {
            this.A0D.A0F().ACr();
        }
        return z11;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final void ABc(Intent intent, Bundle bundle, C1998jY c1998jY) {
        this.A0I.A4V(this, A0N);
        A0P(c1998jY);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final void AGF(boolean z11) {
        if (this.A04 != null) {
            this.A04.A1j(z11);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final void AGp(boolean z11) {
        if (this.A04 != null) {
            this.A04.A1k(z11);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final void AKD(Bundle bundle) {
    }

    public AbstractC0861Do getContentView() {
        return this.A04;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public String getCurrentClientToken() {
        return A0D(0, 0, 66);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final boolean onActivityResult(int i5, int i11, Intent intent) {
        if (this.A04 != null) {
            return this.A04.A1r(i5, i11, intent);
        }
        return false;
    }

    @Override // android.view.View
    public final void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        this.A02 = configuration.orientation;
        if (this.A04 != null) {
            this.A04.onConfigurationChanged(configuration);
        }
        if (this.A04 instanceof C6K) {
            A0N(this.A04, this.A04.getFullScreenAdStyle());
            A0O(this.A04.getAdDataBundle());
        } else {
            if (this.A04 instanceof C6M) {
                A0N(this.A04, this.A04.getFullScreenAdStyle());
                return;
            }
            boolean z11 = this.A04 instanceof C6J;
            if (A0M[2].charAt(7) != '3') {
                throw new RuntimeException();
            }
            A0M[2] = "dTSLtaN3TPLZnVsUfzbb4eL6QIUFm0aB";
            if (!z11) {
                return;
            }
            A0N(this.A04, this.A04.getFullScreenAdStyle());
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final void onDestroy() {
        if (this.A04 != null) {
            this.A04.A1b();
            this.A04 = null;
        }
        this.A0D.A01().A5Y(this.A0A.A30());
        this.A0G.A03();
    }

    @Override // android.view.ViewGroup
    public final boolean onInterceptTouchEvent(MotionEvent motionEvent) {
        return super.onInterceptTouchEvent(motionEvent);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final void onStart() {
        if (this.A04 != null) {
            this.A04.A1c();
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final void onStop() {
        if (this.A04 != null) {
            this.A04.A1d();
        }
    }

    public void setListener(InterfaceC2459r9 interfaceC2459r9) {
    }

    public void setServerSideRewardHandler(C1814gV c1814gV) {
        this.A05 = c1814gV;
    }

    public void setUnskippableSecondsComplete(boolean z11) {
        this.A09 = z11;
        if (this.A04 != null) {
            this.A04.A1i(this.A09);
        }
    }

    private void setupToolbarForAd(AbstractC0861Do abstractC0861Do) {
        if (this.A0H == null) {
            return;
        }
        this.A06 = true;
        LA laA2z = this.A0A.A2z(this.A00);
        int iA01 = A01(this.A00);
        if (this.A0H instanceof FullScreenAdToolbar) {
            ((FullScreenAdToolbar) this.A0H).A0G(this.A0D, laA2z.A2u());
            ((FullScreenAdToolbar) this.A0H).A0F(laA2z.A35(), laA2z.A37(), iA01);
        } else if (this.A0H instanceof C0910Fl) {
            C0910Fl c0910Fl = (C0910Fl) this.A0H;
            String[] strArr = A0M;
            if (strArr[7].length() != strArr[5].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0M;
            strArr2[6] = "BSHe58";
            strArr2[0] = "ZBSZ6J22vFdXaG69CEBQUYT0cT";
            c0910Fl.A0I(laA2z);
            ((C0910Fl) this.A0H).setInitialUnskippableSeconds(iA01);
        }
        C2597tN fullScreenAdStyle = abstractC0861Do.getFullScreenAdStyle();
        A0N(abstractC0861Do, fullScreenAdStyle);
        this.A0K.add(fullScreenAdStyle);
        if (this.A0H instanceof FullScreenAdToolbar) {
            this.A0H.setToolbarActionMessage(A0D(4, 3, 90) + (this.A00 + 1) + A0D(0, 4, 42) + this.A0A.A2v());
        }
        boolean z11 = abstractC0861Do instanceof C6L;
        this.A0H.setVisibility(z11 ? 8 : 0);
        this.A0H.setSkipIconSuppressed(z11);
        if (this.A08) {
            this.A0H.setToolbarActionMode(1);
        }
        A0O(laA2z);
    }
}
