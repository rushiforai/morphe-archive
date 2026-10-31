package vt;

import com.stripe.android.model.PaymentMethod;
import com.stripe.android.model.SetupIntent;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class v extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public w f93138t;

    /* renamed from: u, reason: collision with root package name */
    public SetupIntent f93139u;

    /* renamed from: v, reason: collision with root package name */
    public PaymentMethod f93140v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f93141w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ w f93142x;

    /* renamed from: y, reason: collision with root package name */
    public int f93143y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public v(w wVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f93142x = wVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f93141w = obj;
        this.f93143y |= Integer.MIN_VALUE;
        return this.f93142x.a(null, null, this);
    }
}
