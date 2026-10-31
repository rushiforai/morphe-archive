package e1;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class l extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public CharSequence f51321t;

    /* renamed from: u, reason: collision with root package name */
    public Object f51322u;

    /* renamed from: v, reason: collision with root package name */
    public c80.d f51323v;

    /* renamed from: w, reason: collision with root package name */
    public long f51324w;

    /* renamed from: x, reason: collision with root package name */
    public /* synthetic */ Object f51325x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ n f51326y;

    /* renamed from: z, reason: collision with root package name */
    public int f51327z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public l(n nVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f51326y = nVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f51325x = obj;
        this.f51327z |= Integer.MIN_VALUE;
        return n.a(this.f51326y, null, 0L, null, this);
    }
}
