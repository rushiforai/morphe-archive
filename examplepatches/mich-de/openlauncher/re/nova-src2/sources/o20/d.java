package o20;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class d extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public f f79403t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f79404u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ f f79405v;

    /* renamed from: w, reason: collision with root package name */
    public int f79406w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d(f fVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f79405v = fVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f79404u = obj;
        this.f79406w |= Integer.MIN_VALUE;
        return this.f79405v.f(0, null, this);
    }
}
