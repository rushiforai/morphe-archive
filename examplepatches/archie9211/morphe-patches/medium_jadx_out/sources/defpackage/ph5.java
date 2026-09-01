package defpackage;

import j$.util.Objects;
import java.lang.reflect.Type;
import java.lang.reflect.WildcardType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ph5 implements WildcardType {
    public final /* synthetic */ int a;
    public final Type b;
    public final Type c;

    public ph5(Type[] typeArr, Type[] typeArr2, int i) {
        this.a = i;
        switch (i) {
            case 1:
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
                    vv2.w(typeArr[0]);
                    this.c = null;
                    this.b = typeArr[0];
                    return;
                }
                typeArr2[0].getClass();
                vv2.w(typeArr2[0]);
                if (typeArr[0] != Object.class) {
                    lg8.r();
                    throw null;
                }
                this.c = typeArr2[0];
                this.b = Object.class;
                return;
            default:
                if (typeArr2.length > 1) {
                    ay0.e("At most one lower bound is supported");
                    throw null;
                }
                if (typeArr.length != 1) {
                    ay0.e("Exactly one upper bound must be specified");
                    throw null;
                }
                if (typeArr2.length != 1) {
                    Objects.requireNonNull(typeArr[0]);
                    d46.z(typeArr[0]);
                    this.c = null;
                    this.b = d46.y(typeArr[0]);
                    return;
                }
                Objects.requireNonNull(typeArr2[0]);
                d46.z(typeArr2[0]);
                if (typeArr[0] != Object.class) {
                    ay0.e("When lower bound is specified, upper bound must be Object");
                    throw null;
                }
                this.c = d46.y(typeArr2[0]);
                this.b = Object.class;
                return;
        }
    }

    public final boolean equals(Object obj) {
        switch (this.a) {
            case 0:
                if ((obj instanceof WildcardType) && d46.E(this, (WildcardType) obj)) {
                    break;
                }
                break;
            default:
                if ((obj instanceof WildcardType) && vv2.F(this, (WildcardType) obj)) {
                    break;
                }
                break;
        }
        return true;
    }

    @Override // java.lang.reflect.WildcardType
    public final Type[] getLowerBounds() {
        int i = this.a;
        Type type = this.c;
        switch (i) {
            case 0:
                return type != null ? new Type[]{type} : d46.g;
            default:
                return type != null ? new Type[]{type} : vv2.m;
        }
    }

    @Override // java.lang.reflect.WildcardType
    public final Type[] getUpperBounds() {
        int i = this.a;
        Type type = this.b;
        switch (i) {
            case 0:
                return new Type[]{type};
            default:
                return new Type[]{type};
        }
    }

    public final int hashCode() {
        int iHashCode;
        int iHashCode2;
        int i = this.a;
        Type type = this.b;
        Type type2 = this.c;
        switch (i) {
            case 0:
                iHashCode = type2 != null ? type2.hashCode() + 31 : 1;
                iHashCode2 = type.hashCode();
                break;
            default:
                iHashCode = type2 != null ? type2.hashCode() + 31 : 1;
                iHashCode2 = type.hashCode();
                break;
        }
        return (iHashCode2 + 31) ^ iHashCode;
    }

    public final String toString() {
        int i = this.a;
        Type type = this.c;
        Type type2 = this.b;
        switch (i) {
            case 0:
                if (type != null) {
                    return "? super " + d46.j0(type);
                }
                if (type2 == Object.class) {
                    return "?";
                }
                return "? extends " + d46.j0(type2);
            default:
                if (type != null) {
                    return "? super " + vv2.c0(type);
                }
                if (type2 == Object.class) {
                    return "?";
                }
                return "? extends " + vv2.c0(type2);
        }
    }
}
