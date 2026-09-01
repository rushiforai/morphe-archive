package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class bz5 implements iwa {
    public final y28 a;

    public bz5(y28 y28Var) {
        this.a = y28Var;
    }

    public final boolean equals(Object obj) {
        bz5 bz5Var = obj instanceof bz5 ? (bz5) obj : null;
        return this.a.equals(bz5Var != null ? bz5Var.a : null);
    }

    @Override // defpackage.iwa
    public final mn6 getType() {
        hec hecVarT = this.a.T();
        hecVarT.getClass();
        return hecVarT;
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Class{");
        hec hecVarT = this.a.T();
        hecVarT.getClass();
        sb.append(hecVarT);
        sb.append('}');
        return sb.toString();
    }
}
