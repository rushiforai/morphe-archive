package ads_mobile_sdk;

import c80.d;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class f72 extends ContinuationImpl {

    /* renamed from: a, reason: collision with root package name */
    public m72 f3233a;

    /* renamed from: b, reason: collision with root package name */
    public Object f3234b;

    /* renamed from: c, reason: collision with root package name */
    public d f3235c;

    /* renamed from: d, reason: collision with root package name */
    public /* synthetic */ Object f3236d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ m72 f3237e;

    /* renamed from: f, reason: collision with root package name */
    public int f3238f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f72(m72 m72Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f3237e = m72Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f3236d = obj;
        this.f3238f |= Integer.MIN_VALUE;
        return m72.a(this.f3237e, (b.j7) null, this);
    }
}
