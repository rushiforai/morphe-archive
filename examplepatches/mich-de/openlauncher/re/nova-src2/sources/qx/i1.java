package qx;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import com.vungle.ads.internal.protos.Sdk;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import kotlin.LazyKt;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.MapsKt;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import t70.r1;

/* loaded from: classes.dex */
public final class i1 {

    /* renamed from: s, reason: collision with root package name */
    public static final c80.j f84516s;

    /* renamed from: a, reason: collision with root package name */
    public final Context f84517a;

    /* renamed from: b, reason: collision with root package name */
    public final String f84518b;

    /* renamed from: c, reason: collision with root package name */
    public final long f84519c;

    /* renamed from: d, reason: collision with root package name */
    public final int f84520d;

    /* renamed from: e, reason: collision with root package name */
    public final Object f84521e;

    /* renamed from: f, reason: collision with root package name */
    public final ArrayList f84522f;

    /* renamed from: g, reason: collision with root package name */
    public final ArrayList f84523g;

    /* renamed from: h, reason: collision with root package name */
    public final ArrayList f84524h;

    /* renamed from: i, reason: collision with root package name */
    public final LinkedHashSet f84525i;

    /* renamed from: j, reason: collision with root package name */
    public final LinkedHashMap f84526j;

    /* renamed from: k, reason: collision with root package name */
    public final LinkedHashMap f84527k;

    /* renamed from: l, reason: collision with root package name */
    public final LinkedHashMap f84528l;

    /* renamed from: m, reason: collision with root package name */
    public final LinkedHashMap f84529m;
    public final LinkedHashMap n;
    public final LinkedHashMap o;

    /* renamed from: p, reason: collision with root package name */
    public final ArrayList f84530p;

    /* renamed from: q, reason: collision with root package name */
    public final y70.d f84531q;

    /* renamed from: r, reason: collision with root package name */
    public final a70.d f84532r;

    static {
        int i5 = c80.k.f19846a;
        f84516s = new c80.j(2);
    }

    public i1(Context context, String str) {
        a80.e eVar = t70.y0.f88884a;
        a80.d dVar = a80.d.f488c;
        this.f84517a = context;
        this.f84518b = str;
        this.f84519c = 500L;
        this.f84520d = 2;
        this.f84521e = new Object();
        this.f84522f = new ArrayList();
        this.f84523g = new ArrayList();
        this.f84524h = new ArrayList();
        this.f84525i = new LinkedHashSet();
        this.f84526j = new LinkedHashMap();
        this.f84527k = new LinkedHashMap();
        this.f84528l = new LinkedHashMap();
        this.f84529m = new LinkedHashMap();
        this.n = new LinkedHashMap();
        this.o = new LinkedHashMap();
        this.f84530p = new ArrayList();
        this.f84531q = t70.k0.a(CoroutineContext.Element.DefaultImpls.d(t70.m0.d(), dVar));
        this.f84532r = LazyKt.a(new a7.f(this, 27));
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(i1 i1Var, l lVar, Activity activity, ContinuationImpl continuationImpl) {
        c1 c1Var;
        l lVar2;
        i1Var.getClass();
        if (continuationImpl instanceof c1) {
            c1Var = (c1) continuationImpl;
            int i5 = c1Var.f84460x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c1Var.f84460x = i5 - Integer.MIN_VALUE;
            } else {
                c1Var = new c1(i1Var, continuationImpl);
            }
        }
        c1 c1Var2 = c1Var;
        Object objA = c1Var2.f84458v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c1Var2.f84460x;
        if (i11 == 0) {
            ResultKt.b(objA);
            if (activity.isFinishing() || activity.isDestroyed()) {
                return Boolean.FALSE;
            }
            if (mx.h1.b()) {
                return Boolean.FALSE;
            }
            zy.c cVar = zy.c.f98823a;
            if (zy.c.c("intermediation_enabled")) {
                c1Var2.f84460x = 1;
                Object objM = i1Var.m(lVar, activity, c1Var2);
                if (objM != coroutineSingletons) {
                    return objM;
                }
            } else {
                i1Var.l(lVar.d());
                zy.c.i(b.c0.k("ad_request_", lVar.name()), b70.k.e0(new Pair("path", "legacy")));
                q20.c cVar2 = new q20.c(14);
                c1Var2.f84456t = i1Var;
                c1Var2.f84457u = lVar;
                c1Var2.f84460x = 2;
                objA = x.a(activity, lVar, cVar2, null, null, c1Var2);
                if (objA != coroutineSingletons) {
                    lVar2 = lVar;
                }
            }
            return coroutineSingletons;
        }
        if (i11 == 1) {
            ResultKt.b(objA);
            return objA;
        }
        if (i11 != 2) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        lVar2 = c1Var2.f84457u;
        i1Var = c1Var2.f84456t;
        ResultKt.b(objA);
        Pair pair = (Pair) objA;
        r rVar = (r) pair.f71683a;
        e eVar = (e) pair.f71684b;
        if (rVar != null) {
            zy.c cVar3 = zy.c.f98823a;
            h6.c1.A("path", "legacy", b.c0.k("ad_fill_", lVar2.name()));
            i1Var.j(g.f84492b, rVar);
            return Boolean.TRUE;
        }
        zy.c cVar4 = zy.c.f98823a;
        h6.c1.A("path", "legacy", b.c0.k("ad_no_fill_", lVar2.name()));
        synchronized (i1Var.f84521e) {
            i1Var.n.put(g.f84492b, eVar);
            Unit unit = Unit.f71706a;
        }
        return Boolean.FALSE;
    }

