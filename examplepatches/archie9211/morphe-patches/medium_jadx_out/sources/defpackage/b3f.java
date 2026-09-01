package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class b3f implements c3f {
    public final hne a;

    public b3f(hne hneVar) {
        this.a = hneVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof b3f) && this.a.equals(((b3f) obj).a);
    }

    @Override // defpackage.c3f
    public final String getId() {
        return this.a.a;
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "Writer(userUiModel=" + this.a + ")";
    }
}
