package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class qve extends tve {
    public final String a;
    public final boolean b;
    public final boolean c;
    public final boolean d;
    public final pve e;

    public qve(String str, boolean z, boolean z2, boolean z3, pve pveVar) {
        this.a = str;
        this.b = z;
        this.c = z2;
        this.d = z3;
        this.e = pveVar;
    }

    @Override // defpackage.tve
    public final String a() {
        return this.a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof qve)) {
            return false;
        }
        qve qveVar = (qve) obj;
        return this.a.equals(qveVar.a) && this.b == qveVar.b && this.c == qveVar.c && this.d == qveVar.d && this.e.equals(qveVar.e);
    }

    public final int hashCode() {
        return this.e.hashCode() + (((((((this.a.hashCode() * 31) + (this.b ? 1231 : 1237)) * 31) + (this.c ? 1231 : 1237)) * 31) + (this.d ? 1231 : 1237)) * 31);
    }

    public final String toString() {
        StringBuilder sbD = ev6.D("Empty(source=", this.a, ", isLocked=", ", canLock=", this.b);
        ho2.R(sbD, this.c, ", canHide=", this.d, ", currentUser=");
        sbD.append(this.e);
        sbD.append(")");
        return sbD.toString();
    }
}
