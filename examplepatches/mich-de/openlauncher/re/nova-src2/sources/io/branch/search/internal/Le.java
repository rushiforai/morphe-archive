package io.branch.search.internal;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class Le extends Lambda implements Function1<Ke<Object, Object>, Unit> {

    /* renamed from: a, reason: collision with root package name */
    public static final Le f62854a = new Le();

    public Le() {
        super(1);
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        Ke it = (Ke) obj;
        Intrinsics.g(it, "it");
        return Unit.f71706a;
    }
}
