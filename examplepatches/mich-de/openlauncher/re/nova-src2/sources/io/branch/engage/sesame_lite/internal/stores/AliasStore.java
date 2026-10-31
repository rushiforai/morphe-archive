package io.branch.engage.sesame_lite.internal.stores;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u001e\n\u0002\b\u0004\u0018\u0000 \u000b2\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001:\u0001\u000bB\u000f\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0002\u0010\u0006J\u0014\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\u00030\b2\u0006\u0010\t\u001a\u00020\u0002J\b\u0010\n\u001a\u00020\u0000H\u0016¨\u0006\f"}, d2 = {"Lio/branch/engage/sesame_lite/internal/stores/AliasStore;", "Lio/branch/engage/sesame_lite/internal/stores/InMemoryStore;", b.f42142b, "Lio/branch/engage/sesame_lite/internal/stores/AliasEntity;", "cachedFile", "Ljava/io/File;", "(Ljava/io/File;)V", "getForPackage", b.f42142b, "packageName", "newDataInstance", k.O, "sesame-lite_release"}, k = 1, mv = {1, 7, 1}, xi = 48)
/* loaded from: classes4.dex */
public final class AliasStore extends InMemoryStore<String, AliasEntity> {

    @NotNull
    public static final String TYPE = "aliases";

    public AliasStore(@Nullable File file) {
        super("aliases", file, AliasEntity.INSTANCE.serializer(), null);
    }

    @NotNull
    public final Collection<AliasEntity> getForPackage(@NotNull String packageName) {
        Intrinsics.g(packageName, "packageName");
        Collection<AliasEntity> collectionValues = getData().values();
        ArrayList arrayList = new ArrayList();
        for (Object obj : collectionValues) {
            if (Intrinsics.b(((AliasEntity) obj).getPackageName(), packageName)) {
                arrayList.add(obj);
            }
        }
        return arrayList;
    }

    @Override // io.branch.engage.sesame_lite.internal.stores.InMemoryStore
    @NotNull
    public AliasStore newDataInstance() {
        AliasStore aliasStore = new AliasStore(getCacheFile());
        aliasStore.setData(getData());
        return aliasStore;
    }
}