    /* JADX WARN: Code restructure failed: missing block: B:39:0x00bb, code lost:
    
        if (r9 == r1) goto L40;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0016  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object b(i1 i1Var, l lVar, ContinuationImpl continuationImpl) {
        e1 e1Var;
        i1Var.getClass();
        if (continuationImpl instanceof e1) {
            e1Var = (e1) continuationImpl;
            int i5 = e1Var.f84478x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                e1Var.f84478x = i5 - Integer.MIN_VALUE;
            } else {
                e1Var = new e1(i1Var, continuationImpl);
            }
        }
        Object objA = e1Var.f84476v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = e1Var.f84478x;
        if (i11 == 0) {
            ResultKt.b(objA);
            if (mx.h1.b()) {
                return Boolean.FALSE;
            }
            lVar.getClass();
            if (l.g().length() == 0) {
                synchronized (i1Var.f84521e) {
                    i1Var.n.put(g.f84493c, new c("empty_ad_unit"));
                    Unit unit = Unit.f71706a;
                }
                return Boolean.FALSE;
            }
            zy.c cVar = zy.c.f98823a;
            if (zy.c.c("intermediation_enabled")) {
                e1Var.f84478x = 1;
                Object objN = i1Var.n(lVar, e1Var);
                if (objN != coroutineSingletons) {
                    return objN;
                }
            } else {
                ox.f fVar = ox.f.f81065a;
                int i12 = ox.f.f81069e;
                i1Var.l(l.g());
                zy.c.i(b.c0.k("ad_request_", lVar.name()), b70.k.e0(new Pair("path", "legacy")));
                pu.e eVar = new pu.e(28);
                e1Var.f84474t = i1Var;
                e1Var.f84475u = lVar;
                e1Var.f84478x = 2;
                objA = g0.f84495a.a(i12, lVar, eVar, e1Var);
            }
            return coroutineSingletons;
        }
        if (i11 == 1) {
            ResultKt.b(objA);
            return objA;
        }
        if (i11 != 2) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        lVar = e1Var.f84475u;
        i1Var = e1Var.f84474t;
        ResultKt.b(objA);
        ArrayList arrayList = new ArrayList();
        for (Object obj : (List) objA) {
            if (obj instanceof y) {
                arrayList.add(obj);
            }
        }
        if (!arrayList.isEmpty()) {
            zy.c cVar2 = zy.c.f98823a;
            h6.c1.A("path", "legacy", b.c0.k("ad_fill_", lVar.name()));
            i1Var.j(g.f84493c, new i0(arrayList, lVar));
            return Boolean.TRUE;
        }
        zy.c cVar3 = zy.c.f98823a;
        h6.c1.A("path", "legacy", b.c0.k("ad_no_fill_", lVar.name()));
        synchronized (i1Var.f84521e) {
            i1Var.n.put(g.f84493c, new c("icon_legacy"));
            Unit unit2 = Unit.f71706a;
        }
        return Boolean.FALSE;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0016  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object c(i1 i1Var, l lVar, ContinuationImpl continuationImpl) {
        g1 g1Var;
        l lVar2;
        i1Var.getClass();
        if (continuationImpl instanceof g1) {
            g1Var = (g1) continuationImpl;
            int i5 = g1Var.f84500x;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                g1Var.f84500x = i5 - Integer.MIN_VALUE;
            } else {
                g1Var = new g1(i1Var, continuationImpl);
            }
        }
        Object objS = g1Var.f84498v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = g1Var.f84500x;
        int i12 = 1;
        if (i11 == 0) {
            ResultKt.b(objS);
            if (mx.h1.b()) {
                return Boolean.FALSE;
            }
            zy.c cVar = zy.c.f98823a;
            if (zy.c.c("intermediation_enabled")) {
                g1Var.f84500x = 1;
                Object objO = i1Var.o(lVar, g1Var);
                if (objO != coroutineSingletons) {
                    return objO;
                }
            } else {
                i1Var.l(lVar.c());
                zy.c.i(b.c0.k("ad_request_", lVar.name()), b70.k.e0(new Pair("path", "legacy")));
                q20.c cVar2 = new q20.c(13);
                g1Var.f84496t = i1Var;
                g1Var.f84497u = lVar;
                g1Var.f84500x = 2;
                String strC = lVar.c();
                t70.m mVar = new t70.m(1, IntrinsicsKt.b(g1Var));
                mVar.t();
                Ref.ObjectRef objectRef = new Ref.ObjectRef();
                ui.n nVar = new ui.n(strC, ul.b.P(ui.a.f91272a));
                lb0.b.V(nVar);
                ui.o oVarD = nVar.d();
                r0 r0Var = new r0(lVar, null, cVar2, null, objectRef, mVar);
                q qVar = q.f84576a;
                q.b(new t(mVar, oVarD, r0Var, i12));
                mVar.v(new p0(objectRef));
                objS = mVar.s();
                if (objS != coroutineSingletons) {
                    lVar2 = lVar;
                }
            }
            return coroutineSingletons;
        }
        if (i11 == 1) {
            ResultKt.b(objS);
            return objS;
        }
        if (i11 != 2) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        lVar2 = g1Var.f84497u;
        i1Var = g1Var.f84496t;
        ResultKt.b(objS);
        Pair pair = (Pair) objS;
        r rVar = (r) pair.f71683a;
        e eVar = (e) pair.f71684b;
        if (rVar != null) {
            zy.c cVar3 = zy.c.f98823a;
            h6.c1.A("path", "legacy", b.c0.k("ad_fill_", lVar2.name()));
            i1Var.j(g.f84491a, rVar);
            return Boolean.TRUE;
        }
        zy.c cVar4 = zy.c.f98823a;
        h6.c1.A("path", "legacy", b.c0.k("ad_no_fill_", lVar2.name()));
        if (eVar instanceof a) {
            throw new IllegalStateException("AppIdMissing");
        }
        synchronized (i1Var.f84521e) {
            i1Var.n.put(g.f84491a, eVar);
            Unit unit = Unit.f71706a;
        }
        return Boolean.FALSE;
    }

    public final ArrayList d(g gVar) {
        int iOrdinal = gVar.ordinal();
        if (iOrdinal == 0) {
            return this.f84522f;
        }
        if (iOrdinal == 1) {
            return this.f84523g;
        }
        if (iOrdinal == 2) {
            return this.f84524h;
        }
        throw new NoWhenBranchMatchedException();
    }

    public final r e(List list) {
        zy.c cVar = zy.c.f98823a;
        wm.c cVar2 = zy.c.f98825c;
        long jG0 = kotlin.ranges.a.g0(cVar2 != null ? cVar2.b("waterfall_block_ms") : 0L, 0L, com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h.f42227c);
        long j11 = jG0 > 0 ? jG0 * 1000000 : 500000000L;
        synchronized (this.f84521e) {
            Iterator it = list.iterator();
            while (it.hasNext()) {
                g gVar = (g) it.next();
                Iterator it2 = d(gVar).iterator();
                while (it2.hasNext()) {
                    r rVar = (r) it2.next();
                    if (!rVar.e() && !rVar.f84589e) {
                        it2.remove();
                        return rVar;
                    }
                    it2.remove();
                    if (rVar.e()) {
                        zy.c cVar3 = zy.c.f98823a;
                        zy.c.i("ad_expired_" + rVar.f84585a.name(), null);
                    }
                    rVar.a();
                }
                if (this.f84525i.contains(gVar) && !this.f84527k.containsKey(gVar)) {
                    long jNanoTime = System.nanoTime();
                    Long l9 = (Long) this.f84526j.get(gVar);
                    if (jNanoTime - (l9 != null ? l9.longValue() : 0L) < j11) {
                        return null;
                    }
                }
            }
            return null;
        }
    }

    public final sx.i f() {
        return (sx.i) this.f84532r.getValue();
    }

    public final void g(l lVar, Activity activity) {
        if (t70.k0.f(this.f84531q)) {
            h(g.f84491a, lVar);
            if (l.g().length() > 0) {
                h(g.f84493c, lVar);
            }
            if (activity == null || this.f84518b.length() <= 0) {
                return;
            }
            l.f84543e.getClass();
            zy.c cVar = zy.c.f98823a;
            if (zy.c.c("banner_fallback_enabled")) {
                i(lVar, activity);
            }
        }
    }

    public final void h(g gVar, l lVar) {
        y70.d dVar = this.f84531q;
        if (t70.k0.f(dVar)) {
            t70.m0.t(dVar, null, null, new a1(this, gVar, lVar, null), 3);
        }
    }

    public final void i(l lVar, Activity activity) {
        y70.d dVar = this.f84531q;
        if (t70.k0.f(dVar)) {
            g gVar = g.f84491a;
            t70.m0.t(dVar, null, null, new b1(this, lVar, activity, null), 3);
        }
    }

    public final void j(g gVar, r rVar) {
        List listI1;
        synchronized (this.f84521e) {
            try {
                this.f84527k.remove(gVar);
                this.f84529m.remove(gVar);
                r1 r1Var = (r1) this.f84528l.remove(gVar);
                if (r1Var != null) {
                    r1Var.c(null);
                }
                d(gVar).add(rVar);
                listI1 = b70.g.I1(this.f84530p);
                Unit unit = Unit.f71706a;
            } catch (Throwable th2) {
                throw th2;
            }
        }
        Iterator it = listI1.iterator();
        while (it.hasNext()) {
            w0 w0Var = (w0) ((m) it.next());
            if (w0Var.f().contains(gVar) && w0Var.j()) {
                w0Var.p(null);
            }
        }
    }

    public final void k(r rVar) {
        if (rVar.c() || rVar.f84589e || rVar.e()) {
            rVar.a();
            return;
        }
        synchronized (this.f84521e) {
            try {
                if (rVar instanceof j0) {
                    this.f84522f.add(rVar);
                } else if (rVar instanceof s) {
                    this.f84523g.add(rVar);
                } else if (rVar instanceof i0) {
                    this.f84524h.add(rVar);
                } else if (rVar instanceof y) {
                    ((y) rVar).a();
                    Unit unit = Unit.f71706a;
                } else {
                    rVar.a();
                    Unit unit2 = Unit.f71706a;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final void l(String str) {
        int iIntValue;
        synchronized (this.f84521e) {
            try {
                Integer num = (Integer) this.o.get(str);
                iIntValue = (num != null ? num.intValue() : 0) + 1;
                this.o.put(str, Integer.valueOf(iIntValue));
            } catch (Throwable th2) {
                throw th2;
            }
        }
        zy.c cVar = zy.c.f98823a;
        zy.c.i("ad_sdk_request", MapsKt.j0(new Pair("unit", str), new Pair("session_count", Integer.valueOf(iIntValue))));
    }

    /* JADX WARN: Removed duplicated region for block: B:27:0x00e3  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x0125  */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object m(l lVar, Activity activity, ContinuationImpl continuationImpl) {
        d1 d1Var;
        Activity activity2;
        i1 i1Var;
        i1 i1Var2;
        l lVar2;
        sx.j jVar;
        r rVar;
        if (continuationImpl instanceof d1) {
            d1Var = (d1) continuationImpl;
            int i5 = d1Var.f84468y;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                d1Var.f84468y = i5 - Integer.MIN_VALUE;
            } else {
                d1Var = new d1(this, continuationImpl);
            }
        }
        d1 d1Var2 = d1Var;
        Object objH = d1Var2.f84466w;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = d1Var2.f84468y;
        if (i11 == 0) {
            ResultKt.b(objH);
            String country = Locale.getDefault().getCountry();
            String strD = lVar.d();
            sx.i iVarF = f();
            sx.b bVar = sx.b.f87747b;
            d1Var2.f84463t = this;
            d1Var2.f84464u = lVar;
            d1Var2.f84465v = activity;
            d1Var2.f84468y = 1;
            objH = iVarF.h(strD, bVar, country, d1Var2);
            if (objH != coroutineSingletons) {
                activity2 = activity;
                i1Var = this;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            jVar = (sx.j) d1Var2.f84465v;
            lVar2 = d1Var2.f84464u;
            i1Var2 = d1Var2.f84463t;
            ResultKt.b(objH);
            Pair pair = (Pair) objH;
            rVar = (r) pair.f71683a;
            e eVar = (e) pair.f71684b;
            if (rVar == null) {
                zy.c cVar = zy.c.f98823a;
                zy.c.i(b.c0.k("ad_fill_", lVar2.name()), MapsKt.j0(new Pair("path", "mediated"), new Pair("network", jVar.c().a()), new Pair("tier", jVar.d())));
                i1Var2.j(g.f84492b, rVar);
                return Boolean.TRUE;
            }
            zy.c cVar2 = zy.c.f98823a;
            zy.c.i(b.c0.k("ad_no_fill_", lVar2.name()), MapsKt.j0(new Pair("path", "mediated"), new Pair("network", jVar.c().a()), new Pair("tier", jVar.d())));
            if (eVar instanceof c) {
                sx.i.g(i1Var2.f(), jVar);
            }
            synchronized (i1Var2.f84521e) {
                i1Var2.n.put(g.f84492b, eVar);
                Unit unit = Unit.f71706a;
            }
            return Boolean.FALSE;
        }
        Activity activity3 = (Activity) d1Var2.f84465v;
        lVar = d1Var2.f84464u;
        i1 i1Var3 = d1Var2.f84463t;
        ResultKt.b(objH);
        activity2 = activity3;
        i1Var = i1Var3;
        sx.j jVar2 = (sx.j) objH;
        i1Var.l(jVar2.a());
        zy.c cVar3 = zy.c.f98823a;
        zy.c.i(b.c0.k("ad_request_", lVar.name()), MapsKt.j0(new Pair("path", "mediated"), new Pair("network", jVar2.c().a()), new Pair("tier", jVar2.d())));
        pu.e eVar2 = new pu.e(29);
        y0 y0Var = new y0(i1Var, 0);
        d1Var2.f84463t = i1Var;
        d1Var2.f84464u = lVar;
        d1Var2.f84465v = jVar2;
        d1Var2.f84468y = 2;
        l lVar3 = lVar;
        objH = x.a(activity2, lVar3, eVar2, jVar2, y0Var, d1Var2);
        if (objH != coroutineSingletons) {
            i1Var2 = i1Var;
            lVar2 = lVar3;
            jVar = jVar2;
            Pair pair2 = (Pair) objH;
            rVar = (r) pair2.f71683a;
            e eVar3 = (e) pair2.f71684b;
            if (rVar == null) {
            }
        }
        return coroutineSingletons;
    }

