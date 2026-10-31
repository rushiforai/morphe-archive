package com.facebook.ads.redexgen.X;

import android.content.Intent;
import android.content.pm.PackageManager;
import android.graphics.drawable.ColorDrawable;
import android.os.Handler;
import android.os.Looper;
import android.os.RemoteException;
import android.text.TextUtils;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Locale;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: com.facebook.ads.redexgen.X.6L, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class C6L extends AbstractC0861Do implements InterfaceC0869Dw, C1L {
    public static byte[] A0C;
    public static String[] A0D = {"IUuJYYFIfMZJQnInmWPJcDnPayAbLtq1", "UkdSzm4WzkqymnPkDVkoo5CtKnw7iFnm", "FSH1ZQ4L68njZokAq4EGwWbOvh", "4MXLHL9ciI9L5xZSDPnIT5401SuLkPxD", "ZeTnalGsTkJhEt2lgmWxCbn8YeQ0RUO0", "t5SvOIIIG2cl5CJ0KBXCjedpkIP4iETu", "wUmwZuWUmWjdiRe3tWUvZyJzJegZdAy1", "iP2fdsb8J6oVBDOPPbJwmmhRNmQDJh6m"};
    public long A00;
    public C2370pi A01;
    public C1J A02;
    public boolean A03;
    public boolean A04;
    public boolean A05;
    public final int A06;
    public final C0958Hi A07;
    public final InterfaceC2459r9 A08;
    public final InterfaceC2515s3 A09;
    public final C1245Tb A0A;
    public final InterfaceC2511rz A0B;

    public static String A03(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0C, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            if (A0D[1].charAt(8) != 'z') {
                throw new RuntimeException();
            }
            String[] strArr = A0D;
            strArr[3] = "vGGKdTv0LVMI5qtK45xehlVrCYmR9ReM";
            strArr[5] = "CVmeLshquPTB5IABvxChkEnG2eCTjyrB";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 106);
            i13++;
        }
    }

    public static void A05() {
        byte[] bArr = {108, 103, 122, 47, 104, 99, 106, 98, 101, 110, 111, 84, 106, 111, 43, 32, 41, 33, 38, 45, 44, 23, 41, 44, 23, 33, 38, 44, 45, 48, 35, 40, 33, 41, 46, 37, 36, 31, 33, 36, 31, 44, 33, 34, 37, 44, 31, 52, 37, 56, 52, 74, 65, 72, 64, 71, 76, 77, 118, 72, 77, 118, 93, 70, 93, 72, 69, 41, 34, 43, 35, 36, 47, 46, 21, 44, 37, 56, 41, 47, 46, 21, 60, 35, 47, 61, 21, 62, 35, 39, 47, 118, 121, 124, 118, 126, 74, 102, 122, 96, 103, 118, 112, 4, 13, 16, 1, 7, 6, 61, 20, 11, 7, 21, 61, 22, 11, 15, 7, 68, 66, 84, 67, 82, 93, 88, 82, 90};
        if (A0D[7].charAt(2) != '2') {
            throw new RuntimeException();
        }
        A0D[1] = "fHE1wtNMzNzduPkXrAld0R8bV2ZATAuq";
        A0C = bArr;
    }

    static {
        A05();
    }

    public C6L(C0958Hi c0958Hi, InterfaceC2515s3 interfaceC2515s3, InterfaceC2224nG interfaceC2224nG, LA la2, int i5, boolean z11, boolean z12, InterfaceC2459r9 interfaceC2459r9, InterfaceC2511rz interfaceC2511rz, int i11, int i12, int i13, int i14) throws JSONException {
        super(c0958Hi, interfaceC2515s3, interfaceC2224nG, la2, i5, z11, z12, interfaceC2459r9, i11);
        this.A03 = false;
        this.A04 = false;
        this.A05 = false;
        this.A07 = c0958Hi;
        this.A09 = interfaceC2515s3;
        this.A08 = interfaceC2459r9;
        this.A0B = interfaceC2511rz;
        int iMax = Math.max(0, i13 - i14);
        this.A06 = iMax;
        this.A0A = new C1245Tb(c0958Hi, la2, interfaceC2224nG, i12);
        if (!TextUtils.isEmpty(super.A00)) {
            this.A0A.A0q(A03(30, 21, 42), super.A00);
        }
        this.A0A.A0q(A03(67, 24, 32), String.format(Locale.US, A03(0, 4, 35), Double.valueOf(iMax / 1000.0d)));
        this.A0A.A0q(A03(103, 16, 8), Integer.toString(iMax));
        try {
            JSONObject jSONObject = new JSONObject();
            jSONObject.put(A03(4, 10, 97), true);
            jSONObject.put(A03(51, 16, 67), i11);
            jSONObject.put(A03(14, 16, 34), i5);
            this.A0A.A0t(jSONObject);
        } catch (JSONException unused) {
        }
        EC.A06(this, new ColorDrawable(-16777216));
    }

    private void A04() {
        if (!this.A03 && this.A00 > 0) {
            this.A03 = true;
            int elapsedMs = (int) (System.currentTimeMillis() - this.A00);
            this.A0B.AEd(elapsedMs);
        }
    }

    private void A06(String str, String str2) throws PackageManager.NameNotFoundException, RemoteException {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        if (super.A08.A32().A0U()) {
            if (this.A02 == null) {
                this.A02 = new C1J(this.A07, this, this, super.A08.A1V());
                this.A0A.A0k(this.A02);
            }
            if (this.A02.A0P(str, str2, this.A0A.A0Q(), null)) {
                return;
            }
        }
        HashMap map = new HashMap();
        if (TextUtils.isEmpty(str2)) {
            str2 = A03(Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE, 9, 91);
        }
        map.put(A03(91, 12, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE), str2);
        new C2644u8(this.A07, this.A09.A7x(), this.A0F, this.A0C, super.A0A, super.A08.A33(), this.A08).A06(super.A08.A37(), str, map);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0861Do
    public final EnumC1698ec A1a(String str) throws PackageManager.NameNotFoundException, RemoteException {
        AAJ(str);
        return EnumC1698ec.A08;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0861Do
    public final void A1b() {
        super.A1b();
        A04();
        if (this.A01 != null) {
            this.A01.A06();
            this.A01 = null;
        }
        C1J c1j = this.A02;
        if (A0D[2].length() == 4) {
            throw new RuntimeException();
        }
        String[] strArr = A0D;
        strArr[4] = "Gms856nYL4wdZmM2RF8KUCnfJTcG3zKK";
        strArr[0] = "XGbpTuOv9k2uupmc7j9zznncRMJnGoeP";
        if (c1j != null) {
            this.A02.A0K();
            this.A02 = null;
        }
        this.A0F.A0V();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0861Do
    public final void A1g() {
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0861Do
    public final void A1h() {
        this.A0A.A0j(this);
        this.A0A.A0a();
        ViewGroup viewGroup = (ViewGroup) this.A0A.A0Q().getParent();
        if (viewGroup != null) {
            ViewGroup parent = this.A0A.A0Q();
            viewGroup.removeView(parent);
        }
        addView(this.A0A.A0Q(), new FrameLayout.LayoutParams(-1, -1));
        this.A0A.A0d();
        if (this.A06 > 0 && !this.A04) {
            this.A00 = System.currentTimeMillis();
            this.A01 = new C2370pi(this.A06, 100.0f, 100L, new Handler(Looper.getMainLooper()), new C0857Dk(this));
            this.A01.A07();
            return;
        }
        this.A0B.AH3(true);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0861Do
    public final void A1i(boolean z11) {
        if (z11) {
            if (A0D[6].charAt(5) == '0') {
                throw new RuntimeException();
            }
            String[] strArr = A0D;
            strArr[4] = "5mlyA1Jsc0PWAbQGHDKAeTnsP3ty69hA";
            strArr[0] = "EDrOZSRInWKqYiTZNVqbYgnHVeqR0HHX";
            this.A04 = true;
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0861Do
    public final void A1j(boolean z11) {
        if (this.A02 != null && this.A02.A0N()) {
            return;
        }
        if (this.A01 != null) {
            this.A01.A06();
        }
        if (z11) {
            this.A0A.A0W();
        } else {
            this.A0A.A0b();
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0861Do
    public final void A1k(boolean z11) {
        if (this.A01 != null && !this.A01.A05() && !this.A01.A04()) {
            this.A01.A07();
        }
        if (z11) {
            this.A0A.A0V();
            return;
        }
        C1245Tb c1245Tb = this.A0A;
        if (A0D[1].charAt(8) != 'z') {
            throw new RuntimeException();
        }
        A0D[2] = "fJpRK4l9eTZXHwTP0FR";
        c1245Tb.A0c();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0861Do
    public final boolean A1o() {
        return false;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0861Do
    public final boolean A1p() {
        return false;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0861Do
    public final boolean A1q() {
        return true;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0861Do
    public final boolean A1r(int i5, int i11, Intent intent) {
        if (i5 != C1J.A0G) {
            return false;
        }
        C1J c1j = this.A02;
        if (A0D[6].charAt(5) == '0') {
            throw new RuntimeException();
        }
        A0D[1] = "W7Vegf5azP6B6EfIwTJLzc0rw74bFnMR";
        if (c1j != null) {
            boolean zA0N = this.A02.A0N();
            if (A0D[2].length() != 4) {
                A0D[7] = "AX2lZp3if2L7aivV8T1NwgyldhdrQZW6";
                if (!zA0N) {
                    return false;
                }
            } else {
                A0D[2] = "225jJAAJ441v1XcW";
                if (!zA0N) {
                    return false;
                }
            }
            this.A0A.A0X();
            return true;
        }
        return false;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC0869Dw
    public final void AAJ(String str) throws PackageManager.NameNotFoundException, RemoteException {
        A06(super.A08.A32().A0K().A06(), str);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC0869Dw
    public final void AAK(String str, String str2) throws PackageManager.NameNotFoundException, RemoteException {
        A06(str, str2);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC0869Dw
    public final void AAO() {
        this.A08.A5C(this.A09.A7L());
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC0869Dw
    public final void ABU() {
        new Handler(Looper.getMainLooper()).post(new C0856Dj(this));
    }

    @Override // com.facebook.ads.redexgen.X.C1L
    public final void AEF() {
        if (this.A05) {
            return;
        }
        this.A05 = true;
        this.A0A.A0b();
    }

    @Override // com.facebook.ads.redexgen.X.C1L
    public final void AEG() {
        if (!this.A05) {
            return;
        }
        this.A05 = false;
        this.A0A.A0c();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC0869Dw
    public final void AF3() {
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

    @Override // com.facebook.ads.redexgen.X.C1L
    public final void AHq() {
        this.A0A.A0X();
    }

    @Override // com.facebook.ads.redexgen.X.C1L
    public final void AHr() {
        this.A0A.A0Y();
    }

    @Override // com.facebook.ads.redexgen.X.C1L
    public final void AHs() {
        this.A0A.A0X();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC0869Dw
    public final void AI1(String str) {
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC0869Dw
    public final void ALW() {
        A1f();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC0869Dw
    public final void close() {
        A04();
        this.A0B.AE6();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC0861Do
    public C2597tN getFullScreenAdStyle() {
        return new C2597tN(true, C2597tN.A07, super.A08.A31().A01(), false, -16777216, null);
    }
}
