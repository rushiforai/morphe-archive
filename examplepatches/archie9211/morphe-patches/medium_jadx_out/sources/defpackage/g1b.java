package defpackage;

import java.lang.reflect.GenericArrayType;
import java.lang.reflect.Type;
import java.lang.reflect.WildcardType;
import java.util.Collection;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class g1b extends d1b {
    public final WildcardType a;

    public g1b(WildcardType wildcardType) {
        this.a = wildcardType;
    }

    @Override // defpackage.d1b
    public final Type b() {
        return this.a;
    }

    public final d1b c() {
        WildcardType wildcardType = this.a;
        Type[] upperBounds = wildcardType.getUpperBounds();
        Type[] lowerBounds = wildcardType.getLowerBounds();
        if (upperBounds.length > 1 || lowerBounds.length > 1) {
            ywb.i("Wildcard types with many bounds are not yet supported: ", wildcardType);
            return null;
        }
        if (lowerBounds.length == 1) {
            Object objK0 = k80.K0(lowerBounds);
            objK0.getClass();
            Type type = (Type) objK0;
            boolean z = type instanceof Class;
            if (z) {
                Class cls = (Class) type;
                if (cls.isPrimitive()) {
                    return new b1b(cls);
                }
            }
            return ((type instanceof GenericArrayType) || (z && ((Class) type).isArray())) ? new j0b(type) : type instanceof WildcardType ? new g1b((WildcardType) type) : new s0b(type);
        }
        if (upperBounds.length == 1) {
            Type type2 = (Type) k80.K0(upperBounds);
            if (!g76.L(type2, Object.class)) {
                type2.getClass();
                boolean z2 = type2 instanceof Class;
                if (z2) {
                    Class cls2 = (Class) type2;
                    if (cls2.isPrimitive()) {
                        return new b1b(cls2);
                    }
                }
                return ((type2 instanceof GenericArrayType) || (z2 && ((Class) type2).isArray())) ? new j0b(type2) : type2 instanceof WildcardType ? new g1b((WildcardType) type2) : new s0b(type2);
            }
        }
        return null;
    }

    @Override // defpackage.o86
    public final Collection getAnnotations() {
        return ey3.a;
    }
}
