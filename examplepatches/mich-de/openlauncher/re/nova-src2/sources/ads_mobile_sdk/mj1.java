package ads_mobile_sdk;

import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Ref;

/* loaded from: classes.dex */
public final class mj1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public zj1 f7228a;

    /* renamed from: b, reason: collision with root package name */
    public Ref.ObjectRef f7229b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f7230c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ zj1 f7231d;

    /* renamed from: e, reason: collision with root package name */
    public int f7232e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public mj1(zj1 zj1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f7231d = zj1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f7230c = obj;
        this.f7232e |= Integer.MIN_VALUE;
        return this.f7231d.b((String) null, this);
    }
}
