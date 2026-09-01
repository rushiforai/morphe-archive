package defpackage;

import j$.util.Objects;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class f1g extends t0g {
    public final int a;
    public final int b;
    public final int c;
    public final int d;
    public final d1g e;
    public final e1g f;

    public f1g(int i, int i2, int i3, int i4, d1g d1gVar, e1g e1gVar) {
        this.a = i;
        this.b = i2;
        this.c = i3;
        this.d = i4;
        this.e = d1gVar;
        this.f = e1gVar;
    }

    public static ing b() {
        ing ingVar = new ing();
        ingVar.f = null;
        ingVar.a = null;
        ingVar.b = null;
        ingVar.c = null;
        ingVar.d = null;
        ingVar.e = d1g.e;
        return ingVar;
    }

    @Override // defpackage.bzf
    public final boolean a() {
        return this.e != d1g.e;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof f1g)) {
            return false;
        }
        f1g f1gVar = (f1g) obj;
        return f1gVar.a == this.a && f1gVar.b == this.b && f1gVar.c == this.c && f1gVar.d == this.d && f1gVar.e == this.e && f1gVar.f == this.f;
    }

    public final int hashCode() {
        return Objects.hash(f1g.class, Integer.valueOf(this.a), Integer.valueOf(this.b), Integer.valueOf(this.c), Integer.valueOf(this.d), this.e, this.f);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("AesCtrHmacAead Parameters (variant: ", String.valueOf(this.e), ", hashType: ", String.valueOf(this.f), ", ");
        sbU.append(this.c);
        sbU.append("-byte IV, and ");
        sbU.append(this.d);
        sbU.append("-byte tags, and ");
        sbU.append(this.a);
        sbU.append("-byte AES key, and ");
        sbU.append(this.b);
        sbU.append("-byte HMAC key)");
        return sbU.toString();
    }
}
