package com.facebook.ads.redexgen.X;

import java.lang.reflect.Constructor;
import java.util.Arrays;
import java.util.concurrent.atomic.AtomicBoolean;

/* renamed from: com.facebook.ads.redexgen.X.Yr, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1379Yr {
    public static byte[] A02;
    public final InterfaceC1378Yq A00;
    public final AtomicBoolean A01 = new AtomicBoolean(false);

    static {
        A02();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 54);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A02 = new byte[]{37, 18, 18, 15, 18, 64, 9, 14, 19, 20, 1, 14, 20, 9, 1, 20, 9, 14, 7, 64, 5, 24, 20, 5, 14, 19, 9, 15, 14, 38, 29, 22, 11, 3, 22, 16, 7, 22, 23, 83, 22, 1, 1, 28, 1, 83, 16, 1, 22, 18, 7, 26, 29, 20, 83, 22, 11, 7, 1, 18, 16, 7, 28, 1};
    }

    public C1379Yr(InterfaceC1378Yq interfaceC1378Yq) {
        this.A00 = interfaceC1378Yq;
    }

    private Constructor<? extends InterfaceC1383Yv> A01() {
        synchronized (this.A01) {
            if (this.A01.get()) {
                return null;
            }
            try {
                return this.A00.A82();
            } catch (ClassNotFoundException unused) {
                this.A01.set(true);
                return null;
            } catch (Exception e3) {
                throw new RuntimeException(A00(0, 29, 86), e3);
            }
        }
    }

    public final InterfaceC1383Yv A03(Object... objArr) {
        Constructor<? extends InterfaceC1383Yv> constructorA01 = A01();
        if (constructorA01 == null) {
            return null;
        }
        try {
            return constructorA01.newInstance(objArr);
        } catch (Exception e3) {
            throw new IllegalStateException(A00(29, 35, 69), e3);
        }
    }
}
