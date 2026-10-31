package com.facebook.ads.redexgen.X;

import java.io.EOFException;
import java.io.IOException;
import org.checkerframework.dataflow.qual.Pure;

/* renamed from: com.facebook.ads.redexgen.X.Yx, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1385Yx {
    public static int A00(Q9 q92, byte[] bArr, int i5, int i11) throws IOException {
        int i12 = 0;
        while (i12 < i11) {
            int totalBytesPeeked = i11 - i12;
            int bytesPeeked = q92.AI5(bArr, i5 + i12, totalBytesPeeked);
            if (bytesPeeked == -1) {
                break;
            }
            i12 += bytesPeeked;
        }
        return i12;
    }

    @Pure
    public static void A01(boolean z11, String str) throws L9 {
        if (z11) {
        } else {
            throw L9.A01(str, null);
        }
    }

    public static boolean A02(Q9 q92, int i5) throws IOException {
        try {
            q92.ALL(i5);
            return true;
        } catch (EOFException unused) {
            return false;
        }
    }

    public static boolean A03(Q9 q92, byte[] bArr, int i5, int i11) throws IOException {
        try {
            q92.readFully(bArr, i5, i11);
            return true;
        } catch (EOFException unused) {
            return false;
        }
    }

    public static boolean A04(Q9 q92, byte[] bArr, int i5, int i11, boolean z11) throws IOException {
        try {
            return q92.AI7(bArr, i5, i11, z11);
        } catch (EOFException e3) {
            if (z11) {
                return false;
            }
            throw e3;
        }
    }
}
