package mh;

import java.io.Serializable;

/* loaded from: classes3.dex */
public final class s extends t implements Serializable {

    /* renamed from: b, reason: collision with root package name */
    public static final s f76375b = new s(0);

    /* renamed from: c, reason: collision with root package name */
    public static final s f76376c = new s(1);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f76377a;

    public /* synthetic */ s(int i5) {
        this.f76377a = i5;
    }

    @Override // mh.t
    public final t a() {
        switch (this.f76377a) {
            case 0:
                return f76376c;
            default:
                return f76375b;
        }
    }

    @Override // java.util.Comparator
    public final /* bridge */ /* synthetic */ int compare(Object obj, Object obj2) {
        switch (this.f76377a) {
            case 0:
                Comparable comparable = (Comparable) obj;
                Comparable comparable2 = (Comparable) obj2;
                comparable.getClass();
                comparable2.getClass();
                return comparable.compareTo(comparable2);
            default:
                Comparable comparable3 = (Comparable) obj;
                Comparable comparable4 = (Comparable) obj2;
                comparable3.getClass();
                if (comparable3 == comparable4) {
                    return 0;
                }
                return comparable4.compareTo(comparable3);
        }
    }

    public final String toString() {
        switch (this.f76377a) {
            case 0:
                return "Ordering.natural()";
            default:
                return "Ordering.natural().reverse()";
        }
    }
}
