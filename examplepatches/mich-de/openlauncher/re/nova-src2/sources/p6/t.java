package p6;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.Parcelable;
import android.util.Log;
import androidx.navigation.NavBackStackEntryState;
import b.u4;
import c3.c1;
import c3.m3;
import e10.w3;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.ListIterator;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.locks.ReentrantLock;
import kotlin.LazyKt;
import kotlin.Unit;
import kotlin.collections.ArrayDeque;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import kotlin.jvm.internal.Ref;
import kotlin.jvm.internal.TypeIntrinsics;
import kotlin.sequences.ConstrainedOnceSequence;
import kotlin.sequences.SequencesKt;
import kotlin.sequences.TakeWhileSequence;
import w70.i2;
import w70.n1;
import w70.o1;
import w70.t1;
import w70.u1;
import z.d1;
import z.e1;

/* loaded from: classes2.dex */
public abstract class t {
    public int A;
    public final ArrayList B;
    public final t1 C;
    public final n1 D;

    /* renamed from: a, reason: collision with root package name */
    public final Context f82252a;

    /* renamed from: b, reason: collision with root package name */
    public final Activity f82253b;

    /* renamed from: c, reason: collision with root package name */
    public h0 f82254c;

    /* renamed from: d, reason: collision with root package name */
    public Bundle f82255d;

    /* renamed from: e, reason: collision with root package name */
    public Parcelable[] f82256e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f82257f;

    /* renamed from: g, reason: collision with root package name */
    public final ArrayDeque f82258g;

    /* renamed from: h, reason: collision with root package name */
    public final i2 f82259h;

    /* renamed from: i, reason: collision with root package name */
    public final i2 f82260i;

    /* renamed from: j, reason: collision with root package name */
    public final o1 f82261j;

    /* renamed from: k, reason: collision with root package name */
    public final LinkedHashMap f82262k;

    /* renamed from: l, reason: collision with root package name */
    public final LinkedHashMap f82263l;

    /* renamed from: m, reason: collision with root package name */
    public final LinkedHashMap f82264m;
    public final LinkedHashMap n;
    public h6.a0 o;

    /* renamed from: p, reason: collision with root package name */
    public v f82265p;

    /* renamed from: q, reason: collision with root package name */
    public final CopyOnWriteArrayList f82266q;

    /* renamed from: r, reason: collision with root package name */
    public h6.t f82267r;

    /* renamed from: s, reason: collision with root package name */
    public final m3 f82268s;

    /* renamed from: t, reason: collision with root package name */
    public final d00.c f82269t;

    /* renamed from: u, reason: collision with root package name */
    public final boolean f82270u;

    /* renamed from: v, reason: collision with root package name */
    public final b1 f82271v;

    /* renamed from: w, reason: collision with root package name */
    public final LinkedHashMap f82272w;

    /* renamed from: x, reason: collision with root package name */
    public Lambda f82273x;

    /* renamed from: y, reason: collision with root package name */
    public p f82274y;

    /* renamed from: z, reason: collision with root package name */
    public final LinkedHashMap f82275z;

    public t(Context context) {
        Object next;
        Intrinsics.g(context, "context");
        this.f82252a = context;
        Iterator it = q70.d.p0(context, b.f82131l).getF71970a();
        while (true) {
            if (!it.hasNext()) {
                next = null;
                break;
            } else {
                next = it.next();
                if (((Context) next) instanceof Activity) {
                    break;
                }
            }
        }
        this.f82253b = (Activity) next;
        this.f82258g = new ArrayDeque();
        EmptyList emptyList = EmptyList.f71733a;
        this.f82259h = u1.c(emptyList);
        i2 i2VarC = u1.c(emptyList);
        this.f82260i = i2VarC;
        this.f82261j = new o1(i2VarC);
        this.f82262k = new LinkedHashMap();
        this.f82263l = new LinkedHashMap();
        this.f82264m = new LinkedHashMap();
        this.n = new LinkedHashMap();
        this.f82266q = new CopyOnWriteArrayList();
        this.f82267r = h6.t.f59441b;
        this.f82268s = new m3(this, 6);
        this.f82269t = new d00.c(this, false, 2);
        this.f82270u = true;
        b1 b1Var = new b1();
        this.f82271v = b1Var;
        this.f82272w = new LinkedHashMap();
        this.f82275z = new LinkedHashMap();
        b1Var.a(new k0(b1Var));
        b1Var.a(new c(this.f82252a));
        this.B = new ArrayList();
        LazyKt.a(new c1(this, 21));
        t1 t1VarB = u1.b(1, 0, v70.a.f92142b, 2);
        this.C = t1VarB;
        this.D = new n1(t1VarB);
    }

