package x70;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class e extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public t0.x f95222t;

    /* renamed from: u, reason: collision with root package name */
    public w70.m f95223u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f95224v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ t0.x f95225w;

    /* renamed from: x, reason: collision with root package name */
    public int f95226x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e(t0.x xVar, Continuation continuation) {
        super(continuation);
        this.f95225w = xVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f95224v = obj;
        this.f95226x |= Integer.MIN_VALUE;
        return this.f95225w.a(null, this);
    }
}
