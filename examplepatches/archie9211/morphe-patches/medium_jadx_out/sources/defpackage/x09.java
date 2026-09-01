package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class x09 implements y09 {
    public final String a;
    public final String b;
    public final String c;

    public x09(String str, String str2) {
        this.a = str;
        this.b = str2;
        this.c = str2;
    }

    @Override // defpackage.y09
    public final Integer a() {
        return null;
    }

    @Override // defpackage.y09
    public final Integer b() {
        return null;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof x09)) {
            return false;
        }
        x09 x09Var = (x09) obj;
        return this.a.equals(x09Var.a) && this.b.equals(x09Var.b);
    }

    @Override // defpackage.y09
    public final Object getData() {
        return this.c;
    }

    @Override // defpackage.y09
    public final String getParagraphName() {
        return this.a;
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return ev6.y("UploadingUrlImage(paragraphName=", this.a, ", url=", this.b, ")");
    }
}
