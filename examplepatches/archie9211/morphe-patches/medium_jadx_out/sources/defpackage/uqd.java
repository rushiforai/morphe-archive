package defpackage;

import java.util.LinkedList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class uqd implements e52 {
    public final LinkedList a;
    public volatile tqd b;

    public uqd(tqd tqdVar) {
        tqdVar.getClass();
        this.a = new LinkedList();
        this.b = tqdVar;
    }

    @Override // defpackage.e52
    public final synchronized void a() {
        this.a.clear();
    }

    @Override // defpackage.e52
    public final synchronized void b(b52 b52Var) {
        this.a.remove(b52Var);
    }

    @Override // defpackage.e52
    public final synchronized void c(tqd tqdVar) {
        if (tqdVar == this.b) {
            return;
        }
        tqd tqdVar2 = this.b;
        this.b = tqdVar;
        for (b52 b52Var : this.a) {
            b52Var.getClass();
            tqdVar2.getClass();
            tqd tqdVar3 = tqdVar;
            r40.C(b52Var.d, "Data migration", b52Var.e, new ep0(b52Var, tqdVar2, b52Var.b(tqdVar2), tqdVar3, b52Var.b(tqdVar), 1));
            tqdVar = tqdVar3;
        }
    }

    @Override // defpackage.e52
    public final tqd d() {
        return this.b;
    }

    @Override // defpackage.e52
    public final synchronized void e(b52 b52Var) {
        this.a.add(b52Var);
    }
}
