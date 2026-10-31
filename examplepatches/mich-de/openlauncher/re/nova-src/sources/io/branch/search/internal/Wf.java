package io.branch.search.internal;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class Wf extends Lambda implements Function0<String> {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Cf f63604a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ boolean f63605b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public Wf(Cf cf2, boolean z11) {
        super(0);
        this.f63604a = cf2;
        this.f63605b = z11;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        return "Zero state request, config=" + this.f63604a + ", isCoreReady=" + this.f63605b;
    }
}
