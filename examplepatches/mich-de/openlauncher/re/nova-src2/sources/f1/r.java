package f1;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class r extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f53910t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ y f53911u;

    /* renamed from: v, reason: collision with root package name */
    public int f53912v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public r(y yVar, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f53911u = yVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f53910t = obj;
        this.f53912v |= Integer.MIN_VALUE;
        return this.f53911u.a(null, null, this);
    }
}
