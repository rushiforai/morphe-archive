package com.amplitude.id;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\b\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\u0018\u00002\u00020\u0001B\u0005¢\u0006\u0002\u0010\u0002J\b\u0010\f\u001a\u00020\rH\u0016J\b\u0010\u000e\u001a\u00020\u000fH\u0016J\u0012\u0010\u0010\u001a\u00020\r2\b\u0010\u0003\u001a\u0004\u0018\u00010\u0004H\u0016J\u0012\u0010\u0011\u001a\u00020\r2\b\u0010\t\u001a\u0004\u0018\u00010\u0004H\u0016R\u001c\u0010\u0003\u001a\u0004\u0018\u00010\u0004X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0005\u0010\u0006\"\u0004\b\u0007\u0010\bR\u001c\u0010\t\u001a\u0004\u0018\u00010\u0004X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\n\u0010\u0006\"\u0004\b\u000b\u0010\b¨\u0006\u0012"}, d2 = {"Lcom/amplitude/id/IMIdentityStorage;", "Lcom/amplitude/id/IdentityStorage;", "()V", "deviceId", b.f42142b, "getDeviceId", "()Ljava/lang/String;", "setDeviceId", "(Ljava/lang/String;)V", "userId", "getUserId", "setUserId", "delete", b.f42142b, "load", "Lcom/amplitude/id/Identity;", "saveDeviceId", "saveUserId", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class IMIdentityStorage implements IdentityStorage {

    @Nullable
    private String deviceId;

    @Nullable
    private String userId;

    @Override // com.amplitude.id.IdentityStorage
    public void delete() {
        this.userId = null;
        this.deviceId = null;
    }

    @Nullable
    public final String getDeviceId() {
        return this.deviceId;
    }

    @Nullable
    public final String getUserId() {
        return this.userId;
    }

    @Override // com.amplitude.id.IdentityStorage
    @NotNull
    public Identity load() {
        return new Identity(this.userId, this.deviceId);
    }

    @Override // com.amplitude.id.IdentityStorage
    public void saveDeviceId(@Nullable String deviceId) {
        this.deviceId = deviceId;
    }

    @Override // com.amplitude.id.IdentityStorage
    public void saveUserId(@Nullable String userId) {
        this.userId = userId;
    }

    public final void setDeviceId(@Nullable String str) {
        this.deviceId = str;
    }

    public final void setUserId(@Nullable String str) {
        this.userId = str;
    }
}
