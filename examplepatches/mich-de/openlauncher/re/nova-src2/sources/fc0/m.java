package fc0;

import java.io.Serializable;
import java.util.Collections;
import java.util.List;

/* loaded from: classes5.dex */
public final class m implements o, Serializable {

    /* renamed from: a, reason: collision with root package name */
    public static final m f54635a = new m();

    @Override // x60.f
    public final boolean a() {
        return true;
    }

    @Override // x60.f
    public final double b(double d5) {
        return d5;
    }

    @Override // x60.f
    public final List c() {
        return Collections.EMPTY_LIST;
    }

    @Override // java.lang.Comparable
    public final int compareTo(Object obj) {
        return e.f54605b.compareTo((x60.f) obj);
    }

    @Override // x60.f
    public final x60.f d(x60.f fVar) {
        return fVar;
    }

    public final boolean equals(Object obj) {
        return this == obj || (obj instanceof m);
    }

    @Override // x60.f
    public final x60.f g() {
        return this;
    }

    @Override // java.util.function.DoubleSupplier
    public final double getAsDouble() {
        return 1.0d;
    }

    @Override // kc0.a
    public final /* bridge */ /* synthetic */ Object getValue() {
        return 1;
    }

    public final int hashCode() {
        Integer num = 1;
        return num.hashCode();
    }
}
