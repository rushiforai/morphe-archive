package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jmf extends bof {
    public final qw3 n;
    public final String o;

    public jmf(qw3 qw3Var, String str) {
        super(2);
        this.n = qw3Var;
        vp7.o(qw3Var.a, "email cannot be null");
        vp7.o(qw3Var.b, "password cannot be null");
        this.o = str;
    }

    @Override // defpackage.bof
    public final String a() {
        return "linkEmailAuthCredential";
    }

    @Override // defpackage.bof
    public final void c(wfd wfdVar, hnf hnfVar) {
        this.g = new d2f(this, 8, wfdVar);
        qw3 qw3Var = this.n;
        String str = qw3Var.a;
        String str2 = qw3Var.b;
        vp7.n(str2);
        String strE = this.d.a.e();
        String strD = this.d.d();
        hnfVar.getClass();
        vp7.n(str);
        vp7.n(str2);
        vp7.n(strE);
        ujf ujfVar = this.b;
        vp7.p(ujfVar);
        ujf ujfVar2 = hnfVar.a;
        zjf zjfVar = new zjf(ujfVar, hnf.b);
        vp7.n(str);
        vp7.n(str2);
        vp7.n(strE);
        ing ingVar = new ing();
        ingVar.a = str;
        ingVar.b = str2;
        ingVar.c = strD;
        ingVar.d = this.o;
        ingVar.e = zjfVar;
        ingVar.f = ujfVar2;
        ujfVar2.p(strE, ingVar);
    }

    @Override // defpackage.bof
    public final void e() {
        xmf xmfVarZ0 = d2f.z0(this.c, this.i);
        this.e.a(this.h, xmfVarZ0);
        f(new ctg(xmfVarZ0));
    }
}
