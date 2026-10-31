package y3;

import androidx.compose.ui.node.LayoutNode;
import h6.c1;

/* loaded from: classes.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final long f96596a;

    public /* synthetic */ a(long j11) {
        this.f96596a = j11;
    }

    public static long a(long j11, int i5, int i11, int i12, int i13, int i14) {
        if ((i14 & 1) != 0) {
            i5 = j(j11);
        }
        if ((i14 & 2) != 0) {
            i11 = h(j11);
        }
        if ((i14 & 4) != 0) {
            i12 = i(j11);
        }
        if ((i14 & 8) != 0) {
            i13 = g(j11);
        }
        if (i11 < i5 || i13 < i12 || i5 < 0 || i12 < 0) {
            j.a("maxWidth must be >= than minWidth,\nmaxHeight must be >= than minHeight,\nminWidth and minHeight must be >= 0");
        }
        return b.h(i5, i11, i12, i13);
    }

    public static final boolean b(long j11, long j12) {
        return j11 == j12;
    }

    public static final boolean c(long j11) {
        int i5 = (int) (3 & j11);
        int i11 = (((i5 & 2) >> 1) * 3) + ((i5 & 1) << 1);
        return (((int) (j11 >> (i11 + 46))) & ((1 << (18 - i11)) - 1)) != 0;
    }

    public static final boolean d(long j11) {
        int i5 = (int) (3 & j11);
        return (((int) (j11 >> 33)) & ((1 << (((((i5 & 2) >> 1) * 3) + ((i5 & 1) << 1)) + 13)) - 1)) != 0;
    }

    public static final boolean e(long j11) {
        int i5 = (int) (3 & j11);
        int i11 = (((i5 & 2) >> 1) * 3) + ((i5 & 1) << 1);
        int i12 = (1 << (18 - i11)) - 1;
        int i13 = ((int) (j11 >> (i11 + 15))) & i12;
        int i14 = ((int) (j11 >> (i11 + 46))) & i12;
        return i13 == (i14 == 0 ? LayoutNode.NotPlacedPlaceOrder : i14 - 1);
    }

    public static final boolean f(long j11) {
        int i5 = (int) (3 & j11);
        int i11 = (1 << (((((i5 & 2) >> 1) * 3) + ((i5 & 1) << 1)) + 13)) - 1;
        int i12 = ((int) (j11 >> 2)) & i11;
        int i13 = ((int) (j11 >> 33)) & i11;
        return i12 == (i13 == 0 ? LayoutNode.NotPlacedPlaceOrder : i13 - 1);
    }

    public static final int g(long j11) {
        int i5 = (int) (3 & j11);
        int i11 = (((i5 & 2) >> 1) * 3) + ((i5 & 1) << 1);
        int i12 = ((int) (j11 >> (i11 + 46))) & ((1 << (18 - i11)) - 1);
        return i12 == 0 ? LayoutNode.NotPlacedPlaceOrder : i12 - 1;
    }

    public static final int h(long j11) {
        int i5 = (int) (3 & j11);
        int i11 = ((int) (j11 >> 33)) & ((1 << (((((i5 & 2) >> 1) * 3) + ((i5 & 1) << 1)) + 13)) - 1);
        return i11 == 0 ? LayoutNode.NotPlacedPlaceOrder : i11 - 1;
    }

    public static final int i(long j11) {
        int i5 = (int) (3 & j11);
        int i11 = (((i5 & 2) >> 1) * 3) + ((i5 & 1) << 1);
        return ((int) (j11 >> (i11 + 15))) & ((1 << (18 - i11)) - 1);
    }

    public static final int j(long j11) {
        int i5 = (int) (3 & j11);
        return ((int) (j11 >> 2)) & ((1 << (((((i5 & 2) >> 1) * 3) + ((i5 & 1) << 1)) + 13)) - 1);
    }

    public static String k(long j11) {
        int iH = h(j11);
        String strValueOf = iH == Integer.MAX_VALUE ? "Infinity" : String.valueOf(iH);
        int iG = g(j11);
        String strValueOf2 = iG != Integer.MAX_VALUE ? String.valueOf(iG) : "Infinity";
        StringBuilder sb2 = new StringBuilder("Constraints(minWidth = ");
        sb2.append(j(j11));
        sb2.append(", maxWidth = ");
        sb2.append(strValueOf);
        sb2.append(", minHeight = ");
        sb2.append(i(j11));
        sb2.append(", maxHeight = ");
        return c1.t(sb2, strValueOf2, ')');
    }

    public final boolean equals(Object obj) {
        if (obj instanceof a) {
            return this.f96596a == ((a) obj).f96596a;
        }
        return false;
    }

    public final int hashCode() {
        return Long.hashCode(this.f96596a);
    }

    public final String toString() {
        return k(this.f96596a);
    }
}
