package defpackage;

import j$.util.Objects;
import java.lang.reflect.GenericArrayType;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.lang.reflect.TypeVariable;
import java.lang.reflect.WildcardType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class kxd<T> {
    private final Class<? super T> a;
    private final Type b;
    private final int c;

    public kxd() {
        Type genericSuperclass = getClass().getGenericSuperclass();
        if (genericSuperclass instanceof ParameterizedType) {
            ParameterizedType parameterizedType = (ParameterizedType) genericSuperclass;
            if (parameterizedType.getRawType() == kxd.class) {
                Type typeY = d46.y(parameterizedType.getActualTypeArguments()[0]);
                if (!Objects.equals(System.getProperty("gson.allowCapturingTypeVariables"), "true")) {
                    e(typeY);
                }
                this.b = typeY;
                this.a = d46.M(typeY);
                this.c = typeY.hashCode();
                return;
            }
        } else if (genericSuperclass == kxd.class) {
            ygf.f("TypeToken must be created with a type argument: new TypeToken<...>() {}; When using code shrinkers (ProGuard, R8, ...) make sure that generic signatures are preserved.\nSee ".concat("https://github.com/google/gson/blob/main/Troubleshooting.md#".concat("type-token-raw")));
            throw null;
        }
        ygf.f("Must only create direct subclasses of TypeToken");
        throw null;
    }

    public static <T> kxd<T> a(Class<T> cls) {
        return new kxd<>(cls);
    }

    public static kxd<?> b(Type type) {
        return new kxd<>(type);
    }

    public static void e(Type type) {
        if (type instanceof TypeVariable) {
            TypeVariable typeVariable = (TypeVariable) type;
            StringBuilder sb = new StringBuilder("TypeToken type argument must not contain a type variable; captured type variable ");
            sb.append(typeVariable.getName());
            sb.append(" declared by ");
            sb.append(typeVariable.getGenericDeclaration());
            ywb.l(sb, "\nSee ", "https://github.com/google/gson/blob/main/Troubleshooting.md#".concat("typetoken-type-variable"));
            return;
        }
        if (type instanceof GenericArrayType) {
            e(((GenericArrayType) type).getGenericComponentType());
            return;
        }
        int i = 0;
        if (type instanceof ParameterizedType) {
            ParameterizedType parameterizedType = (ParameterizedType) type;
            Type ownerType = parameterizedType.getOwnerType();
            if (ownerType != null) {
                e(ownerType);
            }
            Type[] actualTypeArguments = parameterizedType.getActualTypeArguments();
            int length = actualTypeArguments.length;
            while (i < length) {
                e(actualTypeArguments[i]);
                i++;
            }
            return;
        }
        if (!(type instanceof WildcardType)) {
            if (type != null) {
                return;
            }
            ay0.e("TypeToken captured `null` as type argument; probably a compiler / runtime bug");
            return;
        }
        WildcardType wildcardType = (WildcardType) type;
        for (Type type2 : wildcardType.getLowerBounds()) {
            e(type2);
        }
        Type[] upperBounds = wildcardType.getUpperBounds();
        int length2 = upperBounds.length;
        while (i < length2) {
            e(upperBounds[i]);
            i++;
        }
    }

    public final Class<? super T> c() {
        return this.a;
    }

    public final Type d() {
        return this.b;
    }

    public final boolean equals(Object obj) {
        return (obj instanceof kxd) && d46.E(this.b, ((kxd) obj).b);
    }

    public final int hashCode() {
        return this.c;
    }

    public final String toString() {
        return d46.j0(this.b);
    }

    public kxd(Type type) {
        Objects.requireNonNull(type);
        Type typeY = d46.y(type);
        this.b = typeY;
        this.a = d46.M(typeY);
        this.c = typeY.hashCode();
    }
}
