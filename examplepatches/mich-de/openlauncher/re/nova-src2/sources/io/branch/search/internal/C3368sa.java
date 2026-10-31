package io.branch.search.internal;

import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Lambda;

/* renamed from: io.branch.search.internal.sa, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3368sa extends Lambda implements Function0<Unit> {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Function2<t70.j0, Continuation<? super Unit>, Object> f65768a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3368sa(Ma ma2) {
        super(0);
        this.f65768a = ma2;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() throws Throwable {
        t70.m0.u(EmptyCoroutineContext.f71803a, new C3351ra(this.f65768a, null));
        return Unit.f71706a;
    }
}
