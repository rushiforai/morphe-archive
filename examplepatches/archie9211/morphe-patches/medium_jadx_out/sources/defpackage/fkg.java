package defpackage;

import java.math.BigInteger;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fkg {
    public static final fkg d;
    public final BigInteger a;
    public final BigInteger b;
    public final BigInteger c;

    static {
        BigInteger bigInteger = BigInteger.ONE;
        d = new fkg(bigInteger, bigInteger, BigInteger.ZERO);
    }

    public fkg(BigInteger bigInteger, BigInteger bigInteger2, BigInteger bigInteger3) {
        this.a = bigInteger;
        this.b = bigInteger2;
        this.c = bigInteger3;
    }
}
