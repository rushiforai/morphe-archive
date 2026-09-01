package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class uf4 implements y74 {
    @Override // defpackage.y74
    public final w74 a() {
        return w74.BOTH;
    }

    @Override // defpackage.y74
    public final x74 b(c41 c41Var, c41 c41Var2, y28 y28Var) {
        c41Var.getClass();
        c41Var2.getClass();
        if (!(c41Var2 instanceof q4a) || !(c41Var instanceof q4a)) {
            return x74.UNKNOWN;
        }
        q4a q4aVar = (q4a) c41Var2;
        q4a q4aVar2 = (q4a) c41Var;
        return !g76.L(q4aVar.getName(), q4aVar2.getName()) ? x74.UNKNOWN : (sgg.P(q4aVar) && sgg.P(q4aVar2)) ? x74.OVERRIDABLE : (sgg.P(q4aVar) || sgg.P(q4aVar2)) ? x74.INCOMPATIBLE : x74.UNKNOWN;
    }
}
