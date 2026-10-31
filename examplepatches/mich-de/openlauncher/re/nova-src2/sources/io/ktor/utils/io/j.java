package io.ktor.utils.io;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class j extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f66600t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ m f66601u;

    /* renamed from: v, reason: collision with root package name */
    public int f66602v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public j(m mVar, Continuation continuation) {
        super(continuation);
        this.f66601u = mVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f66600t = obj;
        this.f66602v |= Integer.MIN_VALUE;
        return this.f66601u.d(this);
    }
}
