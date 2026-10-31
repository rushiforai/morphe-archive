package com.facebook.ads.redexgen.X;

import android.net.Uri;
import android.os.Bundle;
import java.util.ArrayList;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public final class VO implements InterfaceC1018Jt {
    public final int A00;
    public final int A01;
    public final long A02;
    public final long A03;
    public final boolean A04;
    public final int[] A05;
    public final long[] A06;
    public final Uri[] A07;
    public static String[] A08 = {"Oy", "u5", "eyMDe1VPxcseWgRGD7x6dnvE4ZXa9FGP", "m5wEXEzW91ekTJQDqbEoY7M2Viz5uNqS", "4wGXSzkRdQtsgY", "dG1HBzS8O", "NY2HoinqdDUhoFlKPu66HqYUSi2kxly6", "UAsD70KhiIFqGZERIuo6tT1QHkT9LAoT"};
    public static final String A0G = N1.A0h(0);
    public static final String A0B = N1.A0h(1);
    public static final String A0H = N1.A0h(2);
    public static final String A0F = N1.A0h(3);
    public static final String A0C = N1.A0h(4);
    public static final String A0A = N1.A0h(5);
    public static final String A0D = N1.A0h(6);
    public static final String A0E = N1.A0h(7);
    public static final InterfaceC1017Js<VO> A09 = new InterfaceC1017Js() { // from class: com.facebook.ads.redexgen.X.VP
        @Override // com.facebook.ads.redexgen.X.InterfaceC1017Js
        public final InterfaceC1018Jt A7F(Bundle bundle) {
            return VO.A00(bundle);
        }
    };

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 15 out of bounds for length 15
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:125)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public static VO A00(Bundle bundle) {
        long j11 = bundle.getLong(A0G);
        int i5 = bundle.getInt(A0B);
        int i11 = bundle.getInt(A0E);
        ArrayList parcelableArrayList = bundle.getParcelableArrayList(A0H);
        int[] intArray = bundle.getIntArray(A0F);
        long[] longArray = bundle.getLongArray(A0C);
        long j12 = bundle.getLong(A0A);
        boolean z11 = bundle.getBoolean(A0D);
        if (intArray == null) {
            intArray = new int[0];
        }
        Uri[] uriArr = new Uri[0];
        if (parcelableArrayList != null) {
            Object[] array = parcelableArrayList.toArray(uriArr);
            String[] strArr = A08;
            if (strArr[1].length() != strArr[0].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A08;
            strArr2[1] = "hk";
            strArr2[0] = "dz";
            uriArr = (Uri[]) array;
        }
        if (longArray == null) {
            longArray = new long[0];
        }
        return new VO(j11, i5, i11, intArray, uriArr, longArray, j12, z11);
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 15 out of bounds for length 15
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:125)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public final VO A06(int i5) {
        int[] iArrA02 = A02(this.A05, i5);
        long[] jArrA03 = A03(this.A06, i5);
        return new VO(this.A03, i5, this.A01, iArrA02, (Uri[]) Arrays.copyOf(this.A07, i5), jArrA03, this.A02, this.A04);
    }

    public VO(long j11) {
        this(j11, -1, -1, new int[0], new Uri[0], new long[0], 0L, false);
    }

    public VO(long j11, int i5, int i11, int[] iArr, Uri[] uriArr, long[] jArr, long j12, boolean z11) {
        AbstractC1062Ln.A07(iArr.length == uriArr.length);
        this.A03 = j11;
        this.A00 = i5;
        this.A01 = i11;
        this.A05 = iArr;
        this.A07 = uriArr;
        this.A06 = jArr;
        this.A02 = j12;
        this.A04 = z11;
    }

    public static int[] A02(int[] iArr, int i5) {
        int length = iArr.length;
        int iMax = Math.max(i5, length);
        int[] iArrCopyOf = Arrays.copyOf(iArr, iMax);
        Arrays.fill(iArrCopyOf, length, iMax, 0);
        return iArrCopyOf;
    }

    public static long[] A03(long[] jArr, int i5) {
        int length = jArr.length;
        int iMax = Math.max(i5, length);
        long[] jArrCopyOf = Arrays.copyOf(jArr, iMax);
        Arrays.fill(jArrCopyOf, length, iMax, -9223372036854775807L);
        return jArrCopyOf;
    }

    public final int A04() {
        return A05(-1);
    }

    /* JADX WARN: Incorrect condition in loop: B:4:0x0005 */
    /* JADX WARN: Removed duplicated region for block: B:13:0x0045  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int A05(int i5) {
        int i11 = i5 + 1;
        while (i11 < nextAdIndexToPlay) {
            boolean z11 = this.A04;
            if (A08[6].charAt(22) == '1') {
                throw new RuntimeException();
            }
            String[] strArr = A08;
            strArr[2] = "wXzuuLzplSU7fe00gnkOtQG4HVUKIEbm";
            strArr[3] = "HTdk1COeDneuqKlJWd1wMEh0kFRhi2IN";
            if (!z11) {
                int i12 = this.A05[i11];
                String[] strArr2 = A08;
                String str = strArr2[5];
                String str2 = strArr2[4];
                int length = str.length();
                int nextAdIndexToPlay = str2.length();
                if (length == nextAdIndexToPlay) {
                    if (i12 == 0) {
                        break;
                    }
                } else {
                    A08[6] = "54DsX3tQhkmFtMCpdkyLWRpb2NsjawWZ";
                    if (i12 == 0) {
                        break;
                    }
                    if (this.A05[i11] == 1) {
                        break;
                    }
                    i11++;
                }
            } else {
                break;
            }
        }
        return i11;
    }

    /* JADX WARN: Incorrect condition in loop: B:7:0x000a */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean A07() {
        if (this.A00 == -1) {
            return true;
        }
        for (int i5 = 0; i5 < i; i5++) {
            int i11 = this.A05[i5];
            if (i11 != 0) {
                int i12 = this.A05[i5];
                if (i12 != 1) {
                }
            }
            return true;
        }
        return false;
    }

    public final boolean A08() {
        return this.A00 == -1 || A04() < this.A00;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        VO vo2 = (VO) obj;
        if (this.A03 == vo2.A03 && this.A00 == vo2.A00 && this.A01 == vo2.A01 && Arrays.equals(this.A07, vo2.A07) && Arrays.equals(this.A05, vo2.A05) && Arrays.equals(this.A06, vo2.A06) && this.A02 == vo2.A02 && this.A04 == vo2.A04) {
            return true;
        }
        return false;
    }

    public final int hashCode() {
        return (((((((((((((this.A00 * 31) + this.A01) * 31) + ((int) (this.A03 ^ (this.A03 >>> 32)))) * 31) + Arrays.hashCode(this.A07)) * 31) + Arrays.hashCode(this.A05)) * 31) + Arrays.hashCode(this.A06)) * 31) + ((int) (this.A02 ^ (this.A02 >>> 32)))) * 31) + (this.A04 ? 1 : 0);
    }
}
