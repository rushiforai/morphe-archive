package defpackage;

import android.content.Context;
import android.webkit.WebView;
import com.google.firebase.messaging.FirebaseMessaging;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class mb implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ String b;

    public /* synthetic */ mb(String str, int i) {
        this.a = i;
        this.b = str;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) throws Exception {
        FirebaseMessaging firebaseMessaging;
        gnb gnbVarB0;
        int i = 14;
        boolean z = false;
        switch (this.a) {
            case 0:
                String str = this.b;
                yp2 yp2Var = (yp2) obj;
                yp2Var.getClass();
                ko2 ko2Var = yp2Var.a.b;
                return new wb(str, (u3) ko2Var.h.get(), ko2Var.t());
            case 1:
                String str2 = this.b;
                WebView webView = (WebView) obj;
                webView.getClass();
                if (!g76.L(webView.getUrl(), str2)) {
                    webView.loadUrl(str2);
                }
                return c1e.a;
            case 2:
                String str3 = this.b;
                jq2 jq2Var = (jq2) obj;
                jq2Var.getClass();
                eo2 eo2Var = jq2Var.a;
                gx5 gx5Var = (gx5) eo2Var.b.x.get();
                ko2 ko2Var2 = eo2Var.b;
                Context context = ko2Var2.a.a;
                qn7 qn7Var = (qn7) ko2Var2.g.get();
                pu7 pu7Var = (pu7) ko2Var2.w.get();
                n32 n32Var = (n32) ko2Var2.q.get();
                e00 e00Var = (e00) ko2Var2.p.get();
                synchronized (FirebaseMessaging.class) {
                    firebaseMessaging = FirebaseMessaging.getInstance(xj4.d());
                }
                firebaseMessaging.getClass();
                olb olbVar = new olb(28, firebaseMessaging);
                zpa zpaVar = (zpa) ((ys2) eo2Var.e).b.z.get();
                zpaVar.getClass();
                my6 my6Var = new my6();
                my6Var.a = zpaVar;
                return new oc(str3, gx5Var, context, qn7Var, pu7Var, n32Var, e00Var, olbVar, my6Var, ko2Var2.t(), on7.b());
            case 3:
                String str4 = this.b;
                xs2 xs2Var = (xs2) obj;
                xs2Var.getClass();
                eo2 eo2Var2 = xs2Var.a;
                ys2 ys2Var = (ys2) eo2Var2.e;
                fj7 fj7Var = new fj7(ys2Var.N());
                kne kneVarO = ys2Var.O();
                kbe kbeVarM = ys2Var.M();
                ko2 ko2Var3 = eo2Var2.b;
                s26 s26VarZ = ko2Var3.z();
                ax2 ax2VarT = ko2Var3.t();
                r13 r13Var = xg3.a;
                iq7.s(r13Var);
                return new bi(str4, fj7Var, kneVarO, kbeVarM, s26VarZ, ax2VarT, r13Var);
            case 4:
                String str5 = this.b;
                vo2 vo2Var = (vo2) obj;
                vo2Var.getClass();
                eo2 eo2Var3 = vo2Var.a;
                ys2 ys2Var2 = (ys2) eo2Var3.e;
                ji jiVar = new ji((zk2) ys2Var2.b.r.get());
                ot1 ot1VarD = ys2Var2.d();
                n0c n0cVarC = ys2Var2.c();
                ko2 ko2Var4 = eo2Var3.b;
                return new si(str5, jiVar, ot1VarD, n0cVarC, ko2Var4.b(), ko2Var4.t());
            case 5:
                String str6 = this.b;
                ep2 ep2Var = (ep2) obj;
                ep2Var.getClass();
                eo2 eo2Var4 = ep2Var.a;
                ys2 ys2Var3 = (ys2) eo2Var4.e;
                wi wiVar = new wi(ys2Var3.E());
                nec necVarF = ys2Var3.F();
                mya myaVarD = ys2Var3.D();
                ko2 ko2Var5 = eo2Var4.b;
                return new ej(str6, wiVar, necVarF, myaVarD, ko2Var5.w(), ko2Var5.t());
            case 6:
                String str7 = this.b;
                fp2 fp2Var = (fp2) obj;
                fp2Var.getClass();
                eo2 eo2Var5 = fp2Var.a;
                ys2 ys2Var4 = (ys2) eo2Var5.e;
                ij ijVar = new ij((zk2) ys2Var4.b.r.get());
                kne kneVarO2 = ys2Var4.O();
                kbe kbeVarM2 = ys2Var4.M();
                ko2 ko2Var6 = eo2Var5.b;
                s26 s26VarZ2 = ko2Var6.z();
                ax2 ax2VarT2 = ko2Var6.t();
                r13 r13Var2 = xg3.a;
                iq7.s(r13Var2);
                return new rj(str7, ijVar, kneVarO2, kbeVarM2, s26VarZ2, ax2VarT2, r13Var2);
            case 7:
                String str8 = this.b;
                jyb jybVar = (jyb) obj;
                gyb.d(jybVar, 1);
                gyb.e(jybVar, str8);
                return c1e.a;
            case 8:
                gyb.b((jyb) obj, this.b);
                return c1e.a;
            case 9:
                String str9 = this.b;
                lp2 lp2Var = (lp2) obj;
                lp2Var.getClass();
                eo2 eo2Var6 = lp2Var.a;
                ko2 ko2Var7 = eo2Var6.b;
                ax2 ax2VarT3 = ko2Var7.t();
                cx2 cx2Var = new cx2(ko2Var7.x());
                mya myaVarA = ko2Var7.A();
                bye byeVar = new bye((zk2) ((ys2) eo2Var6.e).b.r.get());
                r13 r13Var3 = xg3.a;
                iq7.s(r13Var3);
                return new sl2(str9, ax2VarT3, cx2Var, myaVarA, byeVar, r13Var3);
            case 10:
                gyb.e((jyb) obj, this.b);
                return c1e.a;
            case 11:
                String str10 = this.b;
                anb anbVar = (anb) obj;
                anbVar.getClass();
                gnbVarB0 = anbVar.B0("SELECT COUNT(*)>0 FROM dependency WHERE prerequisite_id=?");
                try {
                    gnbVarB0.M(1, str10);
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
                String str11 = this.b;
                anb anbVar2 = (anb) obj;
                anbVar2.getClass();
                gnbVarB0 = anbVar2.B0("SELECT work_spec_id FROM dependency WHERE prerequisite_id=?");
                try {
                    gnbVarB0.M(1, str11);
                    ArrayList arrayList = new ArrayList();
                    while (gnbVarB0.w0()) {
                        arrayList.add(gnbVarB0.d0(0));
                        break;
                    }
                    return arrayList;
                } finally {
                }
            case 13:
                String str12 = this.b;
                anb anbVar3 = (anb) obj;
                anbVar3.getClass();
                gnbVarB0 = anbVar3.B0("SELECT COUNT(*)=0 FROM dependency WHERE work_spec_id=? AND prerequisite_id IN (SELECT id FROM workspec WHERE state!=2)");
                try {
                    gnbVarB0.M(1, str12);
                    if (gnbVarB0.w0()) {
                        if (((int) gnbVarB0.getLong(0)) != 0) {
                            z = true;
                        }
                    }
                    gnbVarB0.close();
                    return Boolean.valueOf(z);
                } finally {
                }
            case 14:
                String str13 = this.b;
                op2 op2Var = (op2) obj;
                op2Var.getClass();
                ys2 ys2Var5 = (ys2) op2Var.a.e;
                rz2 rz2Var = new rz2(17, ys2Var5.b.u());
                ko2 ko2Var8 = ys2Var5.b;
                p5e p5eVar = new p5e(ko2Var8.u(), (zk2) ko2Var8.r.get());
                r13 r13Var4 = xg3.a;
                iq7.s(r13Var4);
                return new ce3(str13, rz2Var, p5eVar, r13Var4);
            case 15:
                String str14 = this.b;
                qp2 qp2Var = (qp2) obj;
                qp2Var.getClass();
                eo2 eo2Var7 = qp2Var.a;
                ys2 ys2Var6 = (ys2) eo2Var7.e;
                ko2 ko2Var9 = ys2Var6.b;
                xnb xnbVar = new xnb(ko2Var9.u(), (zk2) ko2Var9.r.get());
                wjc wjcVar = new wjc(6, ys2Var6.b.u());
                ax2 ax2VarT4 = eo2Var7.b.t();
                r13 r13Var5 = xg3.a;
                iq7.s(r13Var5);
                return new uf3(str14, xnbVar, wjcVar, ax2VarT4, r13Var5);
            case 16:
                String str15 = this.b;
                tp2 tp2Var = (tp2) obj;
                tp2Var.getClass();
                eo2 eo2Var8 = tp2Var.a;
                ys2 ys2Var7 = (ys2) eo2Var8.e;
                olb olbVar2 = new olb(i, ys2Var7.N());
                ko2 ko2Var10 = eo2Var8.b;
                return new ju3(str15, olbVar2, ko2Var10.h(), (zk2) ko2Var10.r.get(), new my6((in7) ys2Var7.b.o.get()), ko2Var10.z());
            case 17:
                String str16 = this.b;
                up2 up2Var = (up2) obj;
                up2Var.getClass();
                eo2 eo2Var9 = up2Var.a;
                ys2 ys2Var8 = (ys2) eo2Var9.e;
                lig ligVar = new lig(new f64((e00) ys2Var8.b.p.get()));
                fj7 fj7Var2 = new fj7(ys2Var8.N());
                n0c n0cVarC2 = ys2Var8.c();
                tl tlVarP = ys2Var8.p();
                kbe kbeVarM3 = ys2Var8.M();
                ot1 ot1VarD2 = ys2Var8.d();
                ko2 ko2Var11 = eo2Var9.b;
                ax2 ax2VarB = ko2Var11.b();
                fr9 fr9VarR = ys2Var8.r();
                kne kneVarO3 = ys2Var8.O();
                ax2 ax2VarT5 = ko2Var11.t();
                ax2 ax2VarW = ko2Var11.w();
                s26 s26VarZ3 = ko2Var11.z();
                ty2 ty2VarQ = ko2Var11.q();
                r13 r13Var6 = xg3.a;
                iq7.s(r13Var6);
                return new f74(str16, ligVar, fj7Var2, n0cVarC2, tlVarP, kbeVarM3, ot1VarD2, ax2VarB, fr9VarR, kneVarO3, ax2VarT5, ax2VarW, s26VarZ3, ty2VarQ, r13Var6);
            case 18:
                String str17 = this.b;
                sb4 sb4Var = (sb4) obj;
                sb4Var.getClass();
                return Boolean.valueOf(g76.L(sb4Var.a, str17));
            case 19:
                String str18 = this.b;
                sb4 sb4Var2 = (sb4) obj;
                sb4Var2.getClass();
                return Boolean.valueOf(g76.L(sb4Var2.a, str18));
            case 20:
                String str19 = this.b;
                zp2 zp2Var = (zp2) obj;
                zp2Var.getClass();
                eo2 eo2Var10 = zp2Var.a;
                ys2 ys2Var9 = (ys2) eo2Var10.e;
                os4 os4Var = new os4(new hb((e00) ys2Var9.b.p.get()), ys2Var9.N());
                fj7 fj7Var3 = new fj7(ys2Var9.N());
                ko2 ko2Var12 = ys2Var9.b;
                t5e t5eVar = new t5e(new hb((e00) ko2Var12.p.get()), (pu7) ko2Var12.w.get());
                ko2 ko2Var13 = eo2Var10.b;
                pu7 pu7Var2 = (pu7) ko2Var13.w.get();
                kne kneVarO4 = ys2Var9.O();
                kbe kbeVarM4 = ys2Var9.M();
                s26 s26VarZ4 = ko2Var13.z();
                ax2 ax2VarT6 = ko2Var13.t();
                cx2 cx2Var2 = new cx2(ko2Var13.x());
                sh2 sh2VarO = ys2Var9.o();
                Context context2 = ko2Var13.a.a;
                r13 r13Var7 = xg3.a;
                iq7.s(r13Var7);
                return new fj4(str19, os4Var, fj7Var3, t5eVar, pu7Var2, kneVarO4, kbeVarM4, s26VarZ4, ax2VarT6, cx2Var2, sh2VarO, context2, r13Var7);
            case 21:
                String str20 = this.b;
                aq2 aq2Var = (aq2) obj;
                aq2Var.getClass();
                ko2 ko2Var14 = aq2Var.a.b;
                qn7 qn7Var2 = (qn7) ko2Var14.g.get();
                n32 n32Var2 = (n32) ko2Var14.q.get();
                dm4 dm4Var = (dm4) ko2Var14.j.get();
                hx4 hx4Var = new hx4((qn7) ko2Var14.g.get(), (dm4) ko2Var14.j.get());
                ax2 ax2VarT7 = ko2Var14.t();
                kb2 kb2VarB = on7.b();
                r13 r13Var8 = xg3.a;
                iq7.s(r13Var8);
                return new xm4(str20, qn7Var2, n32Var2, dm4Var, hx4Var, ax2VarT7, kb2VarB, r13Var8);
            case 22:
                String str21 = this.b;
                cq2 cq2Var = (cq2) obj;
                cq2Var.getClass();
                eo2 eo2Var11 = cq2Var.a;
                ys2 ys2Var10 = (ys2) eo2Var11.e;
                n0c n0cVarA = ys2Var10.a();
                ko2 ko2Var15 = eo2Var11.b;
                qi1 qi1Var = (qi1) ko2Var15.t.get();
                zk2 zk2Var = (zk2) ko2Var15.r.get();
                ax2 ax2VarK = ko2Var15.k();
                tg1 tg1VarB = ys2Var10.b();
                ko2 ko2Var16 = ys2Var10.b;
                mv4 mv4Var = new mv4((zk2) ko2Var16.r.get(), (qi1) ko2Var16.t.get());
                r13 r13Var9 = xg3.a;
                iq7.s(r13Var9);
                return new xv4(str21, n0cVarA, qi1Var, zk2Var, ax2VarK, tg1VarB, mv4Var, r13Var9);
            case 23:
                String str22 = this.b;
                rg1 rg1Var = (rg1) obj;
                rg1Var.getClass();
                return Boolean.valueOf(g76.L(rg1Var.a, str22));
            case 24:
                String str23 = this.b;
                pr2 pr2Var = (pr2) obj;
                pr2Var.getClass();
                eo2 eo2Var12 = pr2Var.a;
                ys2 ys2Var11 = (ys2) eo2Var12.e;
                q85 q85Var = new q85((zk2) ys2Var11.b.r.get());
                ko2 ko2Var17 = eo2Var12.b;
                ax2 ax2VarB2 = ko2Var17.b();
                ax2 ax2VarW2 = ko2Var17.w();
                s26 s26VarZ5 = ko2Var17.z();
                ax2 ax2VarT8 = ko2Var17.t();
                ot1 ot1VarD3 = ys2Var11.d();
                nec necVarF2 = ys2Var11.F();
                kne kneVarO5 = ys2Var11.O();
                kbe kbeVarM5 = ys2Var11.M();
                n0c n0cVarC3 = ys2Var11.c();
                mya myaVarD2 = ys2Var11.D();
                r13 r13Var10 = xg3.a;
                iq7.s(r13Var10);
                return new sza(str23, q85Var, ax2VarB2, ax2VarW2, s26VarZ5, ax2VarT8, ot1VarD3, necVarF2, kneVarO5, kbeVarM5, n0cVarC3, myaVarD2, r13Var10, ys2Var11.o());
            case 25:
                String str24 = this.b;
                f09 f09Var = (f09) obj;
                f09Var.getClass();
                return Boolean.valueOf(g76.L(f09Var.a, str24));
            case 26:
                String str25 = this.b;
                kl5 kl5Var = (kl5) obj;
                kl5Var.getClass();
                return Boolean.valueOf(g76.L(kl5Var.a, str25));
            case 27:
                String str26 = this.b;
                iq2 iq2Var = (iq2) obj;
                iq2Var.getClass();
                eo2 eo2Var13 = iq2Var.a;
                ko2 ko2Var18 = eo2Var13.b;
                og3 og3VarD = ko2Var18.d();
                ys2 ys2Var12 = (ys2) eo2Var13.e;
                go5 go5Var = new go5((mq5) ys2Var12.b.R.get());
                tl tlVarP2 = ys2Var12.p();
                vr7 vr7Var = (vr7) ko2Var18.f.get();
                fr9 fr9VarR2 = ys2Var12.r();
                lb5 lb5Var = new lb5((gn9) ys2Var12.b.u.get(), 2);
                ku3 ku3VarS = ys2Var12.s();
                ty2 ty2VarQ2 = ko2Var18.q();
                ax2 ax2VarT9 = ko2Var18.t();
                r13 r13Var11 = xg3.a;
                iq7.s(r13Var11);
                return new ap5(str26, og3VarD, go5Var, tlVarP2, vr7Var, fr9VarR2, lb5Var, ku3VarS, ty2VarQ2, ax2VarT9, r13Var11);
            case 28:
                String str27 = this.b;
                kq2 kq2Var = (kq2) obj;
                kq2Var.getClass();
                eo2 eo2Var14 = kq2Var.a;
                ys2 ys2Var13 = (ys2) eo2Var14.e;
                iq5 iq5Var = new iq5((mq5) ys2Var13.b.R.get());
                tl tlVarP3 = ys2Var13.p();
                pkf pkfVar = new pkf(ys2Var13.G());
                ko2 ko2Var19 = eo2Var14.b;
                vr7 vr7Var2 = (vr7) ko2Var19.f.get();
                pp5 pp5Var = new pp5(ys2Var13.r(), new my6(ys2Var13.T()));
                lb5 lb5Var2 = new lb5((gn9) ys2Var13.b.u.get(), 2);
                ku3 ku3VarS2 = ys2Var13.s();
                ty2 ty2VarQ3 = ko2Var19.q();
                ax2 ax2VarT10 = ko2Var19.t();
                r13 r13Var12 = xg3.a;
                iq7.s(r13Var12);
                return new bq5(str27, iq5Var, tlVarP3, pkfVar, vr7Var2, pp5Var, lb5Var2, ku3VarS2, ty2VarQ3, ax2VarT10, r13Var12);
            default:
                String str28 = this.b;
                lq2 lq2Var = (lq2) obj;
                lq2Var.getClass();
                eo2 eo2Var15 = lq2Var.a;
                ys2 ys2Var14 = (ys2) eo2Var15.e;
                bye byeVar2 = new bye((zk2) ys2Var14.b.r.get());
                ko2 ko2Var20 = eo2Var15.b;
                mya myaVarA2 = ko2Var20.A();
                mya myaVarA3 = ys2Var14.b.A();
                ub5 ub5VarL = ys2Var14.l();
                r13 r13Var13 = xg3.a;
                iq7.s(r13Var13);
                vwa vwaVar = new vwa(myaVarA3, ub5VarL, r13Var13, i);
                uj8 uj8Var = (uj8) ko2Var20.U.get();
                vr7 vr7Var3 = (vr7) ko2Var20.f.get();
                yx2 yx2VarL = ko2Var20.l();
                zg7 zg7VarE = ko2Var20.e();
                cr0 cr0Var = (cr0) ko2Var20.I.get();
                ub5 ub5VarL2 = ys2Var14.l();
                slc slcVar = (slc) ko2Var20.G.get();
                zxc zxcVarB = ys2Var14.B();
                iq7.s(r13Var13);
                return new ar5(str28, byeVar2, myaVarA2, vwaVar, uj8Var, vr7Var3, yx2VarL, zg7VarE, cr0Var, ub5VarL2, slcVar, zxcVarB, r13Var13, ys2Var14.a);
        }
    }
}
