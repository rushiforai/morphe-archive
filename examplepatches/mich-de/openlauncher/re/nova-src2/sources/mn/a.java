package mn;

import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import hn.h;
import java.lang.reflect.GenericArrayType;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.lang.reflect.TypeVariable;
import java.lang.reflect.WildcardType;
import java.util.Objects;
import lb0.b;

/* loaded from: classes.dex */
public class a<T> {

    /* renamed from: a, reason: collision with root package name */
    public final Class f76504a;

    /* renamed from: b, reason: collision with root package name */
    public final Type f76505b;

    /* renamed from: c, reason: collision with root package name */
    public final int f76506c;

    public a() {
        Type genericSuperclass = getClass().getGenericSuperclass();
        if (genericSuperclass instanceof ParameterizedType) {
            ParameterizedType parameterizedType = (ParameterizedType) genericSuperclass;
            if (parameterizedType.getRawType() == a.class) {
                Type typeA = h.a(parameterizedType.getActualTypeArguments()[0]);
                if (!Objects.equals(System.getProperty("gson.allowCapturingTypeVariables"), InneractiveMediationDefs.SHOW_HOUSE_AD_YES)) {
                    a(typeA);
                }
                this.f76505b = typeA;
                this.f76504a = h.g(typeA);
                this.f76506c = typeA.hashCode();
                return;
            }
        } else if (genericSuperclass == a.class) {
            throw new IllegalStateException("TypeToken must be created with a type argument: new TypeToken<...>() {}; When using code shrinkers (ProGuard, R8, ...) make sure that generic signatures are preserved.\nSee " + b.s("type-token-raw"));
        }
        throw new IllegalStateException("Must only create direct subclasses of TypeToken");
    }

    public static void a(Type type) {
        if (type instanceof TypeVariable) {
            TypeVariable typeVariable = (TypeVariable) type;
            throw new IllegalArgumentException("TypeToken type argument must not contain a type variable; captured type variable " + typeVariable.getName() + " declared by " + typeVariable.getGenericDeclaration() + "\nSee " + b.s("typetoken-type-variable"));
        }
        if (type instanceof GenericArrayType) {
            a(((GenericArrayType) type).getGenericComponentType());
            return;
        }
        int i5 = 0;
        if (type instanceof ParameterizedType) {
            ParameterizedType parameterizedType = (ParameterizedType) type;
            Type ownerType = parameterizedType.getOwnerType();
            if (ownerType != null) {
                a(ownerType);
            }
            Type[] actualTypeArguments = parameterizedType.getActualTypeArguments();
            int length = actualTypeArguments.length;
            while (i5 < length) {
                a(actualTypeArguments[i5]);
                i5++;
            }
            return;
        }
        if (!(type instanceof WildcardType)) {
            if (type == null) {
                throw new IllegalArgumentException("TypeToken captured `null` as type argument; probably a compiler / runtime bug");
            }
            return;
        }
        WildcardType wildcardType = (WildcardType) type;
        for (Type type2 : wildcardType.getLowerBounds()) {
            a(type2);
        }
        Type[] upperBounds = wildcardType.getUpperBounds();
        int length2 = upperBounds.length;
        while (i5 < length2) {
            a(upperBounds[i5]);
            i5++;
        }
    }

    public final boolean equals(Object obj) {
        if (obj instanceof a) {
            return h.d(this.f76505b, ((a) obj).f76505b);
        }
        return false;
    }

    public final int hashCode() {
        return this.f76506c;
    }

    public final String toString() {
        return h.l(this.f76505b);
    }

    public a(Type type) {
        Objects.requireNonNull(type);
        Type typeA = h.a(type);
        this.f76505b = typeA;
        this.f76504a = h.g(typeA);
        this.f76506c = typeA.hashCode();
    }
}
