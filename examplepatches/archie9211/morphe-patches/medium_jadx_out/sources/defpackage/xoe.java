package defpackage;

import java.lang.reflect.Type;
import java.lang.reflect.WildcardType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class xoe implements WildcardType {
    public final Type a;
    public final Type b;

    public xoe(Type[] typeArr, Type[] typeArr2) {
        if (typeArr2.length > 1) {
            lg8.r();
            throw null;
        }
        if (typeArr.length != 1) {
            lg8.r();
            throw null;
        }
        if (typeArr2.length != 1) {
            typeArr[0].getClass();
            yoe.b(typeArr[0]);
            this.b = null;
            this.a = yoe.a(typeArr[0]);
            return;
        }
        typeArr2[0].getClass();
        yoe.b(typeArr2[0]);
        if (typeArr[0] != Object.class) {
            lg8.r();
            throw null;
        }
        this.b = yoe.a(typeArr2[0]);
        this.a = Object.class;
    }

    public final boolean equals(Object obj) {
        return (obj instanceof WildcardType) && vn7.u(this, (WildcardType) obj);
    }

    @Override // java.lang.reflect.WildcardType
    public final Type[] getLowerBounds() {
        Type type = this.b;
        return type != null ? new Type[]{type} : yoe.b;
    }

    @Override // java.lang.reflect.WildcardType
    public final Type[] getUpperBounds() {
        return new Type[]{this.a};
    }

    public final int hashCode() {
        Type type = this.b;
        return (this.a.hashCode() + 31) ^ (type != null ? type.hashCode() + 31 : 1);
    }

    public final String toString() {
        Type type = this.b;
        if (type != null) {
            return "? super " + yoe.k(type);
        }
        Type type2 = this.a;
        if (type2 == Object.class) {
            return "?";
        }
        return "? extends " + yoe.k(type2);
    }
}
