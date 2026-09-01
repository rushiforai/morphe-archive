package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ogd {
    public final mx a;
    public mx b;
    public boolean c = false;
    public i58 d = null;

    public ogd(mx mxVar, mx mxVar2) {
        this.a = mxVar;
        this.b = mxVar2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ogd)) {
            return false;
        }
        ogd ogdVar = (ogd) obj;
        return g76.L(this.a, ogdVar.a) && g76.L(this.b, ogdVar.b) && this.c == ogdVar.c && g76.L(this.d, ogdVar.d);
    }

    public final int hashCode() {
        int iHashCode = (((this.b.hashCode() + (this.a.hashCode() * 31)) * 31) + (this.c ? 1231 : 1237)) * 31;
        i58 i58Var = this.d;
        return iHashCode + (i58Var == null ? 0 : i58Var.hashCode());
    }

    public final String toString() {
        return "TextSubstitutionValue(original=" + ((Object) this.a) + ", substitution=" + ((Object) this.b) + ", isShowingSubstitution=" + this.c + ", layoutCache=" + this.d + ')';
    }
}
