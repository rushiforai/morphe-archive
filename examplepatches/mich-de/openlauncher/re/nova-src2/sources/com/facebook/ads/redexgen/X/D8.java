package com.facebook.ads.redexgen.X;

import android.content.Intent;
import android.content.res.Configuration;
import android.graphics.Rect;
import android.os.Build;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.MotionEvent;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.RelativeLayout;
import com.facebook.ads.internal.view.FullScreenAdToolbar;
import java.lang.ref.WeakReference;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public abstract class D8 extends FrameLayout implements InterfaceC2460rA {
    public static byte[] A0F;
    public static String[] A0G = {"2Xyaln6pEv", "U0a3JqFqqkDVhXbmlhDLXicSxteMexx", "xzpI97Jg3aS17fwtqg1jZWsfReheMZxV", "0HUxaz9ggnFIA", "Uunhkc3", "kqN9", "fWeU9xYsODnan54TmlbSL1hNy6Lef7fu", "qbKhPFfRzVPGu"};
    public static final RelativeLayout.LayoutParams A0H;
    public boolean A00;
    public ViewGroup A01;
    public boolean A02;
    public final LA A03;
    public final C2086kz A04;
    public final C0958Hi A05;
    public final InterfaceC2224nG A06;
    public final C2232nO A07;
    public final C2417qT A08;
    public final AbstractC2452r2 A09;
    public final InterfaceC2459r9 A0A;
    public final InterfaceC2515s3 A0B;
    public final C1539c2 A0C;
    public final ViewOnSystemUiVisibilityChangeListenerC2412qO A0D;
    public final AbstractC1540c3 A0E;

    public static String A0g(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0F, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 80);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0i() {
        A0F = new byte[]{84, 91, 74, 87, 86};
    }

    public abstract void A0p();

    public abstract void A0q();

    public abstract void A0s(C1998jY c1998jY);

    public abstract boolean A0t();

    public abstract boolean A0u();

    public /* synthetic */ void onStart() {
    }

    public /* synthetic */ void onStop() {
    }

    static {
        A0i();
        A0H = new RelativeLayout.LayoutParams(-1, -1);
    }

    public D8(C0958Hi c0958Hi, InterfaceC2515s3 interfaceC2515s3, InterfaceC2224nG interfaceC2224nG, LA la2, C2086kz c2086kz, InterfaceC2459r9 interfaceC2459r9) {
        super(c0958Hi);
        this.A02 = false;
        this.A0E = new DE(this);
        this.A08 = new C2417qT();
        this.A00 = false;
        this.A05 = c0958Hi;
        this.A0B = interfaceC2515s3;
        this.A06 = interfaceC2224nG;
        this.A03 = la2;
        this.A04 = c2086kz;
        this.A0A = interfaceC2459r9;
        this.A07 = new C2232nO(this.A03.A37(), this.A06);
        this.A0C = new C1539c2(this, 1, new WeakReference(this.A0E), this.A05);
        this.A0C.A0W(this.A03.A1J());
        this.A0C.A0X(this.A03.A1K());
        this.A09 = A0f();
        this.A0D = new ViewOnSystemUiVisibilityChangeListenerC2412qO(this);
        this.A0D.A05(EnumC2411qN.A03);
        if (!A0u() && Build.VERSION.SDK_INT >= 35) {
            setFitsSystemWindows(true);
        }
    }

    private AbstractC2452r2 A0f() {
        AbstractC2452r2 abstractC2452r2A0l = A0l();
        abstractC2452r2A0l.setFullscreen(true);
        int unskippableSeconds = this.A03.A32().A0I().A04();
        abstractC2452r2A0l.setPageDetails(this.A03.A35(), this.A03.A37(), unskippableSeconds, this.A03.A36());
        abstractC2452r2A0l.A0D(this.A03.A31().A01(), ViewOnClickListenerC0884El.A05(this.A03));
        if (this.A03.A32().A0I().A02() == 0) {
            this.A02 = true;
            abstractC2452r2A0l.setToolbarActionMode(8);
        } else if (unskippableSeconds < 0 && this.A03.A32().A0T()) {
            if (A0G[5].length() != 4) {
                throw new RuntimeException();
            }
            A0G[5] = "12R7";
            abstractC2452r2A0l.setToolbarActionMode(4);
        }
        if (this.A03.A32().A0I().A02() >= 0) {
            abstractC2452r2A0l.setProgressSpinnerInvisible(true);
        }
        abstractC2452r2A0l.setToolbarListener(new D9(this));
        return abstractC2452r2A0l;
    }

    private void A0h() {
        if (this.A03.A32().A0X()) {
            C2499rn c2499rnA0F = new C2501rp(this.A05, this.A03.A32().A0J(), this.A03.A35()).A0A(this.A03.A31().A01()).A0F();
            AbstractC2234nQ.A04(c2499rnA0F, this.A07, EnumC2231nN.A0U);
            addView(c2499rnA0F, A0H);
            c2499rnA0F.A04(new DB(this));
            return;
        }
        A0q();
    }

    public final C2370pi A0j(int i5, AbstractRunnableC2319oq abstractRunnableC2319oq, C0781Am c0781Am) {
        C2370pi timer = new C2370pi(i5, new DD(this, i5, c0781Am, abstractRunnableC2319oq));
        timer.A07();
        return timer;
    }

    public final C2370pi A0k(int i5, AbstractRunnableC2319oq abstractRunnableC2319oq, C0781Am c0781Am, InterfaceC2527sF interfaceC2527sF) {
        C2370pi timer = new C2370pi(i5, new DC(this, i5, c0781Am, interfaceC2527sF, abstractRunnableC2319oq));
        timer.A07();
        return timer;
    }

    public AbstractC2452r2 A0l() {
        if (A0u()) {
            if (this.A03.A2D()) {
                return new C0922Fy(this.A05, getAppOpenAdVariant(), this.A03, 8, new DA(this));
            }
            return new C0910Fl(this.A05, this.A03, 1);
        }
        return new FullScreenAdToolbar(this.A05, this.A0A, this.A07, 1, this.A03.A2u(), this.A03.A2e());
    }

    public void A0m() {
        if (!this.A03.A2D()) {
            return;
        }
        AbstractC2452r2 abstractC2452r2 = this.A09;
        if (A0G[4].length() == 31) {
            throw new RuntimeException();
        }
        A0G[4] = "c";
        Rect margins = abstractC2452r2.getRequestedMargins();
        if (margins == null) {
            return;
        }
        FrameLayout.LayoutParams layoutParams = (FrameLayout.LayoutParams) this.A09.getLayoutParams();
        layoutParams.setMargins(margins.left, margins.top, margins.right, margins.bottom);
        this.A09.setLayoutParams(layoutParams);
    }

    public final void A0n() {
        if (!this.A00) {
            this.A0C.A0U();
            this.A00 = true;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:11:0x0047  */
    /* JADX WARN: Removed duplicated region for block: B:16:0x008e  */
    /* JADX WARN: Removed duplicated region for block: B:18:0x009f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void A0o() {
        String[] strArr;
        if (this.A09.getToolbarActionMode() == 8) {
            AbstractC2452r2 abstractC2452r2 = this.A09;
            String[] strArr2 = A0G;
            if (strArr2[6].charAt(27) == strArr2[2].charAt(27)) {
                String[] strArr3 = A0G;
                strArr3[3] = "eZr61MFsF2rwL";
                strArr3[7] = "T1wa3uRffD5Dg";
                abstractC2452r2.setToolbarActionMode(2);
                if (this.A03.A32().A0I().A07() != null) {
                    C1738fH c1738fHA0I = this.A03.A32().A0I();
                    if (A0G[4].length() != 31) {
                        String[] strArr4 = A0G;
                        strArr4[6] = "COHiJK7VoTgBq0De7peYJOsfOEOe3XIQ";
                        strArr4[2] = "lGG8rOrP44fRkZ7H96nSjg4VgGaefoVT";
                        c1738fHA0I.A07().A0T(0);
                    }
                }
                this.A03.A3D(false);
                C1735fE c1735fEA32 = this.A03.A32();
                strArr = A0G;
                if (strArr[1].length() == strArr[0].length()) {
                    String[] strArr5 = A0G;
                    strArr5[1] = "wiu2MLgd3UkZmOSHZtDxRr0HkSCWnOg";
                    strArr5[0] = "Ed0NbamE8O";
                    c1735fEA32.A0N(-1);
                    return;
                }
                String[] strArr6 = A0G;
                strArr6[3] = "aRfbrWr89hb3J";
                strArr6[7] = "GJWDx2ihyHFEK";
                c1735fEA32.A0N(-1);
                return;
            }
        } else {
            if (this.A03.A32().A0I().A07() != null) {
            }
            this.A03.A3D(false);
            C1735fE c1735fEA322 = this.A03.A32();
            strArr = A0G;
            if (strArr[1].length() == strArr[0].length()) {
            }
        }
        throw new RuntimeException();
    }

    public final void A0r(ViewGroup viewGroup) {
        if (this.A03.A2D() && getAppOpenAdVariant() == EnumC2457r7.A07) {
            C2662uQ c2662uQ = new C2662uQ(this.A05);
            c2662uQ.setRadius(AbstractC2383pv.A0y);
            c2662uQ.addView(viewGroup, new ViewGroup.LayoutParams(-1, -1));
            this.A01 = c2662uQ;
            return;
        }
        this.A01 = viewGroup;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final void ABc(Intent intent, Bundle bundle, C1998jY c1998jY) {
        this.A0A.A4V(this, A0H);
        A0s(c1998jY);
        A0h();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final void AKD(Bundle bundle) {
    }

    private EnumC2457r7 getAppOpenAdVariant() {
        if (this.A03.A1U().equals(A0g(0, 5, 98))) {
            return EnumC2457r7.A07;
        }
        return EnumC2457r7.A08;
    }

    public Integer getBackgroundColorForToolbar() {
        if (this.A03.A2D()) {
            Integer num = getAppOpenAdVariant().A03;
            if (A0G[4].length() == 31) {
                throw new RuntimeException();
            }
            String[] strArr = A0G;
            strArr[1] = "PAMmmot6Tf7Ql1BWqbyc3bNBHIv9DUl";
            strArr[0] = "h1W7xn1Xng";
            return num;
        }
        return null;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public String getCurrentClientToken() {
        return this.A03.A37();
    }

    public boolean onActivityResult(int i5, int i11, Intent intent) {
        return false;
    }

    @Override // android.view.View
    public void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        if (!A0u() && Build.VERSION.SDK_INT >= 35) {
            setFitsSystemWindows(true);
        }
        A0m();
        if (A0G[4].length() == 31) {
            throw new RuntimeException();
        }
        String[] strArr = A0G;
        strArr[3] = "ppFHHBjYkV1v1";
        strArr[7] = "EE8p4ctuHDbMc";
    }

    public void onDestroy() {
        this.A0D.A03();
        if (!TextUtils.isEmpty(this.A03.A37())) {
            this.A06.ABt(this.A03.A37(), new C2618ti().A05(this.A0C).A04(this.A08).A07());
        }
    }

    @Override // android.view.ViewGroup
    public final boolean onInterceptTouchEvent(MotionEvent motionEvent) {
        this.A08.A06(this.A05, motionEvent, this, this);
        return super.onInterceptTouchEvent(motionEvent);
    }

    public void setListener(InterfaceC2459r9 interfaceC2459r9) {
    }

    public void setUpFullscreenMode(boolean z11) {
        EnumC2411qN enumC2411qN;
        if (z11) {
            enumC2411qN = EnumC2411qN.A04;
        } else {
            enumC2411qN = EnumC2411qN.A03;
        }
        ViewOnSystemUiVisibilityChangeListenerC2412qO viewOnSystemUiVisibilityChangeListenerC2412qO = this.A0D;
        String[] strArr = A0G;
        if (strArr[3].length() != strArr[7].length()) {
            throw new RuntimeException();
        }
        String[] strArr2 = A0G;
        strArr2[6] = "qfOTxDoWDRCl3cD5KSGOieDqypiePN9l";
        strArr2[2] = "QItBARXNxGEv5WetvuW2OzigLPzeTM1z";
        viewOnSystemUiVisibilityChangeListenerC2412qO.A05(enumC2411qN);
    }
}
