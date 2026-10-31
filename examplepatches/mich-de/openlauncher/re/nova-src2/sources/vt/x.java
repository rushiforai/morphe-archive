package vt;

import android.os.Parcelable;
import com.stripe.android.paymentsheet.PaymentSheet$IntentConfiguration;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class x extends ContinuationImpl {
    public int A;

    /* renamed from: t, reason: collision with root package name */
    public Object f93146t;

    /* renamed from: u, reason: collision with root package name */
    public Object f93147u;

    /* renamed from: v, reason: collision with root package name */
    public Parcelable f93148v;

    /* renamed from: w, reason: collision with root package name */
    public l f93149w;

    /* renamed from: x, reason: collision with root package name */
    public PaymentSheet$IntentConfiguration f93150x;

    /* renamed from: y, reason: collision with root package name */
    public /* synthetic */ Object f93151y;

    /* renamed from: z, reason: collision with root package name */
    public final /* synthetic */ y f93152z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public x(y yVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f93152z = yVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f93151y = obj;
        this.A |= Integer.MIN_VALUE;
        return this.f93152z.a(null, null, null, null, this);
    }
}
