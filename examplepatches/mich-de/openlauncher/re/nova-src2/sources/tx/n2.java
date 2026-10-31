package tx;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class n2 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Object f89904t;

    /* renamed from: u, reason: collision with root package name */
    public c80.d f89905u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f89906v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ p2 f89907w;

    /* renamed from: x, reason: collision with root package name */
    public int f89908x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public n2(p2 p2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f89907w = p2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f89906v = obj;
        this.f89908x |= Integer.MIN_VALUE;
        return this.f89907w.c(this);
    }
}
