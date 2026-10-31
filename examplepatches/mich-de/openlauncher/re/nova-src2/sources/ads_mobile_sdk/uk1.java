package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class uk1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public zk1 f10383a;

    /* renamed from: b, reason: collision with root package name */
    public String f10384b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f10385c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ zk1 f10386d;

    /* renamed from: e, reason: collision with root package name */
    public int f10387e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public uk1(zk1 zk1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f10386d = zk1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f10385c = obj;
        this.f10387e |= Integer.MIN_VALUE;
        return zk1.a(this.f10386d, (String) null, this);
    }
}