    /* JADX WARN: Removed duplicated region for block: B:40:0x010a  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x011c  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x0163  */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object n(l lVar, ContinuationImpl continuationImpl) {
        f1 f1Var;
        i1 i1Var;
        l lVar2;
        sx.j jVar;
        i1 i1Var2;
        ArrayList arrayList;
        if (continuationImpl instanceof f1) {
            f1Var = (f1) continuationImpl;
            int i5 = f1Var.f84490y;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                f1Var.f84490y = i5 - Integer.MIN_VALUE;
            } else {
                f1Var = new f1(this, continuationImpl);
            }
        }
        f1 f1Var2 = f1Var;
        Object objH = f1Var2.f84488w;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = f1Var2.f84490y;
        if (i11 == 0) {
            ResultKt.b(objH);
            String country = Locale.getDefault().getCountry();
            lVar.getClass();
            String strG = l.g();
            if (strG.length() == 0) {
                synchronized (this.f84521e) {
                    this.n.put(g.f84493c, new c("empty_ad_unit"));
                    Unit unit = Unit.f71706a;
                }
                return Boolean.FALSE;
            }
            sx.i iVarF = f();
            sx.b bVar = sx.b.f87748c;
            f1Var2.f84485t = this;
            f1Var2.f84486u = lVar;
            f1Var2.f84490y = 1;
            objH = iVarF.h(strG, bVar, country, f1Var2);
            if (objH != coroutineSingletons) {
                i1Var = this;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            jVar = f1Var2.f84487v;
            lVar2 = f1Var2.f84486u;
            i1Var2 = f1Var2.f84485t;
            ResultKt.b(objH);
            z zVar = (z) objH;
            List listA = zVar.a();
            arrayList = new ArrayList();
            for (Object obj : listA) {
                if (obj instanceof y) {
                    arrayList.add(obj);
                }
            }
            if (arrayList.isEmpty()) {
                zy.c cVar = zy.c.f98823a;
                zy.c.i(b.c0.k("ad_fill_", lVar2.name()), MapsKt.j0(new Pair("path", "mediated"), new Pair("network", jVar.c().a()), new Pair("tier", jVar.d())));
                i1Var2.j(g.f84493c, new i0(arrayList, lVar2));
                return Boolean.TRUE;
            }
            zy.c cVar2 = zy.c.f98823a;
            zy.c.i(b.c0.k("ad_no_fill_", lVar2.name()), MapsKt.j0(new Pair("path", "mediated"), new Pair("network", jVar.c().a()), new Pair("tier", jVar.d())));
            if (zVar.b() instanceof c) {
                sx.i.g(i1Var2.f(), jVar);
            }
            synchronized (i1Var2.f84521e) {
                i1Var2.n.put(g.f84493c, zVar.b());
                Unit unit2 = Unit.f71706a;
            }
            return Boolean.FALSE;
        }
        lVar = f1Var2.f84486u;
        i1 i1Var3 = f1Var2.f84485t;
        ResultKt.b(objH);
        i1Var = i1Var3;
        sx.j jVar2 = (sx.j) objH;
        ox.f fVar = ox.f.f81065a;
        int i12 = ox.f.f81069e;
        i1Var.l(jVar2.a());
        zy.c cVar3 = zy.c.f98823a;
        zy.c.i(b.c0.k("ad_request_", lVar.name()), MapsKt.j0(new Pair("path", "mediated"), new Pair("network", jVar2.c().a()), new Pair("tier", jVar2.d())));
        g0 g0Var = g0.f84495a;
        z0 z0Var = new z0(1);
        y0 y0Var = new y0(i1Var, 2);
        f1Var2.f84485t = i1Var;
        f1Var2.f84486u = lVar;
        f1Var2.f84487v = jVar2;
        f1Var2.f84490y = 2;
        l lVar3 = lVar;
        objH = g0Var.c(i12, lVar3, z0Var, jVar2, y0Var, f1Var2);
        if (objH != coroutineSingletons) {
            lVar2 = lVar3;
            jVar = jVar2;
            i1Var2 = i1Var;
            z zVar2 = (z) objH;
            List listA2 = zVar2.a();
            arrayList = new ArrayList();
            while (r2.hasNext()) {
            }
            if (arrayList.isEmpty()) {
            }
        }
        return coroutineSingletons;
    }

