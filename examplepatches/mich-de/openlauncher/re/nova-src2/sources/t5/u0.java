package t5;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class u0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Object f88705t;

    /* renamed from: u, reason: collision with root package name */
    public Object f88706u;

    /* renamed from: v, reason: collision with root package name */
    public Object f88707v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f88708w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ w0 f88709x;

    /* renamed from: y, reason: collision with root package name */
    public int f88710y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public u0(w0 w0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f88709x = w0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f88708w = obj;
        this.f88710y |= Integer.MIN_VALUE;
        return this.f88709x.e(null, this);
    }
}
