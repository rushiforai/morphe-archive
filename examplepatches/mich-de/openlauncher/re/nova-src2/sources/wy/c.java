package wy;

import com.teslacoilsw.launcher.drawer.drawergroups.smart.crowdsourced.SmartFolderSubmissionPayload;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import t70.j0;
import x80.e0;

/* loaded from: classes4.dex */
public final class c extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f94889t;

    /* renamed from: u, reason: collision with root package name */
    public int f94890u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ SmartFolderSubmissionPayload f94891v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ c(SmartFolderSubmissionPayload smartFolderSubmissionPayload, Continuation continuation, int i5) {
        super(2, continuation);
        this.f94889t = i5;
        this.f94891v = smartFolderSubmissionPayload;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f94889t) {
            case 0:
                return new c(this.f94891v, continuation, 0);
            default:
                return new c(this.f94891v, continuation, 1);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        j0 j0Var = (j0) obj;
        Continuation continuation = (Continuation) obj2;
        switch (this.f94889t) {
        }
        return ((c) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        int i5 = this.f94889t;
        SmartFolderSubmissionPayload smartFolderSubmissionPayload = this.f94891v;
        switch (i5) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i11 = this.f94890u;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    e0 e0Var = e.f94894a;
                    this.f94890u = 1;
                    if (e.a(smartFolderSubmissionPayload, this) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            default:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                int i12 = this.f94890u;
                if (i12 == 0) {
                    ResultKt.b(obj);
                    e0 e0Var2 = e.f94894a;
                    this.f94890u = 1;
                    if (e.a(smartFolderSubmissionPayload, this) == coroutineSingletons2) {
                        return coroutineSingletons2;
                    }
                } else {
                    if (i12 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
        }
    }
}
