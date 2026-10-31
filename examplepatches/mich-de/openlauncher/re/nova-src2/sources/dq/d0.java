package dq;

import com.stripe.android.core.networking.ApiRequest$Options;
import com.stripe.android.model.ConfirmStripeIntentParams;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class d0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public e0 f49301t;

    /* renamed from: u, reason: collision with root package name */
    public ww.a f49302u;

    /* renamed from: v, reason: collision with root package name */
    public ConfirmStripeIntentParams f49303v;

    /* renamed from: w, reason: collision with root package name */
    public ApiRequest$Options f49304w;

    /* renamed from: x, reason: collision with root package name */
    public /* synthetic */ Object f49305x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ e0 f49306y;

    /* renamed from: z, reason: collision with root package name */
    public int f49307z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d0(e0 e0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f49306y = e0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f49305x = obj;
        this.f49307z |= Integer.MIN_VALUE;
        return this.f49306y.e(null, null, null, this);
    }
}
