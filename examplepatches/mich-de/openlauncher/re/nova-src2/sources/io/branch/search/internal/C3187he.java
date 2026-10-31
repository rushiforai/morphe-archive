package io.branch.search.internal;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;

/* renamed from: io.branch.search.internal.he, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3187he extends Lambda implements Function1<Object, Unit> {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ t70.l f64687a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3187he(t70.m mVar) {
        super(1);
        this.f64687a = mVar;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        this.f64687a.i(obj, C3170ge.f64597a);
        return Unit.f71706a;
    }
}
