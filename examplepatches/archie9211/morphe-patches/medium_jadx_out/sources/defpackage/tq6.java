package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tq6 extends q28 implements m49 {
    public float o;
    public boolean p;

    @Override // defpackage.m49
    public final Object v(m73 m73Var, Object obj) {
        mmb mmbVar = obj instanceof mmb ? (mmb) obj : null;
        if (mmbVar == null) {
            mmbVar = new mmb();
        }
        mmbVar.a = this.o;
        mmbVar.b = this.p;
        return mmbVar;
    }
}
