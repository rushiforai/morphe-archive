package defpackage;

import java.util.concurrent.Executor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class h0g implements tig, kr8, br8, kq8 {
    public final /* synthetic */ int a;
    public final Executor b;
    public final o92 c;
    public final jrg d;

    public /* synthetic */ h0g(Executor executor, o92 o92Var, jrg jrgVar, int i) {
        this.a = i;
        this.b = executor;
        this.c = o92Var;
        this.d = jrgVar;
    }

    @Override // defpackage.kq8
    public void a() {
        this.d.p();
    }

    @Override // defpackage.tig
    public final void b(jrg jrgVar) {
        switch (this.a) {
            case 0:
                this.b.execute(new p0g(this, jrgVar, false, 21));
                break;
            default:
                this.b.execute(new p0g(this, jrgVar, false, 22));
                break;
        }
    }

    @Override // defpackage.kr8
    public void i(Object obj) {
        this.d.m(obj);
    }

    @Override // defpackage.br8
    public void onFailure(Exception exc) {
        this.d.o(exc);
    }
}
