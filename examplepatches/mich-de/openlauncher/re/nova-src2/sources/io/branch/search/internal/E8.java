package io.branch.search.internal;

import java.util.LinkedHashMap;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class E8 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final D8 f62408a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final LinkedHashMap f62409b;

    public E8(@NotNull M1 stabilizerCallback) {
        Intrinsics.g(stabilizerCallback, "stabilizerCallback");
        this.f62408a = stabilizerCallback;
        this.f62409b = new LinkedHashMap();
    }
}
