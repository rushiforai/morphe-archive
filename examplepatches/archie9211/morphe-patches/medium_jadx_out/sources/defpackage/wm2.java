package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class wm2 implements f8a {
    public final ko2 a;
    public final xm2 b;
    public final int c;

    public wm2(ko2 ko2Var, xm2 xm2Var, int i) {
        this.a = ko2Var;
        this.b = xm2Var;
        this.c = i;
    }

    @Override // defpackage.g8a
    public final Object get() {
        xm2 xm2Var = this.b;
        ko2 ko2Var = xm2Var.b;
        int i = this.c;
        if (i == 0) {
            return new o41();
        }
        if (i != 1) {
            if (i == 2) {
                return new vm2(this);
            }
            throw new AssertionError(i);
        }
        ko2 ko2Var2 = this.a;
        n32 n32Var = (n32) ko2Var2.q.get();
        pu7 pu7Var = (pu7) ko2Var2.w.get();
        bud budVar = (bud) ko2Var2.F.get();
        mya myaVarA = ko2Var2.A();
        hha hhaVar = new hha(new oo1((zk2) ko2Var.r.get(), 2));
        og3 og3VarF = ko2Var2.f();
        hx4 hx4VarH = ko2Var2.h();
        f88 f88Var = new f88(xm2Var.d(), ko2Var.z());
        mya myaVar = new mya(xm2Var.d(), 17, ko2Var.z());
        gg5 gg5Var = new gg5(new kla((e00) ko2Var.p.get()), 17, ko2Var.b());
        a1a a1aVar = new a1a(new kla((e00) ko2Var.p.get()), 21, ko2Var.b());
        a1a a1aVar2 = new a1a((zk2) ko2Var.r.get(), xm2Var.d());
        oxe oxeVar = new oxe(new kla((e00) ko2Var.p.get()));
        o8c o8cVar = new o8c((zpa) ko2Var.z.get(), new sh2(ko2Var.a.a, 1));
        pkf pkfVar = new pkf((zpa) ko2Var.z.get());
        zxc zxcVarB = xm2Var.b();
        yo8 yo8VarN = ko2Var2.n();
        cr0 cr0Var = (cr0) ko2Var2.I.get();
        og3 og3VarD = ko2Var2.d();
        o2b o2bVar = new o2b(new t5e(new hb((e00) ko2Var.p.get()), (pu7) ko2Var.w.get()), new sh2(ko2Var.a.a, 1), (pu7) ko2Var.w.get(), ko2Var.a.a);
        hx4 hx4Var = new hx4(new qcf((e00) ko2Var.p.get(), (zk2) ko2Var.r.get()), (vr7) ko2Var.f.get());
        vr7 vr7Var = (vr7) ko2Var2.f.get();
        r13 r13Var = xg3.a;
        iq7.s(r13Var);
        return new sg7(n32Var, pu7Var, budVar, myaVarA, hhaVar, og3VarF, hx4VarH, f88Var, myaVar, gg5Var, a1aVar, a1aVar2, oxeVar, o8cVar, pkfVar, zxcVarB, yo8VarN, cr0Var, og3VarD, o2bVar, hx4Var, vr7Var, r13Var, new cx2(ko2Var2.x()));
    }
}
