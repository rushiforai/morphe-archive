package t5;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class s extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public c0 f88685t;

    /* renamed from: u, reason: collision with root package name */
    public c80.d f88686u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f88687v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ c0 f88688w;

    /* renamed from: x, reason: collision with root package name */
    public int f88689x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public s(c0 c0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f88688w = c0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f88687v = obj;
        this.f88689x |= Integer.MIN_VALUE;
        return c0.d(this.f88688w, this);
    }
}
