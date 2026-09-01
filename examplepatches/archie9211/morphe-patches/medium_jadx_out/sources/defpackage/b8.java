package defpackage;

import java.io.Serializable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public class b8 implements l55, Serializable {
    public final Object a;
    public final Class b;
    public final String c;
    public final String d;
    public final boolean e;
    public final int f;
    public final int g;

    public b8(int i, int i2, Class cls, Object obj, String str, String str2) {
        this.a = obj;
        this.b = cls;
        this.c = str;
        this.d = str2;
        this.e = false;
        this.f = i;
        this.g = i2 >> 1;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof b8)) {
            return false;
        }
        b8 b8Var = (b8) obj;
        return this.e == b8Var.e && this.f == b8Var.f && this.g == b8Var.g && g76.L(this.a, b8Var.a) && g76.L(this.b, b8Var.b) && this.c.equals(b8Var.c) && this.d.equals(b8Var.d);
    }

    @Override // defpackage.l55
    public final int getArity() {
        return this.f;
    }

    public final int hashCode() {
        Object obj = this.a;
        int iHashCode = (obj != null ? obj.hashCode() : 0) * 31;
        Class cls = this.b;
        return ((((wgd.o(wgd.o((iHashCode + (cls != null ? cls.hashCode() : 0)) * 31, 31, this.c), 31, this.d) + (this.e ? 1231 : 1237)) * 31) + this.f) * 31) + this.g;
    }

    public final String toString() {
        return n1b.a.i(this);
    }

    public b8(String str) {
        this(0, 0, f76.class, h41.NO_RECEIVER, "dismissSheet", str);
    }
}
