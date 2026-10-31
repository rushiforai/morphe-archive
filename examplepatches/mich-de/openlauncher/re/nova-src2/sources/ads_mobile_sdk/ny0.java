package ads_mobile_sdk;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes2.dex */
public final class ny0 extends SuspendLambda implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ sy0 f7727a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ my0 f7728b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ my0 f7729c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ boolean f7730d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ boolean f7731e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ny0(sy0 sy0Var, my0 my0Var, my0 my0Var2, boolean z11, boolean z12, Continuation continuation) {
        super(2, continuation);
        this.f7727a = sy0Var;
        this.f7728b = my0Var;
        this.f7729c = my0Var2;
        this.f7730d = z11;
        this.f7731e = z12;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new ny0(this.f7727a, this.f7728b, this.f7729c, this.f7730d, this.f7731e, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((ny0) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        Unit unit;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ResultKt.b(obj);
        sy0 sy0Var = this.f7727a;
        Object obj2 = sy0Var.f9733f;
        my0 my0Var = this.f7728b;
        my0 my0Var2 = this.f7729c;
        boolean z11 = this.f7730d;
        boolean z12 = this.f7731e;
        synchronized (obj2) {
            boolean z13 = my0Var != my0Var2;
            try {
                boolean z14 = sy0Var.f9736k;
                boolean z15 = !z14 && my0Var2 == my0.f7374c;
                boolean z16 = z13 && my0Var2 == my0.f7374c;
                boolean z17 = z13 && my0Var2 == my0.f7375d;
                boolean z18 = z13 && my0Var2 == my0.f7376e;
                boolean z19 = z11 != z12;
                sy0Var.f9736k = z14 || z15;
                if (z15) {
                    synchronized (sy0Var.f9733f) {
                    }
                }
                if (z16) {
                    synchronized (sy0Var.f9733f) {
                    }
                }
                if (z17) {
                    synchronized (sy0Var.f9733f) {
                    }
                }
                if (z18) {
                    sy0Var.getVideoLifecycleCallbacks();
                }
                if (z19) {
                    sy0Var.getVideoLifecycleCallbacks();
                }
                unit = Unit.f71706a;
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return unit;
    }
}
