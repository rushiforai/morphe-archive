package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;

/* renamed from: com.facebook.ads.redexgen.X.oq, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractRunnableC2319oq implements Runnable {
    public static byte[] A01;
    public static final AtomicBoolean A02;
    public static final AtomicBoolean A03;
    public static final AtomicReference<InterfaceC2309og> A04;
    public final C2307oe A00;

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A03() {
        A01 = new byte[]{124, 91, 64, 64, 79, 76, 66, 75, 14, 77, 92, 75, 79, 90, 75, 74, 0, 14, 122, 70, 92, 75, 79, 74, 20, 14};
    }

    public abstract void A07();

    static {
        A03();
        A02 = new AtomicBoolean();
        A03 = new AtomicBoolean(false);
        A04 = new AtomicReference<>();
    }

    public AbstractRunnableC2319oq() {
        if (A03.get()) {
            this.A00 = C2324ov.A01(new C2323ou(A02(0, 26, 90) + Thread.currentThread().getName()));
        } else {
            this.A00 = null;
        }
    }

    public static void A04(boolean z11) {
        A03.set(z11);
    }

    public static void A05(boolean z11, InterfaceC2309og interfaceC2309og) {
        A02.set(z11);
        A04.set(interfaceC2309og);
    }

    public final C2307oe A06() {
        return this.A00;
    }

    @Override // java.lang.Runnable
    public final void run() throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            if (A03.get()) {
                C2324ov.A03(this);
            }
            try {
                A07();
            } catch (Throwable th2) {
                if (A02.get()) {
                    AbstractC2326ox.A00().ABf(3301, th2);
                    InterfaceC2309og interfaceC2309og = A04.get();
                    if (interfaceC2309og != null) {
                        interfaceC2309og.AJr(th2, this);
                    }
                } else {
                    throw th2;
                }
            }
            if (A03.get()) {
                C2324ov.A04(this);
            }
        } catch (Throwable th3) {
            AbstractC2311oi.A00(th3, this);
        }
    }
}
