package vt;

import com.stripe.android.model.PaymentMethodCreateParams;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class n extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public p f93083t;

    /* renamed from: u, reason: collision with root package name */
    public PaymentMethodCreateParams f93084u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f93085v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ p f93086w;

    /* renamed from: x, reason: collision with root package name */
    public int f93087x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public n(p pVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f93086w = pVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f93085v = obj;
        this.f93087x |= Integer.MIN_VALUE;
        return this.f93086w.c(null, this);
    }
}
