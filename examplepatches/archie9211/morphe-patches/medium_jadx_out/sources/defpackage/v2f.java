package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class v2f implements x2f {
    public final lt1 a;
    public final String b;

    public v2f(lt1 lt1Var) {
        this.a = lt1Var;
        this.b = lt1Var.a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof v2f) && this.a.equals(((v2f) obj).a);
    }

    @Override // defpackage.x2f
    public final String getId() {
        return this.b;
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "Publication(publication=" + this.a + ")";
    }
}
