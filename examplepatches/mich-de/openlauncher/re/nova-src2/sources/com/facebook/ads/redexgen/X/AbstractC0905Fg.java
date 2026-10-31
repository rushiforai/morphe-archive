package com.facebook.ads.redexgen.X;

import android.content.Intent;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.view.animation.AlphaAnimation;
import android.widget.RelativeLayout;
import com.facebook.ads.internal.view.FullScreenAdToolbar;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.Fg, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC0905Fg extends RelativeLayout implements InterfaceC2460rA {
    public static byte[] A0I;
    public static String[] A0J = {"fqT9snXDZkE2N6bIU2twhbCcrvrF5wQR", "W8MK3buqarkLhDixdfnbfGeXuw3i87xB", "M5iWaw3OwwKxChS5bTa9KUrj63pwu1Od", "QKu8TlGQ3D7NsDDaY", "OUnrWL6BanKvWJF", "644mHU9zQQHAcSiNB", "MqQzuM0GD0HqxOL2854PPJvoiao7nama", "mSpdOD621tCilusEUOf234Jx9LR3KzyX"};
    public static final int A0K;
    public static final int A0L;
    public View A00;
    public C2370pi A01;
    public C2566ss A02;
    public C2570sw A03;
    public C2499rn A04;
    public boolean A05;
    public boolean A06;
    public C1731fA A07;
    public C1814gV A08;
    public boolean A09;
    public final Handler A0A;
    public final ViewOnSystemUiVisibilityChangeListenerC2412qO A0B;
    public final InterfaceC2459r9 A0C;
    public final LA A0D;
    public final C0958Hi A0E;
    public final InterfaceC2224nG A0F;
    public final C2232nO A0G;
    public final AbstractC2452r2 A0H;

    public static String A0V(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0I, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 81);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0c() {
        A0I = new byte[]{88, 84, 86, 21, 93, 90, 88, 94, 89, 84, 84, 80, 21, 90, 95, 72, 21, 82, 85, 79, 94, 73, 72, 79, 82, 79, 82, 90, 87, 21, 82, 86, 75, 73, 94, 72, 72, 82, 84, 85, 21, 87, 84, 92, 92, 94, 95};
    }

    public abstract FullScreenAdToolbar A0g();

    public abstract void A0i();

    public abstract boolean A0q();

    public abstract int getCloseButtonStyle();

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final /* synthetic */ void onStart() {
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final /* synthetic */ void onStop() {
    }

    static {
        A0c();
        A0K = (int) (AbstractC2385px.A02 * 16.0f);
        A0L = (int) (AbstractC2385px.A02 * 12.0f);
    }

    public AbstractC0905Fg(C0958Hi c0958Hi, InterfaceC2224nG interfaceC2224nG, InterfaceC2459r9 interfaceC2459r9, LA la2) {
        super(c0958Hi);
        this.A09 = false;
        this.A06 = false;
        this.A05 = false;
        this.A0A = new Handler(Looper.getMainLooper());
        this.A0E = c0958Hi;
        this.A0F = interfaceC2224nG;
        this.A0C = interfaceC2459r9;
        this.A0B = new ViewOnSystemUiVisibilityChangeListenerC2412qO(this);
        this.A0D = la2;
        this.A0G = new C2232nO(this.A0D.A37(), this.A0F);
        this.A0H = A0g();
        if (this.A0D.A3F()) {
            A0W();
        }
        if (this.A0D.A3U()) {
            A0X();
        }
    }

    private C1744fN A0T(int i5) {
        if (this.A07 != null) {
            if (i5 == 1) {
                C1731fA c1731fA = this.A07;
                if (A0J[2].charAt(7) != 'O') {
                    throw new RuntimeException();
                }
                A0J[0] = "MYlveE6g4wScBr3MsnlZwbj0w3RA4Q0m";
                return c1731fA.A01();
            }
            return this.A07.A00();
        }
        return null;
    }

    private void A0W() {
        this.A02 = AbstractC2571sx.A01(this.A0E, true, this.A0D, this.A0G, this.A0C, EnumC2569sv.A03, AbstractC2568su.A00(this.A0D));
        AbstractC2426qc.A0L(this.A02);
    }

    private void A0X() {
        this.A03 = AbstractC2571sx.A02(this.A0E, EnumC2569sv.A03, this.A0D);
        this.A03.setBackgroundColor(-2145637581);
        AbstractC2426qc.A0L(this.A03);
    }

    private void A0Y() {
        removeAllViews();
        AbstractC2426qc.A0K(this);
    }

    private void A0Z() {
        if (this.A03 != null) {
            RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
            layoutParams.addRule(9);
            layoutParams.addRule(12);
            layoutParams.setMargins(A0K, A0L, 0, A0K);
            addView(this.A03, layoutParams);
        }
    }

    private void A0a() {
        if (this.A02 != null) {
            RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
            layoutParams.addRule(11);
            layoutParams.addRule(12);
            layoutParams.setMargins(0, A0L, A0K, A0K);
            addView(this.A02, layoutParams);
        }
    }

    private void A0b() {
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -1);
        if (A0n() && this.A04 == null) {
            this.A06 = true;
            this.A04 = new C2501rp(this.A0E, this.A0D.A32().A0J(), this.A0D.A35()).A0A(this.A0D.A31().A01()).A0F();
            AbstractC2234nQ.A04(this.A04, this.A0G, EnumC2231nN.A0U);
            this.A0C.A4U(this, 0, layoutParams);
            this.A0C.A4U(this.A04, 1, layoutParams);
            this.A04.A04(new C0907Fi(this));
            return;
        }
        this.A0C.A4U(this, 0, layoutParams);
    }

    private void A0d(C1744fN c1744fN, boolean z11) {
        RelativeLayout.LayoutParams layoutParams;
        AbstractC2426qc.A0L(this.A0H);
        if (this.A0D.A2K()) {
            layoutParams = new RelativeLayout.LayoutParams(-2, -2);
            layoutParams.setMargins(0, AbstractC2383pv.A0P, 0, 0);
        } else {
            layoutParams = new RelativeLayout.LayoutParams(-1, this.A0H.getToolbarHeight());
            this.A0H.A0D(c1744fN, ViewOnClickListenerC0884El.A05(this.A0D));
        }
        layoutParams.addRule(10);
        View view = this.A0H;
        if (A0J[4].length() == 0) {
            throw new RuntimeException();
        }
        A0J[4] = "7";
        addView(view, layoutParams);
    }

    public final void A0h() {
        if (this.A00 == null || !(this.A00 instanceof AbstractC2685un)) {
            return;
        }
        if (A0o()) {
            ((AbstractC2685un) this.A00).A1U();
        } else {
            ((AbstractC2685un) this.A00).A1T();
        }
    }

    public final void A0j(int i5) {
        this.A01 = new C2370pi(i5, new C0906Fh(this, i5));
        this.A05 = true;
        A0h();
        this.A01.A07();
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x0051  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x00e4  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void A0k(View view, boolean z11, int i5) {
        this.A0H.setFullscreen(z11);
        this.A00 = view;
        this.A0B.A05(EnumC2411qN.A03);
        A0Y();
        C1744fN colorInfo = A0T(i5);
        if (colorInfo != null) {
            A0d(colorInfo, z11);
            AbstractC2426qc.A0O(this, colorInfo.A08(false));
        }
        if (!this.A0D.A3F()) {
            boolean zA3U = this.A0D.A3U();
            String[] strArr = A0J;
            if (strArr[3].length() != strArr[5].length()) {
                throw new RuntimeException();
            }
            A0J[0] = "NsWlVTe7e8AxmZfep9MsD1WsEVvEb3lR";
            if (zA3U) {
                AbstractC2426qc.A0K(this.A02);
                AbstractC2426qc.A0K(this.A03);
                A0a();
                A0Z();
                this.A0H.A08();
            }
        }
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -1);
        if (this.A0D.A3F() && this.A02 != null) {
            layoutParams.addRule(2, this.A02.getId());
            layoutParams.addRule(3, this.A0H.getId());
        } else if (this.A0D.A3U()) {
            C2570sw c2570sw = this.A03;
            String[] strArr2 = A0J;
            if (strArr2[1].charAt(22) == strArr2[7].charAt(22)) {
                throw new RuntimeException();
            }
            A0J[4] = "cvLlvPayLTpclEzIvAs";
            if (c2570sw != null) {
                layoutParams.addRule(2, this.A03.getId());
                layoutParams.addRule(3, this.A0H.getId());
            } else {
                layoutParams.addRule(12);
                layoutParams.setMargins(0, z11 ? 0 : this.A0H.getToolbarHeight(), 0, 0);
            }
        }
        if (this.A0D.A2K()) {
            AbstractC2452r2 abstractC2452r2 = this.A0H;
            if (A0J[6].charAt(3) != 'z') {
                throw new RuntimeException();
            }
            String[] strArr3 = A0J;
            strArr3[3] = "cmlraTawHlOzciUSj";
            strArr3[5] = "9DhXPbTXBAe5dGG5J";
            layoutParams.addRule(3, abstractC2452r2.getId());
        }
        addView(view, layoutParams);
        if (this.A0C != null) {
            A0b();
            if (z11) {
                this.A0B.A05(EnumC2411qN.A04);
            }
        }
    }

    public final void A0l(C1998jY c1998jY) {
        if (c1998jY.A05() != null && c1998jY.A05().getWindow() != null) {
            this.A0B.A04(c1998jY.A05().getWindow());
        }
        this.A07 = this.A0D.A31();
        C1735fE c1735fEA32 = null;
        C1735fE adInfo = this.A0D.A32();
        if (adInfo != null) {
            C1735fE adInfo2 = this.A0D.A32();
            if (adInfo2 != null) {
                c1735fEA32 = this.A0D.A32();
            }
        }
        this.A0H.setPageDetails(this.A0D.A35(), this.A0D.A37(), c1735fEA32 != null ? c1735fEA32.A0I().A04() : 0, this.A0D.A36());
        this.A0H.setToolbarListener(new C0909Fk(this, c1998jY));
    }

    public final void A0m(C1998jY c1998jY) {
        AlphaAnimation alphaAnimation = new AlphaAnimation(1.0f, 0.0f);
        alphaAnimation.setDuration(200L);
        alphaAnimation.setAnimationListener(new AnimationAnimationListenerC2473rN(this, this, c1998jY));
        startAnimation(alphaAnimation);
    }

    public final boolean A0n() {
        if (!this.A0D.A39().isEmpty()) {
            boolean zA0X = this.A0D.A32().A0X();
            if (A0J[6].charAt(3) != 'z') {
                throw new RuntimeException();
            }
            A0J[2] = "rwsNokIOLx9Fj0KMvDMbhHWjcozH5rOe";
            if (zA0X) {
                return true;
            }
        }
        return false;
    }

    public final boolean A0o() {
        return this.A05;
    }

    public final boolean A0p() {
        return this.A06;
    }

    public void AGF(boolean z11) {
        if (this.A01 != null && this.A01.A05()) {
            this.A01.A06();
        }
        if (!z11 && this.A02 != null) {
            this.A02.A0P();
        }
    }

    public void AGp(boolean z11) {
        if (this.A01 != null && !this.A01.A04()) {
            this.A01.A07();
        }
    }

    public InterfaceC2224nG getAdEventManager() {
        return this.A0F;
    }

    public InterfaceC2459r9 getAudienceNetworkListener() {
        return this.A0C;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public String getCurrentClientToken() {
        return this.A0D.A37();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final boolean onActivityResult(int i5, int i11, Intent intent) {
        return false;
    }

    public void onDestroy() {
        this.A0B.A03();
        this.A0H.setToolbarListener(null);
        this.A0A.removeCallbacksAndMessages(null);
        if (this.A02 != null) {
            this.A02.A0O();
        }
        A0Y();
    }

    public void setImpressionRecordingFlag(C2417qT c2417qT) {
        c2417qT.A05();
        if (getAudienceNetworkListener() != null) {
            if (this.A09) {
                getAudienceNetworkListener().A5C(new FG().A8s());
            } else {
                getAudienceNetworkListener().A5C(A0V(0, 47, 106));
            }
        }
    }

    public void setListener(InterfaceC2459r9 interfaceC2459r9) {
    }

    public void setServerSideRewardHandler(C1814gV c1814gV) {
        this.A08 = c1814gV;
    }
}
