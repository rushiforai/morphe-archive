package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class mm2 {
    public final rqa a;
    public final boolean b;

    public mm2(rqa rqaVar, boolean z) {
        this.a = rqaVar;
        this.b = z;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof mm2) {
            mm2 mm2Var = (mm2) obj;
            if (mm2Var.a.equals(this.a) && mm2Var.b == this.b) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return Boolean.valueOf(this.b).hashCode() ^ ((this.a.hashCode() ^ 1000003) * 1000003);
    }
}
