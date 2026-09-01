package defpackage;

import com.drew.imaging.avi.hzjl.bPUi;
import com.medium.android.common.ui.Ezz.Plbho;
import java.math.BigInteger;
import java.security.GeneralSecurityException;
import java.security.InvalidAlgorithmParameterException;
import java.security.spec.ECPoint;
import java.util.Collections;
import java.util.Map;
import java.util.Timer;
import sprig.g.Hq.fiHTiFJ;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class tag {
    public static Timer d;
    public Object a;
    public Object b;
    public Object c;

    public tag() {
        this(new long[10], new long[10], new long[10]);
    }

    public static void g(d2f d2fVar, tag tagVar) {
        tag tagVar2 = (tag) d2fVar.b;
        long[] jArr = (long[]) tagVar.a;
        long[] jArr2 = (long[]) tagVar2.a;
        long[] jArr3 = (long[]) d2fVar.c;
        vv2.j0(jArr, jArr2, jArr3);
        long[] jArr4 = (long[]) tagVar.b;
        long[] jArr5 = (long[]) tagVar2.b;
        long[] jArr6 = (long[]) tagVar2.c;
        vv2.j0(jArr4, jArr5, jArr6);
        vv2.j0((long[]) tagVar.c, jArr6, jArr3);
    }

    public Object a(String str, byte[] bArr, p92 p92Var) {
        Map mapSingletonMap = Collections.singletonMap("Content-Type", "application/x-protobuffer");
        mapSingletonMap.getClass();
        return m(str, "POST", bArr, mapSingletonMap, p92Var);
    }

    public vag b() {
        ujf ujfVar;
        qvg qvgVarB;
        dbg dbgVar = (dbg) this.a;
        if (dbgVar == null || (ujfVar = (ujf) this.b) == null) {
            ay0.e("Cannot build without parameters and/or key material");
            return null;
        }
        if (dbgVar.a != ((qvg) ujfVar.b).a.length) {
            ygf.l("Key size mismatch");
            return null;
        }
        if (dbgVar.a() && ((Integer) this.c) == null) {
            ygf.l("Cannot create key without ID requirement with parameters with ID requirement");
            return null;
        }
        if (!((dbg) this.a).a() && ((Integer) this.c) != null) {
            ygf.l("Cannot create key with ID requirement with parameters without ID requirement");
            return null;
        }
        bbg bbgVar = ((dbg) this.a).b;
        if (bbgVar == bbg.d) {
            qvgVarB = mhg.a;
        } else if (bbgVar == bbg.c) {
            qvgVarB = mhg.a(((Integer) this.c).intValue());
        } else {
            if (bbgVar != bbg.b) {
                ygf.f("Unknown AesSivParameters.Variant: ".concat(String.valueOf(bbgVar)));
                return null;
            }
            qvgVarB = mhg.b(((Integer) this.c).intValue());
        }
        return new vag((dbg) this.a, (ujf) this.b, qvgVarB, (Integer) this.c);
    }

    public gjg d() throws GeneralSecurityException {
        Integer num = (Integer) this.c;
        if (num == null) {
            ygf.l("key size not set");
            return null;
        }
        if (((Integer) this.a) == null) {
            ygf.l("tag size not set");
            return null;
        }
        if (((zwf) this.b) != null) {
            return new gjg(num.intValue(), ((Integer) this.a).intValue(), (zwf) this.b);
        }
        ygf.l("variant not set");
        return null;
    }

    public kjg e() throws GeneralSecurityException {
        ujf ujfVar;
        ujg ujgVar = (ujg) this.a;
        if (ujgVar == null || (ujfVar = (ujf) this.b) == null) {
            ygf.l("Cannot build without parameters and/or key material");
            return null;
        }
        if (ujgVar.a != ((qvg) ujfVar.b).a.length) {
            ygf.l("Key size mismatch");
            return null;
        }
        if (ujgVar.a() && ((Integer) this.c) == null) {
            ygf.l("Cannot create key without ID requirement with parameters with ID requirement");
            return null;
        }
        if (!((ujg) this.a).a() && ((Integer) this.c) != null) {
            ygf.l("Cannot create key with ID requirement with parameters without ID requirement");
            return null;
        }
        sjg sjgVar = ((ujg) this.a).c;
        if (sjgVar == sjg.e) {
            qvg qvgVar = mhg.a;
        } else if (sjgVar == sjg.d || sjgVar == sjg.c) {
            mhg.a(((Integer) this.c).intValue());
        } else {
            if (sjgVar != sjg.b) {
                ygf.f("Unknown HmacParameters.Variant: ".concat(String.valueOf(sjgVar)));
                return null;
            }
            mhg.b(((Integer) this.c).intValue());
        }
        return new kjg((ujg) this.a, (ujf) this.b, (Integer) this.c);
    }

    public void f(int i) throws InvalidAlgorithmParameterException {
        if (i != 16 && i != 32) {
            throw new InvalidAlgorithmParameterException(String.format("Invalid key size %d; only 128-bit and 256-bit AES keys are supported", Integer.valueOf(i << 3)));
        }
        this.c = Integer.valueOf(i);
    }

    public void h(int i) throws GeneralSecurityException {
        if (i < 10 || 16 < i) {
            throw new GeneralSecurityException(b09.w(i, "Invalid tag size for AesCmacParameters: "));
        }
        this.a = Integer.valueOf(i);
    }

    public byte[] i() {
        long[] jArr = new long[10];
        long[] jArr2 = new long[10];
        long[] jArr3 = new long[10];
        long[] jArr4 = new long[10];
        long[] jArr5 = new long[10];
        long[] jArr6 = new long[10];
        long[] jArr7 = new long[10];
        long[] jArr8 = new long[10];
        long[] jArr9 = new long[10];
        long[] jArr10 = new long[10];
        long[] jArr11 = new long[10];
        long[] jArr12 = new long[10];
        long[] jArr13 = new long[10];
        long[] jArr14 = (long[]) this.c;
        vv2.k0(jArr4, jArr14);
        vv2.k0(jArr13, jArr4);
        vv2.k0(jArr12, jArr13);
        vv2.j0(jArr5, jArr12, jArr14);
        vv2.j0(jArr6, jArr5, jArr4);
        vv2.k0(jArr12, jArr6);
        vv2.j0(jArr7, jArr12, jArr5);
        vv2.k0(jArr12, jArr7);
        vv2.k0(jArr13, jArr12);
        vv2.k0(jArr12, jArr13);
        vv2.k0(jArr13, jArr12);
        vv2.k0(jArr12, jArr13);
        vv2.j0(jArr8, jArr12, jArr7);
        vv2.k0(jArr12, jArr8);
        vv2.k0(jArr13, jArr12);
        for (int i = 2; i < 10; i += 2) {
            vv2.k0(jArr12, jArr13);
            vv2.k0(jArr13, jArr12);
        }
        vv2.j0(jArr9, jArr13, jArr8);
        vv2.k0(jArr12, jArr9);
        vv2.k0(jArr13, jArr12);
        for (int i2 = 2; i2 < 20; i2 += 2) {
            vv2.k0(jArr12, jArr13);
            vv2.k0(jArr13, jArr12);
        }
        vv2.j0(jArr12, jArr13, jArr9);
        vv2.k0(jArr13, jArr12);
        vv2.k0(jArr12, jArr13);
        for (int i3 = 2; i3 < 10; i3 += 2) {
            vv2.k0(jArr13, jArr12);
            vv2.k0(jArr12, jArr13);
        }
        vv2.j0(jArr10, jArr12, jArr8);
        vv2.k0(jArr12, jArr10);
        vv2.k0(jArr13, jArr12);
        for (int i4 = 2; i4 < 50; i4 += 2) {
            vv2.k0(jArr12, jArr13);
            vv2.k0(jArr13, jArr12);
        }
        vv2.j0(jArr11, jArr13, jArr10);
        vv2.k0(jArr13, jArr11);
        vv2.k0(jArr12, jArr13);
        for (int i5 = 2; i5 < 100; i5 += 2) {
            vv2.k0(jArr13, jArr12);
            vv2.k0(jArr12, jArr13);
        }
        vv2.j0(jArr13, jArr12, jArr11);
        vv2.k0(jArr12, jArr13);
        vv2.k0(jArr13, jArr12);
        for (int i6 = 2; i6 < 50; i6 += 2) {
            vv2.k0(jArr12, jArr13);
            vv2.k0(jArr13, jArr12);
        }
        vv2.j0(jArr12, jArr13, jArr10);
        vv2.k0(jArr13, jArr12);
        vv2.k0(jArr12, jArr13);
        vv2.k0(jArr13, jArr12);
        vv2.k0(jArr12, jArr13);
        vv2.k0(jArr13, jArr12);
        vv2.j0(jArr, jArr13, jArr6);
        vv2.j0(jArr2, (long[]) this.a, jArr);
        vv2.j0(jArr3, (long[]) this.b, jArr);
        byte[] bArrM0 = vv2.m0(jArr3);
        bArrM0[31] = (byte) (bArrM0[31] ^ ((vv2.m0(jArr2)[0] & 1) << 7));
        return bArrM0;
    }

    public urg j() throws GeneralSecurityException {
        cmf cmfVarA;
        prg prgVar = (prg) this.a;
        if (prgVar == null) {
            ygf.l("Cannot build without parameters");
            return null;
        }
        ECPoint eCPoint = (ECPoint) this.b;
        if (eCPoint == null) {
            ygf.l("Cannot build without public point");
            return null;
        }
        hkg.a(eCPoint, prgVar.b.b.getCurve());
        d1g d1gVar = ((prg) this.a).d;
        d1g d1gVar2 = d1g.G;
        if (d1gVar != d1gVar2 && ((Integer) this.c) == null) {
            ygf.l("Cannot create key without ID requirement with parameters with ID requirement");
            return null;
        }
        if (d1gVar == d1gVar2 && ((Integer) this.c) != null) {
            ygf.l("Cannot create key with ID requirement with parameters without ID requirement");
            return null;
        }
        if (d1gVar == d1gVar2) {
            cmfVarA = hmg.a;
        } else if (d1gVar == d1g.F || d1gVar == d1g.E) {
            cmfVarA = hmg.a(((Integer) this.c).intValue());
        } else {
            if (d1gVar != d1g.D) {
                ygf.f("Unknown EcdsaParameters.Variant: ".concat(d1gVar.b));
                return null;
            }
            cmfVarA = hmg.b(((Integer) this.c).intValue());
        }
        return new urg((prg) this.a, (ECPoint) this.b, cmfVarA, (Integer) this.c);
    }

    public tug l() {
        cmf cmfVarA;
        if (((qug) this.a) == null) {
            ygf.l("Cannot build without parameters");
            return null;
        }
        BigInteger bigInteger = (BigInteger) this.b;
        if (bigInteger == null) {
            ygf.l("Cannot build without modulus");
            return null;
        }
        int iBitLength = bigInteger.bitLength();
        qug qugVar = (qug) this.a;
        int i = qugVar.a;
        if (iBitLength != i) {
            StringBuilder sb = new StringBuilder(String.valueOf(iBitLength).length() + 56 + String.valueOf(i).length());
            sb.append("Got modulus size ");
            sb.append(iBitLength);
            sb.append(", but parameters requires modulus size ");
            sb.append(i);
            throw new GeneralSecurityException(sb.toString());
        }
        zwf zwfVar = qugVar.c;
        zwf zwfVar2 = zwf.s;
        if (zwfVar != zwfVar2 && ((Integer) this.c) == null) {
            ygf.l("Cannot create key without ID requirement with parameters with ID requirement");
            return null;
        }
        if (zwfVar == zwfVar2 && ((Integer) this.c) != null) {
            ygf.l("Cannot create key with ID requirement with parameters without ID requirement");
            return null;
        }
        if (zwfVar == zwfVar2) {
            cmfVarA = hmg.a;
        } else if (zwfVar == zwf.r || zwfVar == zwf.q) {
            cmfVarA = hmg.a(((Integer) this.c).intValue());
        } else {
            if (zwfVar != zwf.p) {
                ygf.f("Unknown RsaSsaPssParameters.Variant: ".concat(String.valueOf(zwfVar)));
                return null;
            }
            cmfVarA = hmg.b(((Integer) this.c).intValue());
        }
        return new tug((qug) this.a, (BigInteger) this.b, cmfVarA, (Integer) this.c);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0015  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object m(java.lang.String r10, java.lang.String r11, byte[] r12, java.util.Map r13, defpackage.p92 r14) {
        /*
            Method dump skipped, instruction units count: 304
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.tag.m(java.lang.String, java.lang.String, byte[], java.util.Map, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object n(java.util.List r5, defpackage.p92 r6) {
        /*
            r4 = this;
            boolean r0 = r6 instanceof defpackage.bcg
            if (r0 == 0) goto L13
            r0 = r6
            bcg r0 = (defpackage.bcg) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.e = r1
            goto L18
        L13:
            bcg r0 = new bcg
            r0.<init>(r4, r6)
        L18:
            java.lang.Object r6 = r0.c
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.e
            r3 = 1
            if (r2 == 0) goto L32
            if (r2 != r3) goto L2b
            java.util.Iterator r5 = r0.b
            java.util.Iterator r5 = (java.util.Iterator) r5
            defpackage.br7.v(r6)
            goto L3f
        L2b:
            java.lang.String r4 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r4)
            r4 = 0
            return r4
        L32:
            defpackage.br7.v(r6)
            r6 = 20
            java.util.ArrayList r5 = defpackage.bu1.r1(r5, r6, r6)
            java.util.Iterator r5 = r5.iterator()
        L3f:
            boolean r6 = r5.hasNext()
            if (r6 == 0) goto L59
            java.lang.Object r6 = r5.next()
            java.util.List r6 = (java.util.List) r6
            r2 = r5
            java.util.Iterator r2 = (java.util.Iterator) r2
            r0.b = r2
            r0.e = r3
            java.lang.Object r6 = r4.o(r6, r0)
            if (r6 != r1) goto L3f
            return r1
        L59:
            c1e r4 = defpackage.c1e.a
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.tag.n(java.util.List, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x001b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object o(java.util.List r17, defpackage.p92 r18) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 270
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.tag.o(java.util.List, p92):java.lang.Object");
    }

    public djg c() throws GeneralSecurityException {
        ujf ujfVar;
        gjg gjgVar = (gjg) this.a;
        if (gjgVar == null || (ujfVar = (ujf) this.b) == null) {
            ygf.l("Cannot build without parameters and/or key material");
            return null;
        }
        if (gjgVar.a != ((qvg) ujfVar.b).a.length) {
            ygf.l("Key size mismatch");
            return null;
        }
        if (gjgVar.a() && ((Integer) this.c) == null) {
            ygf.l(fiHTiFJ.ZOGg);
            return null;
        }
        if (!((gjg) this.a).a() && ((Integer) this.c) != null) {
            ygf.l("Cannot create key with ID requirement with parameters without ID requirement");
            return null;
        }
        zwf zwfVar = ((gjg) this.a).c;
        if (zwfVar == zwf.o) {
            qvg qvgVar = mhg.a;
        } else if (zwfVar == zwf.n || zwfVar == zwf.m) {
            mhg.a(((Integer) this.c).intValue());
        } else {
            if (zwfVar != zwf.l) {
                ygf.f("Unknown AesCmacParametersParameters.Variant: ".concat(String.valueOf(zwfVar)));
                return null;
            }
            mhg.b(((Integer) this.c).intValue());
        }
        return new djg((gjg) this.a, (ujf) this.b, (Integer) this.c);
    }

    public iug k() {
        cmf cmfVarA;
        if (((dug) this.a) == null) {
            ygf.l("Cannot build without parameters");
            return null;
        }
        BigInteger bigInteger = (BigInteger) this.b;
        if (bigInteger == null) {
            ygf.l("Cannot build without modulus");
            return null;
        }
        int iBitLength = bigInteger.bitLength();
        dug dugVar = (dug) this.a;
        int i = dugVar.a;
        if (iBitLength != i) {
            StringBuilder sb = new StringBuilder(String.valueOf(iBitLength).length() + 56 + String.valueOf(i).length());
            sb.append("Got modulus size ");
            sb.append(iBitLength);
            sb.append(", but parameters requires modulus size ");
            sb.append(i);
            throw new GeneralSecurityException(sb.toString());
        }
        d1g d1gVar = dugVar.c;
        d1g d1gVar2 = d1g.K;
        if (d1gVar != d1gVar2 && ((Integer) this.c) == null) {
            ygf.l(bPUi.ojteDViYw);
            return null;
        }
        if (d1gVar == d1gVar2 && ((Integer) this.c) != null) {
            ygf.l(Plbho.MBNbMzxheTc);
            return null;
        }
        if (d1gVar == d1gVar2) {
            cmfVarA = hmg.a;
        } else if (d1gVar == d1g.J || d1gVar == d1g.I) {
            cmfVarA = hmg.a(((Integer) this.c).intValue());
        } else {
            if (d1gVar != d1g.H) {
                ygf.f("Unknown RsaSsaPkcs1Parameters.Variant: ".concat(String.valueOf(d1gVar)));
                return null;
            }
            cmfVarA = hmg.b(((Integer) this.c).intValue());
        }
        return new iug((dug) this.a, (BigInteger) this.b, cmfVarA, (Integer) this.c);
    }

    public /* synthetic */ tag(Object obj, Object obj2, Object obj3) {
        this.a = obj;
        this.b = obj2;
        this.c = obj3;
    }

    public tag(d2f d2fVar) {
        this();
        g(d2fVar, this);
    }
}
