package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class h72 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public Object f4235a;

    /* renamed from: b, reason: collision with root package name */
    public jy0 f4236b;

    /* renamed from: c, reason: collision with root package name */
    public d f4237c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f4238d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ m72 f4239e;

    /* renamed from: f, reason: collision with root package name */
    public int f4240f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public h72(m72 m72Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f4239e = m72Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f4238d = obj;
        this.f4240f |= Integer.MIN_VALUE;
        return m72.a(this.f4239e, (jy0) null, this);
    }
}
