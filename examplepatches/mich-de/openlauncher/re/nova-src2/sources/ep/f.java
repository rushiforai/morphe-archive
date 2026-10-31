package ep;

import java.io.Serializable;
import java.lang.reflect.GenericArrayType;
import java.lang.reflect.Type;
import java.util.Objects;

/* loaded from: classes4.dex */
public final class f implements GenericArrayType, Serializable {

    /* renamed from: a, reason: collision with root package name */
    public final Type f52867a;

    public f(Type type) {
        Objects.requireNonNull(type);
        this.f52867a = i.a(type);
    }

    public final boolean equals(Object obj) {
        return (obj instanceof GenericArrayType) && i.e(this, (GenericArrayType) obj);
    }

    @Override // java.lang.reflect.GenericArrayType
    public final Type getGenericComponentType() {
        return this.f52867a;
    }

    public final int hashCode() {
        return this.f52867a.hashCode();
    }

    public final String toString() {
        return i.k(this.f52867a) + "[]";
    }
}
