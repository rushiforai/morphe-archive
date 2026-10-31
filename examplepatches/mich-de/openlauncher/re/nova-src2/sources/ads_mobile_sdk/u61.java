package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class u61 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public b71 f10207a;

    /* renamed from: b, reason: collision with root package name */
    public d f10208b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f10209c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ b71 f10210d;

    /* renamed from: e, reason: collision with root package name */
    public int f10211e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public u61(b71 b71Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f10210d = b71Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f10209c = obj;
        this.f10211e |= Integer.MIN_VALUE;
        return b71.a(this.f10210d, this);
    }
}
