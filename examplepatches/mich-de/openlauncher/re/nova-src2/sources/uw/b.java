package uw;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import t70.r1;

/* loaded from: classes4.dex */
public final class b extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public r1 f91581t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f91582u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ c f91583v;

    /* renamed from: w, reason: collision with root package name */
    public int f91584w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b(c cVar, Continuation continuation) {
        super(continuation);
        this.f91583v = cVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f91582u = obj;
        this.f91584w |= Integer.MIN_VALUE;
        this.f91583v.collect(null, this);
        return CoroutineSingletons.f71806a;
    }
}
