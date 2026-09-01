package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class i8d {
    public final String a;
    public final String b;
    public final int c;
    public final String d;

    public i8d(int i, String str, String str2, String str3) {
        this.a = str;
        this.b = str2;
        this.c = i;
        this.d = str3;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof i8d)) {
            return false;
        }
        i8d i8dVar = (i8d) obj;
        return this.a.equals(i8dVar.a) && this.b.equals(i8dVar.b) && this.c == i8dVar.c && this.d.equals(i8dVar.d);
    }

    public final int hashCode() {
        return this.d.hashCode() + ((wgd.o(this.a.hashCode() * 31, 31, this.b) + this.c) * 31);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("TagDirectoryTagUiModel(tagSlug=", this.a, ", tagName=", this.b, ", tagDepth=");
        sbU.append(this.c);
        sbU.append(", source=");
        sbU.append(this.d);
        sbU.append(")");
        return sbU.toString();
    }
}
