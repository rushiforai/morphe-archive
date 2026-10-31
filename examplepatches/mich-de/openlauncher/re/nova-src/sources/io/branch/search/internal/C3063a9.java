package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.a9, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3063a9 extends C3165g9 {

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final a50.b f63939b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3063a9(@NotNull InterfaceC3148f9 next, @NotNull a50.b level) {
        super(next);
        Intrinsics.g(next, "next");
        Intrinsics.g(level, "level");
        this.f63939b = level;
    }

    @Override // io.branch.search.internal.InterfaceC3148f9
    public final void a(@NotNull AbstractC3080b9 message) {
        Intrinsics.g(message, "message");
        if (this.f63939b.ordinal() <= message.f64019a.ordinal()) {
            this.f64588a.a(message);
        }
    }
}
