package tx;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class x3 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f90061t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ a4 f90062u;

    /* renamed from: v, reason: collision with root package name */
    public int f90063v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public x3(a4 a4Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f90062u = a4Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f90061t = obj;
        this.f90063v |= Integer.MIN_VALUE;
        Object objE = this.f90062u.e(null, null, null, this);
        return objE == CoroutineSingletons.f71806a ? objE : new Result(objE);
    }
}
