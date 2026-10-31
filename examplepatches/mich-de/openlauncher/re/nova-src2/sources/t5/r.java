package t5;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class r extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Object f88675t;

    /* renamed from: u, reason: collision with root package name */
    public c0 f88676u;

    /* renamed from: v, reason: collision with root package name */
    public t70.s f88677v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f88678w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ c0 f88679x;

    /* renamed from: y, reason: collision with root package name */
    public int f88680y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public r(c0 c0Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f88679x = c0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f88678w = obj;
        this.f88680y |= Integer.MIN_VALUE;
        return c0.c(this.f88679x, null, this);
    }
}
