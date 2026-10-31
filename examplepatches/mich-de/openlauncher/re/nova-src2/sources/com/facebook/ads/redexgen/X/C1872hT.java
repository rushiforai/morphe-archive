package com.facebook.ads.redexgen.X;

import android.net.Uri;
import android.os.SystemClock;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Arrays;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.hT, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1872hT {
    public static byte[] A09;
    public static String[] A0A = {"MQiSzC6Vc7q5U8xVfAVqa0KE3PXkq1Wh", "llmWIRVeduP0Uk42S4dYP8WzOBxmVwFr", "wAThdUC71T4mS7MhZngpRLTCFSeH7cGe", "RuJVlhT3aXaWnsDtcE8vQj9gewAnNZmJ", b.f42142b, "HCieBvZgHxLY0nOtfpdDewO3ogemX8ju", "x6utWgpyAiMlnuatLNj3m6zLwlweJpzD", "hst6eBYcAOneZgwaYJPPjmJvBTk4"};
    public static final C1873hU A0B;
    public Long A00;
    public Long A01;
    public Long A02;
    public final long A03;
    public final Uri A04;
    public final String A05;
    public final String A06;
    public final String A07;
    public final String A08;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A09, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            if (A0A[7].length() != 28) {
                throw new RuntimeException();
            }
            String[] strArr = A0A;
            strArr[2] = "TQXDtly80rUsA02hcUwpDDdSkdKbTPoK";
            strArr[0] = "bR9SSk2kBmzxFcVGXaHFi2ecRdbgPTHM";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 93);
            i13++;
        }
    }

    public static void A01() {
        A09 = new byte[]{50, 37, 45, 47, 52, 37, 21, 50, 41, 96, 118, 96, 96, 122, 124, 125, 90, 119, 59, 61, 46, 44, 36, 38, 33, 40, 27, 32, 36, 42, 33};
    }

    static {
        A01();
        A0B = new C1873hU(null);
    }

    public C1872hT(String str, String str2, Uri uri, long j11) {
        C1h.A09(str, A00(9, 9, 78));
        C1h.A09(str2, A00(18, 13, 18));
        C1h.A09(uri, A00(0, 9, 29));
        this.A07 = str;
        this.A08 = str2;
        this.A04 = uri;
        this.A03 = j11;
        this.A06 = A0B.A02(this.A04);
        this.A05 = A0B.A01(this.A04);
    }

    public final long A02() {
        return this.A03;
    }

    public final Uri A03() {
        return this.A04;
    }

    public final Long A04() {
        Long l9 = this.A00;
        if (l9 != null) {
            long jLongValue = l9.longValue();
            long start = SystemClock.elapsedRealtime();
            return Long.valueOf(start - jLongValue);
        }
        return null;
    }

    public final Long A05() {
        Long end = this.A02;
        Long start = this.A01;
        if (end != null && start != null) {
            return Long.valueOf(start.longValue() - end.longValue());
        }
        return null;
    }

    public final String A06() {
        return this.A05;
    }

    public final String A07() {
        return this.A06;
    }

    public final String A08() {
        return this.A07;
    }

    public final String A09() {
        return this.A08;
    }

    public final void A0A() {
        this.A00 = Long.valueOf(SystemClock.elapsedRealtime());
    }

    public final void A0B() {
        this.A01 = Long.valueOf(SystemClock.elapsedRealtime());
    }

    public final void A0C() {
        this.A02 = Long.valueOf(SystemClock.elapsedRealtime());
    }
}
