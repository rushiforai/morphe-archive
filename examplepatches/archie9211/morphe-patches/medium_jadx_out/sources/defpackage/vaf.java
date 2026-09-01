package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class vaf {
    public final paf a;
    public final uaf b;

    public vaf(paf pafVar, uaf uafVar) {
        pafVar.getClass();
        this.a = pafVar;
        this.b = uafVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof vaf)) {
            return false;
        }
        vaf vafVar = (vaf) obj;
        return this.a == vafVar.a && this.b.equals(vafVar.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "ViewState(selectedPostType=" + this.a + ", postsState=" + this.b + ")";
    }
}
