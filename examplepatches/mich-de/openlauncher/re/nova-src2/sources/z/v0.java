package z;

import java.util.List;

/* loaded from: classes.dex */
public abstract class v0 {

    /* renamed from: a, reason: collision with root package name */
    public static final Object[] f97846a = new Object[0];

    /* renamed from: b, reason: collision with root package name */
    public static final j0 f97847b = new j0(0);

    public static final void a(int i5, List list) {
        int size = list.size();
        if (i5 < 0 || i5 >= size) {
            android.support.v4.media.session.b.m0("Index " + i5 + " is out of bounds. The list has " + size + " elements.");
            throw null;
        }
    }

    public static final void b(int i5, int i11, List list) {
        int size = list.size();
        if (i5 > i11) {
            android.support.v4.media.session.b.k0("Indices are out of order. fromIndex (" + i5 + ") is greater than toIndex (" + i11 + ").");
            throw null;
        }
        if (i5 < 0) {
            android.support.v4.media.session.b.m0("fromIndex (" + i5 + ") is less than 0.");
            throw null;
        }
        if (i11 <= size) {
            return;
        }
        android.support.v4.media.session.b.m0("toIndex (" + i11 + ") is more than than the list size (" + size + ')');
        throw null;
    }
}
