package com.amplitude.id;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0002\bf\u0018\u00002\u00020\u0001:\u0001\u0011J\u0010\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H&J\b\u0010\u0006\u001a\u00020\u0007H&J\b\u0010\b\u001a\u00020\tH&J\b\u0010\n\u001a\u00020\u000bH&J\u0010\u0010\f\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H&J\u001a\u0010\r\u001a\u00020\u00032\u0006\u0010\u000e\u001a\u00020\t2\b\b\u0002\u0010\u000f\u001a\u00020\u0010H&ø\u0001\u0000\u0082\u0002\u0006\n\u0004\b!0\u0001¨\u0006\u0012À\u0006\u0001"}, d2 = {"Lcom/amplitude/id/IdentityManager;", b.f42142b, "addIdentityListener", b.f42142b, "listener", "Lcom/amplitude/id/IdentityListener;", "editIdentity", "Lcom/amplitude/id/IdentityManager$Editor;", "getIdentity", "Lcom/amplitude/id/Identity;", "isInitialized", b.f42142b, "removeIdentityListener", "setIdentity", "identity", "updateType", "Lcom/amplitude/id/IdentityUpdateType;", "Editor", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public interface IdentityManager {

    @Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\bf\u0018\u00002\u00020\u0001J\b\u0010\u0002\u001a\u00020\u0003H&J\u0012\u0010\u0004\u001a\u00020\u00002\b\u0010\u0005\u001a\u0004\u0018\u00010\u0006H&J\u0012\u0010\u0007\u001a\u00020\u00002\b\u0010\b\u001a\u0004\u0018\u00010\u0006H&ø\u0001\u0000\u0082\u0002\u0006\n\u0004\b!0\u0001¨\u0006\tÀ\u0006\u0001"}, d2 = {"Lcom/amplitude/id/IdentityManager$Editor;", b.f42142b, "commit", b.f42142b, "setDeviceId", "deviceId", b.f42142b, "setUserId", "userId", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
    public interface Editor {
        void commit();

        @NotNull
        Editor setDeviceId(@Nullable String deviceId);

        @NotNull
        Editor setUserId(@Nullable String userId);
    }

    static /* synthetic */ void setIdentity$default(IdentityManager identityManager, Identity identity, IdentityUpdateType identityUpdateType, int i5, Object obj) {
        if (obj != null) {
            throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: setIdentity");
        }
        if ((i5 & 2) != 0) {
            identityUpdateType = IdentityUpdateType.Updated;
        }
        identityManager.setIdentity(identity, identityUpdateType);
    }

    void addIdentityListener(@NotNull IdentityListener listener);

    @NotNull
    Editor editIdentity();

    @NotNull
    Identity getIdentity();

    boolean isInitialized();

    void removeIdentityListener(@NotNull IdentityListener listener);

    void setIdentity(@NotNull Identity identity, @NotNull IdentityUpdateType updateType);
}
