package hn;

import h6.c1;
import java.io.Serializable;
import java.lang.reflect.Modifier;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.Arrays;
import java.util.Objects;

/* loaded from: classes.dex */
public final class g implements ParameterizedType, Serializable {

    /* renamed from: a, reason: collision with root package name */
    public final Type f59910a;

    /* renamed from: b, reason: collision with root package name */
    public final Type f59911b;

    /* renamed from: c, reason: collision with root package name */
    public final Type[] f59912c;

    public g(Type type, Class cls, Type... typeArr) {
        Objects.requireNonNull(cls);
        if (type == null && !Modifier.isStatic(cls.getModifiers()) && cls.getDeclaringClass() != null) {
            throw new IllegalArgumentException(c1.r(cls, "Must specify owner type for "));
        }
        this.f59910a = type == null ? null : h.a(type);
        this.f59911b = h.a(cls);
        Type[] typeArr2 = (Type[]) typeArr.clone();
        this.f59912c = typeArr2;
        int length = typeArr2.length;
        for (int i5 = 0; i5 < length; i5++) {
            Objects.requireNonNull(this.f59912c[i5]);
            h.b(this.f59912c[i5]);
            Type[] typeArr3 = this.f59912c;
            typeArr3[i5] = h.a(typeArr3[i5]);
        }
    }

    public final boolean equals(Object obj) {
        return (obj instanceof ParameterizedType) && h.d(this, (ParameterizedType) obj);
    }

    @Override // java.lang.reflect.ParameterizedType
    public final Type[] getActualTypeArguments() {
        return (Type[]) this.f59912c.clone();
    }

    @Override // java.lang.reflect.ParameterizedType
    public final Type getOwnerType() {
        return this.f59910a;
    }

    @Override // java.lang.reflect.ParameterizedType
    public final Type getRawType() {
        return this.f59911b;
    }

    public final int hashCode() {
        int iHashCode = Arrays.hashCode(this.f59912c) ^ this.f59911b.hashCode();
        Type type = this.f59910a;
        return iHashCode ^ (type != null ? type.hashCode() : 0);
    }

    public final String toString() {
        Type[] typeArr = this.f59912c;
        int length = typeArr.length;
        Type type = this.f59911b;
        if (length == 0) {
            return h.l(type);
        }
        StringBuilder sb2 = new StringBuilder((length + 1) * 30);
        sb2.append(h.l(type));
        sb2.append("<");
        sb2.append(h.l(typeArr[0]));
        for (int i5 = 1; i5 < length; i5++) {
            sb2.append(", ");
            sb2.append(h.l(typeArr[i5]));
        }
        sb2.append(">");
        return sb2.toString();
    }
}
