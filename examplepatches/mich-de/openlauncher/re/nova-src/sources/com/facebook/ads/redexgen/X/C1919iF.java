package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import java.util.Iterator;
import kotlin.Metadata;
import kotlin.jvm.JvmStatic;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.iF, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1919iF {
    public static byte[] A00;

    static {
        A01();
    }

    public /* synthetic */ C1919iF(AbstractC05811i abstractC05811i) {
        this();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 83);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A00 = new byte[]{56, 47, 34, 59, 43};
    }

    public C1919iF() {
    }

    @JvmStatic
    public final EnumC1918iE A02(String str) {
        EnumC1918iE next;
        C1h.A09(str, A00(0, 5, 29));
        Iterator<EnumC1918iE> it = EnumC1918iE.A02().iterator();
        while (true) {
            if (!it.hasNext()) {
                next = null;
                break;
            }
            next = it.next();
            if (C1h.A0C(next.A05(), str)) {
                break;
            }
        }
        return next;
    }
}
