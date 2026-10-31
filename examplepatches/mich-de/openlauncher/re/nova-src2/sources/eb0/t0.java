package eb0;

import java.lang.reflect.GenericArrayType;
import java.lang.reflect.Type;

/* loaded from: classes5.dex */
public final class t0 implements GenericArrayType {

    /* renamed from: a, reason: collision with root package name */
    public final Type f52649a;

    public t0(Type type) {
        this.f52649a = type;
    }

    public final boolean equals(Object obj) {
        return (obj instanceof GenericArrayType) && w0.e(this, (GenericArrayType) obj);
    }

    @Override // java.lang.reflect.GenericArrayType
    public final Type getGenericComponentType() {
        return this.f52649a;
    }

    public final int hashCode() {
        return this.f52649a.hashCode();
    }

    public final String toString() {
        return w0.t(this.f52649a) + "[]";
    }
}
