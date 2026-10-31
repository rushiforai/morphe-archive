package bq;

import aq.m0;
import java.lang.reflect.GenericArrayType;
import java.lang.reflect.Type;

/* loaded from: classes4.dex */
public final class b implements GenericArrayType {

    /* renamed from: a, reason: collision with root package name */
    public final Type f18416a;

    public b(Type type) {
        this.f18416a = e.a(type);
    }

    public final boolean equals(Object obj) {
        return (obj instanceof GenericArrayType) && m0.b(this, (GenericArrayType) obj);
    }

    @Override // java.lang.reflect.GenericArrayType
    public final Type getGenericComponentType() {
        return this.f18416a;
    }

    public final int hashCode() {
        return this.f18416a.hashCode();
    }

    public final String toString() {
        return e.k(this.f18416a) + "[]";
    }
}
