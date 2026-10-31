package io.branch.search.internal;

import io.branch.search.internal.InterfaceC3332q7;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.w5, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3431w5 {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final F4 f66216a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final InterfaceC3332q7 f66217b;

    /* renamed from: io.branch.search.internal.w5$a */
    public static final class a {
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ C3431w5(F4 f42) {
        this(f42, InterfaceC3332q7.a.f65564b);
        InterfaceC3332q7.Companion.getClass();
    }

    public C3431w5(@NotNull F4 contextDelegate, @NotNull InterfaceC3332q7 shortcutHandler) {
        Intrinsics.g(contextDelegate, "contextDelegate");
        Intrinsics.g(shortcutHandler, "shortcutHandler");
        this.f66216a = contextDelegate;
        this.f66217b = shortcutHandler;
    }
}
