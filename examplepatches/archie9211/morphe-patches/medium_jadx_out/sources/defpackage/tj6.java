package defpackage;

import java.lang.reflect.GenericArrayType;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.lang.reflect.WildcardType;
import java.util.List;

/* JADX INFO: loaded from: classes5.dex */
public final class tj6 implements m45 {
    public final vj6 a;
    public final int b;
    public final vq6 c;

    public tj6(vj6 vj6Var, int i, vq6 vq6Var) {
        this.a = vj6Var;
        this.b = i;
        this.c = vq6Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        vj6 vj6Var = this.a;
        k1b k1bVar = vj6Var.c;
        Type type = k1bVar != null ? (Type) k1bVar.invoke() : null;
        if (type instanceof Class) {
            Class cls = (Class) type;
            Class componentType = cls.isArray() ? cls.getComponentType() : Object.class;
            componentType.getClass();
            return componentType;
        }
        boolean z = type instanceof GenericArrayType;
        int i = this.b;
        if (z) {
            if (i != 0) {
                rd6.r("Array type has been queried for a non-0th argument: ", vj6Var);
                return null;
            }
            Type genericComponentType = ((GenericArrayType) type).getGenericComponentType();
            genericComponentType.getClass();
            return genericComponentType;
        }
        if (!(type instanceof ParameterizedType)) {
            rd6.r("Non-generic type has been queried for arguments: ", vj6Var);
            return null;
        }
        Type type2 = (Type) ((List) this.c.getValue()).get(i);
        if (!(type2 instanceof WildcardType)) {
            return type2;
        }
        WildcardType wildcardType = (WildcardType) type2;
        Type[] lowerBounds = wildcardType.getLowerBounds();
        lowerBounds.getClass();
        Type type3 = (Type) k80.u0(lowerBounds);
        if (type3 == null) {
            Type[] upperBounds = wildcardType.getUpperBounds();
            upperBounds.getClass();
            type3 = (Type) k80.t0(upperBounds);
        }
        type3.getClass();
        return type3;
    }
}
