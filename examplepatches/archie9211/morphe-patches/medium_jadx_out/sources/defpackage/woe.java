package defpackage;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.Arrays;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class woe implements ParameterizedType {
    public final Type a;
    public final Type b;
    public final Type[] c;

    public woe(Type type, Type type2, Type... typeArr) {
        if (type2 instanceof Class) {
            Class<?> enclosingClass = ((Class) type2).getEnclosingClass();
            if (type != null) {
                if (enclosingClass == null || vn7.D(type) != enclosingClass) {
                    ywb.j("unexpected owner type for ", type2, ": ", type);
                    throw null;
                }
            } else if (enclosingClass != null) {
                rd6.s("unexpected owner type for ", type2, ": null");
                throw null;
            }
        }
        this.a = type != null ? yoe.a(type) : null;
        this.b = yoe.a(type2);
        this.c = (Type[]) typeArr.clone();
        int i = 0;
        while (true) {
            Type[] typeArr2 = this.c;
            if (i >= typeArr2.length) {
                return;
            }
            typeArr2[i].getClass();
            yoe.b(this.c[i]);
            Type[] typeArr3 = this.c;
            typeArr3[i] = yoe.a(typeArr3[i]);
            i++;
        }
    }

    public final boolean equals(Object obj) {
        return (obj instanceof ParameterizedType) && vn7.u(this, (ParameterizedType) obj);
    }

    @Override // java.lang.reflect.ParameterizedType
    public final Type[] getActualTypeArguments() {
        return (Type[]) this.c.clone();
    }

    @Override // java.lang.reflect.ParameterizedType
    public final Type getOwnerType() {
        return this.a;
    }

    @Override // java.lang.reflect.ParameterizedType
    public final Type getRawType() {
        return this.b;
    }

    public final int hashCode() {
        int iHashCode = Arrays.hashCode(this.c) ^ this.b.hashCode();
        Set set = yoe.a;
        Type type = this.a;
        return (type != null ? type.hashCode() : 0) ^ iHashCode;
    }

    public final String toString() {
        Type[] typeArr = this.c;
        StringBuilder sb = new StringBuilder((typeArr.length + 1) * 30);
        sb.append(yoe.k(this.b));
        if (typeArr.length == 0) {
            return sb.toString();
        }
        sb.append("<");
        sb.append(yoe.k(typeArr[0]));
        for (int i = 1; i < typeArr.length; i++) {
            sb.append(", ");
            sb.append(yoe.k(typeArr[i]));
        }
        sb.append(">");
        return sb.toString();
    }
}
