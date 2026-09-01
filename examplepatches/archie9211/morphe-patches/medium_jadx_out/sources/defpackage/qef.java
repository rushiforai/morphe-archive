package defpackage;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class qef extends p4d implements f55 {
    public /* synthetic */ List b;
    public /* synthetic */ zdf c;
    public /* synthetic */ f09 d;
    public /* synthetic */ boolean e;
    public /* synthetic */ boolean f;
    public final /* synthetic */ ref g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public qef(ref refVar, n92 n92Var) {
        super(6, n92Var);
        this.g = refVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        ndf ldfVar;
        ndf jdfVar;
        ndf mdfVar;
        List list = this.b;
        zdf zdfVar = this.c;
        f09 f09Var = this.d;
        boolean z = this.e;
        boolean z2 = this.f;
        br7.v(obj);
        qz8 qz8Var = (qz8) f09Var.a;
        Map map = (Map) f09Var.b;
        boolean z3 = z || z2;
        if (zdfVar instanceof rdf) {
            ldfVar = cd7.k;
        } else if (zdfVar instanceof pdf) {
            ldfVar = new kdf(((pdf) zdfVar).a);
        } else if (zdfVar instanceof vdf) {
            ldfVar = tz7.o;
        } else if (zdfVar instanceof tdf) {
            ldfVar = new ldf(((tdf) zdfVar).a);
        } else {
            boolean z4 = qz8Var instanceof oz8;
            if (z4 && ((oz8) qz8Var).a.isEmpty() && (zdfVar instanceof sdf)) {
                ldfVar = fa4.q;
            } else {
                if (!z4 || !((oz8) qz8Var).a.isEmpty() || !(zdfVar instanceof ydf)) {
                    if (z4 && (zdfVar instanceof sdf)) {
                        oz8 oz8Var = (oz8) qz8Var;
                        List list2 = oz8Var.a;
                        HashSet hashSet = new HashSet();
                        ArrayList arrayList = new ArrayList();
                        for (Object obj2 : list2) {
                            if (hashSet.add(((dr9) obj2).a)) {
                                arrayList.add(obj2);
                            }
                        }
                        ArrayList arrayList2 = new ArrayList();
                        for (Object obj3 : arrayList) {
                            if (map.get(((dr9) obj3).a) != x57.SHOWING_LESS_LIKE_THIS) {
                                arrayList2.add(obj3);
                            }
                        }
                        mdfVar = new idf(arrayList2, oz8Var.c, oz8Var.b);
                    } else if (z4 && (zdfVar instanceof ydf)) {
                        oz8 oz8Var2 = (oz8) qz8Var;
                        List list3 = oz8Var2.a;
                        HashSet hashSet2 = new HashSet();
                        ArrayList arrayList3 = new ArrayList();
                        for (Object obj4 : list3) {
                            if (hashSet2.add(((dr9) obj4).a)) {
                                arrayList3.add(obj4);
                            }
                        }
                        ArrayList arrayList4 = new ArrayList();
                        for (Object obj5 : arrayList3) {
                            if (map.get(((dr9) obj5).a) != x57.SHOWING_LESS_LIKE_THIS) {
                                arrayList4.add(obj5);
                            }
                        }
                        mdfVar = new mdf(arrayList4, oz8Var2.c, oz8Var2.b);
                    } else {
                        if (qz8Var instanceof nz8) {
                            jdfVar = new jdf(m4.I(((nz8) qz8Var).a));
                            return new aef(z3, list, zdfVar, jdfVar, this.g.r);
                        }
                        if (!(qz8Var instanceof pz8)) {
                            rd6.p("Unknown feed state, followedItemsState: ", zdfVar, ", feedItems: ", qz8Var);
                            return null;
                        }
                        ldfVar = z46.x;
                    }
                    jdfVar = mdfVar;
                    return new aef(z3, list, zdfVar, jdfVar, this.g.r);
                }
                ldfVar = rz5.i;
            }
        }
        jdfVar = ldfVar;
        return new aef(z3, list, zdfVar, jdfVar, this.g.r);
    }

    @Override // defpackage.f55
    public final Object p(Object obj, Object obj2, Object obj3, Object obj4, Object obj5, Object obj6) {
        boolean zBooleanValue = ((Boolean) obj4).booleanValue();
        boolean zBooleanValue2 = ((Boolean) obj5).booleanValue();
        qef qefVar = new qef(this.g, (n92) obj6);
        qefVar.b = (List) obj;
        qefVar.c = (zdf) obj2;
        qefVar.d = (f09) obj3;
        qefVar.e = zBooleanValue;
        qefVar.f = zBooleanValue2;
        return qefVar.invokeSuspend(c1e.a);
    }
}
