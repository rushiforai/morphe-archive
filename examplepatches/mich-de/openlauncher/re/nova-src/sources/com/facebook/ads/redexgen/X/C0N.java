package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.0N, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public abstract class C0N extends C0Z {
    public static byte[] A00;
    public static String[] A01 = {"2Eapa7KtK0wSgzlkcTL0OrWvIYaASrqh", "7AM1", "4hMQ8PAfDkPo2kfhgRDpGvNAghgImc3L", "GB2s4QYAUVM0qVBDeiHE0w", "fjdqEhctDRIlzZPqOzw3mTRyt7JskPzY", "6rlxXzp39gnLUgSE1TTgxQosRHuP402M", "22X0o5fZOkv1sokdlQgxprlX3QFYhwki", "v1k86ykcE5Y4zX6tZrCvduYm7c8XqD2p"};

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            if (A01[1].length() != 4) {
                throw new RuntimeException();
            }
            String[] strArr = A01;
            strArr[7] = "XfQDV0VqZv3K9UnXizNZ7bbr68zZYHhA";
            strArr[6] = "coLTNVJt0XyLafWTd1INRD9bcnQGC09j";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 24);
            i13++;
        }
    }

    public static void A03() {
        byte[] bArr = {113, 57, 37, 36, 62, 115};
        if (A01[1].length() != 4) {
            throw new RuntimeException();
        }
        A01[2] = "VQH0NvI5Tq9CthRFZqmgudCB6WJoJACM";
        A00 = bArr;
    }

    static {
        A03();
    }

    public static final <T> T A00(T[] tArr) {
        C1h.A09(tArr, A02(0, 6, 85));
        if (tArr.length == 1) {
            return tArr[0];
        }
        return null;
    }

    public static final <T> T A01(T[] tArr, int i5) {
        C1h.A09(tArr, A02(0, 6, 85));
        boolean z11 = false;
        if (i5 >= 0 && i5 < tArr.length) {
            z11 = true;
        }
        if (z11) {
            return tArr[i5];
        }
        return null;
    }
}
