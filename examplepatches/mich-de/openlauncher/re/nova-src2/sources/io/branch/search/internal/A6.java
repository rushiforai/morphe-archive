package io.branch.search.internal;

import java.io.IOException;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class A6 implements x80.y {
    @Override // x80.y
    @NotNull
    public final x80.m0 intercept(@NotNull x80.x chain) throws IOException {
        Intrinsics.g(chain, "chain");
        try {
            return ((c90.f) chain).b(((c90.f) chain).f19892e);
        } catch (Throwable th2) {
            if (th2 instanceof IOException) {
                throw th2;
            }
            throw new IOException(th2);
        }
    }
}
