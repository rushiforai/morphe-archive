package com.facebook.ads.redexgen.X;

import java.io.FileNotFoundException;
import java.io.IOException;

/* renamed from: com.facebook.ads.redexgen.X.Qt, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1185Qt implements X1 {
    public static String[] A01 = {"A", "8tMw97", "50", "N08Oex3V7DL62iB37lfAU2R39jkqELc8", "ZfwnQjQ3J7", "revfGqLBydBAVFTjs0QvgZQ", "6QP8URoleAzsja", "yGgrkdZmF4YTWBTE5Y1t3ZIKmd0Zglz4"};
    public final int A00;

    public C1185Qt() {
        this(-1);
    }

    public C1185Qt(int i5) {
        this.A00 = i5;
    }

    @Override // com.facebook.ads.redexgen.X.X1
    public final int A9C(int i5) {
        if (this.A00 == -1) {
            if (i5 == 7) {
                return 6;
            }
            return 3;
        }
        return this.A00;
    }

    @Override // com.facebook.ads.redexgen.X.X1
    public final long A9X(X0 x02) {
        IOException iOException = x02.A03;
        if (!(iOException instanceof L9) && !(iOException instanceof FileNotFoundException) && !(iOException instanceof C9F) && !(iOException instanceof XB)) {
            boolean zA02 = NQ.A02(iOException);
            if (A01[5].length() == 7) {
                throw new RuntimeException();
            }
            String[] strArr = A01;
            strArr[4] = "NKw5DHEdMI";
            strArr[3] = "RsFNld5fZSnsljS7ii2P4yxneLSiLQR2";
            if (!zA02) {
                return Math.min((x02.A00 - 1) * 1000, 5000);
            }
        }
        return -9223372036854775807L;
    }
}
