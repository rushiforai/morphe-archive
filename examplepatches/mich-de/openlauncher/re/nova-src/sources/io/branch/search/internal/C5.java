package io.branch.search.internal;

import io.branch.search.internal.C3296o5;
import java.util.UUID;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class C5 implements u40.j {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final C5 f62290a = new C5();

    @Override // u40.j
    public final void debug(@NotNull String tag, @NotNull String msg) {
        Intrinsics.g(tag, "tag");
        Intrinsics.g(msg, "msg");
        C3309p1.b(tag, msg);
    }

    @Override // u40.j
    public final void error(@NotNull String tag, @NotNull String msg) {
        Intrinsics.g(tag, "tag");
        Intrinsics.g(msg, "msg");
        C3309p1 c3309p1 = C3309p1.f65465a;
        C3309p1.a(a50.b.f403d, tag, msg, (Throwable) null);
        String string = UUID.randomUUID().toString();
        Intrinsics.f(string, "randomUUID().toString()");
        C3296o5.a aVar = C3296o5.f65426a;
        C3296o5.a(new F6(string, tag, msg, null));
    }

    public final void trace(@NotNull String tag, @NotNull String msg) {
        Intrinsics.g(tag, "tag");
        Intrinsics.g(msg, "msg");
        C3309p1.b(tag, msg);
    }

    @Override // u40.j
    public final void warn(@NotNull String tag, @NotNull String msg) {
        Intrinsics.g(tag, "tag");
        Intrinsics.g(msg, "msg");
        C3309p1 c3309p1 = C3309p1.f65465a;
        C3309p1.a(a50.b.f402c, tag, msg, (Throwable) null);
    }

    @Override // u40.j
    public final void error(@NotNull String tag, @NotNull Throwable t6) {
        Intrinsics.g(tag, "tag");
        Intrinsics.g(t6, "t");
        C3309p1 c3309p1 = C3309p1.f65465a;
        C3309p1.a(a50.b.f403d, tag, (String) null, t6);
        String string = UUID.randomUUID().toString();
        Intrinsics.f(string, "randomUUID().toString()");
        C3296o5.a aVar = C3296o5.f65426a;
        C3296o5.a(new F6(string, tag, null, t6, null));
    }

    @Override // u40.j
    public final void error(@NotNull String tag, @NotNull Throwable t6, @NotNull String msg) {
        Intrinsics.g(tag, "tag");
        Intrinsics.g(t6, "t");
        Intrinsics.g(msg, "msg");
        C3309p1.a(tag, t6, msg);
        String string = UUID.randomUUID().toString();
        Intrinsics.f(string, "randomUUID().toString()");
        C3296o5.a aVar = C3296o5.f65426a;
        C3296o5.a(new F6(string, tag, msg, t6, null));
    }
}
