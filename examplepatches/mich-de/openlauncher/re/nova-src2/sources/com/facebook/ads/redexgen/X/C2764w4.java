package com.facebook.ads.redexgen.X;

import android.text.TextUtils;
import android.widget.FrameLayout;
import java.util.Arrays;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: com.facebook.ads.redexgen.X.w4, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2764w4 extends FrameLayout {
    public static byte[] A0L;
    public static String[] A0M = {"tg98T7YqorVxljyy5rC9rRviyjZQ3PWt", "vfHBQfbeXMWpx0Lt9J2p4bolhXFdVoUD", "nuD8gLvjahybAxP4K7AI7EnQPexhi40p", "Mle9DIn2BhVQrDGkT0Ym6c4cXgC65WVc", "K7R1lop0AG70QQAdOPTNlaEDkQeUTiOI", "yRh0uKXr8zSd48KJrOgjFYKLFGGCRN1w", "QQOq4rDYvkiUVU0ErOwgNbjJJCuazTiH", "YmsKh0Z7MVbEzdUA2tq2qo4jdnYDOoVM"};
    public EnumC1664e4 A00;
    public boolean A01;
    public boolean A02;
    public boolean A03;
    public boolean A04;
    public final LA A05;
    public final C2086kz A06;
    public final C0958Hi A07;
    public final C2232nO A08;
    public final InterfaceC2459r9 A09;
    public final InterfaceC2515s3 A0A;
    public final InterfaceC2763w3 A0B;
    public final C0804Bj A0C;
    public final C0799Be A0D;
    public final C5Z A0E;
    public final BM A0F;
    public final BK A0G;
    public final BG A0H;
    public final BE A0I;
    public final BC A0J;
    public final BB A0K;

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0L, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 38);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0C() {
        A0L = new byte[]{5, 19, 20, 20, 3, 8, 18, 50, 15, 11, 3, 78, 95, 88, 75, 94, 67, 69, 68, 95, 71, 70, 87, 86, 98, 115, 103, 97, 119, 118, 80, 107, 71, 97, 119, 96, 38, 36, 57, 49, 36, 51, 37, 37};
    }

    static {
        A0C();
    }

    public C2764w4(C0958Hi c0958Hi, InterfaceC2224nG interfaceC2224nG, LA la2, C2086kz c2086kz, C2232nO c2232nO, InterfaceC2459r9 interfaceC2459r9, InterfaceC2515s3 interfaceC2515s3, InterfaceC2763w3 interfaceC2763w3) {
        boolean z11;
        super(c0958Hi);
        this.A0J = new BC() { // from class: com.facebook.ads.redexgen.X.6S
            public static byte[] A01;

            static {
                A01();
            }

            public static String A00(int i5, int i11, int i12) {
                byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
                for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
                    bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 5);
                }
                return new String(bArrCopyOfRange);
            }

            public static void A01() {
                A01 = new byte[]{16, 18, 5, 16, 1, 18, 5, 4};
            }

            /* JADX INFO: Access modifiers changed from: private */
            @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
            /* renamed from: A02, reason: merged with bridge method [inline-methods] */
            public final void A03(BD bd2) {
                this.A00.A03 = true;
                this.A00.A0B.AHb(A00(0, 8, 101), this.A00.A03());
            }
        };
        this.A0I = new BE() { // from class: com.facebook.ads.redexgen.X.6R
            public static byte[] A01;

            static {
                A01();
            }

            public static String A00(int i5, int i11, int i12) {
                byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
                for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
                    bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 15);
                }
                return new String(bArrCopyOfRange);
            }

            public static void A01() {
                A01 = new byte[]{65, 93, 80, 72};
            }

            /* JADX INFO: Access modifiers changed from: private */
            @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
            /* renamed from: A02, reason: merged with bridge method [inline-methods] */
            public final void A03(BF bf2) {
                this.A00.A04 = true;
                this.A00.A0B.AHb(A00(0, 4, 62), this.A00.A03());
            }
        };
        this.A0H = new BG() { // from class: com.facebook.ads.redexgen.X.6Q
            public static byte[] A01;

            static {
                A01();
            }

            public static String A00(int i5, int i11, int i12) {
                byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
                for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
                    bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 93);
                }
                return new String(bArrCopyOfRange);
            }

            public static void A01() {
                A01 = new byte[]{28, 13, 25, 31, 9};
            }

            /* JADX INFO: Access modifiers changed from: private */
            @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
            /* renamed from: A02, reason: merged with bridge method [inline-methods] */
            public final void A03(C5W c5w) {
                this.A00.A0B.AHb(A00(0, 5, 49), this.A00.A03());
            }
        };
        this.A0K = new BB() { // from class: com.facebook.ads.redexgen.X.6P
            /* JADX INFO: Access modifiers changed from: private */
            @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
            /* renamed from: A00, reason: merged with bridge method [inline-methods] */
            public final void A03(C5V c5v) {
                this.A00.A0H(c5v);
                this.A00.A0A();
            }
        };
        this.A0F = new BM() { // from class: com.facebook.ads.redexgen.X.6O
            public static byte[] A01;

            static {
                A01();
            }

            public static String A00(int i5, int i11, int i12) {
                byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
                for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
                    bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 77);
                }
                return new String(bArrCopyOfRange);
            }

            public static void A01() {
                A01 = new byte[]{20, 32, 30, 33, 29, 22, 37, 22, 21};
            }

            /* JADX INFO: Access modifiers changed from: private */
            @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
            /* renamed from: A02, reason: merged with bridge method [inline-methods] */
            public final void A03(C5Y c5y) throws JSONException {
                this.A00.A07();
                this.A00.A0B.AHb(A00(0, 9, 100), this.A00.A04(this.A00.A0D.getDuration()));
            }
        };
        this.A0G = new C6N(this);
        this.A03 = false;
        this.A04 = false;
        this.A02 = false;
        this.A01 = false;
        this.A07 = c0958Hi;
        this.A05 = la2;
        this.A06 = c2086kz;
        this.A08 = c2232nO;
        this.A09 = interfaceC2459r9;
        this.A0A = interfaceC2515s3;
        this.A0D = new C0799Be(c0958Hi);
        this.A0B = interfaceC2763w3;
        this.A0D.setFunnelLoggingHandler(c2232nO);
        this.A0D.getEventBus().A03(this.A0J, this.A0I, this.A0H, this.A0K, this.A0F, this.A0G);
        this.A0E = new C5Z(c0958Hi, interfaceC2224nG, this.A0D, la2.A37());
        if (C2203mv.A20(this.A07)) {
            z11 = true;
            this.A0C = new C0804Bj(c0958Hi, interfaceC2224nG, this.A0D, la2.A37(), false, this.A0E, null);
        } else {
            z11 = true;
            this.A0C = null;
        }
        A0B();
        String strA09 = this.A05.A32().A0I().A09();
        if (strA09 != null) {
            this.A0D.setVideoURI(this.A06.A0T(strA09));
        }
        A09();
        AbstractC2426qc.A0O(this, this.A05.A31().A01().A08(z11));
        String videoUrl = la2.A32().A0I().A08();
        if (!TextUtils.isEmpty(videoUrl)) {
            AbstractC2668uW.A00(c0958Hi, this, videoUrl);
        }
        addView(this.A0D, new FrameLayout.LayoutParams(-1, -1));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public JSONObject A03() {
        return A04(this.A0D.getCurrentPositionInMillis());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public JSONObject A04(int i5) throws JSONException {
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put(A02(0, 11, 64), i5);
            jSONObject.put(A02(11, 8, 12), this.A0D.getDuration());
            jSONObject.put(A02(19, 5, 20), this.A0D.A0n());
            jSONObject.put(A02(24, 12, 52), this.A0D.A0p());
            return jSONObject;
        } catch (JSONException e3) {
            throw new RuntimeException(e3);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A07() {
        if (this.A02) {
            return;
        }
        if (A0M[4].charAt(2) == 'n') {
            throw new RuntimeException();
        }
        String[] strArr = A0M;
        strArr[2] = "wYD5NcGpzh0isOAoVzlYli3P4mnoyMgF";
        strArr[3] = "lJUNZHbcIhPOnD8CvxzjDicpi9xwJBJa";
        this.A02 = true;
    }

    private void A08() {
        this.A0D.postDelayed(new E1(this), C2203mv.A0M(this.A07));
    }

    private void A09() {
        this.A0D.postDelayed(new E0(this), C2203mv.A0N(this.A07));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0A() {
        this.A0B.AHb(A02(36, 8, 112), A03());
    }

    private void A0B() {
        if (!TextUtils.isEmpty(this.A05.A32().A0I().A08())) {
            C5B c5b = new C5B(this.A07);
            this.A0D.A0g(c5b);
            c5b.setImage(this.A05.A32().A0I().A08());
        }
        AnonymousClass51 anonymousClass51 = new AnonymousClass51(this.A07, true, this.A08);
        this.A0D.A0g(anonymousClass51);
        this.A0D.A0g(new C0788At(anonymousClass51, EnumC1654du.A03, true));
        this.A0D.A0g(new AnonymousClass55(this.A07));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0H(C5V c5v) {
        if (this.A0D.getState() == EnumC1549cC.A02 && C2203mv.A1e(this.A07)) {
            this.A0D.postDelayed(new C0871Dy(this, c5v), 5000L);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A0I(String str) {
        this.A07.A0F().A3x(str, this.A05.A32().A0I().A09());
        if (C2203mv.A1f(this.A07)) {
            A07();
            return;
        }
        InterfaceC2459r9 interfaceC2459r9 = this.A09;
        InterfaceC2515s3 interfaceC2515s3 = this.A0A;
        String[] strArr = A0M;
        if (strArr[5].charAt(16) != strArr[6].charAt(16)) {
            throw new RuntimeException();
        }
        String[] strArr2 = A0M;
        strArr2[2] = "EBONCaOY6he3EVwrjSVJVgPSsddIWnnf";
        strArr2[3] = "quoo3J1Esh1kTLqYeLvwyhMYZuOues3Q";
        interfaceC2459r9.A5C(interfaceC2515s3.A8c());
        this.A09.A5C(this.A0A.A8X());
    }

    public final void A0N() {
        this.A0D.setVolume(this.A05.A32().A0I().A0A() ? 0.0f : 1.0f);
        this.A0D.A0f(EnumC1664e4.A03, 26);
        A08();
    }

    public final void A0O() {
        if (this.A0D != null) {
            if (!this.A02) {
                this.A0D.A0e(EnumC1718ex.A04);
            }
            this.A0D.getEventBus().A04(this.A0J, this.A0I, this.A0H, this.A0K, this.A0F, this.A0G);
            this.A0D.A0X();
        }
        if (this.A0C != null) {
            this.A0C.A07();
        }
        this.A0E.A0p();
    }

    public final void A0P() {
        this.A0D.A0c(9);
        AbstractC2426qc.A0X(this);
        AbstractC2426qc.A0I(this.A0D);
        AbstractC2426qc.A0e(this.A0D);
    }

    public final void A0Q() {
        this.A0D.A0e(EnumC1718ex.A05);
    }

    public final void A0R(boolean z11) {
        if (z11) {
            this.A0D.setVolume(0.0f);
        } else {
            this.A0D.setVolume(1.0f);
        }
        A0A();
        if (A0M[7].charAt(5) == 'u') {
            throw new RuntimeException();
        }
        A0M[4] = "yn69DofMHsLSVfdL7HK9OU5c1k1rZYJH";
    }

    public final void A0S(boolean z11) {
        if (this.A0D.A0o()) {
            return;
        }
        this.A00 = this.A0D.getVideoStartReason();
        this.A01 = z11;
        this.A0D.A0j(false, 19);
    }

    public final void A0T(boolean z11) {
        if (this.A0D.A0p() || this.A02 || this.A0D.getState() == EnumC1549cC.A06 || this.A00 == null) {
            return;
        }
        boolean z12 = this.A01;
        if (A0M[7].charAt(5) == 'u') {
            throw new RuntimeException();
        }
        String[] strArr = A0M;
        strArr[1] = "icjW3n8vZZxsaCmttUmjcTI7CQu2m51p";
        strArr[0] = "kS3lp82K2YolC4kFtdcvtTBENFWE8ibh";
        if (!z12 || z11) {
            this.A0D.A0f(this.A00, 27);
        }
    }

    public final void A0U(boolean z11) {
        this.A0D.A0j(z11, 18);
    }

    public final void A0V(boolean z11) {
        this.A0D.A0f(EnumC1664e4.A05, 25);
    }
}
