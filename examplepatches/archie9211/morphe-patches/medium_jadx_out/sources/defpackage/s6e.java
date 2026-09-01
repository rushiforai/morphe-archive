package defpackage;

import android.content.Context;
import java.util.concurrent.Executor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class s6e implements g8a {
    public final g8a a;
    public final g8a b;
    public final g8a c;
    public final arb d;
    public final g8a e;
    public final g8a f;
    public final g8a g;

    public s6e(g8a g8aVar, g8a g8aVar2, g8a g8aVar3, arb arbVar, g8a g8aVar4, g8a g8aVar5, g8a g8aVar6) {
        this.a = g8aVar;
        this.b = g8aVar2;
        this.c = g8aVar3;
        this.d = arbVar;
        this.e = g8aVar4;
        this.f = g8aVar5;
        this.g = g8aVar6;
    }

    @Override // defpackage.g8a
    public final Object get() {
        Context context = (Context) this.a.get();
        pz7 pz7Var = (pz7) this.b.get();
        fnb fnbVar = (fnb) this.c.get();
        ku3 ku3Var = (ku3) this.d.get();
        Executor executor = (Executor) this.e.get();
        fnb fnbVar2 = (fnb) this.f.get();
        tz7 tz7Var = new tz7(25, false);
        uob uobVar = new uob(24);
        fnb fnbVar3 = (fnb) this.g.get();
        sj0 sj0Var = new sj0();
        sj0Var.a = context;
        sj0Var.b = pz7Var;
        sj0Var.c = fnbVar;
        sj0Var.d = ku3Var;
        sj0Var.e = executor;
        sj0Var.f = fnbVar2;
        sj0Var.g = tz7Var;
        sj0Var.h = uobVar;
        sj0Var.i = fnbVar3;
        return sj0Var;
    }
}
