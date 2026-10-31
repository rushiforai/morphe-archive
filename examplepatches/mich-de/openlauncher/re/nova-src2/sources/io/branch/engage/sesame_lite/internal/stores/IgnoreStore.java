package io.branch.engage.sesame_lite.internal.stores;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.io.File;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\t\n\u0002\b\u0005\u0018\u0000 \u000f2\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001:\u0001\u000fB\u000f\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0002\u0010\u0006J&\u0010\u0007\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\u00022\u0006\u0010\n\u001a\u00020\u000b2\u0006\u0010\f\u001a\u00020\u00022\u0006\u0010\r\u001a\u00020\bJ\b\u0010\u000e\u001a\u00020\u0000H\u0016¨\u0006\u0010"}, d2 = {"Lio/branch/engage/sesame_lite/internal/stores/IgnoreStore;", "Lio/branch/engage/sesame_lite/internal/stores/InMemoryStore;", b.f42142b, "Lio/branch/engage/sesame_lite/internal/stores/IgnoreEntity;", "cacheFiles", "Ljava/io/File;", "(Ljava/io/File;)V", "isIgnored", b.f42142b, "packageName", "userId", b.f42142b, "hostPackage", "ignoreHost", "newDataInstance", k.O, "sesame-lite_release"}, k = 1, mv = {1, 7, 1}, xi = 48)
/* loaded from: classes4.dex */
public final class IgnoreStore extends InMemoryStore<String, IgnoreEntity> {

    @NotNull
    public static final String TYPE = "ignores";

    public IgnoreStore(@Nullable File file) {
        super("ignores", file, IgnoreEntity.INSTANCE.serializer(), null);
    }

    public final boolean isIgnored(@NotNull String packageName, long userId, @NotNull String hostPackage, boolean ignoreHost) {
        Intrinsics.g(packageName, "packageName");
        Intrinsics.g(hostPackage, "hostPackage");
        return IgnoreStoreKt.isIgnored(getData(), packageName, userId, hostPackage, ignoreHost);
    }

    @Override // io.branch.engage.sesame_lite.internal.stores.InMemoryStore
    @NotNull
    public IgnoreStore newDataInstance() {
        IgnoreStore ignoreStore = new IgnoreStore(getCacheFile());
        ignoreStore.setData(getData());
        return ignoreStore;
    }
}
