package io.branch.search.internal;

import android.app.usage.UsageEvents;
import android.app.usage.UsageStatsManager;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.lf, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3255lf {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final UsageStatsManager f65068a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final Function1<UsageEvents, C3221jf> f65069b;

    /* JADX WARN: Multi-variable type inference failed */
    public C3255lf(@NotNull UsageStatsManager manager, @NotNull Function1<? super UsageEvents, C3221jf> delegateFactory) {
        Intrinsics.g(manager, "manager");
        Intrinsics.g(delegateFactory, "delegateFactory");
        this.f65068a = manager;
        this.f65069b = delegateFactory;
    }
}
