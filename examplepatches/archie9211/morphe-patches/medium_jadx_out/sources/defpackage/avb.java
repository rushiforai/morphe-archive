package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class avb {
    public final atb a;
    public final zub b;

    public avb(atb atbVar, zub zubVar) {
        this.a = atbVar;
        this.b = zubVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof avb)) {
            return false;
        }
        avb avbVar = (avb) obj;
        return this.a.equals(avbVar.a) && this.b.equals(avbVar.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "ViewState(searchBarState=" + this.a + ", content=" + this.b + ")";
    }
}
