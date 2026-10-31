package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class vj1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public th3 f10799a;

    /* renamed from: b, reason: collision with root package name */
    public th3 f10800b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f10801c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ zj1 f10802d;

    /* renamed from: e, reason: collision with root package name */
    public int f10803e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public vj1(zj1 zj1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f10802d = zj1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f10801c = obj;
        this.f10803e |= Integer.MIN_VALUE;
        return this.f10802d.c((String) null, this);
    }
}
