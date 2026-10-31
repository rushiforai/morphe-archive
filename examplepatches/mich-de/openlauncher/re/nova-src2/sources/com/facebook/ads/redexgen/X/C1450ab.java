package com.facebook.ads.redexgen.X;

import java.io.IOException;

/* renamed from: com.facebook.ads.redexgen.X.ab, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1450ab {
    public static String[] A02 = {"RilK1F7N344ypDKNPd", "AF2McISSatZntXc1OXfwhP6HhvcbVIA8", "68T7ON3jiWnjytd50OtPB1oihFsZq3Td", "9ltXOhe4rEl9D6Xz9Jj93gWCIKjfaKJ6", "RmFYNsK5OSBe6ctF2P", "7AaZtb9o8V0qzEqRiUo4F6zL3Y8e85QG", "84oEuapUC1wliP0bhFKbzwqSb8st3Ddw", "Z6ud32nN6RNV1ZOgUQtAKTx38wQVrCFc"};
    public int A00;
    public final C1084Mk A01 = new C1084Mk(8);

    /* JADX WARN: Incorrect condition in loop: B:8:0x001f */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private long A00(Q9 q92) throws IOException {
        q92.AI6(this.A01.A0l(), 0, 1);
        int i5 = this.A01.A0l()[0] & 255;
        if (i5 == 0) {
            return Long.MIN_VALUE;
        }
        int mask = 128;
        int length = 0;
        while (value == 0) {
            mask >>= 1;
            length++;
        }
        int value = ~mask;
        int i11 = i5 & value;
        q92.AI6(this.A01.A0l(), 1, length);
        for (int i12 = 0; i12 < length; i12++) {
            int value2 = i12 + 1;
            i11 = (i11 << 8) + (this.A01.A0l()[value2] & 255);
        }
        int mask2 = this.A00;
        int value3 = length + 1;
        this.A00 = mask2 + value3;
        return i11;
    }

    /* JADX WARN: Incorrect condition in loop: B:27:0x009c */
    /* JADX WARN: Removed duplicated region for block: B:40:0x00d0  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean A01(Q9 q92) throws IOException {
        long jA90 = q92.A90();
        long inputLength = 1024;
        if (jA90 != -1) {
            String[] strArr = A02;
            if (strArr[4].length() != strArr[0].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A02;
            strArr2[3] = "xnI6hG3YBopNkRZuC7s1TkxlBAtqgudv";
            strArr2[7] = "ZPHLQDCqV1TNGQ3V5dTKiVh0sKgYFh6X";
            if (jA90 <= 1024) {
                inputLength = jA90;
            }
        }
        int i5 = (int) inputLength;
        boolean z11 = false;
        q92.AI6(this.A01.A0l(), 0, 4);
        long tag = this.A01.A0Q();
        this.A00 = 4;
        while (tag != 440786851) {
            int i11 = this.A00 + 1;
            this.A00 = i11;
            if (i11 == i5) {
                return false;
            }
            q92.AI6(this.A01.A0l(), 0, 1);
            tag = ((tag << 8) & (-256)) | (this.A01.A0l()[0] & 255);
        }
        long jA00 = A00(q92);
        long j11 = this.A00;
        if (jA00 == Long.MIN_VALUE) {
            return false;
        }
        if (jA90 != -1 && j11 + jA00 >= jA90) {
            return false;
        }
        while (this.A00 < tag) {
            if (A00(q92) == Long.MIN_VALUE) {
                return z11;
            }
            long inputLength2 = A00(q92);
            if (inputLength2 < 0 || inputLength2 > 2147483647L) {
                return false;
            }
            String[] strArr3 = A02;
            if (strArr3[4].length() == strArr3[0].length()) {
                String[] strArr4 = A02;
                strArr4[4] = "buBxE24T7F7XbhqcZM";
                strArr4[0] = "5BVOi08EEwaH5CNGWm";
                if (inputLength2 != 0) {
                }
            } else if (inputLength2 != 0) {
                int i12 = (int) inputLength2;
                q92.A4X(i12);
                this.A00 += i12;
            }
            z11 = false;
        }
        return ((long) this.A00) == j11 + jA00;
    }
}
