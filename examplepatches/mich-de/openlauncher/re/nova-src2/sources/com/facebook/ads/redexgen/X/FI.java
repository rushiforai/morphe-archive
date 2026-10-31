package com.facebook.ads.redexgen.X;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.RelativeLayout;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public final class FI implements InterfaceC2460rA {
    public static byte[] A0D;
    public int A00;
    public C0804Bj A01;
    public C5Z A02;
    public final C0958Hi A04;
    public final InterfaceC2224nG A05;
    public final InterfaceC2459r9 A06;
    public final InterfaceC2510ry A07;
    public final C0799Be A08;
    public final BE A0C = new BE() { // from class: com.facebook.ads.redexgen.X.6v
        public static byte[] A01;
        public static String[] A02 = {"AyjpfVMH4abbuU", "C4f54F5689i8nguXYuZVyawidNrV99tP", b.f42142b, "kvcj7JPhLleA0fC5", "qT9ER7mxQyIS", "DVCseFxiIzNfwa", "yADVvB6XdmuuqrvB", "b9AAn0hyeOBCYK5qzyR18"};

        public static String A00(int i5, int i11, int i12) {
            byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
            int i13 = 0;
            while (true) {
                int length = bArrCopyOfRange.length;
                if (A02[1].charAt(16) != 'Y') {
                    throw new RuntimeException();
                }
                String[] strArr = A02;
                strArr[7] = "MNhPeHQbaIIJpJ20hNozP";
                strArr[2] = b.f42142b;
                if (i13 >= length) {
                    return new String(bArrCopyOfRange);
                }
                bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 60);
                i13++;
            }
        }

        public static void A01() {
            A01 = new byte[]{35, 22, 17, 18, 28, -10, 27, 33, 18, 31, 32, 33, 22, 33, 14, 25, -14, 35, 18, 27, 33};
        }

        static {
            A01();
        }

        /* JADX INFO: Access modifiers changed from: private */
        @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
        /* renamed from: A02, reason: merged with bridge method [inline-methods] */
        public final void A03(BF bf2) {
            this.A00.A06.A5D(A00(0, 21, 113), bf2);
        }
    };
    public final BG A0B = new BG() { // from class: com.facebook.ads.redexgen.X.6u
        public static byte[] A01;

        static {
            A01();
        }

        public static String A00(int i5, int i11, int i12) {
            byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
            for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
                bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 63);
            }
            return new String(bArrCopyOfRange);
        }

        public static void A01() {
            A01 = new byte[]{72, 87, 90, 91, 81, 119, 80, 74, 91, 76, 77, 74, 87, 74, 95, 82, 123, 72, 91, 80, 74};
        }

        /* JADX INFO: Access modifiers changed from: private */
        @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
        /* renamed from: A02, reason: merged with bridge method [inline-methods] */
        public final void A03(C5W c5w) {
            this.A00.A06.A5D(A00(0, 21, 1), c5w);
        }
    };
    public final BM A09 = new BM() { // from class: com.facebook.ads.redexgen.X.6t
        public static byte[] A01;
        public static String[] A02 = {"OtZHHid0c6Ryk9CDDBq47ngXcNldIUWH", "JwrlVwQ54E2WwwQvkywQUOYHwL6g1bho", "WFiM5IPZvaQ4xMZm5xgvQ3FNROoMY2Kr", "al6ZIECO6LO12zMiuvYELaWNpYKDhozx", "wYAPbQwhGVteNN6MGdL8gA6824n9AnKf", "jTihIhEYsz4XSFMEjn7OlZEBUOzI3KNS", "mXaQIkSzTCVxPQuz9HLogqhmhIjgMyMR", "pEgzTi4rZbqmTwficQat67UuNHBZNbaD"};

        public static String A00(int i5, int i11, int i12) {
            byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
            for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
                bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 86);
            }
            return new String(bArrCopyOfRange);
        }

        public static void A01() {
            byte[] bArr = {17, 4, -1, 0, 10, -28, 9, 15, 0, 13, 14, 15, 4, 15, -4, 7, -32, 17, 0, 9, 15};
            String[] strArr = A02;
            if (strArr[6].charAt(4) != strArr[3].charAt(4)) {
                throw new RuntimeException();
            }
            A02[2] = "e0kN46odqljBIthjpUkTXG9hdDsWHsKW";
            A01 = bArr;
        }

        static {
            A01();
        }

        /* JADX INFO: Access modifiers changed from: private */
        @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
        /* renamed from: A02, reason: merged with bridge method [inline-methods] */
        public final void A03(C5Y c5y) {
            this.A00.A06.A5D(A00(0, 21, 69), c5y);
        }
    };
    public final BK A0A = new BK() { // from class: com.facebook.ads.redexgen.X.6s
        /* JADX INFO: Access modifiers changed from: private */
        @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
        /* renamed from: A00, reason: merged with bridge method [inline-methods] */
        public final void A03(BL bl2) {
            this.A00.A07.AEx();
        }
    };
    public String A03 = A02(0, 0, 72);

    static {
        A03();
    }

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0D, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 38);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A03() {
        A0D = new byte[]{-19, 1, 0, -5, -4, -8, -19, 5, -86, -77, -80, -84, -75, -69, -101, -74, -78, -84, -75, -74, -76, -90, -113, -94, -75, -86, -73, -90, -124, -75, -94, -125, -74, -75, -75, -80, -81, -99, -112, -117, -116, -106, 112, -107, -101, -116, -103, -102, -101, -112, -101, -120, -109, 108, -99, -116, -107, -101, -2, -15, -20, -19, -9, -44, -9, -17, -17, -19, -6, 24, 11, 6, 7, 17, -17, -14, -26, -66, -79, -84, -83, -73, -101, -83, -83, -77, -100, -79, -75, -83, 19, 6, 1, 2, 12, -14, -17, -23};
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final /* synthetic */ void onStart() {
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final /* synthetic */ void onStop() {
    }

    public FI(C0958Hi c0958Hi, InterfaceC2510ry interfaceC2510ry, InterfaceC2224nG interfaceC2224nG, InterfaceC2459r9 interfaceC2459r9) {
        this.A04 = c0958Hi;
        this.A05 = interfaceC2224nG;
        this.A07 = interfaceC2510ry;
        this.A08 = new C0799Be(c0958Hi);
        this.A08.A0g(new C5M(c0958Hi));
        this.A08.getEventBus().A03(this.A0C, this.A0B, this.A09, this.A0A);
        this.A06 = interfaceC2459r9;
        this.A08.setIsFullScreen(true);
        this.A08.setVolume(1.0f);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams.addRule(15);
        interfaceC2459r9.A4V(this.A08, layoutParams);
        C2468rI closeButton = new C2468rI(c0958Hi);
        closeButton.setOnClickListener(new ViewOnClickListenerC2508rw(this));
        RelativeLayout.LayoutParams params = closeButton.getDefaultLayoutParams();
        interfaceC2459r9.A4V(closeButton, params);
    }

    public final void A04(int i5) {
        this.A08.setVideoProgressReportIntervalMs(i5);
    }

    public final void A05(View view) {
        this.A08.setControlsAnchorView(view);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final void ABc(Intent intent, Bundle bundle, C1998jY c1998jY) {
        String strA02 = A02(0, 0, 72);
        String ctaText = A02(8, 11, 33);
        if (bundle == null) {
            String stringExtra = intent.getStringExtra(ctaText);
            if (stringExtra != null) {
                strA02 = stringExtra;
            }
            this.A03 = strA02;
        } else {
            String ctaText2 = bundle.getString(ctaText);
            if (ctaText2 != null) {
                strA02 = ctaText2;
            }
            this.A03 = strA02;
        }
        String stringExtra2 = intent.getStringExtra(A02(19, 18, 27));
        if (stringExtra2 != null && !stringExtra2.isEmpty()) {
            C2333p4 c2333p4 = new C2333p4(this.A04, stringExtra2);
            RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
            int i5 = (int) (16.0f * AbstractC2385px.A02);
            layoutParams.setMargins(i5, i5, i5, i5);
            layoutParams.addRule(10);
            layoutParams.addRule(9);
            c2333p4.setOnClickListener(new ViewOnClickListenerC2509rx(this));
            this.A06.A4V(c2333p4, layoutParams);
        }
        this.A00 = intent.getIntExtra(A02(77, 13, 34), 0);
        this.A02 = new C5Z(this.A04, this.A05, this.A08, this.A03, intent.getBundleExtra(A02(58, 11, 98)), null);
        if (C2203mv.A20(this.A04)) {
            this.A01 = new C0804Bj(this.A04, this.A05, this.A08, this.A03, false, this.A02, null);
        } else {
            this.A01 = null;
        }
        this.A08.setVideoMPD(intent.getStringExtra(A02(69, 8, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE)));
        this.A08.setVideoURI(intent.getStringExtra(A02(90, 8, Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE)));
        if (this.A00 > 0) {
            this.A08.A0b(this.A00);
        }
        if (intent.getBooleanExtra(A02(0, 8, 102), false)) {
            this.A08.A0f(EnumC1664e4.A05, 17);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final void AGF(boolean z11) {
        this.A06.A5D(A02(37, 21, 1), new BI());
        this.A08.A0Y();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final void AGp(boolean z11) {
        this.A06.A5D(A02(37, 21, 1), new BH());
        if (!this.A08.A0p()) {
            this.A08.A0f(EnumC1664e4.A05, 18);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final void AKD(Bundle bundle) {
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final String getCurrentClientToken() {
        return this.A03;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final boolean onActivityResult(int i5, int i11, Intent intent) {
        return false;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2460rA
    public final void onDestroy() {
        this.A06.A5D(A02(37, 21, 1), new BA(this.A00, this.A08.getCurrentPositionInMillis()));
        if (this.A02 != null) {
            this.A02.A0j(this.A08.getCurrentPositionInMillis());
        }
        if (this.A01 != null) {
            this.A01.A08();
        }
        this.A08.A0c(1);
        this.A08.A0X();
    }
}
