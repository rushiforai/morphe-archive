package l1;

import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class f7 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public g7 f73302t;

    /* renamed from: u, reason: collision with root package name */
    public e7 f73303u;

    /* renamed from: v, reason: collision with root package name */
    public c80.a f73304v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f73305w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ g7 f73306x;

    /* renamed from: y, reason: collision with root package name */
    public int f73307y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f7(g7 g7Var, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f73306x = g7Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f73305w = obj;
        this.f73307y |= Integer.MIN_VALUE;
        return this.f73306x.a(null, this);
    }
}
