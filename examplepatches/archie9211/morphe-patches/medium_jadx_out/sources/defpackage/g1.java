package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class g1 {
    public static void a(int i, int i2, int i3) {
        if (i < 0 || i2 > i3) {
            ik4.e(i3, ev6.B(i, i2, "startIndex: ", ", endIndex: ", ", size: "));
        } else {
            if (i <= i2) {
                return;
            }
            ay0.e(ev6.v("startIndex: ", i, i2, " > endIndex: "));
        }
    }

    public static void b(int i, int i2) {
        if (i < 0 || i >= i2) {
            z10.i(ev6.v("index: ", i, i2, ", size: "));
        }
    }

    public static void c(int i, int i2) {
        if (i < 0 || i > i2) {
            z10.i(ev6.v("index: ", i, i2, ", size: "));
        }
    }

    public static void d(int i, int i2, int i3) {
        if (i < 0 || i2 > i3) {
            ik4.e(i3, ev6.B(i, i2, "fromIndex: ", ", toIndex: ", ", size: "));
        } else {
            if (i <= i2) {
                return;
            }
            ay0.e(ev6.v("fromIndex: ", i, i2, " > toIndex: "));
        }
    }

    public static int e(int i, int i2) {
        int i3 = i + (i >> 1);
        if (i3 - i2 < 0) {
            i3 = i2;
        }
        return i3 - 2147483639 > 0 ? i2 > 2147483639 ? Integer.MAX_VALUE : 2147483639 : i3;
    }
}
