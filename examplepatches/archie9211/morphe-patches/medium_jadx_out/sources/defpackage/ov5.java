package defpackage;

import com.medium.android.admin.stagebranch.uG.peNPu;
import com.medium.android.common.ui.Ezz.Plbho;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class ov5 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ String b;

    public /* synthetic */ ov5(String str, int i) {
        this.a = i;
        this.b = str;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // defpackage.x45
    public final Object invoke(Object obj) throws Exception {
        gnb gnbVarB0;
        int i = this.a;
        String str = Plbho.AoPPySWeaUMZj;
        boolean z = false;
        c1e c1eVar = c1e.a;
        String str2 = this.b;
        switch (i) {
            case 0:
                jyb jybVar = (jyb) obj;
                gyb.b(jybVar, str2);
                gyb.g(jybVar, 5);
                return c1eVar;
            case 1:
                jyb jybVar2 = (jyb) obj;
                gyb.b(jybVar2, str2);
                gyb.g(jybVar2, 5);
                return c1eVar;
            case 2:
                jyb jybVar3 = (jyb) obj;
                gyb.b(jybVar3, str2);
                gyb.g(jybVar3, 5);
                return c1eVar;
            case 3:
                anb anbVar = (anb) obj;
                anbVar.getClass();
                gnbVarB0 = anbVar.B0("DELETE FROM lists_catalog_download_state WHERE id = ?");
                try {
                    gnbVarB0.M(1, str2);
                    gnbVarB0.w0();
                    return c1eVar;
                } finally {
                }
            case 4:
                anb anbVar2 = (anb) obj;
                anbVar2.getClass();
                gnbVarB0 = anbVar2.B0(str);
                try {
                    gnbVarB0.M(1, str2);
                    int iY = il7.y(gnbVarB0, "id");
                    int iY2 = il7.y(gnbVarB0, "downloaded_item_count");
                    int iY3 = il7.y(gnbVarB0, "total_item_count");
                    int iY4 = il7.y(gnbVarB0, "downloading");
                    int iY5 = il7.y(gnbVarB0, "downloading_post_id");
                    if (gnbVarB0.w0()) {
                        p37Var = new p37(gnbVarB0.d0(iY), (int) gnbVarB0.getLong(iY2), (int) gnbVarB0.getLong(iY3), ((int) gnbVarB0.getLong(iY4)) != 0, gnbVarB0.isNull(iY5) ? null : gnbVarB0.d0(iY5));
                    }
                    return p37Var;
                } finally {
                }
            case 5:
                anb anbVar3 = (anb) obj;
                anbVar3.getClass();
                gnbVarB0 = anbVar3.B0(str);
                try {
                    gnbVarB0.M(1, str2);
                    int iY6 = il7.y(gnbVarB0, "id");
                    int iY7 = il7.y(gnbVarB0, "downloaded_item_count");
                    int iY8 = il7.y(gnbVarB0, "total_item_count");
                    int iY9 = il7.y(gnbVarB0, "downloading");
                    int iY10 = il7.y(gnbVarB0, "downloading_post_id");
                    if (gnbVarB0.w0()) {
                        p37Var = new p37(gnbVarB0.d0(iY6), (int) gnbVarB0.getLong(iY7), (int) gnbVarB0.getLong(iY8), ((int) gnbVarB0.getLong(iY9)) != 0, gnbVarB0.isNull(iY10) ? null : gnbVarB0.d0(iY10));
                    }
                    return p37Var;
                } finally {
                }
            case 6:
                jyb jybVar4 = (jyb) obj;
                gyb.e(jybVar4, str2);
                iyb iybVar = eyb.u;
                fj6 fj6Var = gyb.a[11];
                jybVar4.d(iybVar, Float.valueOf(0.0f));
                return c1eVar;
            case 7:
                qq2 qq2Var = (qq2) obj;
                qq2Var.getClass();
                eo2 eo2Var = qq2Var.a;
                ys2 ys2Var = (ys2) eo2Var.e;
                y85 y85Var = new y85((zk2) ys2Var.b.r.get());
                ko2 ko2Var = eo2Var.b;
                return new x88(this.b, y85Var, ko2Var.b(), ko2Var.z(), ys2Var.d(), ys2Var.O(), ys2Var.M(), ys2Var.c(), ko2Var.t());
            case 8:
                rq2 rq2Var = (rq2) obj;
                rq2Var.getClass();
                eo2 eo2Var2 = rq2Var.a;
                ys2 ys2Var2 = (ys2) eo2Var2.e;
                n0c n0cVarA = ys2Var2.a();
                ko2 ko2Var2 = eo2Var2.b;
                l95 l95VarG = ko2Var2.g();
                hx4 hx4VarH = ko2Var2.h();
                mya myaVarA = ko2Var2.A();
                hha hhaVarQ = ys2Var2.Q();
                qi1 qi1Var = (qi1) ko2Var2.t.get();
                zk2 zk2Var = (zk2) ko2Var2.r.get();
                yo8 yo8VarN = ko2Var2.n();
                pu7 pu7Var = (pu7) ko2Var2.w.get();
                ax2 ax2VarK = ko2Var2.k();
                tg1 tg1VarB = ys2Var2.b();
                me4 me4Var = new me4((qi1) ys2Var2.b.t.get());
                pe4 pe4Var = new pe4(ys2Var2.N());
                og3 og3VarD = ko2Var2.d();
                r13 r13Var = xg3.a;
                iq7.s(r13Var);
                return new m98(this.b, n0cVarA, l95VarG, hx4VarH, myaVarA, hhaVarQ, qi1Var, zk2Var, yo8VarN, pu7Var, ax2VarK, tg1VarB, me4Var, pe4Var, og3VarD, r13Var, ko2Var2.t());
            case 9:
                return xne.a((xne) obj, bt4.NOT_FOLLOWING, new ag8(str2), 159);
            case 10:
                return xne.a((xne) obj, null, new ag8(str2), 191);
            case 11:
                anb anbVar4 = (anb) obj;
                anbVar4.getClass();
                gnbVarB0 = anbVar4.B0(peNPu.NNjs);
                try {
                    gnbVarB0.M(1, str2);
                    if (gnbVarB0.w0()) {
                        if (((int) gnbVarB0.getLong(0)) != 0) {
                            z = true;
                        }
                    }
                    gnbVarB0.close();
                    return Boolean.valueOf(z);
                } finally {
                }
            case 12:
                anb anbVar5 = (anb) obj;
                anbVar5.getClass();
                gnbVarB0 = anbVar5.B0("DELETE FROM offline_catalog WHERE id = ?");
                try {
                    gnbVarB0.M(1, str2);
                    gnbVarB0.w0();
                    return c1eVar;
                } finally {
                }
            case 13:
                anb anbVar6 = (anb) obj;
                anbVar6.getClass();
                gnbVarB0 = anbVar6.B0("DELETE FROM offline_post WHERE id = ?");
                try {
                    gnbVarB0.M(1, str2);
                    gnbVarB0.w0();
                    return c1eVar;
                } finally {
                }
            case 14:
                vq2 vq2Var = (vq2) obj;
                vq2Var.getClass();
                eo2 eo2Var3 = vq2Var.a;
                ko2 ko2Var3 = eo2Var3.b;
                cr0 cr0Var = (cr0) ko2Var3.I.get();
                ys2 ys2Var3 = (ys2) eo2Var3.e;
                return new c79(this.b, cr0Var, new xd4((zk2) ys2Var3.b.r.get()), ys2Var3.l(), ko2Var3.t());
            case 15:
                jyb jybVar5 = (jyb) obj;
                jybVar5.getClass();
                gyb.b(jybVar5, str2);
                return c1eVar;
            case 16:
                jyb jybVar6 = (jyb) obj;
                jybVar6.getClass();
                gyb.b(jybVar6, str2);
                return c1eVar;
            case 17:
                jyb jybVar7 = (jyb) obj;
                jybVar7.getClass();
                gyb.b(jybVar7, str2);
                return c1eVar;
            case 18:
                anb anbVar7 = (anb) obj;
                anbVar7.getClass();
                gnbVarB0 = anbVar7.B0("SELECT long_value FROM Preference where `key`=?");
                try {
                    gnbVarB0.M(1, str2);
                    if (gnbVarB0.w0() && !gnbVarB0.isNull(0)) {
                        p37Var = Long.valueOf(gnbVarB0.getLong(0));
                        break;
                    }
                    return p37Var;
                } finally {
                }
            case 19:
                zq2 zq2Var = (zq2) obj;
                zq2Var.getClass();
                eo2 eo2Var4 = zq2Var.a;
                ys2 ys2Var4 = (ys2) eo2Var4.e;
                wjc wjcVar = new wjc(6, ys2Var4.b.u());
                ko2 ko2Var4 = ys2Var4.b;
                tnb tnbVar = new tnb(ko2Var4.u(), (zk2) ko2Var4.r.get(), ko2Var4.z());
                ko2 ko2Var5 = ys2Var4.b;
                vnb vnbVar = new vnb(ko2Var5.u(), (zk2) ko2Var5.r.get());
                xnb xnbVar = new xnb(ko2Var5.u(), (zk2) ko2Var5.r.get());
                ax2 ax2VarT = eo2Var4.b.t();
                r13 r13Var2 = xg3.a;
                iq7.s(r13Var2);
                return new q1a(this.b, wjcVar, tnbVar, vnbVar, xnbVar, ax2VarT, r13Var2);
            case 20:
                jr2 jr2Var = (jr2) obj;
                jr2Var.getClass();
                ys2 ys2Var5 = (ys2) jr2Var.a.e;
                t51 t51Var = new t51((ex1) ys2Var5.b.W.get());
                ad5 ad5Var = new ad5(ys2Var5.q());
                na5 na5Var = new na5(ys2Var5.q());
                r13 r13Var3 = xg3.a;
                iq7.s(r13Var3);
                return new lma(this.b, t51Var, ad5Var, na5Var, r13Var3);
            case 21:
                nr2 nr2Var = (nr2) obj;
                nr2Var.getClass();
                eo2 eo2Var5 = nr2Var.a;
                ys2 ys2Var6 = (ys2) eo2Var5.e;
                vob vobVar = ys2Var6.a;
                ax2 ax2VarT2 = eo2Var5.b.t();
                ko2 ko2Var6 = ys2Var6.b;
                m5e m5eVar = new m5e(ko2Var6.u(), (zk2) ko2Var6.r.get());
                wjc wjcVar2 = new wjc(6, ys2Var6.b.u());
                r13 r13Var4 = xg3.a;
                iq7.s(r13Var4);
                return new nqa(this.b, vobVar, ax2VarT2, m5eVar, wjcVar2, r13Var4);
            case 22:
                return Boolean.valueOf(((dr9) obj).a.equals(str2));
            case 23:
                jyb jybVar8 = (jyb) obj;
                jybVar8.getClass();
                gyb.b(jybVar8, str2);
                return c1eVar;
            case 24:
                dab dabVar = (dab) obj;
                if (!(dabVar instanceof bab)) {
                    return dabVar;
                }
                bab babVar = (bab) dabVar;
                return g76.L(babVar.a.a, str2) ? babVar.a(true) : dabVar;
            case 25:
                dab dabVar2 = (dab) obj;
                if (!(dabVar2 instanceof bab)) {
                    return dabVar2;
                }
                bab babVar2 = (bab) dabVar2;
                return g76.L(babVar2.a.a, str2) ? babVar2.a(false) : dabVar2;
            case 26:
                return Boolean.valueOf(g76.L(((ugb) obj).a, str2));
            case 27:
                return Boolean.valueOf(g76.L(((ugb) obj).a, str2));
            case 28:
                return Boolean.valueOf(g76.L(((ugb) obj).a, str2));
            default:
                zr2 zr2Var = (zr2) obj;
                zr2Var.getClass();
                eo2 eo2Var6 = zr2Var.a;
                ys2 ys2Var7 = (ys2) eo2Var6.e;
                bub bubVarU = ys2Var7.u();
                yb5 yb5Var = new yb5(ys2Var7.E());
                ko2 ko2Var7 = eo2Var6.b;
                return new gvb(this.b, bubVarU, yb5Var, new cx2(ko2Var7.x()), ko2Var7.w(), ys2Var7.a);
        }
    }
}
