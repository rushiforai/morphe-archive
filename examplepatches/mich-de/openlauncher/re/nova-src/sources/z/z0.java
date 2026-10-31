package z;

/* loaded from: classes.dex */
public abstract class z0 {

    /* renamed from: a, reason: collision with root package name */
    public static final long[] f97875a = {-9187201950435737345L, -1};

    static {
        new o0(0);
    }

    public static final int a(int i5) {
        if (i5 == 7) {
            return 6;
        }
        return i5 - (i5 / 8);
    }

    public static final int b(int i5) {
        if (i5 == 0) {
            return 6;
        }
        return (i5 * 2) + 1;
    }

    public static final int c(int i5) {
        if (i5 > 0) {
            return (-1) >>> Integer.numberOfLeadingZeros(i5);
        }
        return 0;
    }

    public static final int d(int i5) {
        if (i5 == 7) {
            return 8;
        }
        return b.c0.c(i5, 1, 7, i5);
    }
}
