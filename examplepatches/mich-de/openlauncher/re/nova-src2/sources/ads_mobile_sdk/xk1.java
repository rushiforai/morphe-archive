package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class xk1 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public zk1 f11755a;

    /* renamed from: b, reason: collision with root package name */
    public String f11756b;

    /* renamed from: c, reason: collision with root package name */
    public b.gb f11757c;

    /* renamed from: d, reason: collision with root package name */
    public Object f11758d;

    /* renamed from: e, reason: collision with root package name */
    public d f11759e;

    /* renamed from: f, reason: collision with root package name */
    public /* synthetic */ Object f11760f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ zk1 f11761g;

    /* renamed from: h, reason: collision with root package name */
    public int f11762h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public xk1(zk1 zk1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f11761g = zk1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f11760f = obj;
        this.f11762h |= Integer.MIN_VALUE;
        return zk1.a(this.f11761g, (String) null, (b.gb) null, this);
    }
}
