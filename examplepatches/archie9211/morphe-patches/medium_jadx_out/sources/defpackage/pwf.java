package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pwf extends jwf {
    public final baa a;

    public pwf(baa baaVar) {
        this.a = baaVar;
    }

    @Override // defpackage.jwf
    public final Object a() {
        return this.a;
    }

    @Override // defpackage.jwf
    public final boolean b() {
        return true;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof pwf) {
            return this.a.equals(((pwf) obj).a);
        }
        return false;
    }

    public final int hashCode() {
        return this.a.hashCode() + 1502476572;
    }

    public final String toString() {
        return ev6.x("Optional.of(", this.a.toString(), ")");
    }
}
