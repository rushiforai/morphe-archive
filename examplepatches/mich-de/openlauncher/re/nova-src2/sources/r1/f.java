package r1;

import b.c0;
import h6.c1;
import java.util.List;

/* loaded from: classes.dex */
public abstract class f {
    public static final void a(int i5, List list) {
        int size = list.size();
        if (i5 < 0 || i5 >= size) {
            c(i5, size);
        }
    }

    public static final void b(int i5, int i11, List list) {
        if (i5 > i11) {
            f(i5, i11);
        }
        if (i5 < 0) {
            d(i5);
        }
        if (i11 > list.size()) {
            e(i11, list.size());
        }
    }

    private static final void c(int i5, int i11) {
        throw new IndexOutOfBoundsException(c1.n(i5, "Index ", " is out of bounds. The list has ", i11, " elements."));
    }

    private static final void d(int i5) {
        throw new IndexOutOfBoundsException(c0.i(i5, "fromIndex (", ") is less than 0."));
    }

    private static final void e(int i5, int i11) {
        throw new IndexOutOfBoundsException("toIndex (" + i5 + ") is more than than the list size (" + i11 + ')');
    }

    private static final void f(int i5, int i11) {
        throw new IllegalArgumentException(c1.n(i5, "Indices are out of order. fromIndex (", ") is greater than toIndex (", i11, ")."));
    }
}
