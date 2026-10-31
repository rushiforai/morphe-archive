package io.branch.search.internal;

import android.os.UserHandle;
import io.branch.engage.sesame_lite.internal.data.UserCacheEntity;
import io.branch.engage.sesame_lite.internal.data.UserHandleDataSource;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.rf, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3356rf implements UserHandleDataSource {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final UserHandleDataSource f65680a;

    public C3356rf(@NotNull UserHandleDataSource dataSource) {
        Intrinsics.g(dataSource, "dataSource");
        this.f65680a = dataSource;
    }

    @Override // io.branch.engage.sesame_lite.internal.data.UserHandleDataSource
    @Nullable
    public final UserCacheEntity getCacheEntity(@NotNull UserHandle userHandle) {
        Intrinsics.g(userHandle, "userHandle");
        return this.f65680a.getCacheEntity(userHandle);
    }

    @Override // io.branch.engage.sesame_lite.internal.data.UserHandleDataSource
    public final long getCurrentUserId() {
        return this.f65680a.getCurrentUserId();
    }

    @Override // io.branch.engage.sesame_lite.internal.data.UserHandleDataSource
    @Nullable
    public final UserHandle getUserHandle(long j11) {
        return this.f65680a.getUserHandle(j11);
    }

    @Override // io.branch.engage.sesame_lite.internal.data.UserHandleDataSource
    @Nullable
    public final Long getUserHandleId(@NotNull UserHandle userHandle) {
        Intrinsics.g(userHandle, "userHandle");
        return this.f65680a.getUserHandleId(userHandle);
    }

    @Override // io.branch.engage.sesame_lite.internal.data.UserHandleDataSource
    @NotNull
    public final List<UserHandle> getUserHandles() {
        return this.f65680a.getUserHandles();
    }

    @Override // io.branch.engage.sesame_lite.internal.data.UserHandleDataSource
    public final void onUsersChanged() {
        this.f65680a.onUsersChanged();
    }
}
