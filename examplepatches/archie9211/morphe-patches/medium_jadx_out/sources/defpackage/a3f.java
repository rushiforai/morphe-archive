package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class a3f implements c3f {
    public final lt1 a;

    public a3f(lt1 lt1Var) {
        this.a = lt1Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof a3f) && this.a.equals(((a3f) obj).a);
    }

    @Override // defpackage.c3f
    public final String getId() {
        return this.a.a;
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "Publication(collectionUiModel=" + this.a + ")";
    }
}
