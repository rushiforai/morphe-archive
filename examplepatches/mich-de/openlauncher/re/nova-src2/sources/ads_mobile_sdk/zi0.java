package ads_mobile_sdk;

import b.u1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class zi0 implements u1 {

    /* renamed from: a, reason: collision with root package name */
    public final int f12540a;

    public zi0(int i5) {
        this.f12540a = i5;
    }

    @Override // b.u1
    public final void a(ti.p signals) {
        Intrinsics.g(signals, "signals");
        signals.displayCount = Integer.valueOf(this.f12540a);
    }
}
