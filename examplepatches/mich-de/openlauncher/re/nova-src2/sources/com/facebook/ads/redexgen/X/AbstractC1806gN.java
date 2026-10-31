package com.facebook.ads.redexgen.X;

import com.facebook.ads.CacheFlag;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.EnumSet;
import java.util.HashMap;
import java.util.Iterator;

/* renamed from: com.facebook.ads.redexgen.X.gN, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1806gN {
    public static byte[] A00;
    public static String[] A01 = {"clLZYsvE0tPy51tUZC4MogQduYykR52c", "lIEzMI1Fonr4PelfwTzyztQFsyVhf9Ip", "TKGJLfPNKEz49BEpN0NSVjcPCCgCyWSJ", "cZEnp34x0miDoRW1lF5qB", "MYtk66WDjwYbBfGksqsyV", "MltLsCEnY2PnyXwzhPgr0Wnj1nnS0bJG", "gkTktSSw1X1Dow6kMgw10RcVXUs", "ZuSWLm64POnoRfEkuKjWr8AtWtL"};
    public static final HashMap<String, CacheFlag> A02;
    public static final HashMap<CacheFlag, String> A03;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            String[] strArr = A01;
            if (strArr[1].charAt(22) != strArr[0].charAt(22)) {
                throw new RuntimeException();
            }
            A01[2] = "1oiMVSRbwOeIa0T6GP6G0j2MJvvTCWpD";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            byte b11 = bArrCopyOfRange[i13];
            if (A01[2].charAt(29) != 'W') {
                throw new RuntimeException();
            }
            String[] strArr2 = A01;
            strArr2[6] = "8xJh4rvE5fTdL3M0ChyhXfTHjjF";
            strArr2[7] = "i0rIhT0UpCtxGl53MOF2Fd5nLBk";
            bArrCopyOfRange[i13] = (byte) ((b11 ^ i12) ^ 96);
            i13++;
        }
    }

    public static void A03() {
        A00 = new byte[]{61, 54, 60, 48, 49, 116, 112, 124, 122, 120, 70, 71, 70, 77, 7, 28, 25, 28, 29, 5, 28, 122, 101, 104, 105, 99};
    }

    static {
        A03();
        A03 = new HashMap<>();
        A02 = new HashMap<>();
        A04(CacheFlag.NONE, A00(10, 4, 72));
        A04(CacheFlag.ICON, A00(1, 4, 63));
        A04(CacheFlag.IMAGE, A00(5, 5, Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE));
        A04(CacheFlag.VIDEO, A00(21, 5, 108));
    }

    public static String A01(EnumSet<CacheFlag> cacheFlags) {
        if (cacheFlags == null) {
            return null;
        }
        StringBuilder sb2 = new StringBuilder();
        Iterator it = cacheFlags.iterator();
        while (it.hasNext()) {
            String strA00 = A03.get((CacheFlag) it.next());
            if (strA00 == null) {
                strA00 = A00(14, 7, 18);
            }
            sb2.append(strA00).append(A00(0, 1, 113));
        }
        return sb2.toString();
    }

    public static EnumSet<CacheFlag> A02(String str) {
        if (str == null) {
            return null;
        }
        EnumSet<CacheFlag> enumSetNoneOf = EnumSet.noneOf(CacheFlag.class);
        for (String str2 : str.split(A00(0, 1, 113))) {
            enumSetNoneOf.add(A02.get(str2));
        }
        return enumSetNoneOf;
    }

    public static void A04(CacheFlag cacheFlag, String str) {
        A03.put(cacheFlag, str);
        A02.put(str, cacheFlag);
    }
}
