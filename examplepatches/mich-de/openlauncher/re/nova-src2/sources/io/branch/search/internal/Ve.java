package io.branch.search.internal;

import io.branch.search.internal.Xe;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class Ve extends Lambda implements Function1<C3095c7, Unit> {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ We f63544a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Xe f63545b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public Ve(We we2, Xe.a aVar) {
        super(1);
        this.f63544a = we2;
        this.f63545b = aVar;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        C3095c7 it = (C3095c7) obj;
        Intrinsics.g(it, "it");
        if (it.f64098a != this.f63544a.f63603a.get().f64098a) {
            this.f63545b.b(it);
            this.f63545b.a(it);
            this.f63544a.f63603a.set(it);
        }
        return Unit.f71706a;
    }
}
