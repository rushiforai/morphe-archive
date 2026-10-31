package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class j72 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public m72 f5148a;

    /* renamed from: b, reason: collision with root package name */
    public d f5149b;

    /* renamed from: c, reason: collision with root package name */
    public /* synthetic */ Object f5150c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ m72 f5151d;

    /* renamed from: e, reason: collision with root package name */
    public int f5152e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public j72(m72 m72Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f5151d = m72Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f5150c = obj;
        this.f5152e |= Integer.MIN_VALUE;
        return m72.a(this.f5151d, this);
    }
}
