package kl;

import java.lang.reflect.Array;
import java.math.BigInteger;

/* loaded from: classes3.dex */
public abstract class d {

    /* renamed from: a, reason: collision with root package name */
    public static final long[] f71573a;

    /* renamed from: b, reason: collision with root package name */
    public static final long[] f71574b;

    /* renamed from: c, reason: collision with root package name */
    public static final long[] f71575c;

    /* renamed from: d, reason: collision with root package name */
    public static final b[][] f71576d;

    /* renamed from: e, reason: collision with root package name */
    public static final b[] f71577e;

    /* renamed from: f, reason: collision with root package name */
    public static final BigInteger f71578f;

    /* renamed from: g, reason: collision with root package name */
    public static final BigInteger f71579g;

    /* renamed from: h, reason: collision with root package name */
    public static final BigInteger f71580h;

    static {
        BigInteger bigIntegerSubtract = BigInteger.valueOf(2L).pow(255).subtract(BigInteger.valueOf(19L));
        f71578f = bigIntegerSubtract;
        BigInteger bigIntegerMod = BigInteger.valueOf(-121665L).multiply(BigInteger.valueOf(121666L).modInverse(bigIntegerSubtract)).mod(bigIntegerSubtract);
        f71579g = bigIntegerMod;
        BigInteger bigIntegerMod2 = BigInteger.valueOf(2L).multiply(bigIntegerMod).mod(bigIntegerSubtract);
        f71580h = bigIntegerMod2;
        BigInteger bigIntegerValueOf = BigInteger.valueOf(2L);
        BigInteger bigInteger = BigInteger.ONE;
        BigInteger bigIntegerModPow = bigIntegerValueOf.modPow(bigIntegerSubtract.subtract(bigInteger).divide(BigInteger.valueOf(4L)), bigIntegerSubtract);
        c10.a aVar = new c10.a(25, (byte) 0);
        BigInteger bigIntegerMod3 = BigInteger.valueOf(4L).multiply(BigInteger.valueOf(5L).modInverse(bigIntegerSubtract)).mod(bigIntegerSubtract);
        aVar.f19149c = bigIntegerMod3;
        BigInteger bigIntegerMultiply = bigIntegerMod3.pow(2).subtract(bigInteger).multiply(bigIntegerMod.multiply(bigIntegerMod3.pow(2)).add(bigInteger).modInverse(bigIntegerSubtract));
        BigInteger bigIntegerModPow2 = bigIntegerMultiply.modPow(bigIntegerSubtract.add(BigInteger.valueOf(3L)).divide(BigInteger.valueOf(8L)), bigIntegerSubtract);
        if (!bigIntegerModPow2.pow(2).subtract(bigIntegerMultiply).mod(bigIntegerSubtract).equals(BigInteger.ZERO)) {
            bigIntegerModPow2 = bigIntegerModPow2.multiply(bigIntegerModPow).mod(bigIntegerSubtract);
        }
        if (bigIntegerModPow2.testBit(0)) {
            bigIntegerModPow2 = bigIntegerSubtract.subtract(bigIntegerModPow2);
        }
        aVar.f19148b = bigIntegerModPow2;
        f71573a = a.g(c(bigIntegerMod));
        f71574b = a.g(c(bigIntegerMod2));
        f71575c = a.g(c(bigIntegerModPow));
        f71576d = (b[][]) Array.newInstance((Class<?>) b.class, 32, 8);
        c10.a aVarA = aVar;
        for (int i5 = 0; i5 < 32; i5++) {
            c10.a aVarA2 = aVarA;
            for (int i11 = 0; i11 < 8; i11++) {
                f71576d[i5][i11] = b(aVarA2);
                aVarA2 = a(aVarA2, aVarA);
            }
            for (int i12 = 0; i12 < 8; i12++) {
                aVarA = a(aVarA, aVarA);
            }
        }
        c10.a aVarA3 = a(aVar, aVar);
        f71577e = new b[8];
        for (int i13 = 0; i13 < 8; i13++) {
            f71577e[i13] = b(aVar);
            aVar = a(aVar, aVarA3);
        }
    }

    public static c10.a a(c10.a aVar, c10.a aVar2) {
        c10.a aVar3 = new c10.a(25, (byte) 0);
        BigInteger bigIntegerMultiply = f71579g.multiply(((BigInteger) aVar.f19148b).multiply((BigInteger) aVar2.f19148b).multiply((BigInteger) aVar.f19149c).multiply((BigInteger) aVar2.f19149c));
        BigInteger bigInteger = f71578f;
        BigInteger bigIntegerMod = bigIntegerMultiply.mod(bigInteger);
        BigInteger bigIntegerAdd = ((BigInteger) aVar.f19148b).multiply((BigInteger) aVar2.f19149c).add(((BigInteger) aVar2.f19148b).multiply((BigInteger) aVar.f19149c));
        BigInteger bigInteger2 = BigInteger.ONE;
        aVar3.f19148b = bigIntegerAdd.multiply(bigInteger2.add(bigIntegerMod).modInverse(bigInteger)).mod(bigInteger);
        aVar3.f19149c = ((BigInteger) aVar.f19149c).multiply((BigInteger) aVar2.f19149c).add(((BigInteger) aVar.f19148b).multiply((BigInteger) aVar2.f19148b)).multiply(bigInteger2.subtract(bigIntegerMod).modInverse(bigInteger)).mod(bigInteger);
        return aVar3;
    }

    public static b b(c10.a aVar) {
        BigInteger bigIntegerAdd = ((BigInteger) aVar.f19149c).add((BigInteger) aVar.f19148b);
        BigInteger bigInteger = f71578f;
        return new b(a.g(c(bigIntegerAdd.mod(bigInteger))), a.g(c(((BigInteger) aVar.f19149c).subtract((BigInteger) aVar.f19148b).mod(bigInteger))), a.g(c(f71580h.multiply((BigInteger) aVar.f19148b).multiply((BigInteger) aVar.f19149c).mod(bigInteger))));
    }

    public static byte[] c(BigInteger bigInteger) {
        byte[] bArr = new byte[32];
        byte[] byteArray = bigInteger.toByteArray();
        System.arraycopy(byteArray, 0, bArr, 32 - byteArray.length, byteArray.length);
        for (int i5 = 0; i5 < 16; i5++) {
            byte b11 = bArr[i5];
            int i11 = 31 - i5;
            bArr[i5] = bArr[i11];
            bArr[i11] = b11;
        }
        return bArr;
    }
}
