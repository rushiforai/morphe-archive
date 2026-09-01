package defpackage;

import java.util.concurrent.atomic.AtomicReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class e15 extends h15 {
    public final /* synthetic */ pkf a;
    public final /* synthetic */ AtomicReference b;
    public final /* synthetic */ f7 c;
    public final /* synthetic */ d7 d;
    public final /* synthetic */ j15 e;

    public e15(j15 j15Var, pkf pkfVar, AtomicReference atomicReference, f7 f7Var, d7 d7Var) {
        this.e = j15Var;
        this.a = pkfVar;
        this.b = atomicReference;
        this.c = f7Var;
        this.d = d7Var;
    }

    @Override // defpackage.h15
    public final void a() {
        StringBuilder sb = new StringBuilder("fragment_");
        j15 j15Var = this.e;
        sb.append(j15Var.e);
        sb.append("_rq#");
        sb.append(j15Var.X.getAndIncrement());
        String string = sb.toString();
        j15 j15Var2 = (j15) this.a.a;
        l15 l15Var = j15Var2.t;
        this.b.set((l15Var != null ? l15Var.z.getActivityResultRegistry() : j15Var2.Q().getActivityResultRegistry()).d(string, j15Var, this.c, this.d));
    }
}
