package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class s94 extends ufd {
    public final /* synthetic */ jmb e;
    public final /* synthetic */ t94 f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public s94(String str, jmb jmbVar, t94 t94Var) {
        super(str, true);
        this.e = jmbVar;
        this.f = t94Var;
    }

    @Override // defpackage.ufd
    public final long a() throws InterruptedException {
        imb imbVar;
        jmb jmbVar = this.e;
        try {
            imbVar = jmbVar.d();
        } catch (Throwable th) {
            imbVar = new imb(jmbVar, th, 2);
        }
        t94 t94Var = this.f;
        if (!t94Var.d.contains(jmbVar)) {
            return -1L;
        }
        t94Var.e.put(imbVar);
        return -1L;
    }
}
