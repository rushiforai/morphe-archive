package xk;

import java.io.Serializable;

/* loaded from: classes3.dex */
public final class b3 extends l2 implements Serializable {

    /* renamed from: a, reason: collision with root package name */
    public static final b3 f95872a = new b3();

    @Override // xk.l2
    public final l2 b() {
        return i2.f95937b;
    }

    @Override // java.util.Comparator
    public final int compare(Object obj, Object obj2) {
        Comparable comparable = (Comparable) obj;
        Comparable comparable2 = (Comparable) obj2;
        comparable.getClass();
        if (comparable == comparable2) {
            return 0;
        }
        return comparable2.compareTo(comparable);
    }

    public final String toString() {
        return "Ordering.natural().reverse()";
    }
}
