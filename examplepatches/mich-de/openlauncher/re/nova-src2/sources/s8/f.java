package s8;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class f extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public h f86738t;

    /* renamed from: u, reason: collision with root package name */
    public k f86739u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f86740v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ h f86741w;

    /* renamed from: x, reason: collision with root package name */
    public int f86742x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f(h hVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f86741w = hVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f86740v = obj;
        this.f86742x |= Integer.MIN_VALUE;
        return this.f86741w.d(null, this);
    }
}
