package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class prd {
    public final mx a;
    public final yqa b;

    public prd(mx mxVar, yqa yqaVar) {
        this.a = mxVar;
        this.b = yqaVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof prd)) {
            return false;
        }
        prd prdVar = (prd) obj;
        return g76.L(this.a, prdVar.a) && this.b.equals(prdVar.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "TransformedText(text=" + ((Object) this.a) + ", offsetMapping=" + this.b + ')';
    }
}
