package eb0;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.Arrays;
import java.util.Objects;

/* loaded from: classes5.dex */
public final class u0 implements ParameterizedType {

    /* renamed from: a, reason: collision with root package name */
    public final Type f52652a;

    /* renamed from: b, reason: collision with root package name */
    public final Type f52653b;

    /* renamed from: c, reason: collision with root package name */
    public final Type[] f52654c;

    public u0(Type type, Type type2, Type... typeArr) {
        if (type2 instanceof Class) {
            if ((type == null) != (((Class) type2).getEnclosingClass() == null)) {
                throw new IllegalArgumentException();
            }
        }
        for (Type type3 : typeArr) {
            Objects.requireNonNull(type3, "typeArgument == null");
            w0.d(type3);
        }
        this.f52652a = type;
        this.f52653b = type2;
        this.f52654c = (Type[]) typeArr.clone();
    }

    public final boolean equals(Object obj) {
        return (obj instanceof ParameterizedType) && w0.e(this, (ParameterizedType) obj);
    }

    @Override // java.lang.reflect.ParameterizedType
    public final Type[] getActualTypeArguments() {
        return (Type[]) this.f52654c.clone();
    }

    @Override // java.lang.reflect.ParameterizedType
    public final Type getOwnerType() {
        return this.f52652a;
    }

    @Override // java.lang.reflect.ParameterizedType
    public final Type getRawType() {
        return this.f52653b;
    }

    public final int hashCode() {
        int iHashCode = Arrays.hashCode(this.f52654c) ^ this.f52653b.hashCode();
        Type type = this.f52652a;
        return iHashCode ^ (type != null ? type.hashCode() : 0);
    }

    public final String toString() {
        Type[] typeArr = this.f52654c;
        int length = typeArr.length;
        Type type = this.f52653b;
        if (length == 0) {
            return w0.t(type);
        }
        StringBuilder sb2 = new StringBuilder((typeArr.length + 1) * 30);
        sb2.append(w0.t(type));
        sb2.append("<");
        sb2.append(w0.t(typeArr[0]));
        for (int i5 = 1; i5 < typeArr.length; i5++) {
            sb2.append(", ");
            sb2.append(w0.t(typeArr[i5]));
        }
        sb2.append(">");
        return sb2.toString();
    }
}