    public static e0 e(e0 e0Var, int i5, boolean z11, e0 e0Var2) {
        h0 h0Var;
        if (e0Var.f82157f == i5 && (e0Var2 == null || (e0Var.equals(e0Var2) && Intrinsics.b(e0Var.f82153b, e0Var2.f82153b)))) {
            return e0Var;
        }
        if (e0Var instanceof h0) {
            h0Var = (h0) e0Var;
        } else {
            h0Var = e0Var.f82153b;
            Intrinsics.d(h0Var);
        }
        return h0Var.f(i5, h0Var, z11, e0Var2);
    }

    public static void n(t tVar, String route, n0 n0Var, int i5) {
        if ((i5 & 2) != 0) {
            n0Var = null;
        }
        tVar.getClass();
        Intrinsics.g(route, "route");
        if (tVar.f82254c == null) {
            throw new IllegalArgumentException(("Cannot navigate to " + route + ". Navigation graph has not been set for NavController " + tVar + '.').toString());
        }
        h0 h0VarK = tVar.k(tVar.f82258g);
        b0 b0VarH = h0VarK.h(route, true, h0VarK);
        if (b0VarH == null) {
            StringBuilder sbK = u4.k("Navigation destination that matches route ", route, " cannot be found in the navigation graph ");
            sbK.append(tVar.f82254c);
            throw new IllegalArgumentException(sbK.toString());
        }
        e0 e0Var = b0VarH.f82136a;
        Bundle bundleB = e0Var.b(b0VarH.f82137b);
        if (bundleB == null) {
            bundleB = new Bundle();
        }
        Intent intent = new Intent();
        int i11 = e0.f82151i;
        String str = e0Var.f82158g;
        Uri uri = Uri.parse(str != null ? "android-app://androidx.navigation/".concat(str) : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        Intrinsics.c(uri);
        intent.setDataAndType(uri, null);
        intent.setAction(null);
        bundleB.putParcelable("android-support-nav:controller:deepLinkIntent", intent);
        tVar.m(e0Var, bundleB, n0Var);
    }

    public static /* synthetic */ void r(t tVar, n nVar) {
        tVar.q(nVar, false, new ArrayDeque());
    }

    public final void a(e0 e0Var, Bundle bundle, n nVar, List list) {
        Object objPrevious;
        Object objPrevious2;
        e0 e0Var2 = nVar.f82192b;
        boolean z11 = e0Var2 instanceof d;
        ArrayDeque arrayDeque = this.f82258g;
        if (!z11) {
            while (!arrayDeque.isEmpty() && (((n) arrayDeque.last()).f82192b instanceof d) && p(((n) arrayDeque.last()).f82192b.f82157f, true, false)) {
            }
        }
        ArrayDeque arrayDeque2 = new ArrayDeque();
        boolean z12 = e0Var instanceof h0;
        Context context = this.f82252a;
        Object obj = null;
        if (z12) {
            e0 e0Var3 = e0Var2;
            do {
                Intrinsics.d(e0Var3);
                e0Var3 = e0Var3.f82153b;
                if (e0Var3 != null) {
                    ListIterator listIterator = list.listIterator(list.size());
                    while (true) {
                        if (!listIterator.hasPrevious()) {
                            objPrevious2 = null;
                            break;
                        } else {
                            objPrevious2 = listIterator.previous();
                            if (Intrinsics.b(((n) objPrevious2).f82192b, e0Var3)) {
                                break;
                            }
                        }
                    }
                    n nVarL = (n) objPrevious2;
                    if (nVarL == null) {
                        nVarL = b50.d.l(context, e0Var3, bundle, i(), this.f82265p);
                    }
                    arrayDeque2.addFirst(nVarL);
                    if (!arrayDeque.isEmpty() && ((n) arrayDeque.last()).f82192b == e0Var3) {
                        r(this, (n) arrayDeque.last());
                    }
                }
                if (e0Var3 == null) {
                    break;
                }
            } while (e0Var3 != e0Var);
        }
        e0 e0Var4 = arrayDeque2.isEmpty() ? e0Var2 : ((n) arrayDeque2.first()).f82192b;
        while (e0Var4 != null && d(e0Var4.f82157f, e0Var4) != e0Var4) {
            e0Var4 = e0Var4.f82153b;
            if (e0Var4 != null) {
                Bundle bundle2 = (bundle == null || !bundle.isEmpty()) ? bundle : null;
                ListIterator listIterator2 = list.listIterator(list.size());
                while (true) {
                    if (!listIterator2.hasPrevious()) {
                        objPrevious = null;
                        break;
                    } else {
                        objPrevious = listIterator2.previous();
                        if (Intrinsics.b(((n) objPrevious).f82192b, e0Var4)) {
                            break;
                        }
                    }
                }
                n nVarL2 = (n) objPrevious;
                if (nVarL2 == null) {
                    nVarL2 = b50.d.l(context, e0Var4, e0Var4.b(bundle2), i(), this.f82265p);
                }
                arrayDeque2.addFirst(nVarL2);
            }
        }
        if (!arrayDeque2.isEmpty()) {
            e0Var2 = ((n) arrayDeque2.first()).f82192b;
        }
        while (!arrayDeque.isEmpty() && (((n) arrayDeque.last()).f82192b instanceof h0)) {
            e0 e0Var5 = ((n) arrayDeque.last()).f82192b;
            Intrinsics.e(e0Var5, "null cannot be cast to non-null type androidx.navigation.NavGraph");
            d1 d1Var = ((h0) e0Var5).f82177j;
            int i5 = e0Var2.f82157f;
            d1Var.getClass();
            if (e1.b(d1Var, i5) != null) {
                break;
            } else {
                r(this, (n) arrayDeque.last());
            }
        }
        n nVar2 = (n) arrayDeque.g();
        if (nVar2 == null) {
            nVar2 = (n) arrayDeque2.g();
        }
        if (!Intrinsics.b(nVar2 != null ? nVar2.f82192b : null, this.f82254c)) {
            ListIterator listIterator3 = list.listIterator(list.size());
            while (true) {
                if (!listIterator3.hasPrevious()) {
                    break;
                }
                Object objPrevious3 = listIterator3.previous();
                e0 e0Var6 = ((n) objPrevious3).f82192b;
                h0 h0Var = this.f82254c;
                Intrinsics.d(h0Var);
                if (Intrinsics.b(e0Var6, h0Var)) {
                    obj = objPrevious3;
                    break;
                }
            }
            n nVarL3 = (n) obj;
            if (nVarL3 == null) {
                h0 h0Var2 = this.f82254c;
                Intrinsics.d(h0Var2);
                h0 h0Var3 = this.f82254c;
                Intrinsics.d(h0Var3);
                nVarL3 = b50.d.l(context, h0Var2, h0Var3.b(bundle), i(), this.f82265p);
            }
            arrayDeque2.addFirst(nVarL3);
        }
        Iterator<E> it = arrayDeque2.iterator();
        while (it.hasNext()) {
            n nVar3 = (n) it.next();
            Object obj2 = this.f82272w.get(this.f82271v.b(nVar3.f82192b.f82152a));
            if (obj2 == null) {
                throw new IllegalStateException(b.c0.q(new StringBuilder("NavigatorBackStack for "), e0Var.f82152a, " should already be created").toString());
            }
            ((o) obj2).a(nVar3);
        }
        arrayDeque.addAll(arrayDeque2);
        arrayDeque.addLast(nVar);
        Iterator it2 = b70.g.u1(arrayDeque2, nVar).iterator();
        while (it2.hasNext()) {
            n nVar4 = (n) it2.next();
            h0 h0Var4 = nVar4.f82192b.f82153b;
            if (h0Var4 != null) {
                l(nVar4, f(h0Var4.f82157f));
            }
        }
    }

    public final void b(w3 listener) {
        Intrinsics.g(listener, "listener");
        this.f82266q.add(listener);
        ArrayDeque arrayDeque = this.f82258g;
        if (arrayDeque.isEmpty()) {
            return;
        }
        n nVar = (n) arrayDeque.last();
        e0 e0Var = nVar.f82192b;
        nVar.a();
        listener.a(this, e0Var);
    }

    public final boolean c() {
        ArrayDeque arrayDeque;
        while (true) {
            arrayDeque = this.f82258g;
            if (arrayDeque.isEmpty() || !(((n) arrayDeque.last()).f82192b instanceof h0)) {
                break;
            }
            r(this, (n) arrayDeque.last());
        }
        n nVar = (n) arrayDeque.j();
        ArrayList arrayList = this.B;
        if (nVar != null) {
            arrayList.add(nVar);
        }
        this.A++;
        v();
        int i5 = this.A - 1;
        this.A = i5;
        if (i5 == 0) {
            ArrayList arrayListK1 = b70.g.K1(arrayList);
            arrayList.clear();
            Iterator it = arrayListK1.iterator();
            while (it.hasNext()) {
                n nVar2 = (n) it.next();
                Iterator it2 = this.f82266q.iterator();
                while (it2.hasNext()) {
                    w3 w3Var = (w3) it2.next();
                    e0 e0Var = nVar2.f82192b;
                    nVar2.a();
                    w3Var.a(this, e0Var);
                }
                this.C.c(nVar2);
            }
            ArrayList arrayListK12 = b70.g.K1(arrayDeque);
            i2 i2Var = this.f82259h;
            i2Var.getClass();
            i2Var.k(null, arrayListK12);
            ArrayList arrayListS = s();
            i2 i2Var2 = this.f82260i;
            i2Var2.getClass();
            i2Var2.k(null, arrayListS);
        }
        return nVar != null;
    }

    public final e0 d(int i5, e0 e0Var) {
        e0 e0Var2;
        h0 h0Var = this.f82254c;
        if (h0Var == null) {
            return null;
        }
        if (h0Var.f82157f == i5) {
            if (e0Var == null) {
                return h0Var;
            }
            if (Intrinsics.b(h0Var, e0Var) && e0Var.f82153b == null) {
                return this.f82254c;
            }
        }
        n nVar = (n) this.f82258g.j();
        if (nVar == null || (e0Var2 = nVar.f82192b) == null) {
            e0Var2 = this.f82254c;
            Intrinsics.d(e0Var2);
        }
        return e(e0Var2, i5, false, e0Var);
    }

    public final n f(int i5) {
        Object objPrevious;
        ArrayDeque arrayDeque = this.f82258g;
        ListIterator<E> listIterator = arrayDeque.listIterator(arrayDeque.size());
        while (true) {
            if (!listIterator.hasPrevious()) {
                objPrevious = null;
                break;
            }
            objPrevious = listIterator.previous();
            if (((n) objPrevious).f82192b.f82157f == i5) {
                break;
            }
        }
        n nVar = (n) objPrevious;
        if (nVar != null) {
            return nVar;
        }
        StringBuilder sbJ = u4.j(i5, "No destination with ID ", " is on the NavController's back stack. The current destination is ");
        sbJ.append(g());
        throw new IllegalArgumentException(sbJ.toString().toString());
    }

    public final e0 g() {
        n nVar = (n) this.f82258g.j();
        if (nVar != null) {
            return nVar.f82192b;
        }
        return null;
    }

    public final h0 h() {
        h0 h0Var = this.f82254c;
        if (h0Var == null) {
            throw new IllegalStateException("You must call setGraph() before calling getGraph()");
        }
        Intrinsics.e(h0Var, "null cannot be cast to non-null type androidx.navigation.NavGraph");
        return h0Var;
    }

    public final h6.t i() {
        return this.o == null ? h6.t.f59442c : this.f82267r;
    }

    public final n j() {
        Object next;
        Iterator it = b70.g.w1(this.f82258g).iterator();
        if (it.hasNext()) {
            it.next();
        }
        Iterator it2 = ((ConstrainedOnceSequence) q70.d.m0(it)).getF71970a();
        while (true) {
            if (!it2.hasNext()) {
                next = null;
                break;
            }
            next = it2.next();
            if (!(((n) next).f82192b instanceof h0)) {
                break;
            }
        }
        return (n) next;
    }

    public final h0 k(ArrayDeque arrayDeque) {
        e0 e0Var;
        n nVar = (n) arrayDeque.j();
        if (nVar == null || (e0Var = nVar.f82192b) == null) {
            e0Var = this.f82254c;
            Intrinsics.d(e0Var);
        }
        if (e0Var instanceof h0) {
            return (h0) e0Var;
        }
        h0 h0Var = e0Var.f82153b;
        Intrinsics.d(h0Var);
        return h0Var;
    }

    public final void l(n nVar, n nVar2) {
        this.f82262k.put(nVar, nVar2);
        LinkedHashMap linkedHashMap = this.f82263l;
        if (linkedHashMap.get(nVar2) == null) {
            linkedHashMap.put(nVar2, new AtomicInteger(0));
        }
        Object obj = linkedHashMap.get(nVar2);
        Intrinsics.d(obj);
        ((AtomicInteger) obj).incrementAndGet();
    }

    /* JADX WARN: Removed duplicated region for block: B:11:0x0037  */
    /* JADX WARN: Removed duplicated region for block: B:19:0x005d  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x00f6  */
    /* JADX WARN: Removed duplicated region for block: B:84:0x01ed  */
    /* JADX WARN: Removed duplicated region for block: B:86:0x01f2  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void m(e0 e0Var, Bundle bundle, n0 n0Var) {
        boolean zP;
        LinkedHashMap linkedHashMap;
        boolean z11;
        int iNextIndex;
        e0 e0Var2;
        int iNextIndex2;
        LinkedHashMap linkedHashMap2 = this.f82272w;
        Iterator it = linkedHashMap2.values().iterator();
        while (it.hasNext()) {
            ((o) it.next()).f82214d = true;
        }
        Ref.BooleanRef booleanRef = new Ref.BooleanRef();
        if (n0Var != null) {
            boolean z12 = n0Var.f82208e;
            boolean z13 = n0Var.f82207d;
            int i5 = n0Var.f82206c;
            zP = i5 != -1 ? p(i5, z13, z12) : false;
        }
        Bundle bundleB = e0Var.b(bundle);
        if (n0Var == null || !n0Var.f82205b) {
            b1 b1Var = this.f82271v;
            if (n0Var == null || !n0Var.f82204a) {
                linkedHashMap = linkedHashMap2;
                z11 = false;
                if (!z11) {
                    n nVarL = b50.d.l(this.f82252a, e0Var, bundleB, i(), this.f82265p);
                    z0 z0VarB = b1Var.b(e0Var.f82152a);
                    List listP = ul.b.P(nVarL);
                    this.f82273x = new s(booleanRef, this, e0Var, bundleB);
                    z0VarB.d(listP, n0Var);
                    this.f82273x = null;
                }
            } else {
                ArrayDeque arrayDeque = this.f82258g;
                n nVar = (n) arrayDeque.j();
                ListIterator<E> listIterator = arrayDeque.listIterator(arrayDeque.getF71724c());
                while (true) {
                    if (!listIterator.hasPrevious()) {
                        iNextIndex = -1;
                        break;
                    } else if (((n) listIterator.previous()).f82192b == e0Var) {
                        iNextIndex = listIterator.nextIndex();
                        break;
                    }
                }
                if (iNextIndex != -1) {
                    if (e0Var instanceof h0) {
                        int i11 = h0.n;
                        List listA0 = SequencesKt.A0(SequencesKt.y0(q70.d.p0((h0) e0Var, b.f82134q), b.o));
                        if (arrayDeque.f71724c - iNextIndex == listA0.size()) {
                            Iterable iterableSubList = arrayDeque.subList(iNextIndex, arrayDeque.f71724c);
                            ArrayList arrayList = new ArrayList(b70.c.u0(iterableSubList, 10));
                            Iterator it2 = iterableSubList.iterator();
                            while (it2.hasNext()) {
                                arrayList.add(Integer.valueOf(((n) it2.next()).f82192b.f82157f));
                            }
                            if (arrayList.equals(listA0)) {
                                ArrayDeque arrayDeque2 = new ArrayDeque();
                                while (ul.b.K(arrayDeque) >= iNextIndex) {
                                    n nVar2 = (n) b70.d.H0(arrayDeque);
                                    u(nVar2);
                                    n nVar3 = new n(nVar2.f82191a, nVar2.f82192b, nVar2.f82192b.b(bundle), nVar2.f82194d, nVar2.f82195e, nVar2.f82196f, nVar2.f82197g);
                                    nVar3.f82194d = nVar2.f82194d;
                                    nVar3.b(nVar2.f82202l);
                                    arrayDeque2.addFirst(nVar3);
                                    linkedHashMap2 = linkedHashMap2;
                                }
                                linkedHashMap = linkedHashMap2;
                                Iterator it3 = arrayDeque2.iterator();
                                while (it3.hasNext()) {
                                    n nVar4 = (n) it3.next();
                                    h0 h0Var = nVar4.f82192b.f82153b;
                                    if (h0Var != null) {
                                        l(nVar4, f(h0Var.f82157f));
                                    }
                                    arrayDeque.addLast(nVar4);
                                }
                                Iterator it4 = arrayDeque2.iterator();
                                while (it4.hasNext()) {
                                    n nVar5 = (n) it4.next();
                                    z0 z0VarB2 = b1Var.b(nVar5.f82192b.f82152a);
                                    e0 e0Var3 = nVar5.f82192b;
                                    if (e0Var3 == null) {
                                        e0Var3 = null;
                                    }
                                    if (e0Var3 != null) {
                                        new o0().f82220b = true;
                                        Unit unit = Unit.f71706a;
                                        z0VarB2.c(e0Var3);
                                        o oVarB = z0VarB2.b();
                                        ReentrantLock reentrantLock = oVarB.f82211a;
                                        reentrantLock.lock();
                                        try {
                                            ArrayList arrayListK1 = b70.g.K1((Collection) oVarB.f82215e.f93973a.getValue());
                                            ListIterator listIterator2 = arrayListK1.listIterator(arrayListK1.size());
                                            while (true) {
                                                if (!listIterator2.hasPrevious()) {
                                                    iNextIndex2 = -1;
                                                    break;
                                                } else if (Intrinsics.b(((n) listIterator2.previous()).f82196f, nVar5.f82196f)) {
                                                    iNextIndex2 = listIterator2.nextIndex();
                                                    break;
                                                }
                                            }
                                            arrayListK1.set(iNextIndex2, nVar5);
                                            i2 i2Var = oVarB.f82212b;
                                            i2Var.getClass();
                                            i2Var.k(null, arrayListK1);
                                            Unit unit2 = Unit.f71706a;
                                            reentrantLock.unlock();
                                        } catch (Throwable th2) {
                                            reentrantLock.unlock();
                                            throw th2;
                                        }
                                    }
                                }
                                z11 = true;
                            }
                        }
                        linkedHashMap = linkedHashMap2;
                        z11 = false;
                    } else if (nVar == null || (e0Var2 = nVar.f82192b) == null || e0Var.f82157f != e0Var2.f82157f) {
                    }
                    if (!z11) {
                    }
                }
            }
        } else if (this.f82264m.containsKey(Integer.valueOf(e0Var.f82157f))) {
            booleanRef.f71859a = t(e0Var.f82157f, bundleB, n0Var);
            linkedHashMap = linkedHashMap2;
            z11 = false;
        }
        w();
        Iterator it5 = linkedHashMap.values().iterator();
        while (it5.hasNext()) {
            ((o) it5.next()).f82214d = false;
        }
        if (zP || booleanRef.f71859a || z11) {
            c();
        } else {
            v();
        }
    }

    public final boolean o() {
        if (this.f82258g.isEmpty()) {
            return false;
        }
        e0 e0VarG = g();
        Intrinsics.d(e0VarG);
        return p(e0VarG.f82157f, true, false) && c();
    }

    public final boolean p(int i5, boolean z11, boolean z12) {
        e0 e0Var;
        t tVar;
        boolean z13;
        ArrayDeque arrayDeque = this.f82258g;
        int i11 = 0;
        if (arrayDeque.isEmpty()) {
            return false;
        }
        ArrayList arrayList = new ArrayList();
        Iterator it = b70.g.w1(arrayDeque).iterator();
        while (true) {
            if (!it.hasNext()) {
                e0Var = null;
                break;
            }
            e0Var = ((n) it.next()).f82192b;
            z0 z0VarB = this.f82271v.b(e0Var.f82152a);
            if (z11 || e0Var.f82157f != i5) {
                arrayList.add(z0VarB);
            }
            if (e0Var.f82157f == i5) {
                break;
            }
        }
        if (e0Var == null) {
            int i12 = e0.f82151i;
            Log.i("NavController", "Ignoring popBackStack to destination " + a0.a(this.f82252a, i5) + " as it was not found on the current back stack");
            return false;
        }
        Ref.BooleanRef booleanRef = new Ref.BooleanRef();
        ArrayDeque arrayDeque2 = new ArrayDeque();
        Iterator it2 = arrayList.iterator();
        while (true) {
            if (!it2.hasNext()) {
                tVar = this;
                z13 = z12;
                break;
            }
            z0 z0Var = (z0) it2.next();
            Ref.BooleanRef booleanRef2 = new Ref.BooleanRef();
            n nVar = (n) arrayDeque.last();
            tVar = this;
            z13 = z12;
            tVar.f82274y = new p(booleanRef2, booleanRef, tVar, z13, arrayDeque2);
            z0Var.e(nVar, z13);
            tVar.f82274y = null;
            if (!booleanRef2.f71859a) {
                break;
            }
            z12 = z13;
        }
        if (z13) {
            LinkedHashMap linkedHashMap = tVar.f82264m;
            if (!z11) {
                TakeWhileSequence.AnonymousClass1 anonymousClass1 = new TakeWhileSequence.AnonymousClass1();
                while (anonymousClass1.hasNext()) {
                    Integer numValueOf = Integer.valueOf(((e0) anonymousClass1.next()).f82157f);
                    NavBackStackEntryState navBackStackEntryState = (NavBackStackEntryState) arrayDeque2.g();
                    linkedHashMap.put(numValueOf, navBackStackEntryState != null ? navBackStackEntryState.f14739a : null);
                }
            }
            if (!arrayDeque2.isEmpty()) {
                NavBackStackEntryState navBackStackEntryState2 = (NavBackStackEntryState) arrayDeque2.first();
                int i13 = navBackStackEntryState2.f14740b;
                String str = navBackStackEntryState2.f14739a;
                TakeWhileSequence.AnonymousClass1 anonymousClass12 = new TakeWhileSequence.AnonymousClass1();
                while (anonymousClass12.hasNext()) {
                    linkedHashMap.put(Integer.valueOf(((e0) anonymousClass12.next()).f82157f), str);
                }
                if (linkedHashMap.values().contains(str)) {
                    tVar.n.put(str, arrayDeque2);
                }
            }
        }
        w();
        return booleanRef.f71859a;
    }

    public final void q(n nVar, boolean z11, ArrayDeque arrayDeque) {
        v vVar;
        o1 o1Var;
        Set set;
        ArrayDeque arrayDeque2 = this.f82258g;
        n nVar2 = (n) arrayDeque2.last();
        if (!Intrinsics.b(nVar2, nVar)) {
            throw new IllegalStateException(("Attempted to pop " + nVar.f82192b + ", which is not the top of the back stack (" + nVar2.f82192b + ')').toString());
        }
        b70.d.H0(arrayDeque2);
        o oVar = (o) this.f82272w.get(this.f82271v.b(nVar2.f82192b.f82152a));
        boolean z12 = true;
        if ((oVar == null || (o1Var = oVar.f82216f) == null || (set = (Set) o1Var.f93973a.getValue()) == null || !set.contains(nVar2)) && !this.f82263l.containsKey(nVar2)) {
            z12 = false;
        }
        h6.t tVar = nVar2.f82198h.f59342d;
        h6.t tVar2 = h6.t.f59442c;
        if (tVar.compareTo(tVar2) >= 0) {
            if (z11) {
                nVar2.b(tVar2);
                arrayDeque.addFirst(new NavBackStackEntryState(nVar2));
            }
            if (z12) {
                nVar2.b(tVar2);
            } else {
                nVar2.b(h6.t.f59440a);
                u(nVar2);
            }
        }
        if (z11 || z12 || (vVar = this.f82265p) == null) {
            return;
        }
        String backStackEntryId = nVar2.f82196f;
        Intrinsics.g(backStackEntryId, "backStackEntryId");
        h6.n1 n1Var = (h6.n1) vVar.f82279a.remove(backStackEntryId);
        if (n1Var != null) {
            n1Var.a();
        }
    }

    public final ArrayList s() {
        ArrayList arrayList = new ArrayList();
        Iterator it = this.f82272w.values().iterator();
        while (it.hasNext()) {
            Iterable iterable = (Iterable) ((o) it.next()).f82216f.f93973a.getValue();
            ArrayList arrayList2 = new ArrayList();
            for (Object obj : iterable) {
                n nVar = (n) obj;
                if (!arrayList.contains(nVar) && nVar.f82202l.compareTo(h6.t.f59443d) < 0) {
                    arrayList2.add(obj);
                }
            }
            b70.d.z0(arrayList2, arrayList);
        }
        ArrayList arrayList3 = new ArrayList();
        Iterator<E> it2 = this.f82258g.iterator();
        while (it2.hasNext()) {
            Object next = it2.next();
            n nVar2 = (n) next;
            if (!arrayList.contains(nVar2) && nVar2.f82202l.compareTo(h6.t.f59443d) >= 0) {
                arrayList3.add(next);
            }
        }
        b70.d.z0(arrayList3, arrayList);
        ArrayList arrayList4 = new ArrayList();
        Iterator it3 = arrayList.iterator();
        while (it3.hasNext()) {
            Object next2 = it3.next();
            if (!(((n) next2).f82192b instanceof h0)) {
                arrayList4.add(next2);
            }
        }
        return arrayList4;
    }

    public final boolean t(int i5, Bundle bundle, n0 n0Var) {
        e0 e0VarH;
        n nVar;
        e0 e0Var;
        Integer numValueOf = Integer.valueOf(i5);
        LinkedHashMap linkedHashMap = this.f82264m;
        if (!linkedHashMap.containsKey(numValueOf)) {
            return false;
        }
        String str = (String) linkedHashMap.get(Integer.valueOf(i5));
        b70.d.D0(linkedHashMap.values(), new j3.o(str, 6));
        ArrayDeque arrayDeque = (ArrayDeque) TypeIntrinsics.c(this.n).remove(str);
        ArrayList arrayList = new ArrayList();
        n nVar2 = (n) this.f82258g.j();
        if (nVar2 == null || (e0VarH = nVar2.f82192b) == null) {
            e0VarH = h();
        }
        if (arrayDeque != null) {
            Iterator<E> it = arrayDeque.iterator();
            while (it.hasNext()) {
                NavBackStackEntryState navBackStackEntryState = (NavBackStackEntryState) it.next();
                e0 e0VarE = e(e0VarH, navBackStackEntryState.f14740b, true, null);
                Context context = this.f82252a;
                if (e0VarE == null) {
                    int i11 = e0.f82151i;
                    throw new IllegalStateException(("Restore State failed: destination " + a0.a(context, navBackStackEntryState.f14740b) + " cannot be found from the current destination " + e0VarH).toString());
                }
                arrayList.add(navBackStackEntryState.a(context, e0VarE, i(), this.f82265p));
                e0VarH = e0VarE;
            }
        }
        ArrayList arrayList2 = new ArrayList();
        ArrayList arrayList3 = new ArrayList();
        Iterator it2 = arrayList.iterator();
        while (it2.hasNext()) {
            Object next = it2.next();
            if (!(((n) next).f82192b instanceof h0)) {
                arrayList3.add(next);
            }
        }
        Iterator it3 = arrayList3.iterator();
        while (it3.hasNext()) {
            n nVar3 = (n) it3.next();
            List list = (List) b70.g.i1(arrayList2);
            if (Intrinsics.b((list == null || (nVar = (n) b70.g.h1(list)) == null || (e0Var = nVar.f82192b) == null) ? null : e0Var.f82152a, nVar3.f82192b.f82152a)) {
                list.add(nVar3);
            } else {
                arrayList2.add(ul.b.T(nVar3));
            }
        }
        Ref.BooleanRef booleanRef = new Ref.BooleanRef();
        Iterator it4 = arrayList2.iterator();
        while (it4.hasNext()) {
            List list2 = (List) it4.next();
            z0 z0VarB = this.f82271v.b(((n) b70.g.W0(list2)).f82192b.f82152a);
            this.f82273x = new r(booleanRef, arrayList, new Ref.IntRef(), this, bundle);
            z0VarB.d(list2, n0Var);
            this.f82273x = null;
        }
        return booleanRef.f71859a;
    }

    public final void u(n child) {
        Intrinsics.g(child, "child");
        n nVar = (n) this.f82262k.remove(child);
        if (nVar == null) {
            return;
        }
        LinkedHashMap linkedHashMap = this.f82263l;
        AtomicInteger atomicInteger = (AtomicInteger) linkedHashMap.get(nVar);
        Integer numValueOf = atomicInteger != null ? Integer.valueOf(atomicInteger.decrementAndGet()) : null;
        if (numValueOf != null && numValueOf.intValue() == 0) {
            o oVar = (o) this.f82272w.get(this.f82271v.b(nVar.f82192b.f82152a));
            if (oVar != null) {
                oVar.b(nVar);
            }
            linkedHashMap.remove(nVar);
        }
    }

    public final void v() {
        AtomicInteger atomicInteger;
        o1 o1Var;
        Set set;
        ArrayList arrayListK1 = b70.g.K1(this.f82258g);
        if (arrayListK1.isEmpty()) {
            return;
        }
        e0 e0Var = ((n) b70.g.h1(arrayListK1)).f82192b;
        ArrayList arrayList = new ArrayList();
        if (e0Var instanceof d) {
            Iterator it = b70.g.w1(arrayListK1).iterator();
            while (it.hasNext()) {
                e0 e0Var2 = ((n) it.next()).f82192b;
                arrayList.add(e0Var2);
                if (!(e0Var2 instanceof d) && !(e0Var2 instanceof h0)) {
                    break;
                }
            }
        }
        HashMap map = new HashMap();
        for (n nVar : b70.g.w1(arrayListK1)) {
            h6.t tVar = nVar.f82202l;
            e0 e0Var3 = nVar.f82192b;
            if (e0Var != null && e0Var3.f82157f == e0Var.f82157f) {
                h6.t tVar2 = h6.t.f59444e;
                if (tVar != tVar2) {
                    o oVar = (o) this.f82272w.get(this.f82271v.b(e0Var3.f82152a));
                    if (Intrinsics.b((oVar == null || (o1Var = oVar.f82216f) == null || (set = (Set) o1Var.f93973a.getValue()) == null) ? null : Boolean.valueOf(set.contains(nVar)), Boolean.TRUE) || ((atomicInteger = (AtomicInteger) this.f82263l.get(nVar)) != null && atomicInteger.get() == 0)) {
                        map.put(nVar, h6.t.f59443d);
                    } else {
                        map.put(nVar, tVar2);
                    }
                }
                e0 e0Var4 = (e0) b70.g.Y0(arrayList);
                if (e0Var4 != null && e0Var4.f82157f == e0Var3.f82157f) {
                    b70.d.F0(arrayList);
                }
                e0Var = e0Var.f82153b;
            } else if (arrayList.isEmpty() || e0Var3.f82157f != ((e0) b70.g.W0(arrayList)).f82157f) {
                nVar.b(h6.t.f59442c);
            } else {
                e0 e0Var5 = (e0) b70.d.F0(arrayList);
                if (tVar == h6.t.f59444e) {
                    nVar.b(h6.t.f59443d);
                } else {
                    h6.t tVar3 = h6.t.f59443d;
                    if (tVar != tVar3) {
                        map.put(nVar, tVar3);
                    }
                }
                h0 h0Var = e0Var5.f82153b;
                if (h0Var != null && !arrayList.contains(h0Var)) {
                    arrayList.add(h0Var);
                }
            }
        }
        Iterator it2 = arrayListK1.iterator();
        while (it2.hasNext()) {
            n nVar2 = (n) it2.next();
            h6.t tVar4 = (h6.t) map.get(nVar2);
            if (tVar4 != null) {
                nVar2.b(tVar4);
            } else {
                nVar2.c();
            }
        }
    }

    public final void w() {
        int i5;
        boolean z11 = false;
        if (this.f82270u) {
            ArrayDeque arrayDeque = this.f82258g;
            if (arrayDeque == null || !arrayDeque.isEmpty()) {
                Iterator<E> it = arrayDeque.iterator();
                i5 = 0;
                while (it.hasNext()) {
                    if (!(((n) it.next()).f82192b instanceof h0) && (i5 = i5 + 1) < 0) {
                        ul.b.d0();
                        throw null;
                    }
                }
            } else {
                i5 = 0;
            }
            if (i5 > 1) {
                z11 = true;
            }
        }
        this.f82269t.setEnabled(z11);
    }
}
