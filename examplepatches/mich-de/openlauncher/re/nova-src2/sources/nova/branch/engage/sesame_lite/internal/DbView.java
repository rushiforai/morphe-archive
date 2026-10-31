package nova.branch.engage.sesame_lite.internal;

import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import nova.branch.engage.sesame_lite.internal.stores.AliasStore;
import nova.branch.engage.sesame_lite.internal.stores.IgnoreStore;
import nova.branch.engage.sesame_lite.internal.stores.InMemoryEntity;
import nova.branch.engage.sesame_lite.internal.stores.InMemoryStore;
import nova.branch.engage.sesame_lite.internal.stores.LinkStore;
import nova.branch.engage.sesame_lite.internal.stores.UsageStore;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u000b\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001B'\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\b\u001a\u00020\t¢\u0006\u0004\b\n\u0010\u000bJ&\u0010\u0014\u001a \u0012\u001c\u0012\u001a\u0012\u0006\b\u0001\u0012\u00020\u0001\u0012\u000e\b\u0001\u0012\n\u0012\u0006\b\u0001\u0012\u00020\u00010\u00170\u00160\u0015H\u0016R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000fR\u0011\u0010\u0006\u001a\u00020\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R\u0011\u0010\b\u001a\u00020\t¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013¨\u0006\u0018"}, d2 = {"Lnova/branch/engage/sesame_lite/internal/DbView;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "linkStore", "Lnova/branch/engage/sesame_lite/internal/stores/LinkStore;", "usageStore", "Lnova/branch/engage/sesame_lite/internal/stores/UsageStore;", "aliasStore", "Lnova/branch/engage/sesame_lite/internal/stores/AliasStore;", "ignoreStore", "Lnova/branch/engage/sesame_lite/internal/stores/IgnoreStore;", "<init>", "(Lnova/branch/engage/sesame_lite/internal/stores/LinkStore;Lnova/branch/engage/sesame_lite/internal/stores/UsageStore;Lnova/branch/engage/sesame_lite/internal/stores/AliasStore;Lnova/branch/engage/sesame_lite/internal/stores/IgnoreStore;)V", "getLinkStore", "()Lnova/branch/engage/sesame_lite/internal/stores/LinkStore;", "getUsageStore", "()Lnova/branch/engage/sesame_lite/internal/stores/UsageStore;", "getAliasStore", "()Lnova/branch/engage/sesame_lite/internal/stores/AliasStore;", "getIgnoreStore", "()Lnova/branch/engage/sesame_lite/internal/stores/IgnoreStore;", "getAll", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lnova/branch/engage/sesame_lite/internal/stores/InMemoryStore;", "Lnova/branch/engage/sesame_lite/internal/stores/InMemoryEntity;", "sesame-lite_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final class DbView {

    @NotNull
    private final AliasStore aliasStore;

    @NotNull
    private final IgnoreStore ignoreStore;

    @NotNull
    private final LinkStore linkStore;

    @NotNull
    private final UsageStore usageStore;

    public DbView(@NotNull LinkStore linkStore, @NotNull UsageStore usageStore, @NotNull AliasStore aliasStore, @NotNull IgnoreStore ignoreStore) {
        Intrinsics.g(linkStore, "linkStore");
        Intrinsics.g(usageStore, "usageStore");
        Intrinsics.g(aliasStore, "aliasStore");
        Intrinsics.g(ignoreStore, "ignoreStore");
        this.linkStore = linkStore;
        this.usageStore = usageStore;
        this.aliasStore = aliasStore;
        this.ignoreStore = ignoreStore;
    }

    @NotNull
    public final AliasStore getAliasStore() {
        return this.aliasStore;
    }

    @NotNull
    public List<InMemoryStore<? extends Object, ? extends InMemoryEntity<? extends Object>>> getAll() {
        return ul.b.Q(this.linkStore, this.usageStore, this.aliasStore, this.ignoreStore);
    }

    @NotNull
    public final IgnoreStore getIgnoreStore() {
        return this.ignoreStore;
    }

    @NotNull
    public final LinkStore getLinkStore() {
        return this.linkStore;
    }

    @NotNull
    public final UsageStore getUsageStore() {
        return this.usageStore;
    }
}
