package tz;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class j extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f90132t;

    /* renamed from: u, reason: collision with root package name */
    public int f90133u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ n8.p f90134v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public j(n8.p pVar, Continuation continuation) {
        super(continuation);
        this.f90134v = pVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f90132t = obj;
        this.f90133u |= Integer.MIN_VALUE;
        return this.f90134v.emit(null, this);
    }
}
