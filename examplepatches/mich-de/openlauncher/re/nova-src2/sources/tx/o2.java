package tx;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class o2 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Object f89924t;

    /* renamed from: u, reason: collision with root package name */
    public c80.d f89925u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f89926v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ p2 f89927w;

    /* renamed from: x, reason: collision with root package name */
    public int f89928x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public o2(p2 p2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f89927w = p2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f89926v = obj;
        this.f89928x |= Integer.MIN_VALUE;
        return this.f89927w.d(this);
    }
}
