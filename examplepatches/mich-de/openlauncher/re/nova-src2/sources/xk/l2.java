package xk;

import java.util.Comparator;

/* loaded from: classes.dex */
public abstract class l2 implements Comparator {
    public static l2 a(Comparator comparator) {
        return comparator instanceof l2 ? (l2) comparator : new d0(comparator);
    }

    public l2 b() {
        return new c3(this);
    }
}
