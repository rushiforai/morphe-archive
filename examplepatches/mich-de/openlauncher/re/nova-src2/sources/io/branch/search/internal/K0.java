package io.branch.search.internal;

import java.util.Set;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class K0 {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final C3255lf f62768a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final Set<Integer> f62769b;

    public static final class a {
    }

    public K0(@NotNull C3255lf manager, @NotNull Set<Integer> eventTypes) {
        Intrinsics.g(manager, "manager");
        Intrinsics.g(eventTypes, "eventTypes");
        this.f62768a = manager;
        this.f62769b = eventTypes;
    }
}
