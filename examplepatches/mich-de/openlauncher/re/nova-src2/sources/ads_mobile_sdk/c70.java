package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class c70 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public h70 f1696a;

    /* renamed from: b, reason: collision with root package name */
    public Object f1697b;

    /* renamed from: c, reason: collision with root package name */
    public d f1698c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f1699d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ h70 f1700e;

    /* renamed from: f, reason: collision with root package name */
    public int f1701f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c70(h70 h70Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f1700e = h70Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f1699d = obj;
        this.f1701f |= Integer.MIN_VALUE;
        return h70.a(this.f1700e, this);
    }
}
