package defpackage;

import android.util.Log;
import androidx.compose.runtime.ComposeRuntimeError;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.concurrent.CancellationException;
import java.util.concurrent.atomic.AtomicReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class swa extends l22 {
    public final ft a;
    public final ku3 b;
    public final Object c;
    public va6 d;
    public Throwable e;
    public final ArrayList f;
    public List g;
    public g78 h;
    public final o78 i;
    public final ArrayList j;
    public final ArrayList k;
    public final f78 l;
    public final gg5 m;
    public final f78 n;
    public final f78 o;
    public ArrayList p;
    public g78 q;
    public x51 r;
    public final xpc s;
    public boolean t;
    public final xpc u;
    public final vwa v;
    public final wa6 w;
    public final ib2 x;
    public final z46 y;
    public static final xpc z = vv2.j(t89.d);
    public static final AtomicReference A = new AtomicReference(Boolean.FALSE);

    public swa(ib2 ib2Var) {
        ft ftVar = new ft(new nwa(this, 0));
        this.a = ftVar;
        this.b = new ku3(new nwa(this, 1));
        this.c = new Object();
        this.f = new ArrayList();
        this.h = new g78();
        this.i = new o78(new q22[16]);
        this.j = new ArrayList();
        this.k = new ArrayList();
        this.l = new f78();
        this.m = new gg5(18);
        this.n = new f78();
        this.o = new f78();
        this.s = vv2.j(null);
        this.u = vv2.j(pwa.Inactive);
        this.v = new vwa(4);
        wa6 wa6Var = new wa6((va6) ib2Var.o0(cd7.g));
        wa6Var.R(new eb8(14, this));
        this.w = wa6Var;
        this.x = ib2Var.j0(ftVar).j0(wa6Var);
        this.y = new z46();
    }

    public static final void L(ArrayList arrayList, swa swaVar, q22 q22Var) {
        arrayList.clear();
        synchronized (swaVar.c) {
            Iterator it2 = swaVar.k.iterator();
            if (it2.hasNext()) {
                ((s48) it2.next()).getClass();
                throw null;
            }
        }
    }

    public static void w(k78 k78Var) {
        try {
            if (k78Var.w() instanceof pic) {
                throw new IllegalStateException("Unsupported concurrent change during composition. A state object was modified by composition as well as being modified outside composition.");
            }
        } finally {
            k78Var.c();
        }
    }

    public final void A() {
        int i;
        x68 x68Var;
        synchronized (this.c) {
            try {
                if (this.l.j()) {
                    x68 x68VarB = v58.b(this.l);
                    this.l.a();
                    gg5 gg5Var = this.m;
                    ((f78) gg5Var.b).a();
                    ((f78) gg5Var.c).a();
                    this.o.a();
                    x68Var = new x68(x68VarB.b);
                    Object[] objArr = x68VarB.a;
                    int i2 = x68VarB.b;
                    for (int i3 = 0; i3 < i2; i3++) {
                        s48 s48Var = (s48) objArr[i3];
                        x68Var.a(new f09(s48Var, this.n.g(s48Var)));
                    }
                    this.n.a();
                } else {
                    x68Var = pm8.b;
                    x68Var.getClass();
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        Object[] objArr2 = x68Var.a;
        int i4 = x68Var.b;
        for (i = 0; i < i4; i++) {
            f09 f09Var = (f09) objArr2[i];
        }
    }

    public final boolean B() {
        boolean zC;
        synchronized (this.c) {
            zC = C();
        }
        return zC;
    }

    public final boolean C() {
        return !this.t && (((x90) ((iq1) this.a.c).d).get() & 134217727) > 0;
    }

    public final boolean D() {
        return this.i.c != 0 || C() || E() || this.l.j();
    }

    public final boolean E() {
        return !this.t && (((x90) ((iq1) this.b.c).d).get() & 134217727) > 0;
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x0023  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean F() {
        /*
            r2 = this;
            java.lang.Object r0 = r2.c
            monitor-enter(r0)
            g78 r1 = r2.h     // Catch: java.lang.Throwable -> L21
            boolean r1 = r1.h()     // Catch: java.lang.Throwable -> L21
            if (r1 != 0) goto L23
            o78 r1 = r2.i     // Catch: java.lang.Throwable -> L21
            int r1 = r1.c     // Catch: java.lang.Throwable -> L21
            if (r1 == 0) goto L12
            goto L23
        L12:
            boolean r1 = r2.C()     // Catch: java.lang.Throwable -> L21
            if (r1 != 0) goto L23
            boolean r2 = r2.E()     // Catch: java.lang.Throwable -> L21
            if (r2 == 0) goto L1f
            goto L23
        L1f:
            r2 = 0
            goto L24
        L21:
            r2 = move-exception
            goto L26
        L23:
            r2 = 1
        L24:
            monitor-exit(r0)
            return r2
        L26:
            monitor-exit(r0)
            throw r2
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.swa.F():boolean");
    }

    public final List G() {
        List listH;
        synchronized (this.c) {
            listH = H();
        }
        return listH;
    }

    public final List H() {
        List list = this.g;
        if (list != null) {
            return list;
        }
        ArrayList arrayList = this.f;
        List arrayList2 = arrayList.isEmpty() ? ey3.a : new ArrayList(arrayList);
        this.g = arrayList2;
        return arrayList2;
    }

    public final void I() {
        w51 w51VarZ;
        synchronized (this.c) {
            w51VarZ = z();
            if (((pwa) this.u.getValue()).compareTo(pwa.ShuttingDown) <= 0) {
                Throwable th = this.e;
                CancellationException cancellationException = new CancellationException("Recomposer shutdown; frame clock awaiter will never resume");
                cancellationException.initCause(th);
                throw cancellationException;
            }
        }
        if (w51VarZ != null) {
            ((x51) w51VarZ).resumeWith(c1e.a);
        }
    }

    public final void J() {
        synchronized (this.c) {
            this.t = true;
        }
    }

    public final void K(q22 q22Var) {
        synchronized (this.c) {
            ArrayList arrayList = this.k;
            if (arrayList.size() > 0) {
                ((s48) arrayList.get(0)).getClass();
                throw null;
            }
        }
    }

    public final q22 N(q22 q22Var, g78 g78Var) {
        k78 k78VarD;
        if (q22Var.v.F || q22Var.w == 3) {
            return null;
        }
        g78 g78Var2 = this.q;
        if (g78Var2 == null || !g78Var2.c(q22Var)) {
            eb8 eb8Var = new eb8(13, q22Var);
            pda pdaVar = new pda(q22Var, 5, g78Var);
            oic oicVarH = uic.h();
            k78 k78Var = oicVarH instanceof k78 ? (k78) oicVarH : null;
            if (k78Var == null || (k78VarD = k78Var.D(eb8Var, pdaVar)) == null) {
                ygf.f("Cannot create a mutable snapshot of an read-only snapshot");
            } else {
                try {
                    oic oicVarJ = k78VarD.j();
                    if (g78Var != null) {
                        try {
                            if (g78Var.h()) {
                                ui9 ui9Var = new ui9(g78Var, 18, q22Var);
                                p65 p65Var = q22Var.v;
                                if (p65Var.F) {
                                    b22.a("Preparing a composition while composing is not supported");
                                }
                                p65Var.F = true;
                                try {
                                    ui9Var.invoke();
                                    p65Var.F = false;
                                } catch (Throwable th) {
                                    p65Var.F = false;
                                    throw th;
                                }
                            }
                        } catch (Throwable th2) {
                            oic.q(oicVarJ);
                            throw th2;
                        }
                    }
                    boolean zW = q22Var.w();
                    oic.q(oicVarJ);
                    if (zW) {
                        return q22Var;
                    }
                } finally {
                    w(k78VarD);
                }
            }
        }
        return null;
    }

    public final void O(Throwable th, q22 q22Var) throws Throwable {
        if (!((Boolean) A.get()).booleanValue() || (th instanceof ComposeRuntimeError)) {
            synchronized (this.c) {
                Log.e("ComposeInternal", "Error was captured in composition.", th);
                owa owaVar = (owa) this.s.getValue();
                if (owaVar != null) {
                    throw owaVar.a;
                }
                xpc xpcVar = this.s;
                owa owaVar2 = new owa(th);
                xpcVar.getClass();
                xpcVar.m(null, owaVar2);
            }
            throw th;
        }
        synchronized (this.c) {
            try {
                Log.e("ComposeInternal", "Error was captured in composition while live edit was enabled.", th);
                this.j.clear();
                this.i.i();
                this.h = new g78();
                this.k.clear();
                this.l.a();
                this.n.a();
                xpc xpcVar2 = this.s;
                owa owaVar3 = new owa(th);
                xpcVar2.getClass();
                xpcVar2.m(null, owaVar3);
                if (q22Var != null) {
                    Q(q22Var);
                }
                if (z() != null) {
                    b22.a("expected to go to inactive state due to composition error");
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final boolean P() {
        boolean zD;
        synchronized (this.c) {
            if (this.h.g()) {
                return D();
            }
            List listH = H();
            jqb jqbVar = new jqb(this.h);
            this.h = new g78();
            try {
                int size = listH.size();
                for (int i = 0; i < size; i++) {
                    ((q22) listH.get(i)).x(jqbVar);
                    if (((pwa) this.u.getValue()).compareTo(pwa.ShuttingDown) <= 0) {
                        break;
                    }
                }
                synchronized (this.c) {
                    if (z() != null) {
                        throw new IllegalStateException("called outside of runRecomposeAndApplyChanges");
                    }
                    zD = D();
                }
                return zD;
            } catch (Throwable th) {
                synchronized (this.c) {
                    g78 g78Var = this.h;
                    int i2 = g78Var.d;
                    Iterator<E> it2 = jqbVar.iterator();
                    while (it2.hasNext()) {
                        g78Var.k(it2.next());
                    }
                    throw th;
                }
            }
        }
    }

    public final void Q(q22 q22Var) {
        ArrayList arrayList = this.p;
        if (arrayList == null) {
            arrayList = new ArrayList();
            this.p = arrayList;
        }
        if (!arrayList.contains(q22Var)) {
            arrayList.add(q22Var);
        }
        if (this.f.remove(q22Var)) {
            this.g = null;
        }
    }

    public final void R(va6 va6Var) {
        synchronized (this.c) {
            Throwable th = this.e;
            if (th != null) {
                throw th;
            }
            if (((pwa) this.u.getValue()).compareTo(pwa.ShuttingDown) <= 0) {
                throw new IllegalStateException("Recomposer shut down");
            }
            if (this.d != null) {
                throw new IllegalStateException("Recomposer already running");
            }
            this.d = va6Var;
            if (z() != null) {
                b22.a("called outside of runRecomposeAndApplyChanges");
            }
        }
    }

    public final void S() {
        w51 w51VarZ;
        synchronized (this.c) {
            if (this.t) {
                this.t = false;
                w51VarZ = z();
            } else {
                w51VarZ = null;
            }
        }
        if (w51VarZ != null) {
            ((x51) w51VarZ).resumeWith(c1e.a);
        }
    }

    @Override // defpackage.l22
    public final void a(q22 q22Var, b55 b55Var) throws Throwable {
        pwa pwaVar;
        boolean zContains;
        k78 k78VarD;
        boolean z2 = q22Var.v.F;
        synchronized (this.c) {
            pwa pwaVar2 = (pwa) this.u.getValue();
            pwaVar = pwa.ShuttingDown;
            zContains = pwaVar2.compareTo(pwaVar) > 0 ? true ^ H().contains(q22Var) : true;
        }
        try {
            eb8 eb8Var = new eb8(13, q22Var);
            pda pdaVar = new pda(q22Var, 5, (Object) null);
            oic oicVarH = uic.h();
            k78 k78Var = oicVarH instanceof k78 ? (k78) oicVarH : null;
            if (k78Var == null || (k78VarD = k78Var.D(eb8Var, pdaVar)) == null) {
                throw new IllegalStateException("Cannot create a mutable snapshot of an read-only snapshot");
            }
            try {
                oic oicVarJ = k78VarD.j();
                try {
                    q22Var.j(b55Var);
                    synchronized (this.c) {
                        if (((pwa) this.u.getValue()).compareTo(pwaVar) > 0 && !H().contains(q22Var)) {
                            this.f.add(q22Var);
                            this.g = null;
                        }
                    }
                    if (!z2) {
                        uic.h().m();
                    }
                    try {
                        K(q22Var);
                        try {
                            q22Var.d();
                            q22Var.f();
                            if (z2) {
                                return;
                            }
                            uic.h().m();
                        } catch (Throwable th) {
                            O(th, null);
                        }
                    } catch (Throwable th2) {
                        O(th2, q22Var);
                    }
                } finally {
                    oic.q(oicVarJ);
                }
            } finally {
                w(k78VarD);
            }
        } catch (Throwable th3) {
            if (zContains) {
                synchronized (this.c) {
                }
            }
            O(th3, q22Var);
        }
    }

    @Override // defpackage.l22
    public final g78 b(q22 q22Var, m8c m8cVar, b55 b55Var) {
        vwa vwaVar = this.v;
        try {
            m8c m8cVar2 = q22Var.p;
            q22Var.p = m8cVar;
            try {
                a(q22Var, b55Var);
                g78 g78Var = (g78) vwaVar.m();
                if (g78Var == null) {
                    g78Var = iqb.a;
                    g78Var.getClass();
                }
                return g78Var;
            } finally {
                q22Var.p = m8cVar2;
            }
        } finally {
            vwaVar.E(null);
        }
    }

    @Override // defpackage.l22
    public final boolean d() {
        return ((Boolean) A.get()).booleanValue();
    }

    @Override // defpackage.l22
    public final boolean e() {
        return false;
    }

    @Override // defpackage.l22
    public final boolean f() {
        return false;
    }

    @Override // defpackage.l22
    public final long g() {
        return 1000L;
    }

    @Override // defpackage.l22
    public final k22 h() {
        return null;
    }

    @Override // defpackage.l22
    public final ib2 j() {
        return this.x;
    }

    @Override // defpackage.l22
    public final boolean k() {
        return false;
    }

    @Override // defpackage.l22
    public final void l(q22 q22Var) {
        w51 w51VarZ;
        synchronized (this.c) {
            if (this.i.j(q22Var)) {
                w51VarZ = null;
            } else {
                this.i.b(q22Var);
                w51VarZ = z();
            }
        }
        if (w51VarZ != null) {
            ((x51) w51VarZ).resumeWith(c1e.a);
        }
    }

    @Override // defpackage.l22
    public final r48 m(s48 s48Var) {
        r48 r48Var;
        synchronized (this.c) {
            r48Var = (r48) this.n.k(s48Var);
        }
        return r48Var;
    }

    @Override // defpackage.l22
    public final g78 n(q22 q22Var, m8c m8cVar, g78 g78Var) {
        vwa vwaVar = this.v;
        try {
            P();
            q22Var.x(new jqb(g78Var));
            m8c m8cVar2 = q22Var.p;
            q22Var.p = m8cVar;
            try {
                q22 q22VarN = N(q22Var, null);
                if (q22VarN != null) {
                    K(q22Var);
                    q22VarN.d();
                    q22VarN.f();
                }
                g78 g78Var2 = (g78) vwaVar.m();
                if (g78Var2 == null) {
                    g78Var2 = iqb.a;
                    g78Var2.getClass();
                }
                return g78Var2;
            } finally {
                q22Var.p = m8cVar2;
            }
        } finally {
            vwaVar.E(null);
        }
    }

    @Override // defpackage.l22
    public final void o(Set set) {
    }

    @Override // defpackage.l22
    public final void q(mwa mwaVar) {
        vwa vwaVar = this.v;
        g78 g78Var = (g78) vwaVar.m();
        if (g78Var == null) {
            g78 g78Var2 = iqb.a;
            g78Var = new g78();
            vwaVar.E(g78Var);
        }
        g78Var.a(mwaVar);
    }

    @Override // defpackage.l22
    public final void r(q22 q22Var) {
        synchronized (this.c) {
            try {
                g78 g78Var = this.q;
                if (g78Var == null) {
                    g78 g78Var2 = iqb.a;
                    g78Var = new g78();
                    this.q = g78Var;
                }
                g78Var.a(q22Var);
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    @Override // defpackage.l22
    public final y51 s(ir irVar) {
        ku3 ku3Var = this.b;
        iq1 iq1Var = (iq1) ku3Var.c;
        ig8 ig8Var = new ig8();
        ig8Var.a = irVar;
        return iq1Var.u(ig8Var, (ps5) ku3Var.d);
    }

    @Override // defpackage.l22
    public final void v(q22 q22Var) {
        synchronized (this.c) {
            if (this.f.remove(q22Var)) {
                this.g = null;
            }
            this.i.l(q22Var);
            this.j.remove(q22Var);
        }
    }

    public final Object x(rwa rwaVar) {
        x51 x51Var;
        if (F()) {
            return c1e.a;
        }
        x51 x51Var2 = new x51(1, pwd.Q(rwaVar));
        x51Var2.s();
        synchronized (this.c) {
            if (F()) {
                x51Var = x51Var2;
            } else {
                this.r = x51Var2;
                x51Var = null;
            }
        }
        if (x51Var != null) {
            x51Var.resumeWith(c1e.a);
        }
        Object objQ = x51Var2.q();
        return objQ == tb2.COROUTINE_SUSPENDED ? objQ : c1e.a;
    }

    public final void y() {
        synchronized (this.c) {
            if (((pwa) this.u.getValue()).compareTo(pwa.Idle) >= 0) {
                this.u.l(pwa.ShuttingDown);
            }
        }
        this.w.m(null);
    }

    public final w51 z() {
        pwa pwaVar;
        xpc xpcVar = this.u;
        int iCompareTo = ((pwa) xpcVar.getValue()).compareTo(pwa.ShuttingDown);
        xpc xpcVar2 = this.s;
        ArrayList arrayList = this.k;
        ArrayList arrayList2 = this.j;
        o78 o78Var = this.i;
        if (iCompareTo > 0) {
            if (xpcVar2.getValue() != null) {
                pwaVar = pwa.Inactive;
            } else if (this.d == null) {
                this.h = new g78();
                o78Var.i();
                pwaVar = (C() || E()) ? pwa.InactivePendingWork : pwa.Inactive;
            } else {
                pwaVar = (o78Var.c != 0 || this.h.h() || !arrayList2.isEmpty() || !arrayList.isEmpty() || C() || E() || this.l.j()) ? pwa.PendingWork : pwa.Idle;
            }
            xpcVar.l(pwaVar);
            if (pwaVar != pwa.PendingWork) {
                return null;
            }
            x51 x51Var = this.r;
            this.r = null;
            return x51Var;
        }
        List listH = H();
        int size = listH.size();
        for (int i = 0; i < size; i++) {
        }
        this.f.clear();
        this.g = ey3.a;
        this.h = new g78();
        o78Var.i();
        arrayList2.clear();
        arrayList.clear();
        this.p = null;
        x51 x51Var2 = this.r;
        if (x51Var2 != null) {
            x51Var2.l(null);
        }
        this.r = null;
        xpcVar2.l(null);
        return null;
    }

    /* JADX WARN: Code restructure failed: missing block: B:53:0x0139, code lost:
    
        r3 = r11.size();
        r4 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:54:0x013e, code lost:
    
        if (r4 >= r3) goto L115;
     */
    /* JADX WARN: Code restructure failed: missing block: B:56:0x0148, code lost:
    
        if (((defpackage.f09) r11.get(r4)).b == null) goto L116;
     */
    /* JADX WARN: Code restructure failed: missing block: B:57:0x014a, code lost:
    
        r4 = r4 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:58:0x014d, code lost:
    
        r3 = new java.util.ArrayList(r11.size());
        r4 = r11.size();
        r9 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:59:0x015b, code lost:
    
        if (r9 >= r4) goto L117;
     */
    /* JADX WARN: Code restructure failed: missing block: B:60:0x015d, code lost:
    
        r12 = (defpackage.f09) r11.get(r9);
     */
    /* JADX WARN: Code restructure failed: missing block: B:61:0x0165, code lost:
    
        if (r12.b != null) goto L118;
     */
    /* JADX WARN: Code restructure failed: missing block: B:62:0x0167, code lost:
    
        r12 = (defpackage.s48) r12.a;
     */
    /* JADX WARN: Code restructure failed: missing block: B:65:0x016e, code lost:
    
        r9 = r9 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:66:0x0171, code lost:
    
        r4 = r18.c;
     */
    /* JADX WARN: Code restructure failed: missing block: B:67:0x0173, code lost:
    
        monitor-enter(r4);
     */
    /* JADX WARN: Code restructure failed: missing block: B:68:0x0174, code lost:
    
        defpackage.bu1.n0(r3, r18.k);
     */
    /* JADX WARN: Code restructure failed: missing block: B:69:0x0179, code lost:
    
        monitor-exit(r4);
     */
    /* JADX WARN: Code restructure failed: missing block: B:70:0x017a, code lost:
    
        r3 = new java.util.ArrayList(r11.size());
        r4 = r11.size();
        r9 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:71:0x0188, code lost:
    
        if (r9 >= r4) goto L120;
     */
    /* JADX WARN: Code restructure failed: missing block: B:72:0x018a, code lost:
    
        r12 = r11.get(r9);
     */
    /* JADX WARN: Code restructure failed: missing block: B:73:0x0193, code lost:
    
        if (((defpackage.f09) r12).b == null) goto L122;
     */
    /* JADX WARN: Code restructure failed: missing block: B:74:0x0195, code lost:
    
        r3.add(r12);
     */
    /* JADX WARN: Code restructure failed: missing block: B:75:0x0198, code lost:
    
        r9 = r9 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:76:0x019b, code lost:
    
        r11 = r3;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.util.List M(java.util.List r19, defpackage.g78 r20) {
        /*
            Method dump skipped, instruction units count: 457
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.swa.M(java.util.List, g78):java.util.List");
    }
}
