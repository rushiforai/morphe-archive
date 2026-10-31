package ads_mobile_sdk;

import b.x2;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class kl0 implements x2 {

    /* renamed from: a, reason: collision with root package name */
    public final jr0 f5765a;

    public kl0(jr0 flags) {
        Intrinsics.g(flags, "flags");
        this.f5765a = flags;
    }

    @Override // b.x2
    public final cw0 a() {
        return cw0.EXPERIMENT_IDS;
    }

    @Override // b.x2
    public final Object d(Continuation continuation) {
        return new xu0(new jl0(this.f5765a.f5357s.l()));
    }
}
