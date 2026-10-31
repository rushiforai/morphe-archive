package ex;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class t extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public dx.e f53104t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f53105u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ u f53106v;

    /* renamed from: w, reason: collision with root package name */
    public int f53107w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public t(u uVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f53106v = uVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f53105u = obj;
        this.f53107w |= Integer.MIN_VALUE;
        Object objA = this.f53106v.a(null, null, null, this);
        return objA == CoroutineSingletons.f71806a ? objA : new Result(objA);
    }
}
