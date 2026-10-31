package com.facebook.ads.redexgen.X;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.TreeSet;

/* renamed from: com.facebook.ads.redexgen.X.eS, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1688eS {
    public static byte[] A05;
    public static String[] A06 = {"XJsIaGexGfIuS7KEZ9CJlXNx8P4Ex0vt", "60KxRcdLBeG78T2FpJswCsfbof8MgXhk", "CEtqY3eDykzysQrnjk67hSoI7J0lE8tM", "C8j3Xa", "2DALgc8JJTxTXlKdrEx8TMLlTIu8rM", "aUzT0izMM3P341UuinRxCvRfM25HKV7D", "eFiEiYnQcJqWOrmAtm9B3LsRvACfo7Re", "sVCHW3txnWQofnJyftwy8WfNGa"};
    public C1079Mf A00;
    public final int A01;
    public final String A02;
    public final ArrayList<C1687eR> A03;
    public final TreeSet<MK> A04;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A05, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            if (A06[1].charAt(20) == 'A') {
                throw new RuntimeException();
            }
            String[] strArr = A06;
            strArr[0] = "oikn1IeDaTldZ49JGX0shdTwRfWMg6J3";
            strArr[2] = "IDANH1eKx0Aj5KUbxLU1e6GAxb5fBg1H";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 11);
            i13++;
        }
    }

    public static void A01() {
        A05 = new byte[]{88, 12, 23, 88, 108, 78, 76, 71, 74, 75, 108, 64, 65, 91, 74, 65, 91, 109, 74, 66, 71, 78, 79, 11, 95, 68, 11, 89, 78, 69, 74, 70, 78, 11};
    }

    static {
        A01();
    }

    public C1688eS(int i5, String str) {
        this(i5, str, C1079Mf.A03);
    }

    public C1688eS(int i5, String str, C1079Mf c1079Mf) {
        this.A01 = i5;
        this.A02 = str;
        this.A00 = c1079Mf;
        this.A04 = new TreeSet<>();
        this.A03 = new ArrayList<>();
    }

    public final long A02(long j11, long currentEndPosition) {
        boolean z11 = true;
        AbstractC1062Ln.A07(j11 >= 0);
        String[] strArr = A06;
        if (strArr[5].charAt(20) == strArr[6].charAt(20)) {
            throw new RuntimeException();
        }
        String[] strArr2 = A06;
        strArr2[7] = "bN9UoPq5LBr1HLD2ZNhWaqR2kN";
        strArr2[3] = "XDzBoQ";
        if (currentEndPosition < 0) {
            z11 = false;
        }
        AbstractC1062Ln.A07(z11);
        MK mkA04 = A04(j11, currentEndPosition);
        if (mkA04.A0B()) {
            return -Math.min(mkA04.A0C() ? Long.MAX_VALUE : mkA04.A01, currentEndPosition);
        }
        long j12 = j11 + currentEndPosition;
        if (j12 < 0) {
            j12 = Long.MAX_VALUE;
        }
        long queryEndPosition = mkA04.A02 + mkA04.A01;
        if (queryEndPosition < j12) {
            for (MK mk2 : this.A04.tailSet(mkA04, false)) {
                if (mk2.A02 > queryEndPosition) {
                    break;
                }
                queryEndPosition = Math.max(queryEndPosition, mk2.A02 + mk2.A01);
                if (queryEndPosition >= j12) {
                    break;
                }
            }
        }
        return Math.min(queryEndPosition - j11, currentEndPosition);
    }

    public final C1079Mf A03() {
        return this.A00;
    }

    public final MK A04(long j11, long j12) {
        MK mkA02 = MK.A02(this.A02, j11);
        MK mkFloor = this.A04.floor(mkA02);
        if (mkFloor != null && mkFloor.A02 + mkFloor.A01 > j11) {
            return mkFloor;
        }
        MK lookupSpan = this.A04.ceiling(mkA02);
        if (lookupSpan != null) {
            long jMin = lookupSpan.A02 - j11;
            String[] strArr = A06;
            if (strArr[0].charAt(6) != strArr[2].charAt(6)) {
                throw new RuntimeException();
            }
            A06[4] = "aVJfmdWTliU3V44lGj4S5k38mM8Ueq";
            if (j12 != -1) {
                jMin = Math.min(jMin, j12);
            }
            j12 = jMin;
        }
        return MK.A03(this.A02, j11, j12);
    }

    public final MK A05(MK mk2, long j11, boolean z11) {
        AbstractC1062Ln.A08(this.A04.remove(mk2));
        File file = (File) AbstractC1062Ln.A01(mk2.A03);
        if (z11) {
            File file2 = file.getParentFile();
            File fileA04 = MK.A04((File) AbstractC1062Ln.A01(file2), this.A01, mk2.A02, j11);
            if (file.renameTo(fileA04)) {
                file = fileA04;
            } else {
                MV.A07(A00(4, 13, 36), A00(17, 17, 32) + file + A00(0, 4, 115) + fileA04);
            }
        }
        MK newCacheSpan = mk2.A0D(file, j11);
        this.A04.add(newCacheSpan);
        return newCacheSpan;
    }

    public final TreeSet<MK> A06() {
        return this.A04;
    }

    /* JADX WARN: Incorrect condition in loop: B:4:0x0007 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void A07(long j11) {
        for (int i5 = 0; i5 < i; i5++) {
            if (this.A03.get(i5).A01 == j11) {
                this.A03.remove(i5);
                return;
            }
        }
        throw new IllegalStateException();
    }

    public final void A08(MK mk2) {
        this.A04.add(mk2);
    }

    public final boolean A09() {
        return this.A04.isEmpty();
    }

    public final boolean A0A() {
        return this.A03.isEmpty();
    }

    /* JADX WARN: Incorrect condition in loop: B:4:0x0007 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean A0B(long j11, long j12) {
        for (int i5 = 0; i5 < i; i5++) {
            if (this.A03.get(i5).A00(j11, j12)) {
                String[] strArr = A06;
                String str = strArr[7];
                String str2 = strArr[3];
                int length = str.length();
                int i11 = str2.length();
                if (length == i11) {
                    throw new RuntimeException();
                }
                A06[4] = "XKzBDetdOJOyRaULlXIUbxE0BHClvu";
                return true;
            }
        }
        return false;
    }

    /* JADX WARN: Incorrect condition in loop: B:4:0x0007 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean A0C(long j11, long j12) {
        for (int i5 = 0; i5 < i; i5++) {
            if (this.A03.get(i5).A01(j11, j12)) {
                return false;
            }
        }
        this.A03.add(new C1687eR(j11, j12));
        return true;
    }

    public final boolean A0D(C1681eL c1681eL) {
        if (this.A04.remove(c1681eL)) {
            if (c1681eL.A03 != null) {
                c1681eL.A03.delete();
            }
            if (A06[4].length() != 30) {
                throw new RuntimeException();
            }
            String[] strArr = A06;
            strArr[5] = "WdNjvezHgXv69NEjpHb7AJfIHKMKcEq5";
            strArr[6] = "JZNXCd3YgV4FAej3gizlH3Yt3sinraVp";
            return true;
        }
        return false;
    }

    public final boolean A0E(C1693eX c1693eX) {
        C1079Mf c1079Mf = this.A00;
        C1079Mf oldMetadata = this.A00;
        this.A00 = oldMetadata.A05(c1693eX);
        C1079Mf oldMetadata2 = this.A00;
        return !oldMetadata2.equals(c1079Mf);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        C1688eS c1688eS = (C1688eS) obj;
        if (this.A01 == c1688eS.A01) {
            String str = this.A02;
            String str2 = c1688eS.A02;
            String[] strArr = A06;
            if (strArr[0].charAt(6) != strArr[2].charAt(6)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A06;
            strArr2[7] = "JchhdTh7s6hipszCaexu8urUMx";
            strArr2[3] = "iBdtFW";
            if (str.equals(str2) && this.A04.equals(c1688eS.A04) && this.A00.equals(c1688eS.A00)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        int result = this.A01;
        int i5 = result * 31;
        int result2 = this.A02.hashCode();
        return ((i5 + result2) * 31) + this.A00.hashCode();
    }
}