    /* JADX WARN: Removed duplicated region for block: B:50:0x01d7  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x0219  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object o(l lVar, ContinuationImpl continuationImpl) {
        h1 h1Var;
        i1 i1Var;
        l lVar2;
        i1 i1Var2;
        l lVar3;
        sx.j jVar;
        Activity activity;
        List adSizes;
        r rVar;
        if (continuationImpl instanceof h1) {
            h1Var = (h1) continuationImpl;
            int i5 = h1Var.f84508y;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                h1Var.f84508y = i5 - Integer.MIN_VALUE;
            } else {
                h1Var = new h1(this, continuationImpl);
            }
        }
        Object objH = h1Var.f84506w;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = h1Var.f84508y;
        int i12 = 1;
        if (i11 == 0) {
            ResultKt.b(objH);
            String country = Locale.getDefault().getCountry();
            String strC = lVar.c();
            sx.i iVarF = f();
            sx.b bVar = sx.b.f87746a;
            h1Var.f84503t = this;
            h1Var.f84504u = lVar;
            h1Var.f84508y = 1;
            objH = iVarF.h(strC, bVar, country, h1Var);
            if (objH != coroutineSingletons) {
                i1Var = this;
                lVar2 = lVar;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            jVar = h1Var.f84505v;
            lVar3 = h1Var.f84504u;
            i1Var2 = h1Var.f84503t;
            ResultKt.b(objH);
            Pair pair = (Pair) objH;
            rVar = (r) pair.f71683a;
            e eVar = (e) pair.f71684b;
            if (rVar == null) {
                zy.c cVar = zy.c.f98823a;
                zy.c.i(b.c0.k("ad_fill_", lVar3.name()), MapsKt.j0(new Pair("path", "mediated"), new Pair("network", jVar.c().a()), new Pair("tier", jVar.d())));
                i1Var2.j(g.f84491a, rVar);
                return Boolean.TRUE;
            }
            zy.c cVar2 = zy.c.f98823a;
            zy.c.i(b.c0.k("ad_no_fill_", lVar3.name()), MapsKt.j0(new Pair("path", "mediated"), new Pair("network", jVar.c().a()), new Pair("tier", jVar.d())));
            if (eVar instanceof c) {
                sx.i.g(i1Var2.f(), jVar);
            }
            if (eVar instanceof a) {
                throw new IllegalStateException("AppIdMissing");
            }
            synchronized (i1Var2.f84521e) {
                i1Var2.n.put(g.f84491a, eVar);
                Unit unit = Unit.f71706a;
            }
            return Boolean.FALSE;
        }
        l lVar4 = h1Var.f84504u;
        i1 i1Var3 = h1Var.f84503t;
        ResultKt.b(objH);
        lVar2 = lVar4;
        i1Var = i1Var3;
        sx.j jVar2 = (sx.j) objH;
        i1Var.l(jVar2.a());
        zy.c cVar3 = zy.c.f98823a;
        zy.c.i(b.c0.k("ad_request_", lVar2.name()), MapsKt.j0(new Pair("path", "mediated"), new Pair("network", jVar2.c().a()), new Pair("tier", jVar2.d())));
        Context baseContext = i1Var.f84517a;
        z0 z0Var = new z0(0);
        y0 y0Var = new y0(i1Var, 1);
        h1Var.f84503t = i1Var;
        h1Var.f84504u = lVar2;
        h1Var.f84505v = jVar2;
        h1Var.f84508y = 2;
        String strA = jVar2.a();
        if (strA.length() <= 0) {
            strA = null;
        }
        if (strA == null) {
            strA = lVar2.c();
        }
        int iOrdinal = jVar2.c().ordinal();
        if (iOrdinal == 0) {
            t70.m mVar = new t70.m(1, IntrinsicsKt.b(h1Var));
            mVar.t();
            Ref.ObjectRef objectRef = new Ref.ObjectRef();
            ui.n nVar = new ui.n(strA, ul.b.P(ui.a.f91272a));
            lb0.b.V(nVar);
            ui.o oVarD = nVar.d();
            r0 r0Var = new r0(lVar2, jVar2, z0Var, y0Var, objectRef, mVar);
            q qVar = q.f84576a;
            q.b(new t(mVar, oVarD, r0Var, i12));
            mVar.v(new p0(objectRef));
            objH = mVar.s();
        } else {
            if (iOrdinal != 1) {
                throw new NoWhenBranchMatchedException();
            }
            t70.m mVar2 = new t70.m(1, IntrinsicsKt.b(h1Var));
            mVar2.t();
            Ref.ObjectRef objectRef2 = new Ref.ObjectRef();
            while (true) {
                if (!(baseContext instanceof ContextWrapper)) {
                    activity = null;
                    break;
                }
                if (baseContext instanceof Activity) {
                    activity = (Activity) baseContext;
                    break;
                }
                baseContext = ((ContextWrapper) baseContext).getBaseContext();
            }
            ui.n nVar2 = new ui.n(strA, ul.b.Q(ui.a.f91272a, ui.a.f91274c));
            if (activity != null) {
                mi.a aVar = mi.a.f76401g;
                adSizes = ul.b.Q(bh.g.v(activity, Sdk.SDKError.Reason.WEBVIEW_ERROR_VALUE, 0), mi.a.f76402h);
            } else {
                adSizes = ul.b.Q(mi.a.f76402h, mi.a.f76401g);
            }
            Intrinsics.g(adSizes, "adSizes");
            nVar2.f91293q = (mi.a) b70.g.W0(adSizes);
            nVar2.f91294r = b70.g.I1(adSizes);
            lb0.b.V(nVar2);
            ui.o oVarD2 = nVar2.d();
            l lVar5 = lVar2;
            o0 o0Var = new o0(jVar2, lVar5, z0Var, y0Var, objectRef2, mVar2, activity);
            jVar2 = jVar2;
            lVar2 = lVar5;
            q qVar2 = q.f84576a;
            q.b(new c0(mVar2, oVarD2, o0Var, i12));
            mVar2.v(new l0(objectRef2));
            objH = mVar2.s();
            CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
        }
        if (objH != coroutineSingletons) {
            i1Var2 = i1Var;
            lVar3 = lVar2;
            jVar = jVar2;
            Pair pair2 = (Pair) objH;
            rVar = (r) pair2.f71683a;
            e eVar2 = (e) pair2.f71684b;
            if (rVar == null) {
            }
        }
        return coroutineSingletons;
    }
}
