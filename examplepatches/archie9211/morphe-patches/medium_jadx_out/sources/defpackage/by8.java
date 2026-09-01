package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class by8 implements ym1 {
    public final Class a;

    public by8(Class cls) {
        cls.getClass();
        this.a = cls;
    }

    @Override // defpackage.ym1
    public final Class e() {
        return this.a;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof by8) {
            return g76.L(this.a, ((by8) obj).a);
        }
        return false;
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return this.a.toString() + " (Kotlin reflection is not available)";
    }
}
