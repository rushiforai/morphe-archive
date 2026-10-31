package i20;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class f extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public g f61206t;

    /* renamed from: u, reason: collision with root package name */
    public String f61207u;

    /* renamed from: v, reason: collision with root package name */
    public long f61208v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f61209w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ g f61210x;

    /* renamed from: y, reason: collision with root package name */
    public int f61211y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f(g gVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f61210x = gVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f61209w = obj;
        this.f61211y |= Integer.MIN_VALUE;
        return this.f61210x.j(null, null, null, null, null, this);
    }
}
