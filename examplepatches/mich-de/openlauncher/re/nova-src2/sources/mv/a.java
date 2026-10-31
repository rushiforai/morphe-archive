package mv;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class a extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f76818t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ g f76819u;

    /* renamed from: v, reason: collision with root package name */
    public int f76820v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a(g gVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f76819u = gVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f76818t = obj;
        this.f76820v |= Integer.MIN_VALUE;
        Object objB = this.f76819u.b(null, null, null, null, null, this);
        return objB == CoroutineSingletons.f71806a ? objB : new Result(objB);
    }
}
