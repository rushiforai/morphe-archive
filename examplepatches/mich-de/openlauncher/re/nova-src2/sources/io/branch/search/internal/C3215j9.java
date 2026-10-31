package io.branch.search.internal;

import io.branch.search.internal.InterfaceC3272mf;
import java.util.concurrent.atomic.AtomicReference;
import kotlin.Pair;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.j9, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3215j9 implements InterfaceC3272mf {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final InterfaceC3272mf f64888a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final AtomicReference<String> f64889b;

    public C3215j9(@NotNull InterfaceC3272mf source) {
        Intrinsics.g(source, "source");
        this.f64888a = source;
        this.f64889b = new AtomicReference<>();
    }

    @Override // io.branch.search.internal.InterfaceC3272mf
    public final void a() {
        this.f64888a.a();
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // io.branch.search.internal.InterfaceC3272mf
    @NotNull
    public final Pair<String, InterfaceC3272mf.c> b() {
        String str = this.f64889b.get();
        if (str != null) {
            return new Pair<>(str, InterfaceC3272mf.c.MEMORY);
        }
        Pair<String, InterfaceC3272mf.c> pairB = this.f64888a.b();
        this.f64889b.set(pairB.f71683a);
        return pairB;
    }

    @Override // io.branch.search.internal.InterfaceC3272mf
    @Nullable
    public final String get() {
        return (String) b().f71683a;
    }
}
