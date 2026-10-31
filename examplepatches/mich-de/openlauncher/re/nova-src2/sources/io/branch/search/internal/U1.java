package io.branch.search.internal;

import io.branch.search.internal.P1;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class U1 extends Lambda implements Function1<Unit, Unit> {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ P1.c f63410a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public U1(S1 s12) {
        super(1);
        this.f63410a = s12;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        Unit it = (Unit) obj;
        Intrinsics.g(it, "it");
        this.f63410a.a();
        return Unit.f71706a;
    }
}
