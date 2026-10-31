package io.branch.search.internal;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* renamed from: io.branch.search.internal.ge, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3170ge extends Lambda implements Function1<Throwable, Unit> {

    /* renamed from: a, reason: collision with root package name */
    public static final C3170ge f64597a = new C3170ge();

    public C3170ge() {
        super(1);
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        Throwable it = (Throwable) obj;
        Intrinsics.g(it, "it");
        C3309p1.c(EnumC3131e9.ContentProviderRequests, "Handle cancellation");
        return Unit.f71706a;
    }
}
