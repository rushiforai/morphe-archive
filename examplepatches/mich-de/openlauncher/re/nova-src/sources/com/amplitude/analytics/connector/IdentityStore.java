package com.amplitude.analytics.connector;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Map;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\bf\u0018\u00002\u00020\u0001:\u0001\u000eJ \u0010\u0002\u001a\u00020\u00032\u0016\u0010\u0004\u001a\u0012\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u00030\u0005j\u0002`\u0007H&J\b\u0010\b\u001a\u00020\tH&J\b\u0010\n\u001a\u00020\u0006H&J \u0010\u000b\u001a\u00020\u00032\u0016\u0010\u0004\u001a\u0012\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u00030\u0005j\u0002`\u0007H&J\u0010\u0010\f\u001a\u00020\u00032\u0006\u0010\r\u001a\u00020\u0006H&¨\u0006\u000f"}, d2 = {"Lcom/amplitude/analytics/connector/IdentityStore;", b.f42142b, "addIdentityListener", b.f42142b, "listener", "Lkotlin/Function1;", "Lcom/amplitude/analytics/connector/Identity;", "Lcom/amplitude/analytics/connector/IdentityListener;", "editIdentity", "Lcom/amplitude/analytics/connector/IdentityStore$Editor;", "getIdentity", "removeIdentityListener", "setIdentity", "identity", "Editor", "analytics-connector_release"}, k = 1, mv = {1, 5, 1}, xi = 48)
/* loaded from: classes2.dex */
public interface IdentityStore {

    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0010$\n\u0002\b\u0003\bf\u0018\u00002\u00020\u0001J\b\u0010\u0002\u001a\u00020\u0003H&J\u0012\u0010\u0004\u001a\u00020\u00002\b\u0010\u0005\u001a\u0004\u0018\u00010\u0006H&J\u0012\u0010\u0007\u001a\u00020\u00002\b\u0010\b\u001a\u0004\u0018\u00010\u0006H&J\u001e\u0010\t\u001a\u00020\u00002\u0014\u0010\n\u001a\u0010\u0012\u0004\u0012\u00020\u0006\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u000bH&J*\u0010\f\u001a\u00020\u00002 \u0010\r\u001a\u001c\u0012\u0004\u0012\u00020\u0006\u0012\u0012\u0012\u0010\u0012\u0004\u0012\u00020\u0006\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u000b0\u000bH&¨\u0006\u000e"}, d2 = {"Lcom/amplitude/analytics/connector/IdentityStore$Editor;", b.f42142b, "commit", b.f42142b, "setDeviceId", "deviceId", b.f42142b, "setUserId", "userId", "setUserProperties", "userProperties", b.f42142b, "updateUserProperties", "actions", "analytics-connector_release"}, k = 1, mv = {1, 5, 1}, xi = 48)
    public interface Editor {
        void commit();

        @NotNull
        Editor setDeviceId(@Nullable String deviceId);

        @NotNull
        Editor setUserId(@Nullable String userId);

        @NotNull
        Editor setUserProperties(@NotNull Map<String, ? extends Object> userProperties);

        @NotNull
        Editor updateUserProperties(@NotNull Map<String, ? extends Map<String, ? extends Object>> actions);
    }

    void addIdentityListener(@NotNull Function1<? super Identity, Unit> listener);

    @NotNull
    Editor editIdentity();

    @NotNull
    Identity getIdentity();

    void removeIdentityListener(@NotNull Function1<? super Identity, Unit> listener);

    void setIdentity(@NotNull Identity identity);
}
