package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class ne implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ String b;
    public final /* synthetic */ int c;

    public /* synthetic */ ne(int i, String str) {
        this.a = 7;
        this.c = i;
        this.b = str;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) throws Exception {
        gnb gnbVarB0;
        p6d p6dVar;
        int i = this.a;
        c1e c1eVar = c1e.a;
        String str = this.b;
        int i2 = this.c;
        switch (i) {
            case 0:
                uq2 uq2Var = (uq2) obj;
                uq2Var.getClass();
                eo2 eo2Var = uq2Var.a;
                ys2 ys2Var = (ys2) eo2Var.e;
                vob vobVar = ys2Var.a;
                jx4 jx4Var = new jx4(ys2Var.N());
                ot1 ot1VarD = ys2Var.d();
                n0c n0cVarC = ys2Var.c();
                ko2 ko2Var = eo2Var.b;
                ax2 ax2VarB = ko2Var.b();
                ax2 ax2VarT = ko2Var.t();
                zk2 zk2Var = (zk2) ko2Var.r.get();
                r13 r13Var = xg3.a;
                iq7.s(r13Var);
                return new ze(this.b, this.c, vobVar, jx4Var, ot1VarD, n0cVarC, ax2VarB, ax2VarT, zk2Var, r13Var);
            case 1:
                fr2 fr2Var = (fr2) obj;
                fr2Var.getClass();
                eo2 eo2Var2 = fr2Var.a;
                ys2 ys2Var2 = (ys2) eo2Var2.e;
                vob vobVar2 = ys2Var2.a;
                hf hfVar = new hf(ys2Var2.E());
                nec necVarF = ys2Var2.F();
                mya myaVarD = ys2Var2.D();
                ko2 ko2Var2 = eo2Var2.b;
                ax2 ax2VarW = ko2Var2.w();
                ax2 ax2VarT2 = ko2Var2.t();
                r13 r13Var2 = xg3.a;
                iq7.s(r13Var2);
                return new qf(this.b, this.c, vobVar2, hfVar, necVarF, myaVarD, ax2VarW, ax2VarT2, r13Var2);
            case 2:
                qr2 qr2Var = (qr2) obj;
                qr2Var.getClass();
                eo2 eo2Var3 = qr2Var.a;
                ys2 ys2Var3 = (ys2) eo2Var3.e;
                vob vobVar3 = ys2Var3.a;
                hy4 hy4Var = new hy4(ys2Var3.N());
                kne kneVarO = ys2Var3.O();
                kbe kbeVarM = ys2Var3.M();
                ko2 ko2Var3 = eo2Var3.b;
                s26 s26VarZ = ko2Var3.z();
                ax2 ax2VarT3 = ko2Var3.t();
                zk2 zk2Var2 = (zk2) ko2Var3.r.get();
                r13 r13Var3 = xg3.a;
                iq7.s(r13Var3);
                return new eg(this.b, this.c, vobVar3, hy4Var, kneVarO, kbeVarM, s26VarZ, ax2VarT3, zk2Var2, r13Var3);
            case 3:
                bs2 bs2Var = (bs2) obj;
                bs2Var.getClass();
                eo2 eo2Var4 = bs2Var.a;
                ys2 ys2Var4 = (ys2) eo2Var4.e;
                lg lgVar = new lg((zk2) ys2Var4.b.r.get());
                ot1 ot1VarD2 = ys2Var4.d();
                n0c n0cVarC2 = ys2Var4.c();
                ko2 ko2Var4 = eo2Var4.b;
                return new ug(this.b, this.c, lgVar, ot1VarD2, n0cVarC2, ko2Var4.b(), ko2Var4.t());
            case 4:
                ms2 ms2Var = (ms2) obj;
                ms2Var.getClass();
                eo2 eo2Var5 = ms2Var.a;
                ys2 ys2Var5 = (ys2) eo2Var5.e;
                zg zgVar = new zg((zk2) ys2Var5.b.r.get());
                kne kneVarO2 = ys2Var5.O();
                kbe kbeVarM2 = ys2Var5.M();
                ko2 ko2Var5 = eo2Var5.b;
                return new gh(this.b, this.c, zgVar, kneVarO2, kbeVarM2, ko2Var5.z(), ko2Var5.t());
            case 5:
                anb anbVar = (anb) obj;
                anbVar.getClass();
                gnbVarB0 = anbVar.B0("SELECT * FROM SystemIdInfo WHERE work_spec_id=? AND generation=?");
                try {
                    gnbVarB0.M(1, str);
                    gnbVarB0.c(2, i2);
                    int iY = il7.y(gnbVarB0, "work_spec_id");
                    int iY2 = il7.y(gnbVarB0, "generation");
                    int iY3 = il7.y(gnbVarB0, "system_id");
                    if (gnbVarB0.w0()) {
                        p6dVar = new p6d(gnbVarB0.d0(iY), (int) gnbVarB0.getLong(iY2), (int) gnbVarB0.getLong(iY3));
                        break;
                    } else {
                        p6dVar = null;
                    }
                    return p6dVar;
                } finally {
                }
            case 6:
                anb anbVar2 = (anb) obj;
                anbVar2.getClass();
                gnbVarB0 = anbVar2.B0("UPDATE workspec SET next_schedule_time_override=9223372036854775807 WHERE (id=? AND next_schedule_time_override_generation=?)");
                try {
                    gnbVarB0.M(1, str);
                    gnbVarB0.c(2, i2);
                    gnbVarB0.w0();
                    return c1eVar;
                } finally {
                }
            default:
                anb anbVar3 = (anb) obj;
                anbVar3.getClass();
                gnbVarB0 = anbVar3.B0("UPDATE workspec SET stop_reason=? WHERE id=?");
                try {
                    gnbVarB0.c(1, i2);
                    gnbVarB0.M(2, str);
                    gnbVarB0.w0();
                    return c1eVar;
                } finally {
                }
        }
    }

    public /* synthetic */ ne(String str, int i, int i2) {
        this.a = i2;
        this.b = str;
        this.c = i;
    }
}
