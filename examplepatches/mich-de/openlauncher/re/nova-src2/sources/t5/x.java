package t5;

import androidx.datastore.core.CorruptionException;
import java.io.Serializable;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Ref;

/* loaded from: classes2.dex */
public final class x extends SuspendLambda implements Function1 {

    /* renamed from: t, reason: collision with root package name */
    public Serializable f88740t;

    /* renamed from: u, reason: collision with root package name */
    public int f88741u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ Ref.ObjectRef f88742v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ c0 f88743w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ Ref.IntRef f88744x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public x(Ref.ObjectRef objectRef, c0 c0Var, Ref.IntRef intRef, Continuation continuation) {
        super(1, continuation);
        this.f88742v = objectRef;
        this.f88743w = c0Var;
        this.f88744x = intRef;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Continuation continuation) {
        return new x(this.f88742v, this.f88743w, this.f88744x, continuation);
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        return ((x) create((Continuation) obj)).invokeSuspend(Unit.f71706a);
    }

    /* JADX WARN: Code restructure failed: missing block: B:28:0x006a, code lost:
    
        if (r9 != r0) goto L30;
     */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invokeSuspend(Object obj) {
        Ref.ObjectRef objectRef;
        Ref.IntRef intRef;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f88741u;
        Ref.IntRef intRef2 = this.f88744x;
        Ref.ObjectRef objectRef2 = this.f88742v;
        c0 c0Var = this.f88743w;
        try {
        } catch (CorruptionException unused) {
            Object obj2 = objectRef2.f71863a;
            this.f88740t = intRef2;
            this.f88741u = 3;
            obj = c0Var.j(obj2, true, this);
        }
        if (i5 == 0) {
            ResultKt.b(obj);
            this.f88740t = objectRef2;
            this.f88741u = 1;
            obj = c0Var.i(this);
            if (obj == coroutineSingletons) {
                return coroutineSingletons;
            }
            objectRef = objectRef2;
        } else {
            if (i5 != 1) {
                if (i5 == 2) {
                    intRef = (Ref.IntRef) this.f88740t;
                    ResultKt.b(obj);
                    intRef.f71861a = ((Number) obj).intValue();
                    return Unit.f71706a;
                }
                if (i5 != 3) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                intRef2 = (Ref.IntRef) this.f88740t;
                ResultKt.b(obj);
                intRef2.f71861a = ((Number) obj).intValue();
                return Unit.f71706a;
            }
            objectRef = (Ref.ObjectRef) this.f88740t;
            ResultKt.b(obj);
        }
        objectRef.f71863a = obj;
        p0 p0VarG = c0Var.g();
        this.f88740t = intRef2;
        this.f88741u = 2;
        obj = p0VarG.d(this);
        if (obj == coroutineSingletons) {
            return coroutineSingletons;
        }
        intRef = intRef2;
        intRef.f71861a = ((Number) obj).intValue();
        return Unit.f71706a;
    }
}
