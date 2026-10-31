package s10;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class o extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public p f86621t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f86622u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ p f86623v;

    /* renamed from: w, reason: collision with root package name */
    public int f86624w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public o(p pVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f86623v = pVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f86622u = obj;
        this.f86624w |= Integer.MIN_VALUE;
        return this.f86623v.c(null, this);
    }
}
