package c50;

import b00.m;
import e10.h2;
import h50.b0;
import h50.d0;
import h50.f1;
import h50.k;
import h50.n0;
import h50.p0;
import h50.s;
import h6.c1;
import java.io.Closeable;
import java.util.Iterator;
import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.jetbrains.annotations.NotNull;
import t70.j0;
import t70.q1;
import t70.r1;
import t70.s1;

/* loaded from: classes.dex */
public final class e implements j0, Closeable {

    /* renamed from: l, reason: collision with root package name */
    public static final /* synthetic */ AtomicIntegerFieldUpdater f19682l = AtomicIntegerFieldUpdater.newUpdater(e.class, "closed");

    /* renamed from: a, reason: collision with root package name */
    public final g50.e f19683a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f19684b;

    /* renamed from: c, reason: collision with root package name */
    public final s1 f19685c;

    @NotNull
    private volatile /* synthetic */ int closed = 0;

    /* renamed from: d, reason: collision with root package name */
    public final CoroutineContext f19686d;

    /* renamed from: e, reason: collision with root package name */
    public final k50.f f19687e;

    /* renamed from: f, reason: collision with root package name */
    public final l50.a f19688f;

    /* renamed from: g, reason: collision with root package name */
    public final k50.f f19689g;

    /* renamed from: h, reason: collision with root package name */
    public final l50.a f19690h;

    /* renamed from: i, reason: collision with root package name */
    public final s50.d f19691i;

    /* renamed from: j, reason: collision with root package name */
    public final n50.a f19692j;

    /* renamed from: k, reason: collision with root package name */
    public final g f19693k;

    public e(g50.e eVar, g gVar) {
        this.f19683a = eVar;
        int i5 = 0;
        s1 s1Var = new s1((r1) eVar.getCoroutineContext().get(q1.f88853a));
        this.f19685c = s1Var;
        this.f19686d = eVar.getCoroutineContext().plus(s1Var);
        this.f19687e = new k50.f(0);
        this.f19688f = new l50.a(1);
        k50.f fVar = new k50.f(1);
        this.f19689g = fVar;
        this.f19690h = new l50.a(0);
        this.f19691i = new s50.d();
        this.f19692j = new n50.a();
        g gVar2 = new g();
        this.f19693k = gVar2;
        if (this.f19684b) {
            s1Var.w(new a(this));
        }
        Continuation continuation = null;
        fVar.f(k50.f.o, new f50.c(this, eVar, null));
        fVar.f(k50.f.f71138p, new b(this, continuation, i5));
        int i11 = 23;
        gVar2.a(p0.f59264b, new m(i11));
        gVar2.a(h50.e.f59175c, new m(i11));
        gVar2.a(s.f59275d, new m(i11));
        if (gVar.f19702f) {
            gVar2.f19699c.put("DefaultTransformers", new m(22));
        }
        gVar2.a(f1.f59185b, new m(i11));
        i50.c cVar = b0.f59161b;
        gVar2.a(cVar, new m(i11));
        if (gVar.f19701e) {
            gVar2.a(n0.f59254d, new m(i11));
        }
        gVar2.f19701e = gVar.f19701e;
        gVar2.f19702f = gVar.f19702f;
        gVar2.f19697a.putAll(gVar.f19697a);
        gVar2.f19698b.putAll(gVar.f19698b);
        gVar2.f19699c.putAll(gVar.f19699c);
        if (gVar.f19702f) {
            gVar2.a(h50.j0.f59214b, new m(i11));
        }
        s50.a aVar = k.f59216a;
        gVar2.a(cVar, new h2(gVar2));
        Iterator it = gVar2.f19697a.values().iterator();
        while (it.hasNext()) {
            ((Function1) it.next()).invoke(this);
        }
        Iterator it2 = gVar2.f19699c.values().iterator();
        while (it2.hasNext()) {
            ((Function1) it2.next()).invoke(this);
        }
        this.f19688f.f(l50.a.f74724j, new c(this, continuation, i5));
        this.f19684b = true;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(k50.c cVar, ContinuationImpl continuationImpl) {
        d dVar;
        if (continuationImpl instanceof d) {
            dVar = (d) continuationImpl;
            int i5 = dVar.f19681v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                dVar.f19681v = i5 - Integer.MIN_VALUE;
            } else {
                dVar = new d(this, continuationImpl);
            }
        }
        Object objA = dVar.f19679t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = dVar.f19681v;
        if (i11 == 0) {
            ResultKt.b(objA);
            this.f19692j.a(m50.a.f76007a);
            Object obj = cVar.f71120d;
            dVar.f19681v = 1;
            objA = this.f19687e.a(cVar, obj, dVar);
            if (objA == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(objA);
        }
        Intrinsics.e(objA, "null cannot be cast to non-null type io.ktor.client.call.HttpClientCall");
        return (d50.b) objA;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws Exception {
        if (f19682l.compareAndSet(this, 0, 1)) {
            s50.d dVar = (s50.d) this.f19691i.b(d0.f59169a);
            for (s50.a aVar : b70.g.I1(dVar.c().keySet())) {
                Intrinsics.e(aVar, "null cannot be cast to non-null type io.ktor.util.AttributeKey<kotlin.Any>");
                Object objB = dVar.b(aVar);
                if (objB instanceof AutoCloseable) {
                    c1.z((AutoCloseable) objB);
                }
            }
            this.f19685c.j0();
            if (this.f19684b) {
                this.f19683a.close();
            }
        }
    }

    @Override // t70.j0
    public final CoroutineContext getCoroutineContext() {
        return this.f19686d;
    }

    public final String toString() {
        return "HttpClient[" + this.f19683a + AbstractJsonLexerKt.END_LIST;
    }
}
