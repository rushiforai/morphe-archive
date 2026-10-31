package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class ke1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public th3 f5709a;

    /* renamed from: b, reason: collision with root package name */
    public th3 f5710b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f5711c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ re1 f5712d;

    /* renamed from: e, reason: collision with root package name */
    public int f5713e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ke1(re1 re1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f5712d = re1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f5711c = obj;
        this.f5713e |= Integer.MIN_VALUE;
        return re1.a(this.f5712d, null, null, null, this);
    }
}
