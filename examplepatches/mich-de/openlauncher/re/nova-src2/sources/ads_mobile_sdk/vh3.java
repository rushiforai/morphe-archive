package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class vh3 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public ci3 f10787a;

    /* renamed from: b, reason: collision with root package name */
    public String f10788b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f10789c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ ci3 f10790d;

    /* renamed from: e, reason: collision with root package name */
    public int f10791e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public vh3(ci3 ci3Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f10790d = ci3Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f10789c = obj;
        this.f10791e |= Integer.MIN_VALUE;
        return ci3.a(this.f10790d, null, null, this);
    }
}
