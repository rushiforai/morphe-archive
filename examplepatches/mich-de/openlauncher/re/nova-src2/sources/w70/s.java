package w70;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Ref;

/* loaded from: classes.dex */
public final class s extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public Ref.ObjectRef f94003t;

    /* renamed from: u, reason: collision with root package name */
    public int f94004u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f94005v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ Ref.ObjectRef f94006w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ n f94007x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public s(Continuation continuation, Ref.ObjectRef objectRef, n nVar) {
        super(2, continuation);
        this.f94006w = objectRef;
        this.f94007x = nVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        s sVar = new s(continuation, this.f94006w, this.f94007x);
        sVar.f94005v = obj;
        return sVar;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((s) create(new v70.r(((v70.r) obj).f92194a), (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) throws Throwable {
        Ref.ObjectRef objectRef;
        Ref.ObjectRef objectRef2;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f94004u;
        if (i5 == 0) {
            ResultKt.b(obj);
            Object obj2 = ((v70.r) this.f94005v).f92194a;
            boolean z11 = obj2 instanceof v70.q;
            objectRef = this.f94006w;
            if (!z11) {
                objectRef.f71863a = obj2;
            }
            if (z11) {
                v70.p pVar = obj2 instanceof v70.p ? (v70.p) obj2 : null;
                Throwable th2 = pVar != null ? pVar.f92192a : null;
                if (th2 != null) {
                    throw th2;
                }
                Object obj3 = objectRef.f71863a;
                if (obj3 != null) {
                    Object obj4 = obj3 != x70.b.f95216b ? obj3 : null;
                    this.f94005v = obj2;
                    this.f94003t = objectRef;
                    this.f94004u = 1;
                    if (this.f94007x.emit(obj4, this) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                    objectRef2 = objectRef;
                }
                objectRef.f71863a = x70.b.f95218d;
            }
            return Unit.f71706a;
        }
        if (i5 != 1) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        objectRef2 = this.f94003t;
        ResultKt.b(obj);
        objectRef = objectRef2;
        objectRef.f71863a = x70.b.f95218d;
        return Unit.f71706a;
    }
}
