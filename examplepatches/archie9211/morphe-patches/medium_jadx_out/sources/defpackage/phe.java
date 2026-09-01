package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class phe implements whe {
    public final String a;
    public final boolean b;
    public final uhe c;
    public final SourceParameter d;

    public phe(String str, boolean z, uhe uheVar, SourceParameter sourceParameter) {
        uheVar.getClass();
        sourceParameter.getClass();
        this.a = str;
        this.b = z;
        this.c = uheVar;
        this.d = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof phe)) {
            return false;
        }
        phe pheVar = (phe) obj;
        return g76.L(this.a, pheVar.a) && this.b == pheVar.b && g76.L(this.c, pheVar.c) && g76.L(this.d, pheVar.d);
    }

    public final int hashCode() {
        String str = this.a;
        return this.d.hashCode() + ((this.c.hashCode() + ((((str == null ? 0 : str.hashCode()) * 31) + (this.b ? 1231 : 1237)) * 31)) * 31);
    }

    public final String toString() {
        StringBuilder sbD = ev6.D("Empty(userName=", this.a, ", isCurrentUser=", ", featuredBookState=", this.b);
        sbD.append(this.c);
        sbD.append(", sourceParameter=");
        sbD.append(this.d);
        sbD.append(")");
        return sbD.toString();
    }
}
