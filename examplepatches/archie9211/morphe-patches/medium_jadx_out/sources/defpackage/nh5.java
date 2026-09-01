package defpackage;

import j$.util.Objects;
import java.lang.reflect.GenericArrayType;
import java.lang.reflect.Type;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class nh5 implements GenericArrayType {
    public final /* synthetic */ int a;
    public final Type b;

    public nh5(int i, Type type) {
        this.a = i;
        switch (i) {
            case 1:
                this.b = type;
                break;
            default:
                Objects.requireNonNull(type);
                this.b = d46.y(type);
                break;
        }
    }

    public final boolean equals(Object obj) {
        switch (this.a) {
            case 0:
                if ((obj instanceof GenericArrayType) && d46.E(this, (GenericArrayType) obj)) {
                    break;
                }
                break;
            default:
                if ((obj instanceof GenericArrayType) && vv2.F(this, (GenericArrayType) obj)) {
                    break;
                }
                break;
        }
        return true;
    }

    @Override // java.lang.reflect.GenericArrayType
    public final Type getGenericComponentType() {
        switch (this.a) {
        }
        return this.b;
    }

    public final int hashCode() {
        switch (this.a) {
        }
        return this.b.hashCode();
    }

    public final String toString() {
        int i = this.a;
        Type type = this.b;
        switch (i) {
            case 0:
                return d46.j0(type) + "[]";
            default:
                return vv2.c0(type) + "[]";
        }
    }
}
