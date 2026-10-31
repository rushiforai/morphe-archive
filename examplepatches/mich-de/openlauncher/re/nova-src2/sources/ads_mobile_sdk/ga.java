package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class ga extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public ja f3741a;

    /* renamed from: b, reason: collision with root package name */
    public qo3 f3742b;

    /* renamed from: c, reason: collision with root package name */
    public d f3743c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f3744d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ ja f3745e;

    /* renamed from: f, reason: collision with root package name */
    public int f3746f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ga(ja jaVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f3745e = jaVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f3744d = obj;
        this.f3746f |= Integer.MIN_VALUE;
        return this.f3745e.a(null, this);
    }
}
