package com.facebook.ads.redexgen.X;

import android.net.TrafficStats;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.concurrent.Callable;

/* renamed from: com.facebook.ads.redexgen.X.kw, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class CallableC2083kw implements Callable<Boolean> {
    public static byte[] A02;
    public static String[] A03 = {"4L70rbdc", "PBHhMXx0npnpwTY", "91GJPzFmEyeOW3DYeKz29HPCrWXW0gNC", "umTRidE45okZulrVlJrHIV8", "kRbho3HgdeG0CdJ8rA209tRImftPXEnI", "60YY30c8MY", "ZuHjaYDngPTOcLYvMZdLe8TI8ruUn8GD", "lL0vcWHD5F"};
    public final C2082kv A00;
    public final /* synthetic */ C2086kz A01;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 32);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A02 = new byte[]{114, 126, 109, 116, 106, 111, 43, 52, 57, 56, 50};
        if (A03[1].length() != 15) {
            throw new RuntimeException();
        }
        String[] strArr = A03;
        strArr[7] = "XFV0lH04tD";
        strArr[5] = "8rdCtS3Igw";
    }

    static {
        A02();
    }

    public CallableC2083kw(C2086kz c2086kz, C2082kv c2082kv) {
        this.A01 = c2086kz;
        this.A00 = c2082kv;
    }

    private final Boolean A00() throws Throwable {
        String strA01;
        if (AbstractC2311oi.A02(this)) {
            return null;
        }
        try {
            TrafficStats.setThreadStatsTag(61453);
            if (this.A00.A04) {
                strA01 = A01(0, 6, 63);
            } else {
                strA01 = A01(6, 5, Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE);
            }
            String str = this.A00.A08;
            String creativeType = this.A00.A07;
            C1618dJ c1618dJ = new C1618dJ(str, creativeType, this.A00.A06, strA01, this.A00.A02, this.A00.A05);
            c1618dJ.A04 = this.A00.A03;
            c1618dJ.A02 = this.A00.A01;
            c1618dJ.A05 = this.A00.A04;
            if (C2089l2.A06(this.A01.A04)) {
                C2086kz.A0F.put(this.A00.A08, c1618dJ);
            }
            return Boolean.valueOf(C2086kz.A03(this.A01.A04.A02()).AJy(c1618dJ) != null);
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
            return null;
        }
    }

    @Override // java.util.concurrent.Callable
    public final /* bridge */ /* synthetic */ Boolean call() throws Exception {
        if (AbstractC2311oi.A02(this)) {
            return null;
        }
        try {
            return A00();
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
            return null;
        }
    }
}
