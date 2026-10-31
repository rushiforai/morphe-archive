package s8;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Ref;
import r8.n;
import t70.j0;

/* loaded from: classes2.dex */
public final class d extends SuspendLambda implements Function2 {
    public final /* synthetic */ m8.c A;

    /* renamed from: t, reason: collision with root package name */
    public int f86724t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ h f86725u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ Ref.ObjectRef f86726v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ Ref.ObjectRef f86727w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ x8.k f86728x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ Object f86729y;

    /* renamed from: z, reason: collision with root package name */
    public final /* synthetic */ Ref.ObjectRef f86730z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d(h hVar, Ref.ObjectRef objectRef, Ref.ObjectRef objectRef2, x8.k kVar, Object obj, Ref.ObjectRef objectRef3, m8.c cVar, Continuation continuation) {
        super(2, continuation);
        this.f86725u = hVar;
        this.f86726v = objectRef;
        this.f86727w = objectRef2;
        this.f86728x = kVar;
        this.f86729y = obj;
        this.f86730z = objectRef3;
        this.A = cVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new d(this.f86725u, this.f86726v, this.f86727w, this.f86728x, this.f86729y, this.f86730z, this.A, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((d) create((j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) throws Throwable {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f86724t;
        if (i5 != 0) {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return obj;
        }
        ResultKt.b(obj);
        n nVar = (n) this.f86726v.f71863a;
        m8.b bVar = (m8.b) this.f86727w.f71863a;
        x8.n nVar2 = (x8.n) this.f86730z.f71863a;
        this.f86724t = 1;
        Object objA = h.a(this.f86725u, nVar, bVar, this.f86728x, this.f86729y, nVar2, this.A, this);
        return objA == coroutineSingletons ? coroutineSingletons : objA;
    }
}
