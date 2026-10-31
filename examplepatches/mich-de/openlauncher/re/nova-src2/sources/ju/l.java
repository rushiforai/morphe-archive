package ju;

import com.stripe.android.core.networking.ApiRequest$Options;
import com.stripe.android.model.StripeIntent;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class l extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public n f69964t;

    /* renamed from: u, reason: collision with root package name */
    public ww.a f69965u;

    /* renamed from: v, reason: collision with root package name */
    public StripeIntent f69966v;

    /* renamed from: w, reason: collision with root package name */
    public ApiRequest$Options f69967w;

    /* renamed from: x, reason: collision with root package name */
    public /* synthetic */ Object f69968x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ n f69969y;

    /* renamed from: z, reason: collision with root package name */
    public int f69970z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public l(n nVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f69969y = nVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f69968x = obj;
        this.f69970z |= Integer.MIN_VALUE;
        return this.f69969y.d(null, null, null, this);
    }
}
