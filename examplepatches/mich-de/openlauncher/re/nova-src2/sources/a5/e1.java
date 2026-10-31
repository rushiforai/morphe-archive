package a5;

import android.view.View;
import android.view.ViewGroup;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.RestrictedSuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.sequences.SequenceScope;

/* loaded from: classes.dex */
public final class e1 extends RestrictedSuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public int f274t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f275u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ View f276v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e1(View view, Continuation continuation) {
        super(2, continuation);
        this.f276v = view;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        e1 e1Var = new e1(this.f276v, continuation);
        e1Var.f275u = obj;
        return e1Var;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((e1) create((SequenceScope) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f274t;
        View view = this.f276v;
        if (i5 == 0) {
            ResultKt.b(obj);
            SequenceScope sequenceScope = (SequenceScope) this.f275u;
            this.f275u = sequenceScope;
            this.f274t = 1;
            sequenceScope.c(view, this);
            return coroutineSingletons;
        }
        if (i5 == 1) {
            SequenceScope sequenceScope2 = (SequenceScope) this.f275u;
            ResultKt.b(obj);
            if (view instanceof ViewGroup) {
                d1 d1Var = new d1((ViewGroup) view, 0);
                this.f275u = null;
                this.f274t = 2;
                sequenceScope2.getClass();
                Object objD = sequenceScope2.d(d1Var.iterator(), this);
                if (objD != coroutineSingletons) {
                    objD = Unit.f71706a;
                }
                if (objD == coroutineSingletons) {
                    return coroutineSingletons;
                }
            }
        } else {
            if (i5 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
        }
        return Unit.f71706a;
    }
}
