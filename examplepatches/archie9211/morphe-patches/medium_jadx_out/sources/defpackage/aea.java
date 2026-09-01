package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class aea implements m45 {
    public final /* synthetic */ lr4 a;
    public final /* synthetic */ akc b;
    public final /* synthetic */ m45 c;
    public final /* synthetic */ sr4 d;
    public final /* synthetic */ l78 e;
    public final /* synthetic */ l78 f;

    public aea(lr4 lr4Var, akc akcVar, m45 m45Var, sr4 sr4Var, l78 l78Var, l78 l78Var2) {
        this.a = lr4Var;
        this.b = akcVar;
        this.c = m45Var;
        this.d = sr4Var;
        this.e = l78Var;
        this.f = l78Var2;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        if (((Boolean) this.e.getValue()).booleanValue() || ((Boolean) this.f.getValue()).booleanValue()) {
            km4.m(this.a);
            akc akcVar = this.b;
            if (akcVar != null) {
                ((n43) akcVar).a();
            }
            this.c.invoke();
        } else {
            sr4.a(this.d);
        }
        return c1e.a;
    }
}
