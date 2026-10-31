package com.facebook.ads.redexgen.X;

import java.io.IOException;
import java.util.Arrays;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.1Z, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public abstract class C1Z {
    public static byte[] A00;

    static {
        A09();
    }

    public static String A08(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 35);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A09() {
        A00 = new byte[]{25, 81, 77, 76, 86, 27};
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static final <T> void A0A(Appendable appendable, T t6, InterfaceC05610m<? super T, ? extends CharSequence> interfaceC05610m) throws IOException {
        C1h.A09(appendable, A08(0, 6, 6));
        if (interfaceC05610m != null) {
            appendable.append(interfaceC05610m.AB1(t6));
            return;
        }
        if (t6 == 0 ? true : t6 instanceof CharSequence) {
            appendable.append((CharSequence) t6);
        } else if (t6 instanceof Character) {
            appendable.append(((Character) t6).charValue());
        } else {
            appendable.append(t6.toString());
        }
    }
}
