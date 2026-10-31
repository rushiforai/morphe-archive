package b80;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class e extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public f f17620t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f17621u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ f f17622v;

    /* renamed from: w, reason: collision with root package name */
    public int f17623w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e(f fVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f17622v = fVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f17621u = obj;
        this.f17623w |= Integer.MIN_VALUE;
        return this.f17622v.d(this);
    }
}
