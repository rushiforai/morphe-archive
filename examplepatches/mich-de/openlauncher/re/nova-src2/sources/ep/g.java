package ep;

import h6.c1;
import java.io.Serializable;
import java.lang.reflect.Modifier;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.Arrays;
import java.util.Objects;

/* loaded from: classes4.dex */
public final class g implements ParameterizedType, Serializable {

    /* renamed from: a, reason: collision with root package name */
    public final Type f52868a;

    /* renamed from: b, reason: collision with root package name */
    public final Type f52869b;

    /* renamed from: c, reason: collision with root package name */
    public final Type[] f52870c;

    public g(Type type, Class cls, Type... typeArr) {
        Objects.requireNonNull(cls);
        if (type == null && !Modifier.isStatic(cls.getModifiers()) && cls.getDeclaringClass() != null) {
            throw new IllegalArgumentException(c1.r(cls, "Must specify owner type for "));
        }
        this.f52868a = type == null ? null : i.a(type);
        this.f52869b = i.a(cls);
        Type[] typeArr2 = (Type[]) typeArr.clone();
        this.f52870c = typeArr2;
        int length = typeArr2.length;
        for (int i5 = 0; i5 < length; i5++) {
            Objects.requireNonNull(this.f52870c[i5]);
            i.c(this.f52870c[i5]);
            Type[] typeArr3 = this.f52870c;
            typeArr3[i5] = i.a(typeArr3[i5]);
        }
    }

    public final boolean equals(Object obj) {
        return (obj instanceof ParameterizedType) && i.e(this, (ParameterizedType) obj);
    }

    @Override // java.lang.reflect.ParameterizedType
    public final Type[] getActualTypeArguments() {
        return (Type[]) this.f52870c.clone();
    }

    @Override // java.lang.reflect.ParameterizedType
    public final Type getOwnerType() {
        return this.f52868a;
    }

    @Override // java.lang.reflect.ParameterizedType
    public final Type getRawType() {
        return this.f52869b;
    }

    public final int hashCode() {
        int iHashCode = Arrays.hashCode(this.f52870c) ^ this.f52869b.hashCode();
        Type type = this.f52868a;
        return iHashCode ^ (type != null ? type.hashCode() : 0);
    }

    public final String toString() {
        Type[] typeArr = this.f52870c;
        int length = typeArr.length;
        Type type = this.f52869b;
        if (length == 0) {
            return i.k(type);
        }
        StringBuilder sb2 = new StringBuilder((length + 1) * 30);
        sb2.append(i.k(type));
        sb2.append("<");
        sb2.append(i.k(typeArr[0]));
        for (int i5 = 1; i5 < length; i5++) {
            sb2.append(", ");
            sb2.append(i.k(typeArr[i5]));
        }
        sb2.append(">");
        return sb2.toString();
    }
}
