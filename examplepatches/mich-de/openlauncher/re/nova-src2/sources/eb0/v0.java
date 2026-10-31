package eb0;

import java.lang.reflect.Type;
import java.lang.reflect.WildcardType;

/* loaded from: classes5.dex */
public final class v0 implements WildcardType {

    /* renamed from: a, reason: collision with root package name */
    public final Type f52657a;

    /* renamed from: b, reason: collision with root package name */
    public final Type f52658b;

    public v0(Type[] typeArr, Type[] typeArr2) {
        if (typeArr2.length > 1) {
            throw new IllegalArgumentException();
        }
        if (typeArr.length != 1) {
            throw new IllegalArgumentException();
        }
        if (typeArr2.length != 1) {
            typeArr[0].getClass();
            w0.d(typeArr[0]);
            this.f52658b = null;
            this.f52657a = typeArr[0];
            return;
        }
        typeArr2[0].getClass();
        w0.d(typeArr2[0]);
        if (typeArr[0] != Object.class) {
            throw new IllegalArgumentException();
        }
        this.f52658b = typeArr2[0];
        this.f52657a = Object.class;
    }

    public final boolean equals(Object obj) {
        return (obj instanceof WildcardType) && w0.e(this, (WildcardType) obj);
    }

    @Override // java.lang.reflect.WildcardType
    public final Type[] getLowerBounds() {
        Type type = this.f52658b;
        return type != null ? new Type[]{type} : w0.f52662a;
    }

    @Override // java.lang.reflect.WildcardType
    public final Type[] getUpperBounds() {
        return new Type[]{this.f52657a};
    }

    public final int hashCode() {
        Type type = this.f52658b;
        return (type != null ? type.hashCode() + 31 : 1) ^ (this.f52657a.hashCode() + 31);
    }

    public final String toString() {
        Type type = this.f52658b;
        if (type != null) {
            return "? super " + w0.t(type);
        }
        Type type2 = this.f52657a;
        if (type2 == Object.class) {
            return "?";
        }
        return "? extends " + w0.t(type2);
    }
}
