package io.branch.search.internal;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;

/* renamed from: io.branch.search.internal.j7, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3213j7 extends Lambda implements Function1<Throwable, Unit> {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ x80.i f64887a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3213j7(x80.i iVar) {
        super(1);
        this.f64887a = iVar;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        this.f64887a.cancel();
        return Unit.f71706a;
    }
}
