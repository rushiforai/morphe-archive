package h6;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final class t0 extends SuspendLambda implements Function2 {
    public final /* synthetic */ SuspendLambda A;

    /* renamed from: t, reason: collision with root package name */
    public Ref.ObjectRef f59446t;

    /* renamed from: u, reason: collision with root package name */
    public Ref.ObjectRef f59447u;

    /* renamed from: v, reason: collision with root package name */
    public t70.j0 f59448v;

    /* renamed from: w, reason: collision with root package name */
    public int f59449w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ u f59450x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ t f59451y;

    /* renamed from: z, reason: collision with root package name */
    public final /* synthetic */ t70.j0 f59452z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Multi-variable type inference failed */
    public t0(u uVar, t tVar, t70.j0 j0Var, Function2 function2, Continuation continuation) {
        super(2, continuation);
        this.f59450x = uVar;
        this.f59451y = tVar;
        this.f59452z = j0Var;
        this.A = (SuspendLambda) function2;
    }

    /* JADX WARN: Type inference failed for: r4v0, types: [kotlin.coroutines.jvm.internal.SuspendLambda, kotlin.jvm.functions.Function2] */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new t0(this.f59450x, this.f59451y, this.f59452z, this.A, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((t0) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x0083  */
    /* JADX WARN: Removed duplicated region for block: B:26:0x008c  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x009b  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x00a4  */
    /* JADX WARN: Removed duplicated region for block: B:42:? A[SYNTHETIC] */
    /* JADX WARN: Type inference failed for: r11v0, types: [kotlin.coroutines.jvm.internal.SuspendLambda, kotlin.jvm.functions.Function2] */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invokeSuspend(Object obj) throws Throwable {
        Ref.ObjectRef objectRef;
        Throwable th2;
        Ref.ObjectRef objectRef2;
        t70.r1 r1Var;
        y yVar;
        t70.r1 r1Var2;
        y yVar2;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f59449w;
        u uVar = this.f59450x;
        if (i5 == 0) {
            ResultKt.b(obj);
            if (uVar.b() == t.f59440a) {
                return Unit.f71706a;
            }
            Ref.ObjectRef objectRef3 = new Ref.ObjectRef();
            objectRef = new Ref.ObjectRef();
            try {
                t tVar = this.f59451y;
                t70.j0 j0Var = this.f59452z;
                ?? r11 = this.A;
                this.f59446t = objectRef3;
                this.f59447u = objectRef;
                this.f59448v = j0Var;
                this.f59449w = 1;
                t70.m mVar = new t70.m(1, IntrinsicsKt.b(this));
                mVar.t();
                s.Companion.getClass();
                s0 s0Var = new s0(q.b(tVar), objectRef3, j0Var, q.a(tVar), mVar, new c80.d(), r11);
                objectRef.f71863a = s0Var;
                uVar.a(s0Var);
                if (mVar.s() == coroutineSingletons) {
                    return coroutineSingletons;
                }
                objectRef2 = objectRef3;
                r1Var2 = (t70.r1) objectRef2.f71863a;
                if (r1Var2 != null) {
                }
                yVar2 = (y) objectRef.f71863a;
                if (yVar2 != null) {
                }
                return Unit.f71706a;
            } catch (Throwable th3) {
                th2 = th3;
                objectRef2 = objectRef3;
                r1Var = (t70.r1) objectRef2.f71863a;
                if (r1Var != null) {
                    r1Var.c(null);
                }
                yVar = (y) objectRef.f71863a;
                if (yVar != null) {
                    throw th2;
                }
                uVar.c(yVar);
                throw th2;
            }
        }
        if (i5 != 1) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        t70.j0 j0Var2 = this.f59448v;
        objectRef = this.f59447u;
        objectRef2 = this.f59446t;
        try {
            ResultKt.b(obj);
            r1Var2 = (t70.r1) objectRef2.f71863a;
            if (r1Var2 != null) {
                r1Var2.c(null);
            }
            yVar2 = (y) objectRef.f71863a;
            if (yVar2 != null) {
                uVar.c(yVar2);
            }
            return Unit.f71706a;
        } catch (Throwable th4) {
            th2 = th4;
            r1Var = (t70.r1) objectRef2.f71863a;
            if (r1Var != null) {
            }
            yVar = (y) objectRef.f71863a;
            if (yVar != null) {
            }
        }
    }
}
