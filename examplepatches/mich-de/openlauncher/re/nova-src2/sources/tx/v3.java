package tx;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class v3 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f90037t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ a4 f90038u;

    /* renamed from: v, reason: collision with root package name */
    public int f90039v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public v3(a4 a4Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f90038u = a4Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f90037t = obj;
        this.f90039v |= Integer.MIN_VALUE;
        Object objD = this.f90038u.d(null, null, null, this);
        return objD == CoroutineSingletons.f71806a ? objD : new Result(objD);
    }
}
