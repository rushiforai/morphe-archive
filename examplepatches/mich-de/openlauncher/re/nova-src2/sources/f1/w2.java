package f1;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class w2 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public long f54067t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f54068u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ y2 f54069v;

    /* renamed from: w, reason: collision with root package name */
    public int f54070w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public w2(y2 y2Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f54069v = y2Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f54068u = obj;
        this.f54070w |= Integer.MIN_VALUE;
        return this.f54069v.b(0L, 0L, this);
    }
}
