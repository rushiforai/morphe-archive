package u2;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class e extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public long f90448t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f90449u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ f f90450v;

    /* renamed from: w, reason: collision with root package name */
    public int f90451w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e(f fVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f90450v = fVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f90449u = obj;
        this.f90451w |= Integer.MIN_VALUE;
        return this.f90450v.t(0L, this);
    }
}
