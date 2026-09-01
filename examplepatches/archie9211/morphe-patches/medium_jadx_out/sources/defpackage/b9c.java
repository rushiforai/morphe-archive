package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class b9c implements e9c {
    public final String a;
    public final b24 b;

    public b9c(String str, b24 b24Var) {
        this.a = str;
        this.b = b24Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof b9c)) {
            return false;
        }
        b9c b9cVar = (b9c) obj;
        return this.a.equals(b9cVar.a) && this.b.equals(b9cVar.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "MuteAuthorFailed(authorId=" + this.a + ", errorState=" + this.b + ")";
    }
}
