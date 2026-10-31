package o20;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class k extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public br.c f79438t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f79439u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ l f79440v;

    /* renamed from: w, reason: collision with root package name */
    public int f79441w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public k(l lVar, Continuation continuation) {
        super(continuation);
        this.f79440v = lVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f79439u = obj;
        this.f79441w |= Integer.MIN_VALUE;
        return this.f79440v.e(null, null, this);
    }
}
