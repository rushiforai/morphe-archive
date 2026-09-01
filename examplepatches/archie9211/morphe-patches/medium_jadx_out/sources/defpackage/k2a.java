package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class k2a implements l78, sb2 {
    public final /* synthetic */ l78 a;
    public final ib2 b;

    public k2a(l78 l78Var, ib2 ib2Var) {
        this.a = l78Var;
        this.b = ib2Var;
    }

    @Override // defpackage.sb2
    public final ib2 Q() {
        return this.b;
    }

    @Override // defpackage.upc
    public final Object getValue() {
        return this.a.getValue();
    }

    @Override // defpackage.l78
    public final void setValue(Object obj) {
        this.a.setValue(obj);
    }
}
