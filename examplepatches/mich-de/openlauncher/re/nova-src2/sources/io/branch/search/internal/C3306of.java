package io.branch.search.internal;

import android.os.UserHandle;
import io.branch.search.internal.C3250la;
import java.util.List;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.of, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3306of implements C3250la.b {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final C3356rf f65462a;

    public C3306of(@NotNull C3356rf userHandleRepository) {
        Intrinsics.g(userHandleRepository, "userHandleRepository");
        this.f65462a = userHandleRepository;
    }

    @Override // io.branch.search.internal.C3250la.b
    @Nullable
    public final Object a(@NotNull UserHandle userHandle, @NotNull List<C3443x0> list, @NotNull List<C3460y0> list2, @NotNull Continuation<? super Unit> continuation) {
        this.f65462a.f65680a.onUsersChanged();
        return Unit.f71706a;
    }

    @Override // io.branch.search.internal.C3250la.b
    @Nullable
    public final Object b(@NotNull UserHandle userHandle, @NotNull Continuation<? super Unit> continuation) {
        this.f65462a.f65680a.onUsersChanged();
        return Unit.f71706a;
    }

    @Override // io.branch.search.internal.C3250la.b
    @Nullable
    public final Object a(@NotNull UserHandle userHandle, @NotNull Continuation<? super Unit> continuation) {
        this.f65462a.f65680a.onUsersChanged();
        return Unit.f71706a;
    }

    @Override // io.branch.search.internal.C3250la.b
    @Nullable
    public final Object b(@NotNull String str, @NotNull UserHandle userHandle, @NotNull List<C3443x0> list, @NotNull List<C3460y0> list2, @NotNull Continuation<? super Unit> continuation) {
        return Unit.f71706a;
    }

    @Override // io.branch.search.internal.C3250la.b
    @Nullable
    public final Object a(long j11, @NotNull Continuation<? super Unit> continuation) {
        this.f65462a.f65680a.onUsersChanged();
        return Unit.f71706a;
    }

    @Override // io.branch.search.internal.C3250la.b
    @Nullable
    public final Object a(@NotNull String str, @NotNull UserHandle userHandle, @NotNull List<C3443x0> list, @NotNull List<C3460y0> list2, @NotNull Continuation<? super Unit> continuation) {
        return Unit.f71706a;
    }

    @Override // io.branch.search.internal.C3250la.b
    @Nullable
    public final Object a(@NotNull String str, @NotNull UserHandle userHandle, @NotNull Continuation<? super Unit> continuation) {
        return Unit.f71706a;
    }

    @Override // io.branch.search.internal.C3250la.b
    @Nullable
    public final Object a(@NotNull String str, @NotNull UserHandle userHandle, @NotNull List<C3460y0> list, @NotNull Continuation<? super Unit> continuation) {
        return Unit.f71706a;
    }

    @Override // io.branch.search.internal.C3250la.b
    @Nullable
    public final Object a(@NotNull Continuation<? super Unit> continuation) {
        return Unit.f71706a;
    }
}
