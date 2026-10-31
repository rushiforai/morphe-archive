package com.facebook.ads.redexgen.X;

import android.text.TextUtils;
import android.util.Log;
import android.webkit.WebSettings;
import android.widget.FrameLayout;
import android.widget.RelativeLayout;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.vungle.ads.internal.protos.Sdk;
import java.lang.ref.WeakReference;
import java.util.Arrays;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: com.facebook.ads.redexgen.X.hX, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1876hX extends FrameLayout {
    public static byte[] A0C;
    public static String[] A0D = {"2LrpfYyae0azpeRldXrTpIs5j5WolZYJ", "aTWFoH17M5HvBaS06GyoTMgY8LK09kB1", "ZT9jJV1ne", "vwbwskwEgIVHj6V8wHV", "a8UIfMhCahgZVDol7QIaAFMNjSR7v8Rm", "pauq9xVSe1TSbn6Nh8iDWIypG", "tig0s2h3zWgeN1kA13N6tuAlrnUP1dby", "gu60Pcp0oAdbO9RcUpkXMIBgrMh0CW0V"};
    public static final float A0E;
    public static final RelativeLayout.LayoutParams A0F;
    public int A00;
    public long A01;
    public Map<String, String> A02;
    public final LA A03;
    public final C1758fb A04;
    public final C0958Hi A05;
    public final InterfaceC2224nG A06;
    public final InterfaceC2610ta A07;
    public final C0894Ev A08;
    public final InterfaceC1887hj A09;
    public final AtomicBoolean A0A;
    public final AtomicBoolean A0B;

    public static String A07(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0C, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            int i14 = bArrCopyOfRange[i13] ^ i12;
            if (A0D[5].length() != 25) {
                throw new RuntimeException();
            }
            A0D[4] = "2xsSJQdmJTzWNKbVkLPVv70adF3crTtp";
            bArrCopyOfRange[i13] = (byte) (i14 ^ 37);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0A() {
        A0C = new byte[]{11, 47, 29, 33, 44, 52, 44, 47, 33, 40, 12, 41, 52, 5, 22, 23, 13, 10, 3, 68, 1, 22, 22, 11, 22, 52, 8, 5, 29, 5, 6, 8, 1, 68, 0, 11, 39, 16, 5, 39, 8, 13, 7, 15, 68, 16, 22, 13, 3, 3, 1, 22, 1, 0, 68, 19, 13, 16, 12, 68, 20, 22, 1, 73, 1, 18, 1, 10, 16, 68, 7, 8, 13, 7, 15, 23, 68, 7, 11, 17, 10, 16, 68, 5, 10, 0, 68, 32, 1, 8, 5, 29, 106, 86, 91, 67, 91, 88, 86, 95, 123, 94, 73, 108, 83, 95, 77, 102, 97, 99, 109, 106, 36, 104, 107, 101, 96, 109, 106, 99, 36, 118, 97, 105, 107, 112, 97, 36, 116, 104, 101, 125, 101, 102, 104, 97, 61, 50, 55, 61, 53, 45, 112, 113, 120, 117, 109, 93, 65, 76, 84, 76, 79, 65, 72, 55, 43, 38, 62, 38, 37, 43, 34, 24, 53, 34, 42, 40, 51, 34, 21, 2, 10, 8, 19, 2, 56, 20, 2, 20, 20, 14, 8, 9, 56, 14, 3, 20, 15, 11, 5, 14, 107, 121, 126, 67, 106, 117, 121, 107};
    }

    static {
        A0A();
        A0E = (int) (AbstractC2385px.A02 * 4.0f);
        A0F = new RelativeLayout.LayoutParams(-1, -1);
    }

    public C1876hX(C0958Hi c0958Hi, LA la2, C1758fb c1758fb, InterfaceC2224nG interfaceC2224nG, InterfaceC1887hj interfaceC1887hj, Map<String, String> playableMetricsData) {
        super(c0958Hi);
        this.A0A = new AtomicBoolean(false);
        this.A0B = new AtomicBoolean(false);
        this.A01 = -1L;
        this.A00 = 0;
        this.A07 = new AbstractC0897Ey() { // from class: com.facebook.ads.redexgen.X.5g
            @Override // com.facebook.ads.redexgen.X.InterfaceC2610ta
            public final void ADv() {
            }

            @Override // com.facebook.ads.redexgen.X.AbstractC0897Ey, com.facebook.ads.redexgen.X.InterfaceC2610ta
            public final void AEw(int i5, String str) {
                this.A00.A0B.set(true);
                this.A00.A09.AFk();
            }

            @Override // com.facebook.ads.redexgen.X.InterfaceC2610ta
            public final void AFD() {
                if (this.A00.A0B.get() || !this.A00.A0A.compareAndSet(false, true)) {
                    return;
                }
                this.A00.A09.AFD();
            }

            @Override // com.facebook.ads.redexgen.X.InterfaceC2610ta
            public final void AGD() {
                if (this.A00.A04.A0g()) {
                    this.A00.A09.AGV();
                } else {
                    this.A00.A09.AFm();
                }
            }

            @Override // com.facebook.ads.redexgen.X.InterfaceC2610ta
            public final void AHt() {
                this.A00.A09.AHt();
            }
        };
        this.A05 = c0958Hi;
        this.A03 = la2;
        this.A04 = c1758fb;
        this.A06 = interfaceC2224nG;
        this.A09 = interfaceC1887hj;
        this.A02 = playableMetricsData;
        this.A08 = A05();
        if (C2203mv.A1z(this.A05)) {
            this.A05.A0B().AM7(this.A08, this.A03.A37(), false);
        }
        addView(this.A08, A0F);
    }

    public static /* synthetic */ int A00(C1876hX c1876hX) {
        int i5 = c1876hX.A00;
        c1876hX.A00 = i5 + 1;
        return i5;
    }

    private C0894Ev A05() {
        C0894Ev c0894Ev = new C0894Ev(this.A05, (WeakReference<InterfaceC2610ta>) new WeakReference(this.A07), 10, C2203mv.A28(this.A05));
        c0894Ev.setCornerRadius(A0E);
        c0894Ev.setLogMultipleImpressions(false);
        c0894Ev.setCheckAssetsByJavascriptBridge(false);
        c0894Ev.setWebViewTimeoutInMillis(this.A04.A0F());
        c0894Ev.setRequestId(this.A03.A1r());
        c0894Ev.setOnTouchListener(new ViewOnTouchListenerC1877hY(this));
        WebSettings settings = c0894Ev.getSettings();
        settings.setLoadWithOverviewMode(true);
        settings.setUseWideViewPort(true);
        settings.setAllowFileAccess(true);
        settings.setAllowFileAccessFromFileURLs(true);
        c0894Ev.addJavascriptInterface(new C1875hW(this.A05, this, this.A06, this.A02, this.A03.A37()), A07(0, 12, 104));
        return c0894Ev;
    }

    /* JADX WARN: Code restructure failed: missing block: B:13:0x00b8, code lost:
    
        if (r3 <= com.facebook.ads.redexgen.X.C2203mv.A0J(r8)) goto L14;
     */
    /* JADX WARN: Code restructure failed: missing block: B:14:0x00ba, code lost:
    
        r3 = r9.A09;
        r2 = com.facebook.ads.redexgen.X.C1876hX.A0D;
     */
    /* JADX WARN: Code restructure failed: missing block: B:15:0x00ce, code lost:
    
        if (r2[0].charAt(14) == r2[7].charAt(14)) goto L18;
     */
    /* JADX WARN: Code restructure failed: missing block: B:16:0x00d0, code lost:
    
        r3.AEY();
     */
    /* JADX WARN: Code restructure failed: missing block: B:17:0x00d3, code lost:
    
        return;
     */
    /* JADX WARN: Code restructure failed: missing block: B:18:0x00d4, code lost:
    
        r2 = com.facebook.ads.redexgen.X.C1876hX.A0D;
        r2[0] = "1qrV4xG42mjJ5wR1PYF4mguO0xYm8sMw";
        r2[7] = "To2gWJFbGkwQ4PRGYAw3BZd3UXo54AHv";
        r3.AEY();
     */
    /* JADX WARN: Code restructure failed: missing block: B:20:0x00f2, code lost:
    
        if (r3 <= com.facebook.ads.redexgen.X.C2203mv.A0J(r8)) goto L14;
     */
    /* JADX WARN: Code restructure failed: missing block: B:22:0x00f5, code lost:
    
        r7.A05(0);
        r9.A05.A08().ABz(r6, com.facebook.ads.redexgen.X.AbstractC2126lf.A2E, r7);
     */
    /* JADX WARN: Code restructure failed: missing block: B:28:?, code lost:
    
        return;
     */
    /* JADX WARN: Code restructure failed: missing block: B:29:?, code lost:
    
        return;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void A0B() {
        long jCurrentTimeMillis = System.currentTimeMillis() - this.A01;
        C2127lg c2127lg = new C2127lg(A07(25, 67, 65));
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put(A07(Sdk.SDKError.Reason.PRIVACY_URL_ERROR_VALUE, 6, Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE), this.A00);
            jSONObject.put(A07(142, 5, 49), jCurrentTimeMillis);
            jSONObject.put(A07(187, 5, 69), this.A03.A37());
        } catch (JSONException e3) {
            Log.e(A07(92, 15, 31), A07(12, 13, 65), e3);
        }
        c2127lg.A07(jSONObject);
        c2127lg.A05(1);
        C0958Hi c0958Hi = this.A05;
        if (A0D[2].length() == 31) {
            throw new RuntimeException();
        }
        String[] strArr = A0D;
        strArr[0] = "lhJ8s2Q4sCds7IROMAxOWHrUi0xft2U2";
        strArr[7] = "JiEJ4GJfM63VUjRSw5kXmgHmRai0omG0";
        InterfaceC2125le interfaceC2125leA08 = c0958Hi.A08();
        int i5 = AbstractC2126lf.A2D;
        String strA07 = A07(147, 8, 8);
        interfaceC2125leA08.AC0(strA07, i5, c2127lg);
        this.A00 = 0;
        if (C2203mv.A1u(this.A05)) {
            C0958Hi c0958Hi2 = this.A05;
            if (A0D[6].charAt(9) == 'W') {
                A0D[3] = b.f42142b;
            }
        } else {
            this.A09.AEY();
        }
    }

    public final void A0C() throws JSONException {
        String strA0M;
        if (this.A04.A0d()) {
            C2127lg c2127lg = new C2127lg(A07(107, 29, 33));
            JSONObject jSONObject = new JSONObject();
            try {
                jSONObject.put(A07(170, 17, 66), this.A04.A0Q());
                jSONObject.put(A07(187, 5, 69), this.A03.A37());
            } catch (JSONException e3) {
                Log.e(A07(92, 15, 31), A07(12, 13, 65), e3);
            }
            c2127lg.A07(jSONObject);
            c2127lg.A05(1);
            InterfaceC2125le interfaceC2125leA08 = this.A05.A08();
            if (A0D[4].charAt(0) == 'P') {
                throw new RuntimeException();
            }
            A0D[1] = "TEDpWyR4sKSlO4xRZxixfnQAFgDgpHMF";
            int i5 = AbstractC2126lf.A2G;
            String strA07 = A07(155, 15, 98);
            interfaceC2125leA08.AC0(strA07, i5, c2127lg);
            if (C2203mv.A0q(this.A05) && AbstractC2414qQ.A00(this.A05) == EnumC2413qP.A07) {
                this.A05.A08().AC0(strA07, AbstractC2126lf.A2F, c2127lg);
                this.A07.AEw(0, null);
                return;
            }
        }
        try {
            C0894Ev c0894Ev = this.A08;
            if (!TextUtils.isEmpty(this.A04.A0J())) {
                strA0M = this.A04.A0J();
            } else {
                strA0M = this.A04.A0M();
            }
            c0894Ev.loadUrl(strA0M);
        } catch (Exception e11) {
            this.A05.A08().ABz(A07(192, 8, 57), AbstractC2126lf.A2f, new C2127lg(e11));
        }
    }

    public final void A0D() {
        if (C2203mv.A1z(this.A05)) {
            C0958Hi c0958Hi = this.A05;
            if (A0D[2].length() == 31) {
                throw new RuntimeException();
            }
            A0D[1] = "2a9geg5CZy9bcTekyOeVTlcxLNQduX9G";
            c0958Hi.A0B().ALo(this.A08);
        }
        this.A08.removeJavascriptInterface(A07(0, 12, 104));
        if (A0D[3].length() != 23) {
            A0D[6] = "33aduEcFLWt6pdjLdZ5sJJvVvr5WDkst";
            this.A08.destroy();
        } else {
            this.A08.destroy();
        }
    }

    public final void A0E(int i5) {
        this.A08.setVisibility(i5);
        if (i5 == 0) {
            this.A08.resumeTimers();
        } else {
            this.A08.pauseTimers();
        }
    }

    public C2417qT getTouchDataRecorder() {
        return this.A08.getTouchDataRecorder();
    }

    public C1539c2 getViewabilityChecker() {
        return this.A08.getViewabilityChecker();
    }
}
