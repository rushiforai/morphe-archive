package w00;

import android.net.Uri;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import p1.e1;
import t70.m0;
import t70.y0;

/* loaded from: classes4.dex */
public final class o extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f93591t;

    /* renamed from: u, reason: collision with root package name */
    public int f93592u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ v30.c f93593v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ String f93594w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ e1 f93595x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ o(v30.c cVar, String str, e1 e1Var, Continuation continuation, int i5) {
        super(2, continuation);
        this.f93591t = i5;
        this.f93593v = cVar;
        this.f93594w = str;
        this.f93595x = e1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f93591t) {
            case 0:
                return new o(this.f93593v, this.f93594w, this.f93595x, continuation, 0);
            default:
                return new o(this.f93593v, this.f93594w, this.f93595x, continuation, 1);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        t70.j0 j0Var = (t70.j0) obj;
        Continuation continuation = (Continuation) obj2;
        switch (this.f93591t) {
        }
        return ((o) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        switch (this.f93591t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f93592u;
                try {
                    if (i5 == 0) {
                        ResultKt.b(obj);
                        v30.c cVar = this.f93593v;
                        String str = this.f93594w;
                        this.f93592u = 1;
                        obj = cVar.a(str, this);
                        if (obj == coroutineSingletons) {
                            return coroutineSingletons;
                        }
                    } else {
                        if (i5 != 1) {
                            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                        }
                        ResultKt.b(obj);
                    }
                    this.f93595x.setValue((Uri) obj);
                } catch (Exception e3) {
                    e3.printStackTrace();
                }
                return Unit.f71706a;
            default:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                int i11 = this.f93592u;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    a80.e eVar = y0.f88884a;
                    a80.d dVar = a80.d.f488c;
                    o oVar = new o(this.f93593v, this.f93594w, this.f93595x, null, 0);
                    this.f93592u = 1;
                    if (m0.y(dVar, oVar, this) == coroutineSingletons2) {
                        return coroutineSingletons2;
                    }
                } else {
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
        }
    }
}
