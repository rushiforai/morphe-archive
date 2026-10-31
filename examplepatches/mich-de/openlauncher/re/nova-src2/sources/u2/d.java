package u2;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class d extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public long f90443t;

    /* renamed from: u, reason: collision with root package name */
    public long f90444u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f90445v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ f f90446w;

    /* renamed from: x, reason: collision with root package name */
    public int f90447x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d(f fVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f90446w = fVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f90445v = obj;
        this.f90447x |= Integer.MIN_VALUE;
        return this.f90446w.b(0L, 0L, this);
    }
}
