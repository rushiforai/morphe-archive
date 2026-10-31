package io.branch.engage.sesame_lite.internal.stores;

import aa.z;
import b70.c;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import io.branch.engage.sesame_lite.internal.IdHash;
import io.branch.engage.sesame_lite.internal.LinkEntity;
import io.branch.engage.sesame_lite.internal.LinkUsage;
import io.branch.engage.sesame_lite.internal.State;
import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.EnumSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import u40.a;
import u40.l;

@Metadata(d1 = {"\u0000L\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\b\n\u0000\n\u0002\u0010%\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0010$\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u001e\n\u0002\b\u0003\u0018\u0000 \u001b2\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001:\u0001\u001bB\u0011\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0004¢\u0006\u0004\b\u0006\u0010\u0007J\u000f\u0010\b\u001a\u00020\u0000H\u0016¢\u0006\u0004\b\b\u0010\tJ+\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u000b\u001a\u00020\n2\u0012\u0010\r\u001a\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\fH\u0016¢\u0006\u0004\b\u000f\u0010\u0010J\u0019\u0010\u0012\u001a\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0011¢\u0006\u0004\b\u0012\u0010\u0013J)\u0010\u0012\u001a\b\u0012\u0004\u0012\u00020\u00030\u00192\u0006\u0010\u0015\u001a\u00020\u00142\f\u0010\u0018\u001a\b\u0012\u0004\u0012\u00020\u00170\u0016¢\u0006\u0004\b\u0012\u0010\u001a¨\u0006\u001c"}, d2 = {"Lio/branch/engage/sesame_lite/internal/stores/UsageStore;", "Lio/branch/engage/sesame_lite/internal/stores/InMemoryStore;", "Lio/branch/engage/sesame_lite/internal/IdHash;", "Lio/branch/engage/sesame_lite/internal/LinkUsage;", "Ljava/io/File;", "cacheFile", "<init>", "(Ljava/io/File;)V", "newDataInstance", "()Lio/branch/engage/sesame_lite/internal/stores/UsageStore;", b.f42142b, "dbVersion", b.f42142b, "loadedData", b.f42142b, "onPostLoaded", "(ILjava/util/Map;)V", b.f42142b, "get", "()Ljava/util/Map;", "Lio/branch/engage/sesame_lite/internal/stores/LinkStore;", "linkStore", "Ljava/util/EnumSet;", "Lu40/a;", "types", b.f42142b, "(Lio/branch/engage/sesame_lite/internal/stores/LinkStore;Ljava/util/EnumSet;)Ljava/util/Collection;", k.O, "sesame-lite_release"}, k = 1, mv = {1, 7, 1}, xi = 48)
/* loaded from: classes4.dex */
public final class UsageStore extends InMemoryStore<IdHash, LinkUsage> {

    @NotNull
    public static final String TYPE = "usage";

    public UsageStore(@Nullable File file) {
        super("usage", file, LinkUsage.INSTANCE.serializer(), null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: onPostLoaded$lambda-1, reason: not valid java name */
    public static final boolean m339onPostLoaded$lambda1(Map.Entry it) {
        Intrinsics.g(it, "it");
        return ((IdHash) it.getKey()).getType() == a.f90558g;
    }

    @NotNull
    public final Map<IdHash, LinkUsage> get() {
        return getData();
    }

    @Override // io.branch.engage.sesame_lite.internal.stores.InMemoryStore
    public void onPostLoaded(int dbVersion, @NotNull Map<IdHash, LinkUsage> loadedData) {
        Intrinsics.g(loadedData, "loadedData");
        super.onPostLoaded(dbVersion, loadedData);
        if (dbVersion <= 1) {
            State state = State.INSTANCE;
            l log = state.getLog();
            if (log.getLevel().ordinal() >= 3) {
                log.getWriter().debug("SSML-InMemStore", "Cleaning up UsageStore data, db version=" + dbVersion + ": removing contact records");
            }
            int size = loadedData.size();
            loadedData.entrySet().removeIf(new z(10));
            l log2 = state.getLog();
            if (log2.getLevel().ordinal() >= 3) {
                log2.getWriter().debug("SSML-InMemStore", "Removed " + (loadedData.size() - size) + " contact records from UsageStore");
            }
        }
    }

    @NotNull
    public final Collection<LinkUsage> get(@NotNull LinkStore linkStore, @NotNull EnumSet<a> types) {
        Intrinsics.g(linkStore, "linkStore");
        Intrinsics.g(types, "types");
        List list = LinkStore.get$default(linkStore, (long[]) null, types, (Set) null, (Set) null, 13, (Object) null);
        ArrayList arrayList = new ArrayList(c.u0(list, 10));
        Iterator it = list.iterator();
        while (it.hasNext()) {
            arrayList.add(((LinkEntity) it.next()).getIdHash());
        }
        return get((Collection) arrayList);
    }

    @Override // io.branch.engage.sesame_lite.internal.stores.InMemoryStore
    @NotNull
    public UsageStore newDataInstance() {
        UsageStore usageStore = new UsageStore(getCacheFile());
        usageStore.setData(getData());
        return usageStore;
    }
}
