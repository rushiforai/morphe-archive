package is;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class i extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public j f68035t;

    /* renamed from: u, reason: collision with root package name */
    public j f68036u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f68037v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ j f68038w;

    /* renamed from: x, reason: collision with root package name */
    public int f68039x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i(j jVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f68038w = jVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f68037v = obj;
        this.f68039x |= Integer.MIN_VALUE;
        return this.f68038w.a(null, this);
    }
}
