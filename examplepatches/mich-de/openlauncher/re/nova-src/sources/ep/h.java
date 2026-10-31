package ep;

import java.io.Serializable;
import java.lang.reflect.Type;
import java.lang.reflect.WildcardType;
import java.util.Objects;

/* loaded from: classes4.dex */
public final class h implements WildcardType, Serializable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f52871a;

    /* renamed from: b, reason: collision with root package name */
    public final Type f52872b;

    /* renamed from: c, reason: collision with root package name */
    public final Type f52873c;

    public h(Type[] typeArr, Type[] typeArr2, int i5) {
        this.f52871a = i5;
        switch (i5) {
            case 1:
                if (typeArr2.length > 1) {
                    throw new IllegalArgumentException("At most one lower bound is supported");
                }
                if (typeArr.length != 1) {
                    throw new IllegalArgumentException("Exactly one upper bound must be specified");
                }
                if (typeArr2.length != 1) {
                    Objects.requireNonNull(typeArr[0]);
                    hn.h.b(typeArr[0]);
                    this.f52873c = null;
                    this.f52872b = hn.h.a(typeArr[0]);
                    return;
                }
                Objects.requireNonNull(typeArr2[0]);
                hn.h.b(typeArr2[0]);
                if (typeArr[0] != Object.class) {
                    throw new IllegalArgumentException("When lower bound is specified, upper bound must be Object");
                }
                this.f52873c = hn.h.a(typeArr2[0]);
                this.f52872b = Object.class;
                return;
            default:
                i.b(typeArr2.length <= 1);
                i.b(typeArr.length == 1);
                if (typeArr2.length != 1) {
                    Objects.requireNonNull(typeArr[0]);
                    i.c(typeArr[0]);
                    this.f52873c = null;
                    this.f52872b = i.a(typeArr[0]);
                    return;
                }
                Objects.requireNonNull(typeArr2[0]);
                i.c(typeArr2[0]);
                i.b(typeArr[0] == Object.class);
                this.f52873c = i.a(typeArr2[0]);
                this.f52872b = Object.class;
                return;
        }
    }

    public final boolean equals(Object obj) {
        switch (this.f52871a) {
            case 0:
                if (!(obj instanceof WildcardType) || !i.e(this, (WildcardType) obj)) {
                }
                break;
            default:
                if (!(obj instanceof WildcardType) || !hn.h.d(this, (WildcardType) obj)) {
                }
                break;
        }
        return false;
    }

    @Override // java.lang.reflect.WildcardType
    public final Type[] getLowerBounds() {
        switch (this.f52871a) {
            case 0:
                Type type = this.f52873c;
                return type != null ? new Type[]{type} : i.f52874a;
            default:
                Type type2 = this.f52873c;
                return type2 != null ? new Type[]{type2} : hn.h.f59913a;
        }
    }

    @Override // java.lang.reflect.WildcardType
    public final Type[] getUpperBounds() {
        int i5 = this.f52871a;
        Type type = this.f52872b;
        switch (i5) {
            case 0:
                return new Type[]{type};
            default:
                return new Type[]{type};
        }
    }

    public final int hashCode() {
        int iHashCode;
        int iHashCode2;
        switch (this.f52871a) {
            case 0:
                Type type = this.f52873c;
                iHashCode = type != null ? type.hashCode() + 31 : 1;
                iHashCode2 = this.f52872b.hashCode();
                break;
            default:
                Type type2 = this.f52873c;
                iHashCode = type2 != null ? type2.hashCode() + 31 : 1;
                iHashCode2 = this.f52872b.hashCode();
                break;
        }
        return iHashCode ^ (iHashCode2 + 31);
    }

    public final String toString() {
        switch (this.f52871a) {
            case 0:
                Type type = this.f52873c;
                if (type != null) {
                    return "? super " + i.k(type);
                }
                Type type2 = this.f52872b;
                if (type2 == Object.class) {
                    return "?";
                }
                return "? extends " + i.k(type2);
            default:
                Type type3 = this.f52873c;
                if (type3 != null) {
                    return "? super " + hn.h.l(type3);
                }
                Type type4 = this.f52872b;
                if (type4 == Object.class) {
                    return "?";
                }
                return "? extends " + hn.h.l(type4);
        }
    }
}
