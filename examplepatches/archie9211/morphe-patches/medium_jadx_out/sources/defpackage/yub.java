package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yub implements zub {
    public final iub a;
    public final bo4 b;
    public final String c;

    public yub(iub iubVar, zz zzVar, String str) {
        iubVar.getClass();
        zzVar.getClass();
        str.getClass();
        this.a = iubVar;
        this.b = zzVar;
        this.c = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof yub)) {
            return false;
        }
        yub yubVar = (yub) obj;
        return this.a == yubVar.a && this.b.equals(yubVar.b) && g76.L(this.c, yubVar.c);
    }

    public final int hashCode() {
        return this.c.hashCode() + ka1.a(this.b, this.a.hashCode() * 31, 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Results(currentTab=");
        sb.append(this.a);
        sb.append(", queryStream=");
        sb.append(this.b);
        sb.append(", referrerSource=");
        return ka1.v(sb, this.c, ")");
    }
}
