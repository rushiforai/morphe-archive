package defpackage;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class e49 implements ParameterizedType, Type {
    public final Class a;
    public final Type b;
    public final Type[] c;

    public e49(Class cls, Type type, ArrayList arrayList) {
        this.a = cls;
        this.b = type;
        this.c = (Type[]) arrayList.toArray(new Type[0]);
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof ParameterizedType)) {
            return false;
        }
        ParameterizedType parameterizedType = (ParameterizedType) obj;
        return this.a.equals(parameterizedType.getRawType()) && g76.L(this.b, parameterizedType.getOwnerType()) && Arrays.equals(this.c, parameterizedType.getActualTypeArguments());
    }

    @Override // java.lang.reflect.ParameterizedType
    public final Type[] getActualTypeArguments() {
        return this.c;
    }

    @Override // java.lang.reflect.ParameterizedType
    public final Type getOwnerType() {
        return this.b;
    }

    @Override // java.lang.reflect.ParameterizedType
    public final Type getRawType() {
        return this.a;
    }

    @Override // java.lang.reflect.Type
    public final String getTypeName() {
        StringBuilder sb = new StringBuilder();
        Class cls = this.a;
        Type type = this.b;
        if (type != null) {
            sb.append(kyd.k0(type));
            sb.append("$");
            sb.append(cls.getSimpleName());
        } else {
            sb.append(kyd.k0(cls));
        }
        Type[] typeArr = this.c;
        if (typeArr.length != 0) {
            k80.B0(typeArr, sb, ", ", "<", ">", "...", d49.a);
        }
        return sb.toString();
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode();
        Type type = this.b;
        return Arrays.hashCode(this.c) ^ (iHashCode ^ (type != null ? type.hashCode() : 0));
    }

    public final String toString() {
        return getTypeName();
    }
}
