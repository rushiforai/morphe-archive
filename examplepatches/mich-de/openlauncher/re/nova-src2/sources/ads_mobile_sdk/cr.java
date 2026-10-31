package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class cr extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f1979a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ dr f1980b;

    /* renamed from: c, reason: collision with root package name */
    public int f1981c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public cr(dr drVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f1980b = drVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f1979a = obj;
        this.f1981c |= Integer.MIN_VALUE;
        return dr.c(this.f1980b, this);
    }
}
