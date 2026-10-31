package ads_mobile_sdk;

import android.content.Context;
import java.util.concurrent.atomic.AtomicInteger;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class ql1 {

    /* renamed from: a, reason: collision with root package name */
    public final jr0 f8724a;

    /* renamed from: b, reason: collision with root package name */
    public final AtomicInteger f8725b;

    /* renamed from: c, reason: collision with root package name */
    public volatile int f8726c;

    public ql1(jr0 flags, Context context, fi0 deviceTierManager) {
        Intrinsics.g(flags, "flags");
        Intrinsics.g(context, "context");
        Intrinsics.g(deviceTierManager, "deviceTierManager");
        this.f8724a = flags;
        this.f8725b = new AtomicInteger(0);
    }
}
