package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class lj1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public th3 f6248a;

    /* renamed from: b, reason: collision with root package name */
    public th3 f6249b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f6250c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ zj1 f6251d;

    /* renamed from: e, reason: collision with root package name */
    public int f6252e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public lj1(zj1 zj1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f6251d = zj1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f6250c = obj;
        this.f6252e |= Integer.MIN_VALUE;
        return this.f6251d.a((String) null, this);
    }
}
