package io.ktor.utils.io;

import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class n0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public /* synthetic */ Object f66618t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ o0 f66619u;

    /* renamed from: v, reason: collision with root package name */
    public int f66620v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public n0(o0 o0Var, Continuation continuation) {
        super(continuation);
        this.f66619u = o0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f66618t = obj;
        this.f66620v |= Integer.MIN_VALUE;
        return this.f66619u.d(this);
    }
}
