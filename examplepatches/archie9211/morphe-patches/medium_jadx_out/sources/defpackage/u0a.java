package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class u0a implements xzb {
    public final String a;
    public final r0a b;

    public u0a(String str, r0a r0aVar) {
        r0aVar.getClass();
        this.a = str;
        this.b = r0aVar;
    }

    @Override // defpackage.xzb
    public final String a() {
        return this.a;
    }

    @Override // defpackage.xzb
    public final boolean c() {
        return false;
    }

    @Override // defpackage.xzb
    public final int d(String str) {
        str.getClass();
        throw new IllegalStateException("Primitive descriptor does not have elements");
    }

    @Override // defpackage.xzb
    public final int e() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof u0a)) {
            return false;
        }
        u0a u0aVar = (u0a) obj;
        return this.a.equals(u0aVar.a) && g76.L(this.b, u0aVar.b);
    }

    @Override // defpackage.xzb
    public final String f(int i) {
        throw new IllegalStateException("Primitive descriptor does not have elements");
    }

    @Override // defpackage.xzb
    public final List g(int i) {
        throw new IllegalStateException("Primitive descriptor does not have elements");
    }

    @Override // defpackage.xzb
    public final List getAnnotations() {
        return ey3.a;
    }

    @Override // defpackage.xzb
    public final xzb h(int i) {
        throw new IllegalStateException("Primitive descriptor does not have elements");
    }

    public final int hashCode() {
        return (this.b.hashCode() * 31) + this.a.hashCode();
    }

    @Override // defpackage.xzb
    public final boolean isInline() {
        return false;
    }

    @Override // defpackage.xzb
    public final mo7 j() {
        return this.b;
    }

    public final String toString() {
        return ev6.z(new StringBuilder("PrimitiveDescriptor("), this.a, ')');
    }
}
