package io.branch.search.internal;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;

/* renamed from: io.branch.search.internal.le, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3254le extends Lambda implements Function0<Unit> {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Function1<Ke<Object, Object>, Unit> f65066a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ C3271me<Object> f65067b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Multi-variable type inference failed */
    public C3254le(Function1<? super Ke<Object, Object>, Unit> function1, C3271me<Object> c3271me) {
        super(0);
        this.f65066a = function1;
        this.f65067b = c3271me;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        this.f65066a.invoke(this.f65067b);
        return Unit.f71706a;
    }
}
