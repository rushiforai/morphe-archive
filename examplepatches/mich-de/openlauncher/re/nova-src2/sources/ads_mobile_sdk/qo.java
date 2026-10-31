package ads_mobile_sdk;

import java.lang.ref.WeakReference;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;

/* loaded from: classes.dex */
public final class qo implements b.db {

    /* renamed from: a, reason: collision with root package name */
    public final WeakReference f8747a;

    /* renamed from: b, reason: collision with root package name */
    public final g0 f8748b;

    public qo(WeakReference weakReference, g0 g0Var) {
        this.f8747a = weakReference;
        this.f8748b = g0Var;
    }

    @Override // b.db
    public final Object b(long j11, SuspendLambda suspendLambda) throws Throwable {
        uo uoVar = (uo) this.f8747a.get();
        if (uoVar != null) {
            Object objB = uoVar.b(j11, suspendLambda);
            return objB == CoroutineSingletons.f71806a ? objB : Unit.f71706a;
        }
        this.f8748b.a(this);
        return Unit.f71706a;
    }

    @Override // b.db
    public final Object d(long j11, SuspendLambda suspendLambda) throws Throwable {
        uo uoVar = (uo) this.f8747a.get();
        if (uoVar != null) {
            Object objD = uoVar.d(j11, suspendLambda);
            return objD == CoroutineSingletons.f71806a ? objD : Unit.f71706a;
        }
        this.f8748b.a(this);
        return Unit.f71706a;
    }
}
