package l20;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class e extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public f f74624t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f74625u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ f f74626v;

    /* renamed from: w, reason: collision with root package name */
    public int f74627w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e(f fVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f74626v = fVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f74625u = obj;
        this.f74627w |= Integer.MIN_VALUE;
        return this.f74626v.f(0, null, this);
    }
}
