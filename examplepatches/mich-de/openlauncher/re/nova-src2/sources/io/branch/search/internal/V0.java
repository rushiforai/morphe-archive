package io.branch.search.internal;

import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class V0 extends Lambda implements Function1<Function0<? extends Unit>, Long> {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ U0 f63465a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public V0(U0 u02) {
        super(1);
        this.f63465a = u02;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        Function0 it = (Function0) obj;
        Intrinsics.g(it, "it");
        U0 u02 = this.f63465a;
        long j11 = u02.f63403a;
        long jLongValue = ((Number) u02.f63404b.invoke()).longValue() - this.f63465a.f63406d;
        return Long.valueOf(jLongValue < j11 ? j11 - jLongValue : 0L);
    }
}
