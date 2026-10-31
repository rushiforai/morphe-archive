package j10;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class j extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Object f68621t;

    /* renamed from: u, reason: collision with root package name */
    public Object f68622u;

    /* renamed from: v, reason: collision with root package name */
    public boolean f68623v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f68624w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ m f68625x;

    /* renamed from: y, reason: collision with root package name */
    public int f68626y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public j(m mVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f68625x = mVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f68624w = obj;
        this.f68626y |= Integer.MIN_VALUE;
        return this.f68625x.q(null, false, this);
    }
}
