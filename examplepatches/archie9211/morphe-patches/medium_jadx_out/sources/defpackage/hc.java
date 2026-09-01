package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hc {
    public final String a;
    public final bhc b;

    public hc(String str, bhc bhcVar) {
        bhcVar.getClass();
        this.a = str;
        this.b = bhcVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof hc)) {
            return false;
        }
        hc hcVar = (hc) obj;
        return g76.L(this.a, hcVar.a) && this.b == hcVar.b;
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "ShowMessage(message=" + this.a + ", duration=" + this.b + ")";
    }

    public /* synthetic */ hc(String str) {
        this(str, bhc.Short);
    }
}
