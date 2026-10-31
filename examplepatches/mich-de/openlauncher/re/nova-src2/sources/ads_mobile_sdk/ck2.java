package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class ck2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public dq2 f1924a;

    /* renamed from: b, reason: collision with root package name */
    public /* synthetic */ Object f1925b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ dk2 f1926c;

    /* renamed from: d, reason: collision with root package name */
    public int f1927d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ck2(dk2 dk2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f1926c = dk2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f1925b = obj;
        this.f1927d |= Integer.MIN_VALUE;
        return this.f1926c.c(this);
    }
}
