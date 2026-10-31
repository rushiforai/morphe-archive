package t5;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final class b0 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public Ref.IntRef f88529t;

    /* renamed from: u, reason: collision with root package name */
    public int f88530u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f88531v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ Ref.IntRef f88532w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ c0 f88533x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ Object f88534y;

    /* renamed from: z, reason: collision with root package name */
    public final /* synthetic */ boolean f88535z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b0(Ref.IntRef intRef, c0 c0Var, Object obj, boolean z11, Continuation continuation) {
        super(2, continuation);
        this.f88532w = intRef;
        this.f88533x = c0Var;
        this.f88534y = obj;
        this.f88535z = z11;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        b0 b0Var = new b0(this.f88532w, this.f88533x, this.f88534y, this.f88535z, continuation);
        b0Var.f88531v = obj;
        return b0Var;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((b0) create((o1) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    /* JADX WARN: Code restructure failed: missing block: B:15:0x0056, code lost:
    
        if (r6.b(r2, r7) == r0) goto L16;
     */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invokeSuspend(Object obj) {
        o1 o1Var;
        Ref.IntRef intRef;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f88530u;
        Object obj2 = this.f88534y;
        c0 c0Var = this.f88533x;
        Ref.IntRef intRef2 = this.f88532w;
        if (i5 == 0) {
            ResultKt.b(obj);
            o1 o1Var2 = (o1) this.f88531v;
            p0 p0VarG = c0Var.g();
            this.f88531v = o1Var2;
            this.f88529t = intRef2;
            this.f88530u = 1;
            Object objC = p0VarG.c(this);
            if (objC != coroutineSingletons) {
                o1Var = o1Var2;
                obj = objC;
                intRef = intRef2;
            }
            return coroutineSingletons;
        }
        if (i5 != 1) {
            if (i5 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            if (this.f88535z) {
                c0Var.f88550h.K(new c(obj2, obj2 != null ? obj2.hashCode() : 0, intRef2.f71861a));
            }
            return Unit.f71706a;
        }
        intRef = this.f88529t;
        o1Var = (o1) this.f88531v;
        ResultKt.b(obj);
        intRef.f71861a = ((Number) obj).intValue();
        this.f88531v = null;
        this.f88529t = null;
        this.f88530u = 2;
    }
}
