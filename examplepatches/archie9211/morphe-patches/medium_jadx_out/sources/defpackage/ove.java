package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ove extends tve {
    public final String a;
    public final long b;
    public final List c;
    public final boolean d;
    public final boolean e;
    public final boolean f;
    public final pve g;

    public ove(String str, long j, List list, boolean z, boolean z2, boolean z3, pve pveVar) {
        this.a = str;
        this.b = j;
        this.c = list;
        this.d = z;
        this.e = z2;
        this.f = z3;
        this.g = pveVar;
    }

    @Override // defpackage.tve
    public final String a() {
        return this.a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ove)) {
            return false;
        }
        ove oveVar = (ove) obj;
        return this.a.equals(oveVar.a) && this.b == oveVar.b && this.c.equals(oveVar.c) && this.d == oveVar.d && this.e == oveVar.e && this.f == oveVar.f && this.g.equals(oveVar.g);
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        long j = this.b;
        return this.g.hashCode() + ((((((wgd.p((iHashCode + ((int) (j ^ (j >>> 32)))) * 31, 31, this.c) + (this.d ? 1231 : 1237)) * 31) + (this.e ? 1231 : 1237)) * 31) + (this.f ? 1231 : 1237)) * 31);
    }

    public final String toString() {
        StringBuilder sbI = ho2.I(this.b, "Content(source=", this.a, ", responsesCount=");
        sbI.append(", uiModels=");
        sbI.append(this.c);
        sbI.append(", isLocked=");
        sbI.append(this.d);
        sbI.append(", canLock=");
        sbI.append(this.e);
        sbI.append(", canHide=");
        sbI.append(this.f);
        sbI.append(", currentUser=");
        sbI.append(this.g);
        sbI.append(")");
        return sbI.toString();
    }
}
