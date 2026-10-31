package gx;

import android.app.Activity;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Ref;

/* loaded from: classes4.dex */
public final class h0 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public int f58078t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ e f58079u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ dx.f f58080v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ Activity f58081w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ Ref.ObjectRef f58082x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public h0(e eVar, dx.f fVar, Activity activity, Ref.ObjectRef objectRef, Continuation continuation) {
        super(2, continuation);
        this.f58079u = eVar;
        this.f58080v = fVar;
        this.f58081w = activity;
        this.f58082x = objectRef;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new h0(this.f58079u, this.f58080v, this.f58081w, this.f58082x, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((h0) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        Object objA;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f58078t;
        if (i5 == 0) {
            ResultKt.b(obj);
            d0 d0Var = (d0) this.f58082x.f71863a;
            this.f58078t = 1;
            objA = this.f58079u.a(this.f58080v, this.f58081w, d0Var, this);
            if (objA == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            objA = ((Result) obj).f71688a;
        }
        return new Result(objA);
    }
}
