package w00;

import cw.r3;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.Set;
import p1.e1;
import p1.y2;
import r10.p0;

/* loaded from: classes4.dex */
public final class z extends t00.y {

    /* renamed from: d, reason: collision with root package name */
    public final q00.l f93627d;

    /* renamed from: e, reason: collision with root package name */
    public final q00.l f93628e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f93629f;

    /* renamed from: g, reason: collision with root package name */
    public final e1 f93630g;

    /* renamed from: h, reason: collision with root package name */
    public final q00.l f93631h;

    /* renamed from: i, reason: collision with root package name */
    public final q00.l f93632i;

    /* renamed from: j, reason: collision with root package name */
    public final q00.l f93633j;

    /* renamed from: k, reason: collision with root package name */
    public final q00.l f93634k;

    /* renamed from: l, reason: collision with root package name */
    public final q00.l f93635l;

    /* renamed from: m, reason: collision with root package name */
    public final q00.l f93636m;
    public final q00.l n;
    public final q00.l o;

    /* renamed from: p, reason: collision with root package name */
    public final boolean f93637p;

    /* renamed from: q, reason: collision with root package name */
    public final Set f93638q;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public z(p6.t tVar, t00.a0 a0Var, q00.l lVar, q00.l lVar2, boolean z11, e1 e1Var, q00.l lVar3, q00.l lVar4, q00.l lVar5, q00.l lVar6, q00.l lVar7, q00.l lVar8, q00.l lVar9, q00.l lVar10, r3 r3Var) {
        Set setN1;
        super(tVar, a0Var, r3Var);
        y2 y2Var = lVar3.f83363b;
        this.f93627d = lVar;
        this.f93628e = lVar2;
        this.f93629f = z11;
        this.f93630g = e1Var;
        this.f93631h = lVar3;
        this.f93632i = lVar4;
        this.f93633j = lVar5;
        this.f93634k = lVar6;
        this.f93635l = lVar7;
        this.f93636m = lVar8;
        this.n = lVar9;
        this.o = lVar10;
        boolean z12 = z11 && ((Set) y2Var.getValue()).contains(p0.f85207d);
        this.f93637p = z12;
        if (z12) {
            Iterable iterable = (Iterable) y2Var.getValue();
            ArrayList arrayList = new ArrayList();
            for (Object obj : iterable) {
                p0 p0Var = (p0) obj;
                if (p0Var != p0.f85208e && p0Var != p0.f85205b) {
                    arrayList.add(obj);
                }
            }
            setN1 = b70.g.N1(arrayList);
        } else {
            Iterable iterable2 = (Iterable) y2Var.getValue();
            ArrayList arrayList2 = new ArrayList();
            for (Object obj2 : iterable2) {
                if (((p0) obj2) != p0.f85207d) {
                    arrayList2.add(obj2);
                }
            }
            setN1 = b70.g.N1(arrayList2);
        }
        this.f93638q = setN1;
    }

    public final void b(p0 p0Var, boolean z11) {
        LinkedHashSet linkedHashSetZ;
        q00.l lVar = this.f93631h;
        if (z11) {
            linkedHashSetZ = b70.n.c0((Set) lVar.f83363b.getValue(), p0Var);
            p0 p0Var2 = p0.f85208e;
            if (p0Var == p0Var2) {
                linkedHashSetZ = b70.n.Z(linkedHashSetZ, p0.f85207d);
            } else if (p0Var == p0.f85207d) {
                linkedHashSetZ = b70.n.Z(b70.n.Z(b70.n.Z(linkedHashSetZ, p0.f85205b), p0Var2), p0.f85206c);
            } else {
                p0 p0Var3 = p0.f85206c;
                if (p0Var == p0Var3) {
                    linkedHashSetZ = b70.n.Z(linkedHashSetZ, p0.f85205b);
                } else if (p0Var == p0.f85205b) {
                    linkedHashSetZ = b70.n.Z(linkedHashSetZ, p0Var3);
                }
            }
        } else {
            linkedHashSetZ = b70.n.Z((Set) lVar.f83363b.getValue(), p0Var);
        }
        lVar.setValue(linkedHashSetZ);
    }
}
