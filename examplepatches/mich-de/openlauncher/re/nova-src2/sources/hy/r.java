package hy;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class r extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public s f61029t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f61030u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ s f61031v;

    /* renamed from: w, reason: collision with root package name */
    public int f61032w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public r(s sVar, Continuation continuation) {
        super(continuation);
        this.f61031v = sVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f61030u = obj;
        this.f61032w |= Integer.MIN_VALUE;
        return this.f61031v.emit(null, this);
    }
}
