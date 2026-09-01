package defpackage;

import java.lang.reflect.GenericArrayType;
import java.lang.reflect.Type;
import java.lang.reflect.WildcardType;
import java.util.Collection;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class j0b extends d1b {
    public final Type a;
    public final d1b b;

    /* JADX WARN: Multi-variable type inference failed */
    public j0b(Type type) {
        d1b b1bVar;
        d1b b1bVar2;
        this.a = type;
        if (!(type instanceof GenericArrayType)) {
            if (type instanceof Class) {
                Class cls = (Class) type;
                if (cls.isArray()) {
                    Class<?> componentType = cls.getComponentType();
                    componentType.getClass();
                    b1bVar = componentType.isPrimitive() ? new b1b(componentType) : ((componentType instanceof GenericArrayType) || componentType.isArray()) ? new j0b(componentType) : componentType instanceof WildcardType ? new g1b((WildcardType) componentType) : new s0b(componentType);
                }
            }
            ay0.h("Not an array type (", type.getClass(), "): ", type);
            throw null;
        }
        Type genericComponentType = ((GenericArrayType) type).getGenericComponentType();
        genericComponentType.getClass();
        boolean z = genericComponentType instanceof Class;
        if (z) {
            Class cls2 = (Class) genericComponentType;
            if (cls2.isPrimitive()) {
                b1bVar2 = new b1b(cls2);
                this.b = b1bVar2;
            }
        }
        b1bVar = ((genericComponentType instanceof GenericArrayType) || (z && ((Class) genericComponentType).isArray())) ? new j0b(genericComponentType) : genericComponentType instanceof WildcardType ? new g1b((WildcardType) genericComponentType) : new s0b(genericComponentType);
        b1bVar2 = b1bVar;
        this.b = b1bVar2;
    }

    @Override // defpackage.d1b
    public final Type b() {
        return this.a;
    }

    @Override // defpackage.o86
    public final Collection getAnnotations() {
        return ey3.a;
    }
}
