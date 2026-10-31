package dz;

import b.c9;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Ref;
import t70.j0;
import w70.i2;

/* loaded from: classes4.dex */
public final class f extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public int f49878t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ Ref.BooleanRef f49879u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ g f49880v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ Ref.ObjectRef f49881w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ Ref.BooleanRef f49882x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f(g gVar, Continuation continuation, Ref.BooleanRef booleanRef, Ref.BooleanRef booleanRef2, Ref.ObjectRef objectRef) {
        super(2, continuation);
        this.f49879u = booleanRef;
        this.f49880v = gVar;
        this.f49881w = objectRef;
        this.f49882x = booleanRef2;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        Ref.ObjectRef objectRef = this.f49881w;
        return new f(this.f49880v, continuation, this.f49879u, this.f49882x, objectRef);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        ((f) create((j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
        return CoroutineSingletons.f71806a;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f49878t;
        if (i5 != 0) {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            throw c9.o(obj);
        }
        ResultKt.b(obj);
        py.c.f83128b.getClass();
        i2 i2Var = py.c.f83134h;
        Ref.ObjectRef objectRef = this.f49881w;
        e eVar = new e(this.f49880v, this.f49879u, this.f49882x, objectRef);
        this.f49878t = 1;
        i2Var.collect(eVar, this);
        return coroutineSingletons;
    }
}
