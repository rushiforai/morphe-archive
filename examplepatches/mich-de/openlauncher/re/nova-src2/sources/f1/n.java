package f1;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes2.dex */
public final class n extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public Object f53783t;

    /* renamed from: u, reason: collision with root package name */
    public t70.r1 f53784u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f53785v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ o f53786w;

    /* renamed from: x, reason: collision with root package name */
    public int f53787x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public n(o oVar, Continuation continuation) {
        super(continuation);
        this.f53786w = oVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f53785v = obj;
        this.f53787x |= Integer.MIN_VALUE;
        return this.f53786w.emit(null, this);
    }
}
