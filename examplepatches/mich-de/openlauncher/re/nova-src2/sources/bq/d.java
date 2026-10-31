package bq;

import aq.m0;
import java.lang.reflect.Type;
import java.lang.reflect.WildcardType;

/* loaded from: classes4.dex */
public final class d implements WildcardType {

    /* renamed from: a, reason: collision with root package name */
    public final Type f18420a;

    /* renamed from: b, reason: collision with root package name */
    public final Type f18421b;

    public d(Type[] typeArr, Type[] typeArr2) {
        if (typeArr2.length > 1) {
            throw new IllegalArgumentException();
        }
        if (typeArr.length != 1) {
            throw new IllegalArgumentException();
        }
        if (typeArr2.length != 1) {
            typeArr[0].getClass();
            e.b(typeArr[0]);
            this.f18421b = null;
            this.f18420a = e.a(typeArr[0]);
            return;
        }
        typeArr2[0].getClass();
        e.b(typeArr2[0]);
        if (typeArr[0] != Object.class) {
            throw new IllegalArgumentException();
        }
        this.f18421b = e.a(typeArr2[0]);
        this.f18420a = Object.class;
    }

    public final boolean equals(Object obj) {
        return (obj instanceof WildcardType) && m0.b(this, (WildcardType) obj);
    }

    @Override // java.lang.reflect.WildcardType
    public final Type[] getLowerBounds() {
        Type type = this.f18421b;
        return type != null ? new Type[]{type} : e.f18423b;
    }

    @Override // java.lang.reflect.WildcardType
    public final Type[] getUpperBounds() {
        return new Type[]{this.f18420a};
    }

    public final int hashCode() {
        Type type = this.f18421b;
        return (type != null ? type.hashCode() + 31 : 1) ^ (this.f18420a.hashCode() + 31);
    }

    public final String toString() {
        Type type = this.f18421b;
        if (type != null) {
            return "? super " + e.k(type);
        }
        Type type2 = this.f18420a;
        if (type2 == Object.class) {
            return "?";
        }
        return "? extends " + e.k(type2);
    }
}
