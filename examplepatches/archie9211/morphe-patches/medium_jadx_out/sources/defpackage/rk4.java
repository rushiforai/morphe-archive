package defpackage;

import android.content.Context;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rk4 implements e8a {
    public final /* synthetic */ int a;
    public final v0c b;
    public final e8a c;

    public rk4(e8a e8aVar, v0c v0cVar) {
        this.a = 2;
        this.c = e8aVar;
        this.b = v0cVar;
    }

    @Override // defpackage.g8a
    public final Object get() {
        int i = this.a;
        v0c v0cVar = this.b;
        e8a e8aVar = this.c;
        switch (i) {
            case 0:
                Context context = (Context) v0cVar.b;
                ib2 ib2Var = (ib2) e8aVar.get();
                context.getClass();
                ib2Var.getClass();
                return mk0.a(y3b.j, new yl3(new iz2(28)), o7f.c(ib2Var), new nc0(context, 2));
            case 1:
                return new v1a((Context) v0cVar.b, (upe) e8aVar.get());
            default:
                return new b4b((w60) e8aVar.get(), (ib2) v0cVar.b);
        }
    }

    public /* synthetic */ rk4(v0c v0cVar, e8a e8aVar, int i) {
        this.a = i;
        this.b = v0cVar;
        this.c = e8aVar;
    }
}
