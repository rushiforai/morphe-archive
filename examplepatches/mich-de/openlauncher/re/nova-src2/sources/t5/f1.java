package t5;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class f1 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Object f88584t;

    /* renamed from: u, reason: collision with root package name */
    public c80.d f88585u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f88586v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ h1 f88587w;

    /* renamed from: x, reason: collision with root package name */
    public int f88588x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f1(h1 h1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f88587w = h1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f88586v = obj;
        this.f88588x |= Integer.MIN_VALUE;
        return this.f88587w.e(null, this);
    }
}
