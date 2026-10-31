package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class fj extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public wj f3361a;

    /* renamed from: b, reason: collision with root package name */
    public d f3362b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f3363c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ wj f3364d;

    /* renamed from: e, reason: collision with root package name */
    public int f3365e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public fj(wj wjVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f3364d = wjVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f3363c = obj;
        this.f3365e |= Integer.MIN_VALUE;
        return wj.b(this.f3364d, this);
    }
}
