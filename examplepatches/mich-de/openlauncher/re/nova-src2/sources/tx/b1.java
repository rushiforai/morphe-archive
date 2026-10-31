package tx;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class b1 extends ContinuationImpl {
    public int A;

    /* renamed from: t, reason: collision with root package name */
    public Object f89657t;

    /* renamed from: u, reason: collision with root package name */
    public c80.a f89658u;

    /* renamed from: v, reason: collision with root package name */
    public boolean f89659v;

    /* renamed from: w, reason: collision with root package name */
    public boolean f89660w;

    /* renamed from: x, reason: collision with root package name */
    public long f89661x;

    /* renamed from: y, reason: collision with root package name */
    public /* synthetic */ Object f89662y;

    /* renamed from: z, reason: collision with root package name */
    public final /* synthetic */ d1 f89663z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b1(d1 d1Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f89663z = d1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f89662y = obj;
        this.A |= Integer.MIN_VALUE;
        return this.f89663z.f(null, false, false, this);
    }
}
