package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.c9, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3097c9 extends AbstractC3080b9 {

    /* renamed from: d, reason: collision with root package name */
    @Nullable
    public final String f64100d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3097c9(@NotNull a50.b level, @NotNull String tag, @Nullable String str, @Nullable Throwable th2) {
        super(level, tag, th2, 0);
        Intrinsics.g(level, "level");
        Intrinsics.g(tag, "tag");
        this.f64100d = str;
    }

    @Override // io.branch.search.internal.AbstractC3080b9
    @Nullable
    public final String a() {
        return this.f64100d;
    }
}
