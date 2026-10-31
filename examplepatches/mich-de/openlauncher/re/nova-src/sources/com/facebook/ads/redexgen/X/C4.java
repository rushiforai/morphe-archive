package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.List;
import kotlin.Metadata;

@Metadata
/* loaded from: assets/audience_network/classes.dex */
public final class C4 implements InterfaceC1959iv {
    public static byte[] A01;
    public static String[] A02 = {"v5eiq5orQ63mjFn9Ab0xa5hfEt7dVNGs", "GMa9Std1SgwhnqBjupiNZjPVh9G1tahW", "b7jzSYoVv0MCbhy8LuFi2cIYMwqTErso", "atsYm2Lmjuth32CZCVF5cWr6gK32cW43", "LWmjOPy3yc9gDkFg3Mwfy8jPueKDhZoG", "V2GkfKfoO69T6BtDY6bk6DvF6FD5Reg", "9MXbHwoY1oDOACaQooDrI18eOuBIdJFZ", "BO4SfdT76rtaAZQZgdLRkcRu0"};
    public final C1962iy A00;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            String[] strArr = A02;
            if (strArr[2].charAt(6) != strArr[0].charAt(6)) {
                throw new RuntimeException();
            }
            A02[5] = "r8wF";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 57);
            i13++;
        }
    }

    public static void A01() {
        byte[] bArr = {30, 35, 41, 26, 39, 22, 24, 41, 30, 43, 26, -8, 22, 39, 25, -2, 35, 27, 36};
        if (A02[1].charAt(9) != 'g') {
            throw new RuntimeException();
        }
        String[] strArr = A02;
        strArr[3] = "VIYCWdXm4TA11vruTJz60e8scrJTgHDz";
        strArr[6] = "srnAvO6BvH8twjiZ0JA6fwlDf4zn1yep";
        A01 = bArr;
    }

    static {
        A01();
    }

    public C4(C1962iy c1962iy) {
        C1h.A09(c1962iy, A00(0, 19, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE));
        this.A00 = c1962iy;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1959iv
    public final List<C1962iy> A7q() {
        return AbstractC05841s.A0E(this.A00);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1959iv
    public final int A8p() {
        return 1;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1959iv
    public final int A97() {
        return 2;
    }
}
