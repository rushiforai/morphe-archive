package com.facebook.ads.redexgen.X;

import java.io.IOException;
import java.util.Arrays;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executor;

/* renamed from: com.facebook.ads.redexgen.X.Rx, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1215Rx implements U3 {
    public static byte[] A08;
    public static String[] A09 = {"Fuil6XcSvZoh5YEMbQexBfhaYnT", "aKI99LTRdQMjuQIS2y0YE3llhY5iAGor", "RvzI3qPdJuM0Xwf7WGfouIjGnaW1Fm8L", "J9tQuroy9SgA9qN5c5GTV3TEyVpbTCNY", "YKcNpXh8M7GbVkOJPQwPgzjg6nqLI4Dz", "KGrV31SYbiCORkSjiGtYy39LV2I", "84AjlOOCFCJr7F92ZY8I1M2ugPfxieP3", "dgJs6qMmh"};
    public U2 A00;
    public final LS A01;
    public final NX A02;
    public final C07327y A03;
    public final C1686eQ A04;
    public final Executor A05;
    public volatile AbstractRunnableFutureC1087Mn<Void, IOException> A06;
    public volatile boolean A07;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A08, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            byte b11 = bArrCopyOfRange[i13];
            if (A09[4].charAt(15) == 'I') {
                throw new RuntimeException();
            }
            A09[6] = "Slz5Tcujx1hXAiSUBd8t0Pptghtdi2To";
            bArrCopyOfRange[i13] = (byte) ((b11 ^ i12) ^ 1);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A08 = new byte[]{57, 60, 60, 72, 74, 87, 91, 93, 93, 92, 87, 64, 72, 74, 83, 64};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    @Override // com.facebook.ads.redexgen.X.U3
    public final void A6c(U2 u22) throws InterruptedException, IOException {
        this.A00 = u22;
        if (0 != 0) {
            throw new NullPointerException(A01(0, 3, 89));
        }
        boolean z11 = false;
        while (!z11) {
            try {
                if (this.A07) {
                    break;
                }
                this.A06 = new C1216Ry(this);
                if (0 != 0) {
                    throw new NullPointerException(A01(3, 7, 57));
                }
                this.A05.execute(this.A06);
                try {
                    this.A06.get();
                    z11 = true;
                } catch (ExecutionException e3) {
                    Throwable th2 = (Throwable) AbstractC1062Ln.A01(e3.getCause());
                    if (0 == 0) {
                        if (th2 instanceof IOException) {
                            throw ((IOException) th2);
                        }
                        N1.A11(th2);
                        throw null;
                    }
                }
            } catch (Throwable th3) {
                ((AbstractRunnableFutureC1087Mn) AbstractC1062Ln.A01(this.A06)).A02();
                if (0 == 0) {
                    throw th3;
                }
                throw new NullPointerException(A01(10, 6, 36));
            }
        }
        ((AbstractRunnableFutureC1087Mn) AbstractC1062Ln.A01(this.A06)).A02();
        if (0 != 0) {
            throw new NullPointerException(A01(10, 6, 36));
        }
    }

    static {
        A02();
    }

    public C1215Rx(C1273Ug c1273Ug, C1086Mm c1086Mm, Executor executor) {
        this.A05 = (Executor) AbstractC1062Ln.A01(executor);
        AbstractC1062Ln.A01(c1273Ug.A03);
        this.A02 = new NU().A06(c1273Ug.A03.A00).A08(c1273Ug.A03.A04).A02(4).A09();
        this.A03 = c1086Mm.A07();
        this.A04 = new C1686eQ(this.A03, this.A02, null, new InterfaceC1685eP() { // from class: com.facebook.ads.redexgen.X.Rz
            @Override // com.facebook.ads.redexgen.X.InterfaceC1685eP
            public final void AGe(long j11, long j12, long j13) {
                this.A00.A03(j11, j12, j13);
            }
        });
        this.A01 = c1086Mm.A02();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A03(long j11, long j12, long j13) {
        float f11;
        if (this.A00 == null) {
            return;
        }
        if (j11 == -1 || j11 == 0) {
            f11 = -1.0f;
        } else {
            f11 = (j12 * 100.0f) / j11;
        }
        this.A00.AGd(j11, j12, f11);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Mn != com.facebook.ads.androidx.media3.common.util.RunnableFutureTask<java.lang.Void, java.io.IOException> */
    @Override // com.facebook.ads.redexgen.X.U3
    public final void cancel() {
        this.A07 = true;
        AbstractRunnableFutureC1087Mn<Void, IOException> abstractRunnableFutureC1087Mn = this.A06;
        if (abstractRunnableFutureC1087Mn != null) {
            abstractRunnableFutureC1087Mn.cancel(true);
        }
    }

    @Override // com.facebook.ads.redexgen.X.U3
    public final void remove() {
        this.A03.A0E().AJl(this.A03.A0F().A5H(this.A02));
    }
}
