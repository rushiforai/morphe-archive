package io.branch.engage.sesame_lite.internal;

import io.branch.engage.sesame_lite.internal.stores.AliasStore;
import io.branch.engage.sesame_lite.internal.stores.IgnoreStore;
import io.branch.engage.sesame_lite.internal.stores.InMemoryEntity;
import io.branch.engage.sesame_lite.internal.stores.InMemoryStore;
import io.branch.engage.sesame_lite.internal.stores.LinkStore;
import io.branch.engage.sesame_lite.internal.stores.UsageStore;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001B%\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\b\u001a\u00020\t¢\u0006\u0002\u0010\nJ&\u0010\u0013\u001a \u0012\u001c\u0012\u001a\u0012\u0006\b\u0001\u0012\u00020\u0001\u0012\u000e\b\u0001\u0012\n\u0012\u0006\b\u0001\u0012\u00020\u00010\u00160\u00150\u0014H\u0016R\u0011\u0010\u0006\u001a\u00020\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\b\u001a\u00020\t¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u0010R\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0012¨\u0006\u0017"}, d2 = {"Lio/branch/engage/sesame_lite/internal/DbView;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "linkStore", "Lio/branch/engage/sesame_lite/internal/stores/LinkStore;", "usageStore", "Lio/branch/engage/sesame_lite/internal/stores/UsageStore;", "aliasStore", "Lio/branch/engage/sesame_lite/internal/stores/AliasStore;", "ignoreStore", "Lio/branch/engage/sesame_lite/internal/stores/IgnoreStore;", "(Lio/branch/engage/sesame_lite/internal/stores/LinkStore;Lio/branch/engage/sesame_lite/internal/stores/UsageStore;Lio/branch/engage/sesame_lite/internal/stores/AliasStore;Lio/branch/engage/sesame_lite/internal/stores/IgnoreStore;)V", "getAliasStore", "()Lio/branch/engage/sesame_lite/internal/stores/AliasStore;", "getIgnoreStore", "()Lio/branch/engage/sesame_lite/internal/stores/IgnoreStore;", "getLinkStore", "()Lio/branch/engage/sesame_lite/internal/stores/LinkStore;", "getUsageStore", "()Lio/branch/engage/sesame_lite/internal/stores/UsageStore;", "getAll", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lio/branch/engage/sesame_lite/internal/stores/InMemoryStore;", "Lio/branch/engage/sesame_lite/internal/stores/InMemoryEntity;", "sesame-lite_release"}, k = 1, mv = {1, 7, 1}, xi = 48)
/* loaded from: classes4.dex */
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
