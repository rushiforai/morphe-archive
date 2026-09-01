package defpackage;

import java.util.concurrent.Executor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class l7f implements g8a {
    public final g8a a;
    public final g8a b;
    public final arb c;
    public final g8a d;

    public l7f(g8a g8aVar, g8a g8aVar2, arb arbVar, g8a g8aVar3) {
        this.a = g8aVar;
        this.b = g8aVar2;
        this.c = arbVar;
        this.d = g8aVar3;
    }

    @Override // defpackage.g8a
    public final Object get() {
        return new o2b((Executor) this.a.get(), (fnb) this.b.get(), (ku3) this.c.get(), (fnb) this.d.get(), 16);
    }
}
