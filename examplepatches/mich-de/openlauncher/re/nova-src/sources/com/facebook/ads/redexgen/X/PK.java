package com.facebook.ads.redexgen.X;

import java.util.Random;

/* loaded from: assets/audience_network/classes.dex */
public class PK {
    public static String[] A04 = {"rSzGATQq9zIEFUUVThQPSzcmEMv11Cxa", "OkdCK7YlKBr2", "2", "PbNxRaAVN2m5FCVJ2ZtbrRkFjPkqUQRm", "Ct6YKmjYPQJl4gWHu8fvoakTJhqjJ", "gWFc9MD5L0j1", "2lgCW0AVmyxYeMIKJbSHI5pscQvQ", "UIexY4kdeWQVXGZhwd4fYdFuc0jrDrd8"};
    public int A00;
    public int A01;
    public int A02;
    public final /* synthetic */ PL A03;

    public PK(PL pl2, int i5, int i11, int i12) {
        this.A03 = pl2;
        this.A00 = i5;
        this.A01 = i11;
        this.A02 = i12;
    }

    public final int A00() {
        Random random = new Random();
        if (random.nextInt(this.A02) == 0) {
            if (this.A01 <= 0) {
                return this.A00;
            }
            int variation = random.nextInt() % this.A01;
            int i5 = this.A00 + variation;
            int variation2 = A04[2].length();
            if (variation2 != 1) {
                throw new RuntimeException();
            }
            A04[0] = "shBG05MPcUVHxXBNycj93aqzeyUahsh9";
            return i5;
        }
        return 0;
    }
}
