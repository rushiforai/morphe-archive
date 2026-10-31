package nova.branch.engage.sesame_lite.internal;

import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import nova.branch.engage.sesame_lite.internal.stores.AliasStore;
import nova.branch.engage.sesame_lite.internal.stores.IgnoreStore;
import nova.branch.engage.sesame_lite.internal.stores.LinkStore;
import nova.branch.engage.sesame_lite.internal.stores.UsageStore;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u000f\b\u0007\u0018\u0000 \u001b2\u00020\u0001:\u0001\u001bB/\u0012\b\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\b\u0010\b\u001a\u0004\u0018\u00010\t¢\u0006\u0004\b\n\u0010\u000bB\u0011\b\u0016\u0012\u0006\u0010\f\u001a\u00020\r¢\u0006\u0004\b\n\u0010\u000eB\u0011\b\u0016\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\n\u0010\u000fB\u0011\b\u0016\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\n\u0010\u0010B\u0011\b\u0016\u0012\u0006\u0010\u0006\u001a\u00020\u0007¢\u0006\u0004\b\n\u0010\u0011B\u0011\b\u0016\u0012\u0006\u0010\b\u001a\u00020\t¢\u0006\u0004\b\n\u0010\u0012R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0014R\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0015\u0010\u0016R\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0017\u0010\u0018R\u0013\u0010\b\u001a\u0004\u0018\u00010\t¢\u0006\b\n\u0000\u001a\u0004\b\u0019\u0010\u001a¨\u0006\u001c"}, d2 = {"Lnova/branch/engage/sesame_lite/internal/WriteBack;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "linkStore", "Lnova/branch/engage/sesame_lite/internal/stores/LinkStore;", "usageStore", "Lnova/branch/engage/sesame_lite/internal/stores/UsageStore;", "aliasStore", "Lnova/branch/engage/sesame_lite/internal/stores/AliasStore;", "ignoreStore", "Lnova/branch/engage/sesame_lite/internal/stores/IgnoreStore;", "<init>", "(Lnova/branch/engage/sesame_lite/internal/stores/LinkStore;Lnova/branch/engage/sesame_lite/internal/stores/UsageStore;Lnova/branch/engage/sesame_lite/internal/stores/AliasStore;Lnova/branch/engage/sesame_lite/internal/stores/IgnoreStore;)V", "dbView", "Lnova/branch/engage/sesame_lite/internal/DbView;", "(Lnova/branch/engage/sesame_lite/internal/DbView;)V", "(Lnova/branch/engage/sesame_lite/internal/stores/LinkStore;)V", "(Lnova/branch/engage/sesame_lite/internal/stores/UsageStore;)V", "(Lnova/branch/engage/sesame_lite/internal/stores/AliasStore;)V", "(Lnova/branch/engage/sesame_lite/internal/stores/IgnoreStore;)V", "getLinkStore", "()Lnova/branch/engage/sesame_lite/internal/stores/LinkStore;", "getUsageStore", "()Lnova/branch/engage/sesame_lite/internal/stores/UsageStore;", "getAliasStore", "()Lnova/branch/engage/sesame_lite/internal/stores/AliasStore;", "getIgnoreStore", "()Lnova/branch/engage/sesame_lite/internal/stores/IgnoreStore;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "sesame-lite_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final class WriteBack {

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = new Companion(null);

    @NotNull
    private static final WriteBack NO_OP = new WriteBack(null, null, null, null);

    @Nullable
    private final AliasStore aliasStore;

    @Nullable
    private final IgnoreStore ignoreStore;

    @Nullable
    private final LinkStore linkStore;

    @Nullable
    private final UsageStore usageStore;

    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\b"}, d2 = {"Lnova/branch/engage/sesame_lite/internal/WriteBack$Companion;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "NO_OP", "Lnova/branch/engage/sesame_lite/internal/WriteBack;", "getNO_OP", "()Lnova/branch/engage/sesame_lite/internal/WriteBack;", "sesame-lite_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        @NotNull
        public final WriteBack getNO_OP() {
            return WriteBack.NO_OP;
        }

        private Companion() {
        }
    }

    public WriteBack(@Nullable LinkStore linkStore, @Nullable UsageStore usageStore, @Nullable AliasStore aliasStore, @Nullable IgnoreStore ignoreStore) {
        this.linkStore = linkStore;
        this.usageStore = usageStore;
        this.aliasStore = aliasStore;
        this.ignoreStore = ignoreStore;
    }

    @Nullable
    public final AliasStore getAliasStore() {
        return this.aliasStore;
    }

    @Nullable
    public final IgnoreStore getIgnoreStore() {
        return this.ignoreStore;
    }

    @Nullable
    public final LinkStore getLinkStore() {
        return this.linkStore;
    }

    @Nullable
    public final UsageStore getUsageStore() {
        return this.usageStore;
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public WriteBack(@NotNull DbView dbView) {
        this(dbView.getLinkStore(), dbView.getUsageStore(), dbView.getAliasStore(), dbView.getIgnoreStore());
        Intrinsics.g(dbView, "dbView");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public WriteBack(@NotNull LinkStore linkStore) {
        this(linkStore, null, null, null);
        Intrinsics.g(linkStore, "linkStore");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public WriteBack(@NotNull UsageStore usageStore) {
        this(null, usageStore, null, null);
        Intrinsics.g(usageStore, "usageStore");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public WriteBack(@NotNull AliasStore aliasStore) {
        this(null, null, aliasStore, null);
        Intrinsics.g(aliasStore, "aliasStore");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public WriteBack(@NotNull IgnoreStore ignoreStore) {
        this(null, null, null, ignoreStore);
        Intrinsics.g(ignoreStore, "ignoreStore");
    }
}
