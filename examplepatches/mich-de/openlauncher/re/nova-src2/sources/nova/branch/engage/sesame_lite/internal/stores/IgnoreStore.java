package nova.branch.engage.sesame_lite.internal.stores;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.io.File;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\t\n\u0002\b\u0005\u0018\u0000 \u00102\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001:\u0001\u0010B\u0011\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0006\u0010\u0007J&\u0010\b\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u00022\u0006\u0010\u000b\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\u00022\u0006\u0010\u000e\u001a\u00020\tJ\b\u0010\u000f\u001a\u00020\u0000H\u0016¨\u0006\u0011"}, d2 = {"Lnova/branch/engage/sesame_lite/internal/stores/IgnoreStore;", "Lnova/branch/engage/sesame_lite/internal/stores/InMemoryStore;", b.f42142b, "Lnova/branch/engage/sesame_lite/internal/stores/IgnoreEntity;", "cacheFiles", "Ljava/io/File;", "<init>", "(Ljava/io/File;)V", "isIgnored", b.f42142b, "packageName", "userId", b.f42142b, "hostPackage", "ignoreHost", "newDataInstance", k.O, "sesame-lite_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
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

    @Override // nova.branch.engage.sesame_lite.internal.stores.InMemoryStore
    @NotNull
    public IgnoreStore newDataInstance() {
        IgnoreStore ignoreStore = new IgnoreStore(getCacheFile());
        ignoreStore.setData(getData());
        return ignoreStore;
    }
}
