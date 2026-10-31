package androidx.compose.runtime;

import com.google.android.gms.internal.measurement.v6;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.Set;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.TypeIntrinsics;
import p1.c1;
import p1.d1;
import p1.e1;
import p1.g0;
import p1.g1;
import p1.n1;
import p1.o;
import p1.s2;
import p1.t;
import p1.t1;
import p1.v;
import p1.w;
import p1.z;
import rl.g;
import x1.j;
import z.a1;

/* loaded from: classes.dex */
public final class a extends w {

    /* renamed from: a, reason: collision with root package name */
    public final long f14103a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f14104b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f14105c;

    /* renamed from: d, reason: collision with root package name */
    public HashSet f14106d;

    /* renamed from: e, reason: collision with root package name */
    public final LinkedHashSet f14107e = new LinkedHashSet();

    /* renamed from: f, reason: collision with root package name */
    public final e1 f14108f = new ParcelableSnapshotMutableState(j.f94960g, g1.f81423c);

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ t f14109g;

    public a(t tVar, long j11, boolean z11, boolean z12, v6 v6Var) {
        this.f14109g = tVar;
        this.f14103a = j11;
        this.f14104b = z11;
        this.f14105c = z12;
    }

    @Override // p1.w
    public final void a(g0 g0Var, Function2 function2) {
        this.f14109g.f81554b.a(g0Var, function2);
    }

    @Override // p1.w
    public final a1 b(g0 g0Var, g gVar, Function2 function2) {
        return this.f14109g.f81554b.b(g0Var, gVar, function2);
    }

    @Override // p1.w
    public final void c() {
        t tVar = this.f14109g;
        tVar.A--;
    }

    @Override // p1.w
    public final boolean d() {
        return this.f14109g.f81554b.d();
    }

    @Override // p1.w
    public final boolean e() {
        return this.f14104b;
    }

    @Override // p1.w
    public final boolean f() {
        return this.f14105c;
    }

    @Override // p1.w
    public final long g() {
        return this.f14103a;
    }

    @Override // p1.w
    public final v h() {
        return this.f14109g.f81560h;
    }

    @Override // p1.w
    public final n1 i() {
        return (n1) ((s2) this.f14108f).getValue();
    }

    @Override // p1.w
    public final CoroutineContext j() {
        return this.f14109g.f81554b.j();
    }

    @Override // p1.w
    public final void k(g0 g0Var) {
        t tVar = this.f14109g;
        tVar.f81554b.k(tVar.f81560h);
        tVar.f81554b.k(g0Var);
    }

    @Override // p1.w
    public final c1 l(d1 d1Var) {
        return this.f14109g.f81554b.l(d1Var);
    }

    @Override // p1.w
    public final a1 m(g0 g0Var, g gVar, a1 a1Var) {
        return this.f14109g.f81554b.m(g0Var, gVar, a1Var);
    }

    @Override // p1.w
    public final void n(Set set) {
        HashSet hashSet = this.f14106d;
        if (hashSet == null) {
            hashSet = new HashSet();
            this.f14106d = hashSet;
        }
        hashSet.add(set);
    }

    @Override // p1.w
    public final void o(t tVar) {
        this.f14107e.add(tVar);
    }

    @Override // p1.w
    public final void p(t1 t1Var) {
        this.f14109g.f81554b.p(t1Var);
    }

    @Override // p1.w
    public final void q(z zVar) {
        this.f14109g.f81554b.q(zVar);
    }

    @Override // p1.w
    public final void r() {
        this.f14109g.A++;
    }

    @Override // p1.w
    public final void s(o oVar) {
        HashSet hashSet = this.f14106d;
        if (hashSet != null) {
            Iterator it = hashSet.iterator();
            while (it.hasNext()) {
                Set set = (Set) it.next();
                Intrinsics.e(oVar, "null cannot be cast to non-null type androidx.compose.runtime.ComposerImpl");
                set.remove(((t) oVar).f81555c);
            }
        }
        LinkedHashSet linkedHashSet = this.f14107e;
        TypeIntrinsics.a(linkedHashSet);
        linkedHashSet.remove(oVar);
    }

    @Override // p1.w
    public final void t(z zVar) {
        this.f14109g.f81554b.t(zVar);
    }

    public final void u() {
        LinkedHashSet<t> linkedHashSet = this.f14107e;
        if (linkedHashSet.isEmpty()) {
            return;
        }
        HashSet hashSet = this.f14106d;
        if (hashSet != null) {
            for (t tVar : linkedHashSet) {
                Iterator it = hashSet.iterator();
                while (it.hasNext()) {
                    ((Set) it.next()).remove(tVar.f81555c);
                }
            }
        }
        linkedHashSet.clear();
    }
}
