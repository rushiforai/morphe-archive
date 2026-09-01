package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gia {
    public final String a;
    public final bo4 b;

    public gia(String str, bo4 bo4Var) {
        this.a = str;
        this.b = bo4Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof gia)) {
            return false;
        }
        gia giaVar = (gia) obj;
        return this.a.equals(giaVar.a) && this.b.equals(giaVar.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "Newsletter(id=" + this.a + ", isSubscribedToPublicationNewsletterStream=" + this.b + ")";
    }
}
