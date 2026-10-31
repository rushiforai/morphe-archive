package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class yk1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public String f12179a;

    /* renamed from: b, reason: collision with root package name */
    public t70.r f12180b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f12181c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ zk1 f12182d;

    /* renamed from: e, reason: collision with root package name */
    public int f12183e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public yk1(zk1 zk1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f12182d = zk1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f12181c = obj;
        this.f12183e |= Integer.MIN_VALUE;
        return zk1.a(this.f12182d, (String) null, (t70.s) null, this);
    }
}
