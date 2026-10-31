package t5;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class j0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public k0 f88621t;

    /* renamed from: u, reason: collision with root package name */
    public Object f88622u;

    /* renamed from: v, reason: collision with root package name */
    public Object f88623v;

    /* renamed from: w, reason: collision with root package name */
    public m0 f88624w;

    /* renamed from: x, reason: collision with root package name */
    public /* synthetic */ Object f88625x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ k0 f88626y;

    /* renamed from: z, reason: collision with root package name */
    public int f88627z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public j0(k0 k0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f88626y = k0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f88625x = obj;
        this.f88627z |= Integer.MIN_VALUE;
        return this.f88626y.d(null, this);
    }
}
