package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class r43 extends b43 implements u22, ln8 {
    public final /* synthetic */ int q;
    public final d56 r;
    public final boolean s;
    public final float t;
    public yr u;
    public final dv1 v;

    public /* synthetic */ r43(d56 d56Var, boolean z, float f, dv1 dv1Var, int i) {
        this.q = i;
        this.r = d56Var;
        this.s = z;
        this.t = f;
        this.v = dv1Var;
    }

    @Override // defpackage.ln8
    public final void d0() {
        switch (this.q) {
            case 0:
                mo7.T(this, new o43(this, 0));
                break;
            default:
                mo7.T(this, new p43(this, 0));
                break;
        }
    }

    @Override // defpackage.q28
    public final void y0() {
        switch (this.q) {
            case 0:
                mo7.T(this, new o43(this, 0));
                break;
            default:
                mo7.T(this, new p43(this, 0));
                break;
        }
    }
}
