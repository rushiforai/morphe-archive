package e00;

import android.content.Context;
import java.io.IOException;
import kotlin.ExceptionsKt;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Reflection;

/* loaded from: classes4.dex */
public final class v4 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f51084t;

    /* renamed from: u, reason: collision with root package name */
    public int f51085u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ i6 f51086v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ Context f51087w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ v4(i6 i6Var, Context context, Continuation continuation, int i5) {
        super(2, continuation);
        this.f51084t = i5;
        this.f51086v = i6Var;
        this.f51087w = context;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f51084t) {
            case 0:
                return new v4(this.f51086v, this.f51087w, continuation, 0);
            default:
                return new v4(this.f51086v, this.f51087w, continuation, 1);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        t70.j0 j0Var = (t70.j0) obj;
        Continuation continuation = (Continuation) obj2;
        switch (this.f51084t) {
        }
        return ((v4) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) throws IOException {
        switch (this.f51084t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f51085u;
                try {
                    if (i5 == 0) {
                        ResultKt.b(obj);
                        Function2 function2 = this.f51086v.f50527f;
                        Context context = this.f51087w;
                        this.f51085u = 1;
                        obj = function2.invoke(context, this);
                        if (obj == coroutineSingletons) {
                            return coroutineSingletons;
                        }
                    } else {
                        if (i5 != 1) {
                            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                        }
                        ResultKt.b(obj);
                    }
                    return (j6) obj;
                } catch (Exception e3) {
                    String strF1 = b70.g.f1(b70.g.E1(r70.k.X0(ExceptionsKt.b(e3)), 5), "\n", null, null, 0, null, 62);
                    StringBuilder sbW = b.c0.w("Exception: ", Reflection.f71864a.getOrCreateKotlinClass(e3.getClass()).getSimpleName(), ": ", e3.getMessage(), "\n");
                    sbW.append(strF1);
                    return new j6(false, sbW.toString());
                }
            default:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                int i11 = this.f51085u;
                try {
                    if (i11 == 0) {
                        ResultKt.b(obj);
                        Function2 function22 = this.f51086v.f50527f;
                        Context context2 = this.f51087w;
                        this.f51085u = 1;
                        obj = function22.invoke(context2, this);
                        if (obj == coroutineSingletons2) {
                            return coroutineSingletons2;
                        }
                    } else {
                        if (i11 != 1) {
                            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                        }
                        ResultKt.b(obj);
                    }
                    return (j6) obj;
                } catch (Exception e11) {
                    String strF12 = b70.g.f1(b70.g.E1(r70.k.X0(ExceptionsKt.b(e11)), 5), "\n", null, null, 0, null, 62);
                    StringBuilder sbW2 = b.c0.w("Exception: ", Reflection.f71864a.getOrCreateKotlinClass(e11.getClass()).getSimpleName(), ": ", e11.getMessage(), "\n");
                    sbW2.append(strF12);
                    return new j6(false, sbW2.toString());
                }
        }
    }
}
