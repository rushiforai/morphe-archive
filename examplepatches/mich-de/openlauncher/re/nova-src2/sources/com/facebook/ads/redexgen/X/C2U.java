package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.2U, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class C2U {
    public static byte[] A02;
    public static String[] A03 = {"dpnNEMah1FWQjLPL4swYtjEzR8Vu", "JWhlm5PRm61tp205ammrAboSLP15g43O", "8OJ8y3UzTZh7cKFe2ZDSvxULM4qQJ4FS", "0zwqZgE0J36MbuG", "e0hhxN3LMVe9Ia7ZIfoyWfM5tHHh", "OfxgukD32n2Gl1T7", "rM6T3YXRJone23KslZWOEHY64xKYq4Cl", "jwwxrSrLNxYAR1saGqprxpjr76QWuQx6"};
    public final Map<String, C05912l<?, ?>> A00 = new HashMap();
    public final Set<C05912l<?, ?>> A01 = new HashSet();

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            String[] strArr = A03;
            if (strArr[0].length() != strArr[4].length()) {
                break;
            }
            A03[6] = "LZEIMA0Oev2py6LwfKWPorr8jIue1rEm";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            int i14 = bArrCopyOfRange[i13] ^ i12;
            String[] strArr2 = A03;
            if (strArr2[2].charAt(29) != strArr2[1].charAt(29)) {
                break;
            }
            A03[7] = "jTPAWhNzw8wc68X52EBX2DP5tzbbS4vp";
            bArrCopyOfRange[i13] = (byte) (i14 ^ 36);
            i13++;
        }
        throw new RuntimeException();
    }

    public static void A01() {
        A02 = new byte[]{80, 79, 67, 81, 86, 73, 79, 72, 82, 98, 71, 82, 71};
    }

    static {
        A01();
    }

    public final Collection<C05912l<?, ?>> A02() {
        return this.A01;
    }

    public final Collection<C05912l<?, ?>> A03() {
        return this.A00.values();
    }

    public final void A04() {
        this.A00.clear();
        if (!AnonymousClass14.A0C || (!this.A01.isEmpty())) {
            for (C05912l<?, ?> c05912l : this.A01) {
                this.A00.put(c05912l.A02, c05912l);
            }
        }
        this.A01.clear();
    }

    public final boolean A05(C05912l<?, ?> c05912l) {
        C1h.A09(c05912l, A00(0, 13, 2));
        if (this.A01.add(c05912l)) {
            this.A00.remove(c05912l.A02);
            return true;
        }
        return false;
    }

    public final boolean A06(C05912l<?, ?> c05912l) {
        C1h.A09(c05912l, A00(0, 13, 2));
        Set<C05912l<?, ?>> set = this.A01;
        if ((set instanceof Collection) && set.isEmpty()) {
            return false;
        }
        for (C05912l<?, ?> c05912l2 : set) {
            if ((c05912l2 == c05912l || !C1h.A0C(c05912l2.A02, c05912l.A02) || c05912l2.A00 == EnumC05922m.A04) ? false : true) {
                return true;
            }
        }
        return false;
    }
}
