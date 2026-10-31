package kotlin.text;

import b.u4;
import kotlin.Metadata;
import kotlin.collections.AbstractList;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;

@Metadata(d1 = {"\u0000\u0002\n\u0000¨\u0006\u0000"}, d2 = {"kotlin-stdlib"}, k = 2, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes5.dex */
public final class HexExtensionsKt {

    /* renamed from: a, reason: collision with root package name */
    public static final int[] f72010a;

    /* renamed from: b, reason: collision with root package name */
    public static final long[] f72011b;

    static {
        int[] iArr = new int[256];
        int i5 = 0;
        for (int i11 = 0; i11 < 256; i11++) {
            iArr[i11] = "0123456789abcdef".charAt(i11 & 15) | ("0123456789abcdef".charAt(i11 >> 4) << '\b');
        }
        f72010a = iArr;
        int[] iArr2 = new int[256];
        for (int i12 = 0; i12 < 256; i12++) {
            iArr2[i12] = "0123456789ABCDEF".charAt(i12 & 15) | ("0123456789ABCDEF".charAt(i12 >> 4) << '\b');
        }
        int[] iArr3 = new int[256];
        for (int i13 = 0; i13 < 256; i13++) {
            iArr3[i13] = -1;
        }
        int i14 = 0;
        int i15 = 0;
        while (i14 < "0123456789abcdef".length()) {
            iArr3["0123456789abcdef".charAt(i14)] = i15;
            i14++;
            i15++;
        }
        int i16 = 0;
        int i17 = 0;
        while (i16 < "0123456789ABCDEF".length()) {
            iArr3["0123456789ABCDEF".charAt(i16)] = i17;
            i16++;
            i17++;
        }
        long[] jArr = new long[256];
        for (int i18 = 0; i18 < 256; i18++) {
            jArr[i18] = -1;
        }
        int i19 = 0;
        int i21 = 0;
        while (i19 < "0123456789abcdef".length()) {
            jArr["0123456789abcdef".charAt(i19)] = i21;
            i19++;
            i21++;
        }
        int i22 = 0;
        while (i5 < "0123456789ABCDEF".length()) {
            jArr["0123456789ABCDEF".charAt(i5)] = i22;
            i5++;
            i22++;
        }
        f72011b = jArr;
    }

    public static final void a(int i5, int i11, String str) {
        int i12 = i11 - i5;
        if (i12 < 1) {
            String strSubstring = str.substring(i5, i11);
            Intrinsics.f(strSubstring, "substring(...)");
            throw new NumberFormatException("Expected at least 1 hexadecimal digits at index " + i5 + ", but was \"" + strSubstring + "\" of length " + i12);
        }
        if (i12 > 16) {
            int i13 = (i12 + i5) - 16;
            while (i5 < i13) {
                if (str.charAt(i5) != '0') {
                    StringBuilder sbJ = u4.j(i5, "Expected the hexadecimal digit '0' at index ", ", but was '");
                    sbJ.append(str.charAt(i5));
                    sbJ.append("'.\nThe result won't fit the type being parsed.");
                    throw new NumberFormatException(sbJ.toString());
                }
                i5++;
            }
        }
    }

    public static long b(int i5, int i11, String str) {
        HexFormat.f72012d.getClass();
        HexFormat format = HexFormat.f72013e;
        Intrinsics.g(format, "format");
        AbstractList.Companion companion = AbstractList.f71712a;
        int length = str.length();
        companion.getClass();
        AbstractList.Companion.a(i5, i11, length);
        if (format.f72016c.f72021a) {
            a(i5, i11, str);
            return c(i5, i11, str);
        }
        if (i11 - i5 > 0) {
            a(i5, i11, str);
            return c(i5, i11, str);
        }
        String strSubstring = str.substring(i5, i11);
        Intrinsics.f(strSubstring, "substring(...)");
        throw new NumberFormatException("Expected a hexadecimal number with prefix \"\" and suffix \"\", but was ".concat(strSubstring));
    }

    public static final long c(int i5, int i11, String str) {
        long j11 = 0;
        while (i5 < i11) {
            long j12 = j11 << 4;
            char cCharAt = str.charAt(i5);
            if ((cCharAt >>> '\b') == 0) {
                long j13 = f72011b[cCharAt];
                if (j13 >= 0) {
                    j11 = j12 | j13;
                    i5++;
                }
            }
            StringBuilder sbJ = u4.j(i5, "Expected a hexadecimal digit at index ", ", but was ");
            sbJ.append(str.charAt(i5));
            throw new NumberFormatException(sbJ.toString());
        }
        return j11;
    }
}
