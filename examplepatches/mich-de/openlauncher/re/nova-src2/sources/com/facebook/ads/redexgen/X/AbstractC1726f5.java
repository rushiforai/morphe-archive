package com.facebook.ads.redexgen.X;

import android.text.TextUtils;
import com.facebook.ads.AdError;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.concurrent.atomic.AtomicBoolean;

/* renamed from: com.facebook.ads.redexgen.X.f5, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1726f5 {
    public static byte[] A00;
    public static String[] A01 = {"k8frRPm7mgDqxAioixpogczqOVsCxRz8", "VyYaCRL1y3X", "xcDZJmUacSFiJANDAcoJ8UiTqUSchCBm", "q1LjJBebIK3uZB", "OZ3nRZor67qkEvoJ2248OadtkqMar1jr", "9EpE4gWNiaa9VWptaK6T5q1Hhg83q3wa", "tRUyTf0EhWGqzTGUgievnYWyHE", "mWi8o8YvCa"};

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 71);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A00 = new byte[]{64, 87, 69, 83, 64, 86, 87, 86, 109, 68, 91, 86, 87, 93};
        String[] strArr = A01;
        if (strArr[6].length() == strArr[1].length()) {
            throw new RuntimeException();
        }
        A01[0] = "wdMA9wmxCDvCLZH0HoZEqH4eQGBlUk25";
    }

    static {
        A01();
    }

    public static void A02(C0958Hi c0958Hi, C07147g c07147g, InterfaceC1727f6 interfaceC1727f6, AtomicBoolean atomicBoolean, LG lg2) {
        String strA08 = c07147g.A32().A0I().A08();
        if (TextUtils.isEmpty(strA08)) {
            interfaceC1727f6.AGw(lg2, AdError.INTERNAL_ERROR);
            return;
        }
        C2086kz c2086kz = new C2086kz(c0958Hi);
        c2086kz.A0e(new C2232nO(c07147g.A37(), c0958Hi.A0A()));
        c2086kz.A0c(new C2084kx(strA08, AbstractC1775fs.A00(c07147g.A32().A0I()), AbstractC1775fs.A01(c07147g.A32().A0I()), c07147g.A1r(), A00(0, 14, Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE)));
        c2086kz.A0X(new LH(atomicBoolean, interfaceC1727f6, lg2), new C2079ks(c07147g.A1r(), A00(0, 14, Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE)));
    }
}
