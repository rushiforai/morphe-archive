package d00;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class k extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public l f48696t;

    /* renamed from: u, reason: collision with root package name */
    public c80.a f48697u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f48698v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ l f48699w;

    /* renamed from: x, reason: collision with root package name */
    public int f48700x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public k(l lVar, Continuation continuation) {
        super(continuation);
        this.f48699w = lVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f48698v = obj;
        this.f48700x |= Integer.MIN_VALUE;
        return this.f48699w.a(this);
    }
}
