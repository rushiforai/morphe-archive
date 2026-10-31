package w70;

import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;

/* loaded from: classes.dex */
public final class g extends x70.d {

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ AtomicIntegerFieldUpdater f93900f = AtomicIntegerFieldUpdater.newUpdater(g.class, "consumed$volatile");
    private volatile /* synthetic */ int consumed$volatile;

    /* renamed from: d, reason: collision with root package name */
    public final v70.z f93901d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f93902e;

    public /* synthetic */ g(v70.z zVar, boolean z11) {
        this(zVar, z11, EmptyCoroutineContext.f71803a, -3, v70.a.f92141a);
    }

    @Override // x70.d
    public final String b() {
        return "channel=" + this.f93901d;
    }

    @Override // x70.d, w70.m
    public final Object collect(n nVar, Continuation continuation) throws Throwable {
        if (this.f95220b != -3) {
            Object objCollect = super.collect(nVar, continuation);
            return objCollect == CoroutineSingletons.f71806a ? objCollect : Unit.f71706a;
        }
        boolean z11 = this.f93902e;
        if (z11 && f93900f.getAndSet(this, 1) == 1) {
            throw new IllegalStateException("ReceiveChannel.consumeAsFlow can be collected just once");
        }
        Object objN = u1.n(nVar, this.f93901d, z11, continuation);
        return objN == CoroutineSingletons.f71806a ? objN : Unit.f71706a;
    }

    @Override // x70.d
    public final Object e(v70.x xVar, Continuation continuation) throws Throwable {
        Object objN = u1.n(new x70.y(xVar), this.f93901d, this.f93902e, continuation);
        return objN == CoroutineSingletons.f71806a ? objN : Unit.f71706a;
    }

    @Override // x70.d
    public final x70.d f(CoroutineContext coroutineContext, int i5, v70.a aVar) {
        return new g(this.f93901d, this.f93902e, coroutineContext, i5, aVar);
    }

    @Override // x70.d
    public final m g() {
        return new g(this.f93901d, this.f93902e);
    }

    @Override // x70.d
    public final v70.z h(t70.j0 j0Var) {
        if (this.f93902e && f93900f.getAndSet(this, 1) == 1) {
            throw new IllegalStateException("ReceiveChannel.consumeAsFlow can be collected just once");
        }
        return this.f95220b == -3 ? this.f93901d : super.h(j0Var);
    }

    public g(v70.z zVar, boolean z11, CoroutineContext coroutineContext, int i5, v70.a aVar) {
        super(coroutineContext, i5, aVar);
        this.f93901d = zVar;
        this.f93902e = z11;
    }
}
