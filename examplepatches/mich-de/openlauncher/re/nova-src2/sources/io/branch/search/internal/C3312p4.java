package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.p4, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3312p4 implements x80.y {

    /* renamed from: a, reason: collision with root package name */
    @Nullable
    public final A9 f65472a;

    public C3312p4(@Nullable A9 a92) {
        this.f65472a = a92;
    }

    @Override // x80.y
    @NotNull
    public final x80.m0 intercept(@NotNull x80.x chain) throws C3367s9 {
        Intrinsics.g(chain, "chain");
        A9 a92 = this.f65472a;
        if (a92 != null && !a92.e()) {
            throw new C3367s9();
        }
        c90.f fVar = (c90.f) chain;
        return fVar.b(fVar.f19892e);
    }
}
