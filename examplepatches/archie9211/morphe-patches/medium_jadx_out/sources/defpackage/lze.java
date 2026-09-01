package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lze implements qze {
    public final String a;
    public final boolean b;
    public final String c;

    public lze(String str, boolean z, String str2) {
        str.getClass();
        this.a = str;
        this.b = z;
        this.c = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof lze)) {
            return false;
        }
        lze lzeVar = (lze) obj;
        return g76.L(this.a, lzeVar.a) && this.b == lzeVar.b && this.c.equals(lzeVar.c);
    }

    public final int hashCode() {
        return this.c.hashCode() + (((this.a.hashCode() * 31) + (this.b ? 1231 : 1237)) * 31);
    }

    public final String toString() {
        return ka1.v(ev6.D("ToggleBlockAuthor(authorId=", this.a, ", isBlocked=", ", source=", this.b), this.c, ")");
    }
}
