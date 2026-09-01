package defpackage;

import java.lang.reflect.Array;
import java.math.BigInteger;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class ekg {
    public static final long[] a;
    public static final long[] b;
    public static final long[] c;
    public static final akg[][] d;
    public static final akg[] e;
    public static final BigInteger f;
    public static final BigInteger g;
    public static final BigInteger h;

    static {
        BigInteger bigIntegerSubtract = BigInteger.valueOf(2L).pow(255).subtract(BigInteger.valueOf(19L));
        f = bigIntegerSubtract;
        BigInteger bigIntegerMod = BigInteger.valueOf(-121665L).multiply(BigInteger.valueOf(121666L).modInverse(bigIntegerSubtract)).mod(bigIntegerSubtract);
        g = bigIntegerMod;
        BigInteger bigIntegerMod2 = BigInteger.valueOf(2L).multiply(bigIntegerMod).mod(bigIntegerSubtract);
        h = bigIntegerMod2;
        BigInteger bigIntegerValueOf = BigInteger.valueOf(2L);
        BigInteger bigInteger = BigInteger.ONE;
        BigInteger bigIntegerModPow = bigIntegerValueOf.modPow(bigIntegerSubtract.subtract(bigInteger).divide(BigInteger.valueOf(4L)), bigIntegerSubtract);
        d2f d2fVar = new d2f(25);
        BigInteger bigIntegerMod3 = BigInteger.valueOf(4L).multiply(BigInteger.valueOf(5L).modInverse(bigIntegerSubtract)).mod(bigIntegerSubtract);
        d2fVar.c = bigIntegerMod3;
        BigInteger bigIntegerMultiply = bigIntegerMod3.pow(2).subtract(bigInteger).multiply(bigIntegerMod.multiply(bigIntegerMod3.pow(2)).add(bigInteger).modInverse(bigIntegerSubtract));
        BigInteger bigIntegerModPow2 = bigIntegerMultiply.modPow(bigIntegerSubtract.add(BigInteger.valueOf(3L)).divide(BigInteger.valueOf(8L)), bigIntegerSubtract);
        if (!bigIntegerModPow2.pow(2).subtract(bigIntegerMultiply).mod(bigIntegerSubtract).equals(BigInteger.ZERO)) {
            bigIntegerModPow2 = bigIntegerModPow2.multiply(bigIntegerModPow).mod(bigIntegerSubtract);
        }
        if (bigIntegerModPow2.testBit(0)) {
            bigIntegerModPow2 = bigIntegerSubtract.subtract(bigIntegerModPow2);
        }
        d2fVar.b = bigIntegerModPow2;
        a = vv2.l0(b(bigIntegerMod));
        b = vv2.l0(b(bigIntegerMod2));
        c = vv2.l0(b(bigIntegerModPow));
        d = (akg[][]) Array.newInstance((Class<?>) akg.class, 32, 8);
        d2f d2fVarA = d2fVar;
        for (int i = 0; i < 32; i++) {
            d2f d2fVarA2 = d2fVarA;
            for (int i2 = 0; i2 < 8; i2++) {
                d[i][i2] = c(d2fVarA2);
                d2fVarA2 = a(d2fVarA2, d2fVarA);
            }
            for (int i3 = 0; i3 < 8; i3++) {
                d2fVarA = a(d2fVarA, d2fVarA);
            }
        }
        d2f d2fVarA3 = a(d2fVar, d2fVar);
        e = new akg[8];
        for (int i4 = 0; i4 < 8; i4++) {
            e[i4] = c(d2fVar);
            d2fVar = a(d2fVar, d2fVarA3);
        }
    }

    public static d2f a(d2f d2fVar, d2f d2fVar2) {
        d2f d2fVar3 = new d2f(25);
        BigInteger bigIntegerMultiply = g.multiply(((BigInteger) d2fVar.b).multiply((BigInteger) d2fVar2.b).multiply((BigInteger) d2fVar.c).multiply((BigInteger) d2fVar2.c));
        BigInteger bigInteger = f;
        BigInteger bigIntegerMod = bigIntegerMultiply.mod(bigInteger);
        BigInteger bigIntegerAdd = ((BigInteger) d2fVar.b).multiply((BigInteger) d2fVar2.c).add(((BigInteger) d2fVar2.b).multiply((BigInteger) d2fVar.c));
        BigInteger bigInteger2 = BigInteger.ONE;
        d2fVar3.b = bigIntegerAdd.multiply(bigInteger2.add(bigIntegerMod).modInverse(bigInteger)).mod(bigInteger);
        d2fVar3.c = ((BigInteger) d2fVar.c).multiply((BigInteger) d2fVar2.c).add(((BigInteger) d2fVar.b).multiply((BigInteger) d2fVar2.b)).multiply(bigInteger2.subtract(bigIntegerMod).modInverse(bigInteger)).mod(bigInteger);
        return d2fVar3;
    }

    public static byte[] b(BigInteger bigInteger) {
        byte[] bArr = new byte[32];
        byte[] byteArray = bigInteger.toByteArray();
        int length = byteArray.length;
        System.arraycopy(byteArray, 0, bArr, 32 - length, length);
        for (int i = 0; i < 16; i++) {
            byte b2 = bArr[i];
            int i2 = 31 - i;
            bArr[i] = bArr[i2];
            bArr[i2] = b2;
        }
        return bArr;
    }

    public static akg c(d2f d2fVar) {
        BigInteger bigIntegerAdd = ((BigInteger) d2fVar.c).add((BigInteger) d2fVar.b);
        BigInteger bigInteger = f;
        return new akg(vv2.l0(b(bigIntegerAdd.mod(bigInteger))), vv2.l0(b(((BigInteger) d2fVar.c).subtract((BigInteger) d2fVar.b).mod(bigInteger))), vv2.l0(b(h.multiply((BigInteger) d2fVar.b).multiply((BigInteger) d2fVar.c).mod(bigInteger))));
    }
}
