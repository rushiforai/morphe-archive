package com.facebook.ads.redexgen.X;

import android.text.TextUtils;
import java.util.Arrays;
import java.util.Iterator;

/* renamed from: com.facebook.ads.redexgen.X.fx, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1780fx {
    public static byte[] A00;
    public static String[] A01 = {"SZD1gnuwYC0ZDT5XCpN5wGg04vpvlXtv", "38Pkme0hctlwOycqXgIFmSt4EwGMsPu", "PZ5YSJhnqoOlFoXIJ", "MKZOkal4amZt32sY0duMnYWyMVrdvNv7", "PmMqC", "MtvBWYcgrX5nN2Ecp9gb0xGXALHF8kJ8", "836OSMulKGxVhnpon", "Ud77gBKi5ZcurXFgX0oEk2YfAMQgAhDP"};

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 18);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A00 = new byte[]{25, 95, 67, 90, 91, 103, 96, 122, 107, 124, 125, 122, 103, 122, 103, 111, 98, 3, 20, 6, 16, 3, 21, 20, 21, 46, 7, 24, 21, 20, 30};
    }

    static {
        A01();
    }

    /* JADX WARN: Incorrect condition in loop: B:23:0x012a */
    /* JADX WARN: Incorrect condition in loop: B:27:0x015b */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static void A02(C0958Hi c0958Hi, C2086kz c2086kz, C07147g c07147g) {
        c2086kz.A0d(new C2084kx(c07147g.A35().A01(), C2329p0.A04, C2329p0.A04, c07147g.A1r(), A00(17, 14, 99)));
        boolean zA2Q = c07147g.A2Q();
        String strA00 = A00(17, 14, 99);
        if (zA2Q) {
            C2082kv c2082kv = new C2082kv(c07147g.A1Y(), c07147g.A1r(), strA00);
            c2082kv.A04 = true;
            c2082kv.A03 = A00(0, 5, 37);
            c2086kz.A0Y(c2082kv);
        }
        boolean zA33 = C2203mv.A33(c0958Hi, C1576cd.A03());
        String strA09 = c07147g.A32().A0I().A09();
        if (!TextUtils.isEmpty(strA09)) {
            C2082kv c2082kv2 = new C2082kv(strA09, c07147g.A1r(), A00(17, 14, 99), c07147g.A32().A0I().A06());
            if (zA2Q && !zA33) {
                c2086kz.A0Y(c2082kv2);
            } else {
                c2086kz.A0b(c2082kv2);
            }
        }
        String strA08 = c07147g.A32().A0I().A08();
        if (strA08 != null) {
            c2086kz.A0d(new C2084kx(strA08, AbstractC1775fs.A00(c07147g.A32().A0I()), AbstractC1775fs.A01(c07147g.A32().A0I()), c07147g.A1r(), A00(17, 14, 99)));
        }
        AbstractC1774fr.A00(c07147g, c2086kz, strA00);
        Iterator<String> it = c07147g.A32().A0L().A03().iterator();
        while (true) {
            boolean zHasNext = it.hasNext();
            if (A01[3].charAt(13) == 'A') {
                throw new RuntimeException();
            }
            A01[5] = "OaJBMb3uVjEUmdwMqKaIaowf8It3Pi62";
            if (zHasNext) {
                c2086kz.A0d(new C2084kx(it.next(), -1, -1, c07147g.A1r(), A00(17, 14, 99)));
            } else {
                Iterator<C1952io> it2 = c07147g.A1w().iterator();
                while (isDSL) {
                    c2086kz.A0d(new C2084kx(it2.next().A02(), -1, -1, c07147g.A1r(), A00(17, 14, 99)));
                }
                Iterator<C2278oA> it3 = c07147g.A1v().iterator();
                while (isDSL) {
                    c2086kz.A0d(new C2084kx(it3.next().A02(), -1, -1, c07147g.A1r(), A00(17, 14, 99)));
                }
                return;
            }
        }
    }

    public static void A03(C0958Hi c0958Hi, C2086kz c2086kz, C07147g c07147g) {
        int i5 = 0;
        for (C1735fE c1735fE : c07147g.A39()) {
            String strA08 = c1735fE.A0I().A08();
            if (strA08 != null) {
                C2084kx c2084kx = new C2084kx(strA08, AbstractC1775fs.A00(c1735fE.A0I()), AbstractC1775fs.A01(c1735fE.A0I()), c07147g.A1r(), A00(5, 12, 28));
                if (i5 == 0) {
                    c2086kz.A0c(c2084kx);
                } else {
                    c2086kz.A0d(c2084kx);
                }
            }
            String[] strArr = A01;
            if (strArr[2].length() != strArr[6].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A01;
            strArr2[0] = "d4OGgqInyGax2uUwuJ6rocUy9OK0g6RJ";
            strArr2[7] = "8ZRzgNChvbJeQD0ONiajCC1PQNrhJWUQ";
            AbstractC1774fr.A00(c07147g, c2086kz, A00(17, 14, 99));
            Iterator<String> it = c1735fE.A0L().A03().iterator();
            while (it.hasNext()) {
                c2086kz.A0d(new C2084kx(it.next(), -1, -1, c07147g.A1r(), A00(5, 12, 28)));
            }
            if (!TextUtils.isEmpty(c1735fE.A0I().A09())) {
                new C2082kv(c1735fE.A0I().A09(), c07147g.A1r(), A00(5, 12, 28), c1735fE.A0I().A06()).A04 = false;
            }
            i5++;
        }
    }
}
