package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class s62 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Object f9422a;

    /* renamed from: b, reason: collision with root package name */
    public Object f9423b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f9424c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ w62 f9425d;

    /* renamed from: e, reason: collision with root package name */
    public int f9426e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public s62(w62 w62Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f9425d = w62Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f9424c = obj;
        this.f9426e |= Integer.MIN_VALUE;
        return w62.d(this.f9425d, this);
    }
}
