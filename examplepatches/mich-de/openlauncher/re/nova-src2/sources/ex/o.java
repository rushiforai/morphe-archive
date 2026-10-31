package ex;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class o extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f53097t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ q f53098u;

    /* renamed from: v, reason: collision with root package name */
    public int f53099v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public o(q qVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f53098u = qVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f53097t = obj;
        this.f53099v |= Integer.MIN_VALUE;
        Object objA = this.f53098u.a(null, null, null, this);
        return objA == CoroutineSingletons.f71806a ? objA : new Result(objA);
    }
}
