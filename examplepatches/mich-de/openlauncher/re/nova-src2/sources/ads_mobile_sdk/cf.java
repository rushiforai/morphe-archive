package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class cf extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f1846a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ df f1847b;

    /* renamed from: c, reason: collision with root package name */
    public int f1848c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public cf(df dfVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f1847b = dfVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f1846a = obj;
        this.f1848c |= Integer.MIN_VALUE;
        return this.f1847b.a(this);
    }
}
