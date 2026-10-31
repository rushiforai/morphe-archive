package hn;

import java.io.Serializable;
import java.lang.reflect.GenericArrayType;
import java.lang.reflect.Type;
import java.util.Objects;

/* loaded from: classes.dex */
public final class f implements GenericArrayType, Serializable {

    /* renamed from: a, reason: collision with root package name */
    public final Type f59909a;

    public f(Type type) {
        Objects.requireNonNull(type);
        this.f59909a = h.a(type);
    }

    public final boolean equals(Object obj) {
        return (obj instanceof GenericArrayType) && h.d(this, (GenericArrayType) obj);
    }

    @Override // java.lang.reflect.GenericArrayType
    public final Type getGenericComponentType() {
        return this.f59909a;
    }

    public final int hashCode() {
        return this.f59909a.hashCode();
    }

    public final String toString() {
        return h.l(this.f59909a) + "[]";
    }
}
