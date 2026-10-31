package kotlin;

import kotlin.jvm.JvmName;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.a;

@Metadata(d1 = {"\u0000\u0002\n\u0000¨\u0006\u0000"}, d2 = {"kotlin-stdlib"}, k = 2, mv = {2, 1, 0}, xi = 48)
@JvmName
/* loaded from: classes.dex */
public final class UnsignedKt {
    public static final double a(int i5) {
        return (((i5 >>> 31) << 30) * 2) + (Integer.MAX_VALUE & i5);
    }

    public static final double b(long j11) {
        return ((j11 >>> 11) * 2048) + (j11 & 2047);
    }

    public static final String c(int i5, long j11) {
        if (j11 >= 0) {
            a.a(i5);
            String string = Long.toString(j11, i5);
            Intrinsics.f(string, "toString(...)");
            return string;
        }
        long j12 = i5;
        long j13 = ((j11 >>> 1) / j12) << 1;
        long j14 = j11 - (j13 * j12);
        if (j14 >= j12) {
            j14 -= j12;
            j13++;
        }
        a.a(i5);
        String string2 = Long.toString(j13, i5);
        Intrinsics.f(string2, "toString(...)");
        a.a(i5);
        String string3 = Long.toString(j14, i5);
        Intrinsics.f(string3, "toString(...)");
        return string2.concat(string3);
    }
}
