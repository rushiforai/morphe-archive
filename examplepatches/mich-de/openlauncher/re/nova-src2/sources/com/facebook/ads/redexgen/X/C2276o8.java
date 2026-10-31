package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import java.util.Iterator;
import kotlin.Metadata;
import kotlin.jvm.JvmStatic;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.o8, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2276o8 {
    public static byte[] A00;
    public static String[] A01 = {"X6iKGO", "n1663jUEZ04NyjQefcVQngF0Ob3hl8Rp", "Hr7PNgYsonyIEiesPe0H0pY5f28sZsym", "EquNJ3fMIukET0WWVYWmlmL8mVBIg8TB", "9XOH4rvxrJMeZUJVoNuz92iI7LLv2Fha", "V771bSPGltSNqndo2D7BbAlD02Ozj", "0PsiwSnPCEmbhFHYllgT9XmoEJDjq4Md", "LkjwEGgp5KSgPmsnmzhe0sINYIzqe1QT"};

    public /* synthetic */ C2276o8(AbstractC05811i abstractC05811i) {
        this();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 46);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        byte[] bArr = {12, 27, 22, 15, 31};
        if (A01[0].length() != 6) {
            throw new RuntimeException();
        }
        A01[3] = "2seAYkeJuAtgm3YdolZcxfqfJEip2P9i";
        A00 = bArr;
    }

    static {
        A01();
    }

    public C2276o8() {
    }

    @JvmStatic
    public final EnumC2275o7 A02(String str) {
        EnumC2275o7 next;
        C1h.A09(str, A00(0, 5, 84));
        Iterator<EnumC2275o7> it = EnumC2275o7.A02().iterator();
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
