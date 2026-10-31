package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.Pq, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1161Pq extends AbstractC1394Zg {
    public static byte[] A03;
    public static String[] A04 = {"jiUQo6CKmGGn0bNQq2FDO6241A5SoBaj", "NjcrC4BHBlinI8dn9f8F1PayjJ16z1TY", "gszEQEOFdga7cgdSopt7I1tHcrY2V1VV", "ZchU3", "vHwyJxBJm61GSSTnfDo2XQkKjkB8xeAS", "4pl1YbBfuLwBv1qwuqFo1Vv1gtIn", "fxX", "k5pHGx8UQL"};
    public long A00;
    public long[] A01;
    public long[] A02;

    public static String A04(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 75);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0A() {
        A03 = new byte[]{28, 13, 10, 25, 12, 17, 23, 22, 65, 78, 75, 66, 87, 72, 84, 78, 83, 78, 72, 73, 84, 117, 123, 103, 120, 108, AbstractJsonLexerKt.TC_INVALID, 115, 123, 109, 79, 78, 109, 69, 84, 65, 100, 65, 84, 65, 67, 94, 90, 82, 68};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 15 out of bounds for length 15
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:125)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    @Override // com.facebook.ads.redexgen.X.AbstractC1394Zg
    public final boolean A0C(C1084Mk c1084Mk, long j11) {
        if (A00(c1084Mk) != 2) {
            return false;
        }
        if (!A04(30, 10, 107).equals(A05(c1084Mk))) {
            return false;
        }
        int iA07 = c1084Mk.A07();
        String[] strArr = A04;
        if (strArr[0].charAt(11) != strArr[1].charAt(11)) {
            throw new RuntimeException();
        }
        String[] strArr2 = A04;
        strArr2[2] = "1FAGaxqGi6h67RcariZQWfnJHcGhdGYL";
        strArr2[4] = "vjnVM9RdtFi4gs5r0XGM4GzGr7DQsZD8";
        if (iA07 == 0 || A00(c1084Mk) != 8) {
            return false;
        }
        HashMap<String, Object> mapA08 = A08(c1084Mk);
        Object obj = mapA08.get(A04(0, 8, 51));
        if (obj instanceof Double) {
            double dDoubleValue = ((Double) obj).doubleValue();
            if (dDoubleValue > 0.0d) {
                this.A00 = (long) (dDoubleValue * 1000000.0d);
            }
        }
        Object obj2 = mapA08.get(A04(21, 9, 85));
        if (!(obj2 instanceof Map)) {
            return false;
        }
        Map map = (Map) obj2;
        Object obj3 = map.get(A04(8, 13, 108));
        Object obj4 = map.get(A04(40, 5, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE));
        if (!(obj3 instanceof List) || !(obj4 instanceof List)) {
            return false;
        }
        List list = (List) obj3;
        List list2 = (List) obj4;
        int size = list2.size();
        this.A02 = new long[size];
        this.A01 = new long[size];
        for (int i5 = 0; i5 < size; i5++) {
            Object obj5 = list.get(i5);
            Object obj6 = list2.get(i5);
            if (!(obj6 instanceof Double) || !(obj5 instanceof Double)) {
                this.A02 = new long[0];
                this.A01 = new long[0];
                return false;
            }
            this.A02[i5] = (long) (((Double) obj6).doubleValue() * 1000000.0d);
            this.A01[i5] = ((Double) obj5).longValue();
        }
        return false;
    }

    static {
        A0A();
    }

    public C1161Pq() {
        super(new QA());
        this.A00 = -9223372036854775807L;
        this.A02 = new long[0];
        this.A01 = new long[0];
    }

    public static int A00(C1084Mk c1084Mk) {
        return c1084Mk.A0I();
    }

    public static Boolean A01(C1084Mk c1084Mk) {
        return Boolean.valueOf(c1084Mk.A0I() == 1);
    }

    public static Double A02(C1084Mk c1084Mk) {
        return Double.valueOf(Double.longBitsToDouble(c1084Mk.A0P()));
    }

    public static Object A03(C1084Mk c1084Mk, int i5) {
        switch (i5) {
            case 0:
                return A02(c1084Mk);
            case 1:
                return A01(c1084Mk);
            case 2:
                return A05(c1084Mk);
            case 3:
                return A09(c1084Mk);
            case 4:
            case 5:
            case 6:
            case 7:
            case 9:
            default:
                String[] strArr = A04;
                if (strArr[2].charAt(15) == strArr[4].charAt(15)) {
                    throw new RuntimeException();
                }
                String[] strArr2 = A04;
                strArr2[0] = "2bco4nq6inhnwAsO1K5luPRnDcRGJheZ";
                strArr2[1] = "EujQlUlWz3enU6jBMlNNXpk1KLfv0DB1";
                return null;
            case 8:
                return A08(c1084Mk);
            case 10:
                return A06(c1084Mk);
            case 11:
                return A07(c1084Mk);
        }
    }

    public static String A05(C1084Mk c1084Mk) {
        int iA0M = c1084Mk.A0M();
        int iA09 = c1084Mk.A09();
        c1084Mk.A0g(iA0M);
        return new String(c1084Mk.A0l(), iA09, iA0M);
    }

    public static ArrayList<Object> A06(C1084Mk c1084Mk) {
        int iA0L = c1084Mk.A0L();
        ArrayList<Object> arrayList = new ArrayList<>(iA0L);
        for (int i5 = 0; i5 < iA0L; i5++) {
            int count = A00(c1084Mk);
            Object objA03 = A03(c1084Mk, count);
            if (objA03 != null) {
                arrayList.add(objA03);
            }
        }
        return arrayList;
    }

    public static Date A07(C1084Mk c1084Mk) {
        Date date = new Date((long) A02(c1084Mk).doubleValue());
        c1084Mk.A0g(2);
        return date;
    }

    public static HashMap<String, Object> A08(C1084Mk c1084Mk) {
        int iA0L = c1084Mk.A0L();
        HashMap<String, Object> map = new HashMap<>(iA0L);
        for (int i5 = 0; i5 < iA0L; i5++) {
            String strA05 = A05(c1084Mk);
            int count = A00(c1084Mk);
            Object objA03 = A03(c1084Mk, count);
            if (objA03 != null) {
                map.put(strA05, objA03);
            }
        }
        return map;
    }

    public static HashMap<String, Object> A09(C1084Mk c1084Mk) {
        HashMap<String, Object> map = new HashMap<>();
        while (true) {
            String strA05 = A05(c1084Mk);
            int iA00 = A00(c1084Mk);
            if (iA00 == 9) {
                return map;
            }
            Object objA03 = A03(c1084Mk, iA00);
            if (objA03 != null) {
                map.put(strA05, objA03);
            }
        }
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1394Zg
    public final boolean A0B(C1084Mk c1084Mk) {
        return true;
    }

    public final long A0D() {
        return this.A00;
    }

    public final long[] A0E() {
        return this.A01;
    }

    public final long[] A0F() {
        return this.A02;
    }
}
