package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class hi extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public ji f4391a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f4392b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ ji f4393c;

    /* renamed from: d, reason: collision with root package name */
    public int f4394d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public hi(ji jiVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f4393c = jiVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f4392b = obj;
        this.f4394d |= Integer.MIN_VALUE;
        return ji.a(this.f4393c, this);
    }
}
