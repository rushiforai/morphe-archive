package io.branch.search.internal;

import android.os.Process;
import android.os.UserHandle;
import android.os.UserManager;
import io.branch.engage.sesame_lite.internal.data.UserCacheEntity;
import io.branch.engage.sesame_lite.internal.data.UserHandleDataSource;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import kotlin.Pair;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.pf, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3323pf implements UserHandleDataSource {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final UserManager f65490a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final LinkedHashMap f65491b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final LinkedHashMap f65492c;

    public C3323pf(@NotNull UserManager userManager) {
        Intrinsics.g(userManager, "userManager");
        this.f65490a = userManager;
        this.f65491b = new LinkedHashMap();
        this.f65492c = new LinkedHashMap();
        onUsersChanged();
    }

    @Override // io.branch.engage.sesame_lite.internal.data.UserHandleDataSource
    @Nullable
    public final UserCacheEntity getCacheEntity(@NotNull UserHandle userHandle) {
        Intrinsics.g(userHandle, "userHandle");
        return (UserCacheEntity) this.f65492c.get(userHandle);
    }

    @Override // io.branch.engage.sesame_lite.internal.data.UserHandleDataSource
    public final long getCurrentUserId() {
        UserHandle userHandleMyUserHandle = Process.myUserHandle();
        Intrinsics.f(userHandleMyUserHandle, "myUserHandle()");
        Long userHandleId = getUserHandleId(userHandleMyUserHandle);
        if (userHandleId != null) {
            return userHandleId.longValue();
        }
        return 0L;
    }

    @Override // io.branch.engage.sesame_lite.internal.data.UserHandleDataSource
    @Nullable
    public final UserHandle getUserHandle(long j11) {
        UserCacheEntity userCacheEntity = (UserCacheEntity) this.f65491b.get(Long.valueOf(j11));
        if (userCacheEntity != null) {
            return userCacheEntity.getUserHandle();
        }
        return null;
    }

    @Override // io.branch.engage.sesame_lite.internal.data.UserHandleDataSource
    @Nullable
    public final Long getUserHandleId(@NotNull UserHandle userHandle) {
        Intrinsics.g(userHandle, "userHandle");
        UserCacheEntity userCacheEntity = (UserCacheEntity) this.f65492c.get(userHandle);
        if (userCacheEntity != null) {
            return Long.valueOf(userCacheEntity.getUserSerial());
        }
        return null;
    }

    @Override // io.branch.engage.sesame_lite.internal.data.UserHandleDataSource
    @NotNull
    public final List<UserHandle> getUserHandles() {
        return b70.g.I1(this.f65492c.keySet());
    }

    @Override // io.branch.engage.sesame_lite.internal.data.UserHandleDataSource
    public final void onUsersChanged() {
        List<UserHandle> userProfiles = this.f65490a.getUserProfiles();
        if (userProfiles != null) {
            ArrayList arrayList = new ArrayList(b70.c.u0(userProfiles, 10));
            for (UserHandle user : userProfiles) {
                Intrinsics.f(user, "user");
                arrayList.add(new Pair(user, new UserCacheEntity(user, this.f65490a.getSerialNumberForUser(user), this.f65490a.isQuietModeEnabled(user))));
            }
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                Pair pair = (Pair) it.next();
                UserHandle user2 = (UserHandle) pair.f71683a;
                UserCacheEntity userCacheEntity = (UserCacheEntity) pair.f71684b;
                this.f65491b.put(Long.valueOf(userCacheEntity.getUserSerial()), userCacheEntity);
                LinkedHashMap linkedHashMap = this.f65492c;
                Intrinsics.f(user2, "user");
                linkedHashMap.put(user2, userCacheEntity);
            }
        }
    }
}
