package vt;

import com.stripe.android.model.PaymentMethod;
import com.stripe.android.model.SetupIntent;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class t extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public u f93121t;

    /* renamed from: u, reason: collision with root package name */
    public SetupIntent f93122u;

    /* renamed from: v, reason: collision with root package name */
    public PaymentMethod f93123v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f93124w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ u f93125x;

    /* renamed from: y, reason: collision with root package name */
    public int f93126y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public t(u uVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f93125x = uVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f93124w = obj;
        this.f93126y |= Integer.MIN_VALUE;
        this.f93125x.a(null, null, this);
        return CoroutineSingletons.f71806a;
    }
}
