package ads_mobile_sdk;

import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class l0 {

    /* renamed from: a, reason: collision with root package name */
    public final t70.j0 f6023a;

    /* renamed from: b, reason: collision with root package name */
    public final jr0 f6024b;

    /* renamed from: c, reason: collision with root package name */
    public final AtomicInteger f6025c;

    /* renamed from: d, reason: collision with root package name */
    public final ConcurrentHashMap f6026d;

    public l0(t70.j0 backgroundScope, jr0 flags) {
        Intrinsics.g(backgroundScope, "backgroundScope");
        Intrinsics.g(flags, "flags");
        this.f6023a = backgroundScope;
        this.f6024b = flags;
        this.f6025c = new AtomicInteger(0);
        this.f6026d = new ConcurrentHashMap();
    }
}
