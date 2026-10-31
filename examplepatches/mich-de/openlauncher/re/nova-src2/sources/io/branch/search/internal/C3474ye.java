package io.branch.search.internal;

import io.branch.search.internal.InterfaceC3272mf;
import kotlin.Pair;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.ye, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3474ye implements InterfaceC3272mf {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f66348a;

    public C3474ye(@NotNull String webview) {
        Intrinsics.g(webview, "webview");
        this.f66348a = webview;
    }

    @Override // io.branch.search.internal.InterfaceC3272mf
    public final void a() {
    }

    @Override // io.branch.search.internal.InterfaceC3272mf
    @NotNull
    public final Pair<String, InterfaceC3272mf.c> b() {
        return new Pair<>(this.f66348a, InterfaceC3272mf.c.STATIC);
    }

    @Override // io.branch.search.internal.InterfaceC3272mf
    @Nullable
    public final String get() {
        return (String) b().f71683a;
    }
}
