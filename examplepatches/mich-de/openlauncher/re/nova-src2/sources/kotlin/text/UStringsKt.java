package kotlin.text;

import kotlin.Metadata;
import kotlin.UInt;
import kotlin.ULong;
import kotlin.UShort;
import kotlin.jvm.JvmName;
import kotlin.jvm.internal.Intrinsics;
import r70.i;

@Metadata(d1 = {"\u0000\u0002\n\u0000¨\u0006\u0000"}, d2 = {"kotlin-stdlib"}, k = 2, mv = {2, 1, 0}, xi = 48)
@JvmName
/* loaded from: classes5.dex */
public final class UStringsKt {
    public static final int a(String str) {
        Intrinsics.g(str, "<this>");
        UInt uIntB = b(16, str);
        if (uIntB != null) {
            return uIntB.f71697a;
        }
        i.q0(str);
        throw null;
    }

    public static final UInt b(int i5, String str) {
        int i11;
        Intrinsics.g(str, "<this>");
        a.a(i5);
        int length = str.length();
        if (length == 0) {
            return null;
        }
        int i12 = 0;
        char cCharAt = str.charAt(0);
        if (Intrinsics.h(cCharAt, 48) < 0) {
            i11 = 1;
            if (length == 1 || cCharAt != '+') {
                return null;
            }
        } else {
            i11 = 0;
        }
        UInt.Companion companion = UInt.f71696b;
        int iDivideUnsigned = 119304647;
        while (i11 < length) {
            int iDigit = Character.digit((int) str.charAt(i11), i5);
            if (iDigit < 0) {
                return null;
            }
            if (Integer.compareUnsigned(i12, iDivideUnsigned) > 0) {
                if (iDivideUnsigned != 119304647) {
                    return null;
                }
                iDivideUnsigned = Integer.divideUnsigned(-1, i5);
                if (Integer.compareUnsigned(i12, iDivideUnsigned) > 0) {
                    return null;
                }
            }
            int i13 = i12 * i5;
            int i14 = iDigit + i13;
            if (Integer.compareUnsigned(i14, i13) < 0) {
                return null;
            }
            i11++;
            i12 = i14;
        }
        return new UInt(i12);
    }

    public static final long c(String str) {
        ULong uLongD = d(16, str);
        if (uLongD != null) {
            return uLongD.f71700a;
        }
        i.q0(str);
        throw null;
    }

    public static final ULong d(int i5, String str) {
        Intrinsics.g(str, "<this>");
        a.a(i5);
        int length = str.length();
        if (length == 0) {
            return null;
        }
        int i11 = 0;
        char cCharAt = str.charAt(0);
        if (Intrinsics.h(cCharAt, 48) < 0) {
            i11 = 1;
            if (length == 1 || cCharAt != '+') {
                return null;
            }
        }
        long j11 = i5;
        ULong.Companion companion = ULong.f71699b;
        long j12 = 0;
        long jDivideUnsigned = 512409557603043100L;
        while (i11 < length) {
            int iDigit = Character.digit((int) str.charAt(i11), i5);
            if (iDigit < 0) {
                return null;
            }
            if (Long.compareUnsigned(j12, jDivideUnsigned) > 0) {
                if (jDivideUnsigned != 512409557603043100L) {
                    return null;
                }
                jDivideUnsigned = Long.divideUnsigned(-1L, j11);
                if (Long.compareUnsigned(j12, jDivideUnsigned) > 0) {
                    return null;
                }
            }
            long j13 = j12 * j11;
            UInt.Companion companion2 = UInt.f71696b;
            long j14 = (iDigit & 4294967295L) + j13;
            if (Long.compareUnsigned(j14, j13) < 0) {
                return null;
            }
            i11++;
            j12 = j14;
        }
        return new ULong(j12);
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x001c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final short e(String str) {
        UShort uShort;
        UInt uIntB = b(16, str);
        if (uIntB != null) {
            int i5 = uIntB.f71697a;
            uShort = Integer.compareUnsigned(i5, 65535) > 0 ? null : new UShort((short) i5);
        }
        if (uShort != null) {
            return uShort.f71704a;
        }
        i.q0(str);
        throw null;
    }
}
