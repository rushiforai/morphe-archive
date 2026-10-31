package io.branch.search.internal;

import android.os.UserHandle;
import java.util.List;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.ha, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public interface InterfaceC3183ha {

    /* renamed from: io.branch.search.internal.ha$a */
    public interface a {
        void a(@NotNull UserHandle userHandle);

        void a(@NotNull String str, @NotNull UserHandle userHandle);

        void a(@NotNull String[] strArr, @NotNull UserHandle userHandle);

        void a(@NotNull String[] strArr, @NotNull UserHandle userHandle, boolean z11);

        void b(@NotNull UserHandle userHandle);

        void b(@NotNull String str, @NotNull UserHandle userHandle);

        void b(@NotNull String[] strArr, @NotNull UserHandle userHandle);

        void b(@NotNull String[] strArr, @NotNull UserHandle userHandle, boolean z11);

        void c(@NotNull UserHandle userHandle);

        void c(@NotNull String str, @NotNull UserHandle userHandle);

        void d(@NotNull UserHandle userHandle);

        void d(@NotNull String str, @NotNull UserHandle userHandle);
    }

    @Nullable
    List a();

    @Nullable
    List a(@Nullable String str, @Nullable UserHandle userHandle);

    void a(@NotNull C3267ma c3267ma);

    @Nullable
    List b(@Nullable String str, @NotNull UserHandle userHandle);

    void b();
}
