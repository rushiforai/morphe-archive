package ys;

import com.stripe.android.model.ConsumerPaymentDetails;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class x0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public e1 f97611t;

    /* renamed from: u, reason: collision with root package name */
    public ConsumerPaymentDetails.PaymentDetails f97612u;

    /* renamed from: v, reason: collision with root package name */
    public es.f0 f97613v;

    /* renamed from: w, reason: collision with root package name */
    public boolean f97614w;

    /* renamed from: x, reason: collision with root package name */
    public /* synthetic */ Object f97615x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ e1 f97616y;

    /* renamed from: z, reason: collision with root package name */
    public int f97617z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public x0(e1 e1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f97616y = e1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f97615x = obj;
        this.f97617z |= Integer.MIN_VALUE;
        return e1.e(this.f97616y, null, this);
    }
}
