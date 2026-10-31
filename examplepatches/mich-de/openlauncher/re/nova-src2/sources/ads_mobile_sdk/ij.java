package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class ij extends ContinuationImpl {

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f4780c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ wj f4781d;

    /* renamed from: e, reason: collision with root package name */
    public int f4782e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ij(wj wjVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f4781d = wjVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f4780c = obj;
        this.f4782e |= Integer.MIN_VALUE;
        return this.f4781d.a$1(this);
    }
}
