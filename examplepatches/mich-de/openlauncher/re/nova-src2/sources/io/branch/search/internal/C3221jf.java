package io.branch.search.internal;

import android.app.usage.UsageEvents;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.jf, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3221jf {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final UsageEvents f64904a;

    public C3221jf(@NotNull UsageEvents usageEvents) {
        Intrinsics.g(usageEvents, "usageEvents");
        this.f64904a = usageEvents;
    }
}
