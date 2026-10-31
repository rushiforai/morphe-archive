package com.facebook.ads.redexgen.X;

import android.text.TextUtils;
import android.util.Log;
import java.util.Arrays;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: com.facebook.ads.redexgen.X.Gt, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C0943Gt implements InterfaceC2224nG {
    public static InterfaceC2224nG A03;
    public static byte[] A04;
    public static final String A05;
    public static volatile boolean A06;
    public final C0957Hh A00;
    public final InterfaceC2176mU A01;
    public final InterfaceC2223nF A02;

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A04, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 79);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A03() {
        A04 = new byte[]{-90, -21, -4, -21, -12, -6, -76, -88, -37, -37, -52, -44, -41, -37, -48, -43, -50, -121, -37, -42, -121, -45, -42, -50, -121, -56, -43, -121, -48, -43, -35, -56, -45, -48, -53, -121, -43, -13, -30, -28, -26, -24, -26, -17, -26, -13, -22, -28, 46, 51, 42, 31};
    }

    static {
        A03();
        A05 = C0943Gt.class.getSimpleName();
        A06 = false;
    }

    public C0943Gt(C0957Hh c0957Hh) {
        InterfaceC2222nE dispatchCallback;
        this.A00 = c0957Hh;
        if (AbstractC2205mx.A0T(c0957Hh)) {
            this.A01 = AbstractC2174mS.A00(c0957Hh);
            dispatchCallback = AbstractC2229nL.A00(c0957Hh, this.A01);
        } else {
            C7A c7aA01 = AbstractC2174mS.A01(c0957Hh);
            dispatchCallback = AbstractC2229nL.A01(c0957Hh, c7aA01);
            this.A01 = c7aA01;
        }
        this.A02 = new C0946Gw(c0957Hh, dispatchCallback);
        ExecutorC2431qh.A08.execute(new C0945Gv(this));
        A04(c0957Hh);
    }

    public static synchronized InterfaceC2224nG A01(C0957Hh c0957Hh) {
        if (A03 == null) {
            A03 = new C0943Gt(c0957Hh);
        }
        return A03;
    }

    public static synchronized void A04(C0957Hh c0957Hh) {
        if (A06) {
            return;
        }
        c0957Hh.A04().ADj();
        A06 = true;
    }

    private void A05(C2221nD c2221nD) {
        if (!c2221nD.A0A()) {
            Log.e(A05, A02(7, 29, 24) + c2221nD.A06() + A02(0, 7, 55));
        } else {
            A06(c2221nD);
            this.A01.AMQ(c2221nD, new C0944Gu(this, c2221nD));
        }
    }

    private void A06(C2221nD c2221nD) {
        switch (C2225nH.A00[c2221nD.A06().ordinal()]) {
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
            case 6:
            case 7:
                C2127lg c2127lg = new C2127lg(new Exception(A02(36, 5, 50)));
                c2127lg.A05(1);
                try {
                    c2127lg.A07(new JSONObject().put(A02(48, 4, 107), c2221nD.A06().toString()));
                } catch (JSONException unused) {
                }
                this.A00.A08().AC0(A02(41, 7, 50), AbstractC2126lf.A1H, c2127lg);
                break;
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2224nG
    public final void ABo(String str, Map<String, String> data) {
        A05(new C2220nC().A04(str).A00(this.A00.A09().A01()).A03(this.A00.A09().A02()).A05(data).A01(EnumC2226nI.A04).A02(EnumC2227nJ.A04).A07(this.A00));
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2224nG
    public final void ABq(String str, Map<String, String> data) {
        A05(new C2220nC().A04(str).A00(this.A00.A09().A01()).A03(this.A00.A09().A02()).A05(data).A01(EnumC2226nI.A04).A02(EnumC2227nJ.A06).A07(this.A00));
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2224nG
    public final void ABr(String str, Map<String, String> data) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        A05(new C2220nC().A04(str).A00(this.A00.A09().A01()).A03(this.A00.A09().A02()).A05(data).A01(EnumC2226nI.A04).A02(EnumC2227nJ.A07).A06(AbstractC2234nQ.A0A(str, EnumC2231nN.A0I)).A07(this.A00));
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2224nG
    public final void ABt(String str, Map<String, String> data) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        A05(new C2220nC().A04(str).A00(this.A00.A09().A01()).A03(this.A00.A09().A02()).A05(data).A01(EnumC2226nI.A04).A02(EnumC2227nJ.A08).A06(AbstractC2234nQ.A0A(str, EnumC2231nN.A06)).A07(this.A00));
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2224nG
    public final void ABy(String str, Map<String, String> data) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        A05(new C2220nC().A04(str).A00(this.A00.A09().A01()).A03(this.A00.A09().A02()).A05(data).A01(EnumC2226nI.A04).A02(EnumC2227nJ.A0B).A07(this.A00));
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2224nG
    public final void AC2(String str, Map<String, String> data) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        A05(new C2220nC().A04(str).A00(this.A00.A09().A01()).A03(this.A00.A09().A02()).A05(data).A01(EnumC2226nI.A04).A02(EnumC2227nJ.A0C).A07(this.A00));
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2224nG
    public final void AC7(String str, Map<String, String> data) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        A05(new C2220nC().A04(str).A00(this.A00.A09().A01()).A03(this.A00.A09().A02()).A05(data).A01(EnumC2226nI.A05).A02(EnumC2227nJ.A0D).A06(AbstractC2234nQ.A0A(str, EnumC2231nN.A0T)).A07(this.A00));
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2224nG
    public final void AC8(String str, Map<String, String> data) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        A05(new C2220nC().A04(str).A00(this.A00.A09().A01()).A03(this.A00.A09().A02()).A05(data).A01(EnumC2226nI.A05).A02(EnumC2227nJ.A0E).A07(this.A00));
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2224nG
    public final void AC9(String str, Map<String, String> data) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        A05(new C2220nC().A04(str).A00(this.A00.A09().A01()).A03(this.A00.A09().A02()).A05(data).A01(EnumC2226nI.A05).A02(EnumC2227nJ.A0F).A06(AbstractC2234nQ.A0A(str, EnumC2231nN.A0V)).A07(this.A00));
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2224nG
    public final void ACA(String str, Map<String, String> data) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        A05(new C2220nC().A04(str).A00(this.A00.A09().A01()).A03(this.A00.A09().A02()).A05(data).A01(EnumC2226nI.A05).A02(EnumC2227nJ.A0K).A06(AbstractC2234nQ.A0A(str, EnumC2231nN.A0W)).A07(this.A00));
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2224nG
    public final void ACb(String str, Map<String, String> data) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        A05(new C2220nC().A04(str).A00(this.A00.A09().A01()).A03(this.A00.A09().A02()).A05(data).A01(EnumC2226nI.A05).A02(EnumC2227nJ.A0H).A06(AbstractC2234nQ.A0A(str, EnumC2231nN.A0X)).A07(this.A00));
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2224nG
    public final void ACd(String str, Map<String, String> data) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        A05(new C2220nC().A04(str).A00(this.A00.A09().A01()).A03(this.A00.A09().A02()).A05(data).A01(EnumC2226nI.A04).A02(EnumC2227nJ.A0J).A06(AbstractC2234nQ.A0A(str, EnumC2231nN.A0a)).A07(this.A00));
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2224nG
    public final void ACe(String str, Map<String, String> data, String str2, EnumC2226nI enumC2226nI) {
        A05(new C2220nC().A04(str).A00(this.A00.A09().A01()).A03(this.A00.A09().A02()).A05(data).A01(enumC2226nI).A02(EnumC2227nJ.A00(str2)).A07(this.A00));
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2224nG
    public final void ACf(String str, Map<String, String> data) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        C2221nD adEvent = new C2220nC().A04(str).A00(this.A00.A09().A01()).A03(this.A00.A09().A02()).A05(data).A01(EnumC2226nI.A04).A02(EnumC2227nJ.A0L).A07(this.A00);
        A05(adEvent);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2224nG
    public final void ACg(String str, Map<String, String> data) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        C2221nD adEvent = new C2220nC().A04(str).A00(this.A00.A09().A01()).A03(this.A00.A09().A02()).A05(data).A01(EnumC2226nI.A04).A02(EnumC2227nJ.A0M).A07(this.A00);
        A05(adEvent);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2224nG
    public final void ACn(String str, Map<String, String> data) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        A05(new C2220nC().A04(str).A00(this.A00.A09().A01()).A03(this.A00.A09().A02()).A05(data).A01(EnumC2226nI.A05).A02(EnumC2227nJ.A0O).A06(AbstractC2234nQ.A0A(str, EnumC2231nN.A0w)).A07(this.A00));
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2224nG
    public final void ACo(String str, Map<String, String> data) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        A05(new C2220nC().A04(str).A00(this.A00.A09().A01()).A03(this.A00.A09().A02()).A05(data).A01(EnumC2226nI.A05).A02(EnumC2227nJ.A0P).A06(AbstractC2234nQ.A0A(str, EnumC2231nN.A0x)).A07(this.A00));
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2224nG
    public final void ACq(String str) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        A05(new C2220nC().A04(str).A00(this.A00.A09().A01()).A03(this.A00.A09().A02()).A01(EnumC2226nI.A04).A02(EnumC2227nJ.A0Q).A06(AbstractC2234nQ.A0A(str, EnumC2231nN.A0y)).A07(this.A00));
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2224nG
    public final void ACt(String str, Map<String, String> data) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        A05(new C2220nC().A04(str).A00(this.A00.A09().A01()).A03(this.A00.A09().A02()).A05(data).A01(EnumC2226nI.A04).A02(EnumC2227nJ.A0G).A07(this.A00));
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2224nG
    public final void ACy(String str, Map<String, String> data) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        A05(new C2220nC().A04(str).A00(this.A00.A09().A01()).A03(this.A00.A09().A02()).A05(data).A01(EnumC2226nI.A05).A02(EnumC2227nJ.A0R).A06(AbstractC2234nQ.A0A(str, EnumC2231nN.A12)).A07(this.A00));
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2224nG
    public final void ACz(String str, Map<String, String> data) {
        A05(new C2220nC().A04(str).A00(this.A00.A09().A01()).A03(this.A00.A09().A02()).A05(data).A01(EnumC2226nI.A05).A02(EnumC2227nJ.A0W).A07(this.A00));
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2224nG
    public final void AD1(String str, Map<String, String> data) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        A05(new C2220nC().A04(str).A00(this.A00.A09().A01()).A03(this.A00.A09().A02()).A05(data).A01(EnumC2226nI.A05).A02(EnumC2227nJ.A0X).A07(this.A00));
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2224nG
    public final void AIC(String str) {
        new C1442aT(this.A00).A0C(str);
    }
}
