package io.branch.search.internal;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class L3 extends Lambda implements Function0<String> {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ O3 f62835a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public L3(O3 o32) {
        super(0);
        this.f62835a = o32;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        return "Cache regenerate for service: debugInfo=" + this.f62835a.a();
    }
}
