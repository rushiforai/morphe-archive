package defpackage;

import android.content.Context;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sk4 implements e8a {
    public final /* synthetic */ int a = 1;
    public final e8a b;
    public final e8a c;
    public final e8a d;

    public sk4(e8a e8aVar, e8a e8aVar2, e8a e8aVar3) {
        this.b = e8aVar;
        this.c = e8aVar2;
        this.d = e8aVar3;
    }

    @Override // defpackage.g8a
    public final Object get() {
        int i = this.a;
        e8a e8aVar = this.d;
        e8a e8aVar2 = this.c;
        e8a e8aVar3 = this.b;
        switch (i) {
            case 0:
                Context context = (Context) ((v0c) e8aVar).b;
                ib2 ib2Var = (ib2) e8aVar3.get();
                u0c u0cVar = (u0c) e8aVar2.get();
                context.getClass();
                ib2Var.getClass();
                u0cVar.getClass();
                return mk0.a(u0cVar, new yl3(new ff4(4, u0cVar)), o7f.c(ib2Var), new nc0(context, 3));
            default:
                return new b2c((ib2) e8aVar3.get(), (bmd) e8aVar2.get(), (tt2) e8aVar.get());
        }
    }

    public sk4(v0c v0cVar, e8a e8aVar, e8a e8aVar2) {
        this.d = v0cVar;
        this.b = e8aVar;
        this.c = e8aVar2;
    }
}
