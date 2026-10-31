package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class b2 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public th3 f1230a;

    /* renamed from: b, reason: collision with root package name */
    public th3 f1231b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f1232c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ e2 f1233d;

    /* renamed from: e, reason: collision with root package name */
    public int f1234e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b2(e2 e2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f1233d = e2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f1232c = obj;
        this.f1234e |= Integer.MIN_VALUE;
        return this.f1233d.a(this);
    }
}
