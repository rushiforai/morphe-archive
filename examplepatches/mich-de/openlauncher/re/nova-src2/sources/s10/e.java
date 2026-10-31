package s10;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class e extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public f f86591t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f86592u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ f f86593v;

    /* renamed from: w, reason: collision with root package name */
    public int f86594w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e(f fVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f86593v = fVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f86592u = obj;
        this.f86594w |= Integer.MIN_VALUE;
        return this.f86593v.c(null, this);
    }
}
