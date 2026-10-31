package com.facebook.ads.redexgen.X;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;

/* loaded from: assets/audience_network/classes.dex */
public final class Q6 implements ZK {
    public static String[] A02 = {"pUODuGoLs0RBc1HRbI4ssTXDTQ3jVfbJ", "j9OkOTgIDXHcW2JsFXJ", "UaUOOqqYQ9", "PFlBLkWaUiZhk4V", "reIPskA1Z6y", "VAzoWSeaxw", "SWcNPeetBjpO7SS", b.f42142b};
    public final long A00;
    public final Z5 A01;

    public Q6(Z5 z52, long j11) {
        this.A01 = z52;
        this.A00 = j11;
    }

    private ZL A00(long j11, long j12) {
        return new ZL((1000000 * j11) / this.A01.A07, this.A00 + j12);
    }

    @Override // com.facebook.ads.redexgen.X.ZK
    public final long A8U() {
        return this.A01.A06();
    }

    @Override // com.facebook.ads.redexgen.X.ZK
    public final ZJ A9e(long j11) {
        long j12;
        AbstractC1062Ln.A02(this.A01.A0A);
        long[] jArr = this.A01.A0A.A01;
        long[] jArr2 = this.A01.A0A.A00;
        int iA0L = N1.A0L(jArr, this.A01.A07(j11), true, false);
        long j13 = 0;
        if (iA0L == -1) {
            j12 = 0;
        } else {
            j12 = jArr[iA0L];
        }
        if (iA0L != -1) {
            j13 = jArr2[iA0L];
        }
        ZL zlA00 = A00(j12, j13);
        if (zlA00.A01 != j11) {
            int length = jArr.length;
            if (A02[1].length() != 19) {
                throw new RuntimeException();
            }
            String[] strArr = A02;
            strArr[6] = "PND8aWpeSY3JVnt";
            strArr[3] = "FOFlq7HvZMzxxsd";
            if (iA0L != length - 1) {
                ZL secondSeekPoint = A00(jArr[iA0L + 1], jArr2[iA0L + 1]);
                return new ZJ(zlA00, secondSeekPoint);
            }
        }
        return new ZJ(zlA00);
    }

    @Override // com.facebook.ads.redexgen.X.ZK
    public final boolean ABR() {
        return true;
    }
}
