package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class ye3 extends y73 {
    public int m;

    public ye3(m3f m3fVar) {
        super(m3fVar);
        if (m3fVar instanceof pr5) {
            this.e = x73.HORIZONTAL_DIMENSION;
        } else {
            this.e = x73.VERTICAL_DIMENSION;
        }
    }

    @Override // defpackage.y73
    public final void d(int i) {
        if (this.j) {
            return;
        }
        this.j = true;
        this.g = i;
        for (t73 t73Var : this.k) {
            t73Var.a(t73Var);
        }
    }
}
