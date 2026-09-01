package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class w2f implements x2f {
    public final hne a;
    public final String b;

    public w2f(hne hneVar) {
        this.a = hneVar;
        this.b = hneVar.a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof w2f) && this.a.equals(((w2f) obj).a);
    }

    @Override // defpackage.x2f
    public final String getId() {
        return this.b;
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "User(user=" + this.a + ")";
    }
}
