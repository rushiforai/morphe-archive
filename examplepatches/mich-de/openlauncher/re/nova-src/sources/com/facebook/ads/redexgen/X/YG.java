package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.BlockingDeque;
import java.util.concurrent.LinkedBlockingDeque;
import kotlin.Metadata;
import kotlin.jvm.JvmStatic;

@Metadata
/* loaded from: assets/audience_network/classes.dex */
public final class YG {
    public static byte[] A02;
    public static String[] A03 = {"VT4fMDut957REDv81Zf67ZRXVgx5T5a8", "r", "Z8Owoyb", "FnQ4OiwpcdZoDsiJ2m5WJ2Um26YCJsc9", "WRxJAxd2kL6ougEGyIG1Du6QramXeho", "YseYEaNGGUDDQ4eQqZOUPTvdjgKCIPcf", "c4hktFWkJWdy9he8EQ0DeAgF43U5wP0s", "DRA64HFd"};
    public static final YH A04;
    public final String A00;
    public final BlockingDeque<YF> A01 = new LinkedBlockingDeque();

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 104);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A02 = new byte[]{123, 111, 124, 112, 120};
    }

    static {
        A02();
        A04 = new YH(null);
    }

    public YG(String str) {
        this.A00 = str;
    }

    @JvmStatic
    public static final String A01(List<YF> list) {
        return A04.A0A(list);
    }

    public final List<YF> A03() {
        List frames = new ArrayList();
        this.A01.drainTo(frames);
        return frames;
    }

    public final void A04(YF yf2) {
        C1h.A09(yf2, A00(0, 5, Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE));
        YF yfPeekLast = this.A01.peekLast();
        if (yfPeekLast != null) {
            long jA03 = yfPeekLast.A03();
            if (A03[7].length() == 7) {
                throw new RuntimeException();
            }
            A03[1] = "fQhMIvl";
            if (jA03 == yf2.A03() && yfPeekLast.A01() == yf2.A01()) {
                return;
            }
        }
        this.A01.add(yf2);
    }
}
