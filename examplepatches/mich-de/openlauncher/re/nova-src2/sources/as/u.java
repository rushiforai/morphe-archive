package as;

import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class u extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public com.stripe.android.googlepaylauncher.j f15640t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f15641u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ com.stripe.android.googlepaylauncher.j f15642v;

    /* renamed from: w, reason: collision with root package name */
    public int f15643w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public u(com.stripe.android.googlepaylauncher.j jVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f15642v = jVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f15641u = obj;
        this.f15643w |= Integer.MIN_VALUE;
        Object objE = com.stripe.android.googlepaylauncher.j.e(this.f15642v, this);
        return objE == CoroutineSingletons.f71806a ? objE : new Result(objE);
    }
}
