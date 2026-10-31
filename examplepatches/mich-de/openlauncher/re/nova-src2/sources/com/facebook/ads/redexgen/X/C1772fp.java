package com.facebook.ads.redexgen.X;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

/* renamed from: com.facebook.ads.redexgen.X.fp, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1772fp {
    public static byte[] A09;
    public static String[] A0A = {"sUaEQAhVuiO0VAXdO2JdlLerKfoiMKKD", "IqyvPSs9abb36obPtrHb", "pzIcc", "AbneYxZGR5WioOuAn7Jlw7LdtInLK7rT", "hBm1e44xzlSZcZcMOozsAHLJ6DEugPx3", "jZVNH", "nWBulu0j1HPd6ivhGXGPDUfhxJDF8DgG", "RXKxbTX7PavRaC2OgByFl9WxJiST5XzE"};
    public final C0799Be A02;
    public final YG A05;
    public final String A06;
    public final Map<String, String> A07;
    public final boolean A08;
    public final BJ A04 = new BJ() { // from class: com.facebook.ads.redexgen.X.5f
        /* JADX INFO: Access modifiers changed from: private */
        @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
        /* renamed from: A00, reason: merged with bridge method [inline-methods] */
        public final void A03(C5X c5x) {
            YF yf2 = new YF(this.A00.A06, c5x.A03(), c5x.A01(), c5x.A02());
            if (c5x.A00() >= 0.05d) {
                yf2.A06(c5x.A01());
            }
            C1772fp.A00(this.A00);
            this.A00.A05.A04(yf2);
        }
    };
    public final BM A03 = new BM() { // from class: com.facebook.ads.redexgen.X.5e
        /* JADX INFO: Access modifiers changed from: private */
        @Override // com.facebook.ads.redexgen.X.AbstractC2172mQ
        /* renamed from: A00, reason: merged with bridge method [inline-methods] */
        public final void A03(C5Y c5y) {
            if (this.A00.A08) {
                this.A00.A07();
            }
        }
    };
    public int A01 = 0;
    public int A00 = 0;

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A09, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 17);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A04() {
        A09 = new byte[]{48, 35, 48, 59, 33, 10, 60, 59, 49, 48, 45, 81, 69, 86, 90, 82, 104, 84, 88, 66, 89, 67, 4, 16, 3, 15, 7, 17};
    }

    static {
        A04();
    }

    public C1772fp(C0799Be c0799Be, String str, boolean z11, Map<String, String> map) {
        this.A06 = str;
        this.A02 = c0799Be;
        this.A07 = map;
        this.A08 = z11;
        this.A05 = new YG(this.A06);
        this.A02.getEventBus().A03(this.A04, this.A03);
    }

    public static /* synthetic */ int A00(C1772fp c1772fp) {
        int i5 = c1772fp.A01;
        c1772fp.A01 = i5 + 1;
        return i5;
    }

    public final Map<String, String> A06() {
        String strA01 = YG.A01(this.A05.A03());
        HashMap map = new HashMap();
        if (this.A07 != null) {
            Map<String, String> map2 = this.A07;
            String[] strArr = A0A;
            String encodedFrameData = strArr[0];
            if (encodedFrameData.charAt(24) == strArr[7].charAt(24)) {
                throw new RuntimeException();
            }
            A0A[1] = b.f42142b;
            map.putAll(map2);
        }
        if (strA01 == null) {
            strA01 = A02(0, 0, 88);
        }
        map.put(A02(22, 6, 115), strA01);
        map.put(A02(11, 11, 38), String.valueOf(this.A01));
        int i5 = this.A00 + 1;
        this.A00 = i5;
        map.put(A02(0, 11, 68), String.valueOf(i5));
        return map;
    }

    public final void A07() {
        this.A02.getEventBus().A04(this.A04, this.A03);
    }
}
