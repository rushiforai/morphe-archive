package ju;

import com.stripe.android.model.StripeIntent;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class m extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public StripeIntent.NextActionData.RedirectToUrl f69971t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f69972u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ n f69973v;

    /* renamed from: w, reason: collision with root package name */
    public int f69974w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public m(n nVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f69973v = nVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f69972u = obj;
        this.f69974w |= Integer.MIN_VALUE;
        return this.f69973v.f(null, null, this);
    }
}
