package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class db2 extends b43 implements xxb {
    public prd q;
    public uid r;
    public kx6 s;
    public boolean t;
    public yqa u;
    public lid v;
    public ry5 w;
    public sr4 x;

    public static void L0(kx6 kx6Var, String str, boolean z) {
        if (z) {
            ejd ejdVar = kx6Var.e;
            qa2 qa2Var = kx6Var.v;
            if (ejdVar == null) {
                int length = str.length();
                qa2Var.invoke(new uid(str, 4, lk7.q(length, length)));
            } else {
                uid uidVarN = kx6Var.d.n(d46.R(new t43(), new ax1(str, 1)));
                ejdVar.a(null, uidVarN);
                qa2Var.invoke(uidVarN);
            }
        }
    }

    @Override // defpackage.xxb
    public final boolean I() {
        return false;
    }

    @Override // defpackage.xxb
    public final boolean i() {
        return true;
    }

    @Override // defpackage.xxb
    public final void r0(jyb jybVar) {
        mx mxVar = this.r.a;
        fj6[] fj6VarArr = gyb.a;
        iyb iybVar = eyb.F;
        fj6[] fj6VarArr2 = gyb.a;
        fj6 fj6Var = fj6VarArr2[18];
        jybVar.d(iybVar, mxVar);
        mx mxVar2 = this.q.a;
        iyb iybVar2 = eyb.G;
        fj6 fj6Var2 = fj6VarArr2[19];
        jybVar.d(iybVar2, mxVar2);
        long j = this.r.b;
        iyb iybVar3 = eyb.H;
        fj6 fj6Var3 = fj6VarArr2[20];
        jybVar.d(iybVar3, new bkd(j));
        no noVar = tz7.f;
        iyb iybVar4 = eyb.s;
        fj6 fj6Var4 = fj6VarArr2[9];
        jybVar.d(iybVar4, noVar);
        jp jpVarQ = epe.q(this.r.a);
        if (jpVarQ != null) {
            iyb iybVar5 = eyb.t;
            fj6 fj6Var5 = fj6VarArr2[10];
            jybVar.d(iybVar5, jpVarQ);
        }
        jybVar.d(sxb.h, new i4(null, new cb2(this, 0)));
        int i = this.w.d;
        if (i == 6) {
            z82.a.getClass();
            gyb.c(jybVar, y82.c);
        } else if (i == 7 || i == 8) {
            z82.a.getClass();
            gyb.c(jybVar, y82.b);
        } else if (i == 4) {
            z82.a.getClass();
            gyb.c(jybVar, y82.e);
        }
        if (!this.t) {
            jybVar.d(eyb.j, c1e.a);
        }
        boolean z = this.t;
        iyb iybVar6 = eyb.O;
        fj6 fj6Var6 = fj6VarArr2[28];
        jybVar.d(iybVar6, Boolean.valueOf(z));
        gyb.a(jybVar, new cb2(this, 1));
        int i2 = 2;
        if (z) {
            jybVar.d(sxb.k, new i4(null, new cb2(this, i2)));
            jybVar.d(sxb.o, new i4(null, new cb2(this, jybVar)));
        }
        jybVar.d(sxb.j, new i4(null, new so1(8, this)));
        int i3 = this.w.e;
        bb2 bb2Var = new bb2(this, 6);
        jybVar.d(eyb.I, new qy5(i3));
        jybVar.d(sxb.p, new i4(null, bb2Var));
        jybVar.d(sxb.b, new i4(null, new bb2(this, 7)));
        jybVar.d(sxb.c, new i4(null, new bb2(this, 1)));
        if (!bkd.c(this.r.b)) {
            jybVar.d(sxb.q, new i4(null, new bb2(this, 2)));
            if (this.t) {
                jybVar.d(sxb.r, new i4(null, new bb2(this, 3)));
            }
        }
        if (this.t) {
            jybVar.d(sxb.s, new i4(null, new bb2(this, 5)));
        }
    }

    @Override // defpackage.xxb
    public final boolean s0() {
        return true;
    }
}
