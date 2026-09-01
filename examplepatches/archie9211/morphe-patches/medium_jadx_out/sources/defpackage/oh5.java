package defpackage;

import j$.util.Objects;
import java.lang.reflect.Modifier;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class oh5 implements ParameterizedType {
    public final /* synthetic */ int a = 0;
    public final Type b;
    public final Type c;
    public final Type[] d;

    public oh5(Type type, Class cls, Type[] typeArr) {
        Objects.requireNonNull(cls);
        if (type == null && !Modifier.isStatic(cls.getModifiers()) && cls.getDeclaringClass() != null) {
            ik4.h("Must specify owner type for ", cls);
            throw null;
        }
        this.b = type != null ? d46.y(type) : null;
        this.c = d46.y(cls);
        Type[] typeArr2 = (Type[]) typeArr.clone();
        this.d = typeArr2;
        int length = typeArr2.length;
        for (int i = 0; i < length; i++) {
            Objects.requireNonNull(this.d[i]);
            d46.z(this.d[i]);
            Type[] typeArr3 = this.d;
            typeArr3[i] = d46.y(typeArr3[i]);
        }
    }

    public final boolean equals(Object obj) {
        switch (this.a) {
            case 0:
                if ((obj instanceof ParameterizedType) && d46.E(this, (ParameterizedType) obj)) {
                    break;
                }
                break;
            default:
                if ((obj instanceof ParameterizedType) && vv2.F(this, (ParameterizedType) obj)) {
                    break;
                }
                break;
        }
        return true;
    }

    @Override // java.lang.reflect.ParameterizedType
    public final Type[] getActualTypeArguments() {
        int i = this.a;
        Type[] typeArr = this.d;
        switch (i) {
        }
        return (Type[]) typeArr.clone();
    }

    @Override // java.lang.reflect.ParameterizedType
    public final Type getOwnerType() {
        switch (this.a) {
        }
        return this.b;
    }

    @Override // java.lang.reflect.ParameterizedType
    public final Type getRawType() {
        switch (this.a) {
        }
        return this.c;
    }

    public final int hashCode() {
        int i = this.a;
        Type type = this.b;
        Type type2 = this.c;
        Type[] typeArr = this.d;
        switch (i) {
            case 0:
                return (Arrays.hashCode(typeArr) ^ type2.hashCode()) ^ (type != null ? type.hashCode() : 0);
            default:
                return (Arrays.hashCode(typeArr) ^ type2.hashCode()) ^ (type != null ? type.hashCode() : 0);
        }
    }

    public final String toString() {
        int i = this.a;
        Type[] typeArr = this.d;
        int i2 = 1;
        Type type = this.c;
        switch (i) {
            case 0:
                int length = typeArr.length;
                if (length == 0) {
                    return d46.j0(type);
                }
                StringBuilder sb = new StringBuilder((length + 1) * 30);
                sb.append(d46.j0(type));
                sb.append("<");
                sb.append(d46.j0(typeArr[0]));
                while (i2 < length) {
                    sb.append(", ");
                    sb.append(d46.j0(typeArr[i2]));
                    i2++;
                }
                sb.append(">");
                return sb.toString();
            default:
                if (typeArr.length == 0) {
                    return vv2.c0(type);
                }
                StringBuilder sb2 = new StringBuilder((typeArr.length + 1) * 30);
                sb2.append(vv2.c0(type));
                sb2.append("<");
                sb2.append(vv2.c0(typeArr[0]));
                while (i2 < typeArr.length) {
                    sb2.append(", ");
                    sb2.append(vv2.c0(typeArr[i2]));
                    i2++;
                }
                sb2.append(">");
                return sb2.toString();
        }
    }

    public oh5(Type type, Type type2, Type[] typeArr) {
        if (type2 instanceof Class) {
            if ((type == null) != (((Class) type2).getEnclosingClass() == null)) {
                lg8.r();
                throw null;
            }
        }
        for (Type type3 : typeArr) {
            Objects.requireNonNull(type3, "typeArgument == null");
            vv2.w(type3);
        }
        this.b = type;
        this.c = type2;
        this.d = (Type[]) typeArr.clone();
    }
}
