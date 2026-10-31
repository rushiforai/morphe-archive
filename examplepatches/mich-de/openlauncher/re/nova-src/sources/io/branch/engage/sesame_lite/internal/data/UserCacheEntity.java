package io.branch.engage.sesame_lite.internal.data;

import a2.c;
import android.os.UserHandle;
import b.c0;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u000b\n\u0002\b\r\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0086\b\u0018\u00002\u00020\u0001B\u001d\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007¢\u0006\u0002\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0005HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0007HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u0007HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00072\b\u0010\u0013\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0014\u001a\u00020\u0015HÖ\u0001J\t\u0010\u0016\u001a\u00020\u0017HÖ\u0001R\u0011\u0010\u0006\u001a\u00020\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\tR\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0018"}, d2 = {"Lio/branch/engage/sesame_lite/internal/data/UserCacheEntity;", b.f42142b, "userHandle", "Landroid/os/UserHandle;", "userSerial", b.f42142b, "isQuietModeEnabled", b.f42142b, "(Landroid/os/UserHandle;JZ)V", "()Z", "getUserHandle", "()Landroid/os/UserHandle;", "getUserSerial", "()J", "component1", "component2", "component3", "copy", "equals", InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", b.f42142b, "sesame-lite_release"}, k = 1, mv = {1, 7, 1}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class UserCacheEntity {
    private final boolean isQuietModeEnabled;

    @NotNull
    private final UserHandle userHandle;
    private final long userSerial;

    public UserCacheEntity(@NotNull UserHandle userHandle, long j11, boolean z11) {
        Intrinsics.g(userHandle, "userHandle");
        this.userHandle = userHandle;
        this.userSerial = j11;
        this.isQuietModeEnabled = z11;
    }

    public static /* synthetic */ UserCacheEntity copy$default(UserCacheEntity userCacheEntity, UserHandle userHandle, long j11, boolean z11, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            userHandle = userCacheEntity.userHandle;
        }
        if ((i5 & 2) != 0) {
            j11 = userCacheEntity.userSerial;
        }
        if ((i5 & 4) != 0) {
            z11 = userCacheEntity.isQuietModeEnabled;
        }
        return userCacheEntity.copy(userHandle, j11, z11);
    }

    @NotNull
    /* renamed from: component1, reason: from getter */
    public final UserHandle getUserHandle() {
        return this.userHandle;
    }

    /* renamed from: component2, reason: from getter */
    public final long getUserSerial() {
        return this.userSerial;
    }

    /* renamed from: component3, reason: from getter */
    public final boolean getIsQuietModeEnabled() {
        return this.isQuietModeEnabled;
    }

    @NotNull
    public final UserCacheEntity copy(@NotNull UserHandle userHandle, long userSerial, boolean isQuietModeEnabled) {
        Intrinsics.g(userHandle, "userHandle");
        return new UserCacheEntity(userHandle, userSerial, isQuietModeEnabled);
    }

    public boolean equals(@Nullable Object other) {
        if (this == other) {
            return true;
        }
        if (!(other instanceof UserCacheEntity)) {
            return false;
        }
        UserCacheEntity userCacheEntity = (UserCacheEntity) other;
        return Intrinsics.b(this.userHandle, userCacheEntity.userHandle) && this.userSerial == userCacheEntity.userSerial && this.isQuietModeEnabled == userCacheEntity.isQuietModeEnabled;
    }

    @NotNull
    public final UserHandle getUserHandle() {
        return this.userHandle;
    }

    public final long getUserSerial() {
        return this.userSerial;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public int hashCode() {
        int iD = c0.d(this.userHandle.hashCode() * 31, 31, this.userSerial);
        boolean z11 = this.isQuietModeEnabled;
        int i5 = z11;
        if (z11 != 0) {
            i5 = 1;
        }
        return iD + i5;
    }

    public final boolean isQuietModeEnabled() {
        return this.isQuietModeEnabled;
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("UserCacheEntity(userHandle=");
        sb2.append(this.userHandle);
        sb2.append(", userSerial=");
        sb2.append(this.userSerial);
        sb2.append(", isQuietModeEnabled=");
        return c.p(sb2, this.isQuietModeEnabled, ')');
    }
}
