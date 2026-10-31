package n1;

import ab.c0;
import kotlin.Unit;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;

/* loaded from: classes2.dex */
public final class q implements o {

    /* renamed from: b, reason: collision with root package name */
    public static final c0 f77678b = new c0(7, p.f77677j, e.f77636l);

    /* renamed from: a, reason: collision with root package name */
    public final c0.e f77679a;

    public q(c0.e eVar) {
        this.f77679a = eVar;
    }

    public final Object a(float f11, SuspendLambda suspendLambda) {
        Object objG = this.f77679a.g(new Float(f11), suspendLambda);
        return objG == CoroutineSingletons.f71806a ? objG : Unit.f71706a;
    }
}
