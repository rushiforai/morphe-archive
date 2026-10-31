package io.branch.search.internal;

import io.branch.search.internal.multiprocess.CannotBindException;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.xd, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3456xd {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final InterfaceC3376t1 f66293a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final c80.a f66294b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public volatile t70.r f66295c;

    /* renamed from: d, reason: collision with root package name */
    public volatile boolean f66296d;

    /* renamed from: e, reason: collision with root package name */
    public volatile boolean f66297e;

    public C3456xd(@NotNull C3410v1 binding, long j11) {
        Intrinsics.g(binding, "binding");
        this.f66293a = binding;
        this.f66294b = new c80.d();
        this.f66295c = t70.m0.b();
        binding.a(new C3405ud(this, j11));
    }

    public static final void a(C3456xd c3456xd) {
        ((c80.d) c3456xd.f66294b).d();
        if (c3456xd.f66296d) {
            return;
        }
        c3456xd.f66295c = t70.m0.b();
        c3456xd.f66296d = c3456xd.f66293a.b();
        if (c3456xd.f66296d) {
            return;
        }
        ((t70.s) c3456xd.f66295c).j0(new CannotBindException("The service does not exist, is this service disabled?"));
    }

    public static final void b(C3456xd c3456xd) {
        ((c80.d) c3456xd.f66294b).d();
        c3456xd.f66293a.a();
        c3456xd.f66296d = false;
    }

    public static final void c(C3456xd c3456xd) {
        ((c80.d) c3456xd.f66294b).d();
        c3456xd.f66293a.a();
        c3456xd.f66296d = c3456xd.f66293a.b();
        if (c3456xd.f66296d) {
            return;
        }
        ((t70.s) c3456xd.f66295c).j0(new CannotBindException("The service does not exist, is this service disabled?"));
    }
}
