package w70;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class s1 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public t1 f94009t;

    /* renamed from: u, reason: collision with root package name */
    public n f94010u;

    /* renamed from: v, reason: collision with root package name */
    public v1 f94011v;

    /* renamed from: w, reason: collision with root package name */
    public t70.r1 f94012w;

    /* renamed from: x, reason: collision with root package name */
    public /* synthetic */ Object f94013x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ t1 f94014y;

    /* renamed from: z, reason: collision with root package name */
    public int f94015z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public s1(t1 t1Var, Continuation continuation) {
        super(continuation);
        this.f94014y = t1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) throws Throwable {
        this.f94013x = obj;
        this.f94015z |= Integer.MIN_VALUE;
        t1.k(this.f94014y, null, this);
        return CoroutineSingletons.f71806a;
    }
}
