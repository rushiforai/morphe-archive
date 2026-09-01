package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class np5 implements op5 {
    public final j8b a;
    public final String b;
    public final String c;

    public np5(j8b j8bVar) {
        this.a = j8bVar;
        this.b = j8bVar.a;
        this.c = j8bVar.i.a;
    }

    @Override // defpackage.op5
    public final String b() {
        return this.c;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof np5) && this.a.equals(((np5) obj).a);
    }

    @Override // defpackage.op5
    public final String getKey() {
        return this.b;
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "Repost(repostItemUiModel=" + this.a + ")";
    }
}
