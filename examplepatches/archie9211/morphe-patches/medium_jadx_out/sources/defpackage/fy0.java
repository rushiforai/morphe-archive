package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class fy0 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;
    public final /* synthetic */ Object f;
    public final /* synthetic */ Object g;

    public /* synthetic */ fy0(Object obj, Object obj2, Object obj3, Object obj4, Object obj5, Object obj6, int i) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
        this.d = obj3;
        this.e = obj4;
        this.f = obj5;
        this.g = obj6;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        int i2 = 2;
        int i3 = 0;
        c1e c1eVar = c1e.a;
        Object obj2 = this.g;
        Object obj3 = this.f;
        Object obj4 = this.e;
        Object obj5 = this.d;
        Object obj6 = this.c;
        Object obj7 = this.b;
        switch (i) {
            case 0:
                t99[] t99VarArr = (t99[]) obj7;
                List list = (List) obj6;
                bl7 bl7Var = (bl7) obj5;
                pya pyaVar = (pya) obj4;
                pya pyaVar2 = (pya) obj3;
                gy0 gy0Var = (gy0) obj2;
                s99 s99Var = (s99) obj;
                int length = t99VarArr.length;
                int i4 = 0;
                while (i3 < length) {
                    t99 t99Var = t99VarArr[i3];
                    t99Var.getClass();
                    dy0.d(s99Var, t99Var, (tk7) list.get(i4), bl7Var.getLayoutDirection(), pyaVar.a, pyaVar2.a, gy0Var.a);
                    i3++;
                    i4++;
                }
                break;
            case 1:
                tce tceVar = (tce) obj7;
                az5 az5Var = (az5) obj6;
                ye1 ye1Var = (ye1) obj5;
                oe1 oe1Var = (oe1) obj4;
                az5 az5Var2 = (az5) obj3;
                b98 b98Var = (b98) obj2;
                xu6 xu6Var = (xu6) obj;
                xu6Var.getClass();
                if (tceVar.a) {
                    ev6.j(xu6Var, "tutorial", new mz1(new g64(b98Var, 26, tceVar), true, -1311600233), 2);
                }
                bo.F(xu6Var, az5Var, ye1Var, oe1Var);
                bo.F(xu6Var, az5Var2, ye1Var, oe1Var);
                break;
            default:
                final db8 db8Var = (db8) obj7;
                final fha fhaVar = (fha) obj6;
                lma lmaVar = (lma) obj4;
                m45 m45Var = (m45) obj3;
                wea weaVar = (wea) obj2;
                za8 za8Var = (za8) obj;
                za8Var.getClass();
                final wda wdaVar = new wda(fhaVar, weaVar, db8Var, lmaVar, m45Var);
                final boolean zL = g76.L((String) obj5, "METER_DESTINATION");
                db8Var.getClass();
                fhaVar.getClass();
                wo7.k(za8Var, "main_route", new mz1(new d55() { // from class: vda
                    @Override // defpackage.d55
                    public final Object k(Object obj8, Object obj9, Object obj10, Object obj11) {
                        ((Integer) obj11).getClass();
                        ((iv) obj8).getClass();
                        ((ba8) obj9).getClass();
                        p65 p65Var = (p65) ((x12) obj10);
                        db8 db8Var2 = db8Var;
                        boolean zH = p65Var.h(db8Var2);
                        fha fhaVar2 = fhaVar;
                        boolean zH2 = zH | p65Var.h(fhaVar2);
                        Object objM = p65Var.M();
                        uob uobVar = w12.a;
                        if (zH2 || objM == uobVar) {
                            objM = new yda(db8Var2, fhaVar2, null, 0);
                            p65Var.j0(objM);
                        }
                        c1e c1eVar2 = c1e.a;
                        kyd.k(p65Var, (b55) objM, c1eVar2);
                        boolean zH3 = p65Var.h(db8Var2) | p65Var.h(fhaVar2);
                        Object objM2 = p65Var.M();
                        if (zH3 || objM2 == uobVar) {
                            objM2 = new yda(db8Var2, fhaVar2, null, 1);
                            p65Var.j0(objM2);
                        }
                        kyd.k(p65Var, (b55) objM2, c1eVar2);
                        xz5.w(fhaVar2, wdaVar, zL, p65Var, 0);
                        return c1eVar2;
                    }
                }, true, -941923175));
                uda udaVar = new uda(db8Var, 0);
                lmaVar.getClass();
                m45Var.getClass();
                wo7.k(za8Var, "publications_route", new mz1(new m38(lmaVar, m45Var, udaVar, 3), true, -831478666));
                uda udaVar2 = new uda(db8Var, 1);
                weaVar.getClass();
                wo7.k(za8Var, "topic_route", new mz1(new m38(weaVar, m45Var, udaVar2, i2), true, -1267472345));
                wo7.k(za8Var, "image_selection_route", new mz1(new vx4(fhaVar, new eb8(9, fhaVar), m45Var, new ui9(fhaVar, 12, db8Var), 7), true, 1511978153));
                break;
        }
        return c1eVar;
    }
}
