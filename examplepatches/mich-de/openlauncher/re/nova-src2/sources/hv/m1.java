package hv;

import java.util.List;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final class m1 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ Function1 f60404t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ List f60405u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ float f60406v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ float f60407w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public m1(Function1 function1, List list, float f11, float f12, Continuation continuation) {
        super(2, continuation);
        float f13 = v1.f60630a;
        this.f60404t = function1;
        this.f60405u = list;
        this.f60406v = f11;
        this.f60407w = f12;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        float f11 = v1.f60630a;
        return new m1(this.f60404t, this.f60405u, this.f60406v, this.f60407w, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((m1) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ResultKt.b(obj);
        float f11 = v1.f60630a;
        this.f60404t.invoke(new a(this.f60405u, this.f60406v, this.f60407w));
        return Unit.f71706a;
    }
}
