package com.facebook.ads.redexgen.X;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.text.SpannableStringBuilder;
import android.util.Base64;
import android.util.Pair;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.TreeSet;

/* renamed from: com.facebook.ads.redexgen.X.c8, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1545c8 {
    public static byte[] A0D;
    public static String[] A0E = {"KSt7NOfMbdIyAUysXnIXXFlyTN1YPvlO", "JMwE5qL", "27JttR1a422Nako8YGMY5Ahc", "AlDOUBu3jeBnT50Pq4keLXgXJoF39fy6", "TjvrkKyuYEJ7Y3OZAZEHWsPhg82qs4NN", "wARTkO3aZV9vURkyYIzsPp86MDPaDDjR", "y3qNnTbXyBY4yqPfqr1AOySQgGqBWdXR", "fm1NDxkWExV"};
    public List<C1545c8> A00;
    public final long A01;
    public final long A02;
    public final C1545c8 A03;
    public final C1552cF A04;
    public final String A05;
    public final String A06;
    public final String A07;
    public final String A08;
    public final boolean A09;
    public final HashMap<String, Integer> A0A;
    public final HashMap<String, Integer> A0B;
    public final String[] A0C;

    public static String A03(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0D, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            String[] strArr = A0E;
            if (strArr[0].charAt(12) == strArr[3].charAt(12)) {
                throw new RuntimeException();
            }
            A0E[1] = "UOyBgZY";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 63);
            i13++;
        }
    }

    public static void A04() {
        A0D = new byte[]{2, 18, 1, 12, 19, 71, 79, 94, 75, 78, 75, 94, 75, 81};
    }

    static {
        A04();
    }

    public C1545c8(String str, String str2, long j11, long j12, C1552cF c1552cF, String[] strArr, String str3, String str4, C1545c8 c1545c8) {
        this.A07 = str;
        this.A08 = str2;
        this.A05 = str4;
        this.A04 = c1552cF;
        this.A0C = strArr;
        this.A09 = str2 != null;
        this.A02 = j11;
        this.A01 = j12;
        this.A06 = (String) AbstractC1062Ln.A01(str3);
        this.A03 = c1545c8;
        this.A0B = new HashMap<>();
        this.A0A = new HashMap<>();
    }

    public static SpannableStringBuilder A00(String str, Map<String, C1052Ld> map) {
        if (!map.containsKey(str)) {
            C1052Ld c1052Ld = new C1052Ld();
            c1052Ld.A0G(new SpannableStringBuilder());
            map.put(str, c1052Ld);
        }
        C1052Ld regionOutput = map.get(str);
        return (SpannableStringBuilder) AbstractC1062Ln.A01(regionOutput.A0I());
    }

    public static C1545c8 A01(String str) {
        return new C1545c8(null, AbstractC1547cA.A04(str), -9223372036854775807L, -9223372036854775807L, null, null, A03(0, 0, 63), null, null);
    }

    public static C1545c8 A02(String str, long j11, long j12, C1552cF c1552cF, String[] strArr, String str2, String str3, C1545c8 c1545c8) {
        return new C1545c8(str, null, j11, j12, c1552cF, strArr, str2, str3, c1545c8);
    }

    private void A05(long j11, String str, List<Pair<String, String>> regionImageList) {
        if (!A03(0, 0, 63).equals(this.A06)) {
            str = this.A06;
        }
        if (A0B(j11)) {
            String strA03 = A03(2, 3, 90);
            String resolvedRegionId = this.A07;
            if (strA03.equals(resolvedRegionId)) {
                String resolvedRegionId2 = this.A05;
                if (resolvedRegionId2 != null) {
                    regionImageList.add(new Pair<>(str, this.A05));
                    return;
                }
            }
        }
        for (int i5 = 0; i5 < A0C(); i5++) {
            A0D(i5).A05(j11, str, regionImageList);
        }
    }

    /* JADX WARN: Incorrect condition in loop: B:20:0x0089 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void A06(long j11, Map<String, C1552cF> map, Map<String, C1546c9> map2, String str, Map<String, C1052Ld> map3) {
        int end;
        String str2 = str;
        if (A0B(j11)) {
            if (!A03(0, 0, 63).equals(this.A06)) {
                str2 = this.A06;
            }
            for (Map.Entry<String, Integer> entry : this.A0A.entrySet()) {
                String key = entry.getKey();
                if (this.A0B.containsKey(key)) {
                    end = this.A0B.get(key).intValue();
                } else {
                    end = 0;
                }
                int iIntValue = entry.getValue().intValue();
                if (end != iIntValue) {
                    A09(map, (C1052Ld) AbstractC1062Ln.A01(map3.get(key)), end, iIntValue, ((C1546c9) AbstractC1062Ln.A01(map2.get(str2))).A08);
                }
            }
            for (int i5 = 0; i5 < i; i5++) {
                A0D(i5).A06(j11, map, map2, str2, map3);
            }
        }
    }

    private void A07(long j11, boolean z11, String str, Map<String, C1052Ld> map) {
        String str2 = str;
        this.A0B.clear();
        this.A0A.clear();
        if (A03(5, 8, 21).equals(this.A07)) {
            return;
        }
        if (!A03(0, 0, 63).equals(this.A06)) {
            str2 = this.A06;
        }
        if (this.A09 && z11) {
            SpannableStringBuilder spannableStringBuilderA00 = A00(str2, map);
            String resolvedRegionId = this.A08;
            spannableStringBuilderA00.append((CharSequence) AbstractC1062Ln.A01(resolvedRegionId));
            return;
        }
        String strA03 = A03(0, 2, 95);
        String resolvedRegionId2 = this.A07;
        if (strA03.equals(resolvedRegionId2) && z11) {
            A00(str2, map).append('\n');
            return;
        }
        if (!A0B(j11)) {
            return;
        }
        for (Map.Entry<String, C1052Ld> entry : map.entrySet()) {
            this.A0B.put(entry.getKey(), Integer.valueOf(((CharSequence) AbstractC1062Ln.A01(entry.getValue().A0I())).length()));
        }
        if (A0E[4].charAt(4) == '1') {
            throw new RuntimeException();
        }
        A0E[5] = "qSC9DshU3TyXUmFm7kodYAtB4RREv35I";
        String strA032 = A03(13, 1, 30);
        String resolvedRegionId3 = this.A07;
        boolean zEquals = strA032.equals(resolvedRegionId3);
        for (int i5 = 0; i5 < A0C(); i5++) {
            A0D(i5).A07(j11, z11 || zEquals, str2, map);
        }
        if (zEquals) {
            AbstractC1547cA.A07(A00(str2, map));
        }
        for (Map.Entry<String, C1052Ld> entry2 : map.entrySet()) {
            this.A0A.put(entry2.getKey(), Integer.valueOf(((CharSequence) AbstractC1062Ln.A01(entry2.getValue().A0I())).length()));
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:55:0x010e, code lost:
    
        throw new java.lang.RuntimeException();
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static void A08(SpannableStringBuilder spannableStringBuilder) {
        for (C1538c1 c1538c1 : (C1538c1[]) spannableStringBuilder.getSpans(0, spannableStringBuilder.length(), C1538c1.class)) {
            spannableStringBuilder.replace(spannableStringBuilder.getSpanStart(c1538c1), spannableStringBuilder.getSpanEnd(c1538c1), (CharSequence) A03(0, 0, 63));
        }
        for (int i5 = 0; i5 < spannableStringBuilder.length(); i5++) {
            if (spannableStringBuilder.charAt(i5) == ' ') {
                int i11 = i5 + 1;
                while (i11 < spannableStringBuilder.length() && spannableStringBuilder.charAt(i11) == ' ') {
                    i11++;
                }
                int i12 = i11 - (i5 + 1);
                if (i12 > 0) {
                    spannableStringBuilder.delete(i5, i5 + i12);
                }
            }
        }
        if (spannableStringBuilder.length() > 0 && spannableStringBuilder.charAt(0) == ' ') {
            spannableStringBuilder.delete(0, 1);
        }
        int i13 = 0;
        while (true) {
            int length = spannableStringBuilder.length();
            String[] strArr = A0E;
            String str = strArr[0];
            String str2 = strArr[3];
            int i14 = str.charAt(12);
            if (i14 == str2.charAt(12)) {
                break;
            }
            String[] strArr2 = A0E;
            strArr2[0] = "6SZc2y0oNAJcCe30DBBdmMKheHAeYTmm";
            strArr2[3] = "H4yKQZjUxsnBNeN6q82RYzViWhen0fm9";
            if (i13 < length - 1) {
                if (spannableStringBuilder.charAt(i13) == '\n') {
                    int i15 = i13 + 1;
                    int i16 = A0E[4].charAt(4);
                    if (i16 == 49) {
                        break;
                    }
                    A0E[5] = "Jg4Dhg8uc5bolCxlo8tjz92SrT1s3nhA";
                    if (spannableStringBuilder.charAt(i15) == ' ') {
                        int i17 = i13 + 1;
                        spannableStringBuilder.delete(i17, i13 + 2);
                    }
                }
                i13++;
            } else {
                if (spannableStringBuilder.length() > 0 && spannableStringBuilder.charAt(spannableStringBuilder.length() - 1) == ' ') {
                    spannableStringBuilder.delete(spannableStringBuilder.length() - 1, spannableStringBuilder.length());
                }
                for (int i18 = 0; i18 < spannableStringBuilder.length() - 1; i18++) {
                    if (spannableStringBuilder.charAt(i18) == ' ' && spannableStringBuilder.charAt(i18 + 1) == '\n') {
                        spannableStringBuilder.delete(i18, i18 + 1);
                    }
                }
                int length2 = spannableStringBuilder.length();
                if (A0E[2].length() == 24) {
                    A0E[5] = "mX9dnwa7n6m9Q06j8dinNRsLxizQ6DFw";
                    if (length2 > 0 && spannableStringBuilder.charAt(spannableStringBuilder.length() - 1) == '\n') {
                        spannableStringBuilder.delete(spannableStringBuilder.length() - 1, spannableStringBuilder.length());
                        return;
                    }
                    return;
                }
            }
        }
    }

    private void A09(Map<String, C1552cF> map, C1052Ld c1052Ld, int i5, int i11, int i12) {
        C1552cF c1552cFA02 = AbstractC1547cA.A02(this.A04, this.A0C, map);
        SpannableStringBuilder spannableStringBuilder = (SpannableStringBuilder) c1052Ld.A0I();
        if (spannableStringBuilder == null) {
            spannableStringBuilder = new SpannableStringBuilder();
            c1052Ld.A0G(spannableStringBuilder);
        }
        if (c1552cFA02 != null) {
            AbstractC1547cA.A06(spannableStringBuilder, i5, i11, c1552cFA02, this.A03, map, i12);
            if (A03(13, 1, 30).equals(this.A07)) {
                if (c1552cFA02.A04() != Float.MAX_VALUE) {
                    c1052Ld.A05((c1552cFA02.A04() * (-90.0f)) / 100.0f);
                }
                if (c1552cFA02.A0C() != null) {
                    c1052Ld.A0F(c1552cFA02.A0C());
                }
                if (c1552cFA02.A0B() != null) {
                    c1052Ld.A0E(c1552cFA02.A0B());
                }
            }
        }
    }

    private void A0A(TreeSet<Long> treeSet, boolean z11) {
        boolean zEquals = A03(13, 1, 30).equals(this.A07);
        boolean isPNode = A03(2, 3, 90).equals(this.A07);
        if (z11 || zEquals || (isPNode && this.A05 != null)) {
            if (this.A02 != -9223372036854775807L) {
                treeSet.add(Long.valueOf(this.A02));
            }
            if (this.A01 != -9223372036854775807L) {
                treeSet.add(Long.valueOf(this.A01));
            }
        }
        if (this.A00 == null) {
            return;
        }
        for (int i5 = 0; i5 < this.A00.size(); i5++) {
            C1545c8 c1545c8 = this.A00.get(i5);
            boolean isPNode2 = z11 || zEquals;
            c1545c8.A0A(treeSet, isPNode2);
        }
    }

    private final boolean A0B(long j11) {
        return (this.A02 == -9223372036854775807L && this.A01 == -9223372036854775807L) || (this.A02 <= j11 && this.A01 == -9223372036854775807L) || ((this.A02 == -9223372036854775807L && j11 < this.A01) || (this.A02 <= j11 && j11 < this.A01));
    }

    public final int A0C() {
        if (this.A00 == null) {
            return 0;
        }
        return this.A00.size();
    }

    public final C1545c8 A0D(int i5) {
        if (this.A00 != null) {
            return this.A00.get(i5);
        }
        throw new IndexOutOfBoundsException();
    }

    public final List<C1251Th> A0E(long j11, Map<String, C1552cF> map, Map<String, C1546c9> map2, Map<String, String> imageMap) {
        List<Pair<String, String>> arrayList = new ArrayList<>();
        A05(j11, this.A06, arrayList);
        TreeMap treeMap = new TreeMap();
        A07(j11, false, this.A06, treeMap);
        A06(j11, map, map2, this.A06, treeMap);
        ArrayList arrayList2 = new ArrayList();
        for (Pair<String, String> pair : arrayList) {
            String str = imageMap.get(pair.second);
            if (str != null) {
                byte[] bArrDecode = Base64.decode(str, 0);
                Bitmap bitmapDecodeByteArray = BitmapFactory.decodeByteArray(bArrDecode, 0, bArrDecode.length);
                C1546c9 c1546c9 = (C1546c9) AbstractC1062Ln.A01(map2.get(pair.first));
                arrayList2.add(new C1052Ld().A0D(bitmapDecodeByteArray).A04(c1546c9.A02).A0A(0).A07(c1546c9.A01, 0).A09(c1546c9.A05).A06(c1546c9.A04).A03(c1546c9.A00).A0B(c1546c9.A08).A0H());
            }
        }
        for (Map.Entry entry : treeMap.entrySet()) {
            C1546c9 c1546c92 = (C1546c9) AbstractC1062Ln.A01(map2.get(entry.getKey()));
            C1052Ld c1052Ld = (C1052Ld) entry.getValue();
            A08((SpannableStringBuilder) AbstractC1062Ln.A01(c1052Ld.A0I()));
            c1052Ld.A07(c1546c92.A01, c1546c92.A06);
            c1052Ld.A09(c1546c92.A05);
            c1052Ld.A04(c1546c92.A02);
            c1052Ld.A06(c1546c92.A04);
            c1052Ld.A08(c1546c92.A03, c1546c92.A07);
            c1052Ld.A0B(c1546c92.A08);
            arrayList2.add(c1052Ld.A0H());
        }
        return arrayList2;
    }

    public final void A0F(C1545c8 c1545c8) {
        if (this.A00 == null) {
            this.A00 = new ArrayList();
        }
        this.A00.add(c1545c8);
    }

    public final long[] A0G() {
        TreeSet<Long> treeSet = new TreeSet<>();
        A0A(treeSet, false);
        long[] jArr = new long[treeSet.size()];
        int i5 = 0;
        Iterator<Long> it = treeSet.iterator();
        while (it.hasNext()) {
            jArr[i5] = it.next().longValue();
            i5++;
        }
        return jArr;
    }

    public final String[] A0H() {
        return this.A0C;
    }
}
