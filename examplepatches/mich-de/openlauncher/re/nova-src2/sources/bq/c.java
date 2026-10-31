package bq;

import aq.m0;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.Arrays;
import java.util.Set;

/* loaded from: classes4.dex */
public final class c implements ParameterizedType {

    /* renamed from: a, reason: collision with root package name */
    public final Type f18417a;

    /* renamed from: b, reason: collision with root package name */
    public final Type f18418b;

    /* renamed from: c, reason: collision with root package name */
    public final Type[] f18419c;

    public c(Type type, Type type2, Type... typeArr) {
        if (type2 instanceof Class) {
            Class<?> enclosingClass = ((Class) type2).getEnclosingClass();
            if (type != null) {
                if (enclosingClass == null || m0.d(type) != enclosingClass) {
                    throw new IllegalArgumentException("unexpected owner type for " + type2 + ": " + type);
                }
            } else if (enclosingClass != null) {
                throw new IllegalArgumentException("unexpected owner type for " + type2 + ": null");
            }
        }
        this.f18417a = type == null ? null : e.a(type);
        this.f18418b = e.a(type2);
        this.f18419c = (Type[]) typeArr.clone();
        int i5 = 0;
        while (true) {
            Type[] typeArr2 = this.f18419c;
            if (i5 >= typeArr2.length) {
                return;
            }
            typeArr2[i5].getClass();
            e.b(this.f18419c[i5]);
            Type[] typeArr3 = this.f18419c;
            typeArr3[i5] = e.a(typeArr3[i5]);
            i5++;
        }
    }

    public final boolean equals(Object obj) {
        return (obj instanceof ParameterizedType) && m0.b(this, (ParameterizedType) obj);
    }

    @Override // java.lang.reflect.ParameterizedType
    public final Type[] getActualTypeArguments() {
        return (Type[]) this.f18419c.clone();
    }

    @Override // java.lang.reflect.ParameterizedType
    public final Type getOwnerType() {
        return this.f18417a;
    }

    @Override // java.lang.reflect.ParameterizedType
    public final Type getRawType() {
        return this.f18418b;
    }

    public final int hashCode() {
        int iHashCode = Arrays.hashCode(this.f18419c) ^ this.f18418b.hashCode();
        Set set = e.f18422a;
        Type type = this.f18417a;
        return iHashCode ^ (type != null ? type.hashCode() : 0);
    }

    public final String toString() {
        Type[] typeArr = this.f18419c;
        StringBuilder sb2 = new StringBuilder((typeArr.length + 1) * 30);
        sb2.append(e.k(this.f18418b));
        if (typeArr.length == 0) {
            return sb2.toString();
        }
        sb2.append("<");
        sb2.append(e.k(typeArr[0]));
        for (int i5 = 1; i5 < typeArr.length; i5++) {
            sb2.append(", ");
            sb2.append(e.k(typeArr[i5]));
        }
        sb2.append(">");
        return sb2.toString();
    }
}
