package fs;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class a0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f55727t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ f0 f55728u;

    /* renamed from: v, reason: collision with root package name */
    public int f55729v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a0(f0 f0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f55728u = f0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f55727t = obj;
        this.f55729v |= Integer.MIN_VALUE;
        Object objB = this.f55728u.b(null, null, null, null, null, null, this);
        return objB == CoroutineSingletons.f71806a ? objB : new Result(objB);
    }
}
