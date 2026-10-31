package io.branch.search.internal;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class K2 extends Lambda implements Function0<u40.c> {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ C3269mc f62771a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public K2(C3269mc c3269mc) {
        super(0);
        this.f62771a = c3269mc;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        return ((u40.h) this.f62771a.f65159f.getValue()).getPerfStats();
    }
}
