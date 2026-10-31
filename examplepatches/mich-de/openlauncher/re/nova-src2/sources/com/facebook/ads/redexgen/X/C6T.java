package com.facebook.ads.redexgen.X;

import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.Handler;
import android.os.Looper;
import android.os.RemoteException;
import android.text.TextUtils;
import android.util.Log;
import android.view.MotionEvent;
import android.widget.FrameLayout;
import com.facebook.ads.internal.util.activity.AdActivityIntent;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.HashMap;

/* renamed from: com.facebook.ads.redexgen.X.6T, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class C6T extends FrameLayout implements InterfaceC0869Dw {
    public static byte[] A0A;
    public static String[] A0B = {"gR8VXB3ia", "OJTiurBFiCqcREvzh7o4PkhSqDGudpIq", "iaBHwIBC1utH6CwOSIC2yyAu4ZYXfJ61", "YdU4", "YcTfP9iPeB3iMp", "vsmHP1kkKyGC9kag", "2EZKw0n31g6TC4", "KAWIkc2sX"};
    public C1539c2 A00;
    public final int A01;
    public final LA A02;
    public final C0958Hi A03;
    public final InterfaceC2224nG A04;
    public final C2417qT A05;
    public final InterfaceC2761w1 A06;
    public final C1245Tb A07;
    public final String A08;
    public final boolean A09;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0A, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 113);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A0A = new byte[]{118, 84, 91, 18, 65, 21, 70, 65, 84, 71, 65, 21, 116, 64, 81, 92, 80, 91, 86, 80, 123, 80, 65, 66, 90, 71, 94, 116, 86, 65, 92, 67, 92, 65, 76, 27, 21, 120, 84, 94, 80, 21, 70, 64, 71, 80, 21, 65, 93, 84, 65, 21, 92, 65, 18, 70, 21, 92, 91, 21, 76, 90, 64, 71, 21, 116, 91, 81, 71, 90, 92, 81, 120, 84, 91, 92, 83, 80, 70, 65, 27, 77, 88, 89, 21, 83, 92, 89, 80, 27, 30, 26, 25, 45, 60, 49, 61, 54, 59, 61, 22, 61, 44, 47, 55, 42, 51, 54, 57, 8, 54, 52, 35, 62, 33, 62, 35, 46, 77, 66, 71, 77, 69, 113, 93, 65, 91, 92, 77, 75, 55, 56, 45, 48, 47, 60, 24, 61, 29, 56, 45, 56, 27, 44, 55, 61, 53, 60, 33, 39, 49, 38, 55, 56, 61, 55, 63, 22, 9, 5, 23, 52, 25, 16, 5};
    }

    static {
        A02();
    }

    public C6T(C0958Hi c0958Hi, InterfaceC2224nG interfaceC2224nG, InterfaceC2761w1 interfaceC2761w1, LA la2, String str, int i5, C2417qT c2417qT) {
        super(c0958Hi);
        this.A03 = c0958Hi;
        this.A04 = interfaceC2224nG;
        this.A02 = la2;
        this.A08 = str;
        this.A06 = interfaceC2761w1;
        this.A01 = i5;
        C1245Tb preloadedDynamicWebViewController = M1.A02(la2.A1r());
        if (preloadedDynamicWebViewController != null) {
            this.A07 = preloadedDynamicWebViewController;
            this.A09 = true;
        } else {
            this.A07 = new C1245Tb(this.A03, la2, interfaceC2224nG, i5);
            M1.A03(la2, this.A07);
            this.A09 = false;
        }
        if (c2417qT != null) {
            this.A05 = c2417qT;
            this.A07.A0f(c2417qT);
        } else {
            this.A05 = this.A07.A0N();
        }
        this.A07.A0i(new E4(this));
        this.A07.A0g(interfaceC2761w1);
        EnumC2391q3.A04(this, EnumC2391q3.A0A);
        if (C2203mv.A1z(c0958Hi)) {
            c0958Hi.A0B().AM9(this.A07.A0Q(), la2.A37(), false, false, true);
        }
        A04();
    }

    private final void A03() {
        this.A07.A0j(this);
        if (!this.A09) {
            this.A03.A0F().A6f();
            this.A07.A0a();
        } else {
            this.A03.A0F().A6g();
            String[] strArr = A0B;
            if (strArr[6].length() != strArr[4].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0B;
            strArr2[6] = "EW3rEVX7vA8fzU";
            strArr2[4] = "ztAtYR2DvpL08d";
            if (this.A07.A0u()) {
                if (this.A01 == 4) {
                    if (this.A06 != null) {
                        this.A06.AEo(this);
                    }
                    if (C2203mv.A1z(this.A03)) {
                        this.A03.A0B().AEc();
                    }
                } else {
                    ALW();
                }
            }
        }
        A08();
    }

    private final void A04() {
        C1245Tb.A0C().incrementAndGet();
        A03();
        this.A07.A0d();
    }

    private void A05(Intent intent, LA la2) {
        intent.putExtra(A01(157, 8, 17), EnumC2295oR.A08);
        intent.putExtra(A01(Sdk.SDKError.Reason.MRAID_DOWNLOAD_JS_ERROR_VALUE, 18, 40), la2);
        intent.addFlags(268435456);
    }

    private final void A06(LA la2) {
        AdActivityIntent adActivityIntentA06 = C2337p8.A06(this.A03);
        A05(adActivityIntentA06, la2);
        try {
            C2337p8.A0D(this.A03, adActivityIntentA06);
        } catch (Exception e3) {
            this.A03.A08().ABz(A01(107, 11, 38), AbstractC2126lf.A0D, new C2127lg(e3));
            Log.e(A01(90, 17, 41), A01(0, 90, 68), e3);
        }
    }

    private void A07(String str, String str2) throws PackageManager.NameNotFoundException, RemoteException {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        C2644u8 c2644u8 = new C2644u8(this.A03, this.A08, this.A00, this.A05, this.A04, this.A02.A33());
        c2644u8.A0A(this.A02);
        HashMap map = new HashMap();
        if (TextUtils.isEmpty(str2)) {
            str2 = A01(148, 9, 37);
        }
        map.put(A01(Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE, 12, 95), str2);
        c2644u8.A06(this.A02.A37(), str, map);
    }

    public final void A08() {
        AbstractC2426qc.A0K(this.A07.A0Q());
        addView(this.A07.A0Q(), new FrameLayout.LayoutParams(-1, -1));
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC0869Dw
    public final void AAJ(String str) throws PackageManager.NameNotFoundException, RemoteException {
        A07(this.A02.A32().A0K().A06(), str);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC0869Dw
    public final void AAK(String str, String str2) throws PackageManager.NameNotFoundException, RemoteException {
        A07(str, str2);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC0869Dw
    public final void AAO() {
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC0869Dw
    public final void ABU() {
        new Handler(Looper.getMainLooper()).post(new E3(this));
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC0869Dw
    public final void AF3() {
        A06(this.A02);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC0869Dw
    public final void AF7() {
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC0869Dw
    public final void AFy(boolean z11) {
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC0869Dw
    public final void AH6() {
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC0869Dw
    public final void AHh(boolean z11) {
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC0869Dw
    public final void AHj(boolean z11) {
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC0869Dw
    public final void AI1(String str) {
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC0869Dw
    public final void ALW() {
        if (this.A06 != null) {
            this.A06.AEo(this);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC0869Dw
    public final void close() {
    }

    public InterfaceC2224nG getAdEventManager() {
        return this.A04;
    }

    public C1245Tb getDynamicWebViewController() {
        return this.A07;
    }

    @Override // android.view.View
    public final boolean onTouchEvent(MotionEvent motionEvent) {
        requestDisallowInterceptTouchEvent(true);
        return super.onTouchEvent(motionEvent);
    }

    public void setAdViewabilityChecker(C1539c2 c1539c2) {
        this.A00 = c1539c2;
        this.A07.A0l(c1539c2);
    }
}
