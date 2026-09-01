package defpackage;

import java.lang.reflect.GenericArrayType;
import java.lang.reflect.Type;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class voe implements GenericArrayType {
    public final Type a;

    public voe(Type type) {
        this.a = yoe.a(type);
    }

    public final boolean equals(Object obj) {
        return (obj instanceof GenericArrayType) && vn7.u(this, (GenericArrayType) obj);
    }

    @Override // java.lang.reflect.GenericArrayType
    public final Type getGenericComponentType() {
        return this.a;
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return yoe.k(this.a) + "[]";
    }
}
