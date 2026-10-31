package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class bk3 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f1456a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ dk3 f1457b;

    /* renamed from: c, reason: collision with root package name */
    public int f1458c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public bk3(dk3 dk3Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f1457b = dk3Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f1456a = obj;
        this.f1458c |= Integer.MIN_VALUE;
        return this.f1457b.d(this);
    }
}
