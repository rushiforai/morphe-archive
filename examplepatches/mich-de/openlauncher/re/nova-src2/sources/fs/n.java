package fs;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class n extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Object f55806t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f55807u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ y f55808v;

    /* renamed from: w, reason: collision with root package name */
    public int f55809w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public n(y yVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f55808v = yVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f55807u = obj;
        this.f55809w |= Integer.MIN_VALUE;
        Object objN = this.f55808v.n(this);
        return objN == CoroutineSingletons.f71806a ? objN : new Result(objN);
    }
}
