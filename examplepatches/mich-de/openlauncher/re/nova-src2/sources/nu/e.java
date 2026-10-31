package nu;

import com.stripe.android.payments.paymentlauncher.n;
import kotlin.Result;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class e extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f78583t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ n f78584u;

    /* renamed from: v, reason: collision with root package name */
    public int f78585v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e(n nVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f78584u = nVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f78583t = obj;
        this.f78585v |= Integer.MIN_VALUE;
        Object objE = n.e(this.f78584u, null, null, this);
        return objE == CoroutineSingletons.f71806a ? objE : new Result(objE);
    }
}
