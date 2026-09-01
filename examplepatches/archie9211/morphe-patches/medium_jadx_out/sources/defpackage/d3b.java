package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class d3b extends fp7 {
    public final fp7 h;
    public final int i;

    public d3b(fp7 fp7Var, int i) {
        this.h = fp7Var;
        this.i = i;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof d3b)) {
            return false;
        }
        d3b d3bVar = (d3b) obj;
        return d3bVar.h.equals(this.h) && d3bVar.i == this.i;
    }

    public final int hashCode() {
        return this.h.hashCode() + (this.i * 31);
    }
}
