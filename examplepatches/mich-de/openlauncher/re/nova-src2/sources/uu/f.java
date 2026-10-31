package uu;

import cw.n0;
import cw.p0;
import cw.u0;
import cw.y1;
import h6.f1;
import h6.g1;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import kotlin.collections.EmptyList;
import kotlin.collections.EmptySet;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Intrinsics;
import kw.i2;
import kw.x0;
import n8.q;
import ps.v;
import t00.s;
import t70.m0;
import w70.g2;
import w70.m;
import w70.u1;

/* loaded from: classes4.dex */
public final class f extends f1 {

    /* renamed from: a, reason: collision with root package name */
    public final List f91557a;

    /* renamed from: b, reason: collision with root package name */
    public final yu.a f91558b;

    /* renamed from: c, reason: collision with root package name */
    public final uw.c f91559c;

    /* renamed from: d, reason: collision with root package name */
    public final u0 f91560d;

    /* renamed from: e, reason: collision with root package name */
    public final uw.c f91561e;

    public f(List elements, yu.a formArguments) {
        g2 g2Var;
        Intrinsics.g(elements, "elements");
        Intrinsics.g(formArguments, "formArguments");
        this.f91557a = elements;
        this.f91558b = formArguments;
        ArrayList arrayList = new ArrayList();
        for (Object obj : elements) {
            if (obj instanceof i2) {
                arrayList.add(obj);
            }
        }
        ArrayList arrayList2 = new ArrayList();
        Iterator it = arrayList.iterator();
        while (it.hasNext()) {
            b70.d.z0(((i2) it.next()).f72418b, arrayList2);
        }
        ArrayList arrayList3 = new ArrayList();
        Iterator it2 = arrayList2.iterator();
        while (it2.hasNext()) {
            Object next = it2.next();
            if (next instanceof p0) {
                arrayList3.add(next);
            }
        }
        p0 p0Var = (p0) b70.g.Y0(arrayList3);
        EmptySet emptySet = EmptySet.f71734a;
        w70.i2 i2VarC = u1.c(emptySet);
        Continuation continuation = null;
        m0.t(g1.f(this), null, null, new u6.a(this, continuation, 2), 3);
        uw.c cVarJ = v.j((p0Var == null || (g2Var = p0Var.f48258h) == null) ? v.y(emptySet) : g2Var, i2VarC, new s(11));
        this.f91559c = cVarJ;
        y1 y1Var = new y1(e(), 6);
        y1 y1Var2 = new y1(e(), 7);
        this.f91560d = u1.j(y1Var2, cVarJ, y1Var, new cw.u1(new a(y1Var2, cVarJ, y1Var, (Map) this.f91558b.f97655j.getValue()), continuation, 3));
        List list = this.f91557a;
        ArrayList arrayList4 = new ArrayList(b70.c.u0(list, 10));
        Iterator it3 = list.iterator();
        while (it3.hasNext()) {
            arrayList4.add(((x0) it3.next()).f());
        }
        this.f91561e = v.j(this.f91559c, new uw.c(arrayList4.isEmpty() ? v.y(b70.c.v0(b70.g.I1(EmptyList.f71733a))) : new cw.m0((m[]) b70.g.I1(arrayList4).toArray(new m[0]), 13), new n0(arrayList4, 10)), new s(12));
    }

    public final m e() {
        List list = this.f91557a;
        if (list.isEmpty()) {
            return new q(EmptyList.f71733a, 3);
        }
        List list2 = list;
        ArrayList arrayList = new ArrayList(b70.c.u0(list2, 10));
        Iterator it = list2.iterator();
        while (it.hasNext()) {
            arrayList.add(((x0) it.next()).e());
        }
        return new cw.m0((m[]) b70.g.I1(arrayList).toArray(new m[0]), 12);
    }
}
