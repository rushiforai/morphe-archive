package tx;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function3;

/* loaded from: classes4.dex */
public final class o4 extends SuspendLambda implements Function3 {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ boolean f89930t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ p0 f89931u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ q4 f89932v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public o4(q4 q4Var, Continuation continuation) {
        super(3, continuation);
        this.f89932v = q4Var;
    }

    @Override // kotlin.jvm.functions.Function3
    public final Object invoke(Object obj, Object obj2, Object obj3) {
        boolean zBooleanValue = ((Boolean) obj).booleanValue();
        o4 o4Var = new o4(this.f89932v, (Continuation) obj3);
        o4Var.f89930t = zBooleanValue;
        o4Var.f89931u = (p0) obj2;
        return o4Var.invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ResultKt.b(obj);
        boolean z11 = this.f89930t;
        boolean zB = this.f89931u.b();
        if (zB && z11) {
            return new k4(l4.f89868a);
        }
        if (zB && !z11) {
            return new k4(l4.f89869b);
        }
        if (zB || !z11) {
            return j4.f89830a;
        }
        n4 n4Var = (n4) this.f89932v.f89967c.getValue();
        return n4Var instanceof i4 ? n4Var : new m4(0);
    }
}
