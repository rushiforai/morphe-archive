package io.branch.search.internal;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class R2 extends Lambda implements Function0<Boolean> {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ G2 f63255a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public R2(G2 g22) {
        super(0);
        this.f63255a = g22;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        return Boolean.valueOf(this.f63255a.a().f65353c0);
    }
}
