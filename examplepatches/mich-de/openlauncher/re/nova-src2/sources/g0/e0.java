package g0;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final class e0 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public Ref.ObjectRef f56500t;

    /* renamed from: u, reason: collision with root package name */
    public int f56501u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f56502v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ Ref.ObjectRef f56503w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ g0 f56504x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e0(Ref.ObjectRef objectRef, g0 g0Var, Continuation continuation) {
        super(2, continuation);
        this.f56503w = objectRef;
        this.f56504x = g0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        e0 e0Var = new e0(this.f56503w, this.f56504x, continuation);
        e0Var.f56502v = obj;
        return e0Var;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((e0) create((Function1) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    /* JADX WARN: Removed duplicated region for block: B:11:0x002b  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:20:0x0041 -> B:25:0x0053). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:22:0x004d -> B:24:0x0050). Please report as a decompilation issue!!! */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invokeSuspend(Object obj) throws Throwable {
        Function1 function1;
        Object obj2;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f56501u;
        if (i5 == 0) {
            ResultKt.b(obj);
            function1 = (Function1) this.f56502v;
            objectRef = this.f56503w;
            obj2 = objectRef.f71863a;
            if (obj2 instanceof p) {
            }
            return Unit.f71706a;
        }
        if (i5 != 1) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        Ref.ObjectRef objectRef = this.f56500t;
        function1 = (Function1) this.f56502v;
        ResultKt.b(obj);
        q qVar = (q) obj;
        objectRef.f71863a = qVar;
        objectRef = this.f56503w;
        obj2 = objectRef.f71863a;
        if (!(obj2 instanceof p) || (obj2 instanceof m)) {
            return Unit.f71706a;
        }
        qVar = null;
        n nVar = obj2 instanceof n ? (n) obj2 : null;
        if (nVar != null) {
            function1.invoke(nVar);
        }
        v70.i iVar = this.f56504x.f56537e;
        if (iVar != null) {
            this.f56502v = function1;
            this.f56500t = objectRef;
            this.f56501u = 1;
            obj = iVar.q(this);
            if (obj == coroutineSingletons) {
                return coroutineSingletons;
            }
            q qVar2 = (q) obj;
        }
        objectRef.f71863a = qVar2;
        objectRef = this.f56503w;
        obj2 = objectRef.f71863a;
        if (obj2 instanceof p) {
        }
        return Unit.f71706a;
    }
}
