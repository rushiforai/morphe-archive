package io.branch.engage.sesame_lite.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import io.branch.engage.sesame_lite.internal.stores.AliasStore;
import io.branch.engage.sesame_lite.internal.stores.IgnoreStore;
import io.branch.engage.sesame_lite.internal.stores.LinkStore;
import io.branch.engage.sesame_lite.internal.stores.UsageStore;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\b\u0007\u0018\u0000 \u001a2\u00020\u0001:\u0001\u001aB\u000f\b\u0016\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004B\u000f\b\u0016\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0002\u0010\u0007B\u000f\b\u0016\u0012\u0006\u0010\b\u001a\u00020\t¢\u0006\u0002\u0010\nB\u000f\b\u0016\u0012\u0006\u0010\u000b\u001a\u00020\f¢\u0006\u0002\u0010\rB\u000f\b\u0016\u0012\u0006\u0010\u000e\u001a\u00020\u000f¢\u0006\u0002\u0010\u0010B-\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0006\u0012\b\u0010\b\u001a\u0004\u0018\u00010\t\u0012\b\u0010\u000b\u001a\u0004\u0018\u00010\f\u0012\b\u0010\u000e\u001a\u0004\u0018\u00010\u000f¢\u0006\u0002\u0010\u0011R\u0013\u0010\u000b\u001a\u0004\u0018\u00010\f¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0013R\u0013\u0010\u000e\u001a\u0004\u0018\u00010\u000f¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0015R\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u0016\u0010\u0017R\u0013\u0010\b\u001a\u0004\u0018\u00010\t¢\u0006\b\n\u0000\u001a\u0004\b\u0018\u0010\u0019¨\u0006\u001b"}, d2 = {"Lio/branch/engage/sesame_lite/internal/WriteBack;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "dbView", "Lio/branch/engage/sesame_lite/internal/DbView;", "(Lio/branch/engage/sesame_lite/internal/DbView;)V", "linkStore", "Lio/branch/engage/sesame_lite/internal/stores/LinkStore;", "(Lio/branch/engage/sesame_lite/internal/stores/LinkStore;)V", "usageStore", "Lio/branch/engage/sesame_lite/internal/stores/UsageStore;", "(Lio/branch/engage/sesame_lite/internal/stores/UsageStore;)V", "aliasStore", "Lio/branch/engage/sesame_lite/internal/stores/AliasStore;", "(Lio/branch/engage/sesame_lite/internal/stores/AliasStore;)V", "ignoreStore", "Lio/branch/engage/sesame_lite/internal/stores/IgnoreStore;", "(Lio/branch/engage/sesame_lite/internal/stores/IgnoreStore;)V", "(Lio/branch/engage/sesame_lite/internal/stores/LinkStore;Lio/branch/engage/sesame_lite/internal/stores/UsageStore;Lio/branch/engage/sesame_lite/internal/stores/AliasStore;Lio/branch/engage/sesame_lite/internal/stores/IgnoreStore;)V", "getAliasStore", "()Lio/branch/engage/sesame_lite/internal/stores/AliasStore;", "getIgnoreStore", "()Lio/branch/engage/sesame_lite/internal/stores/IgnoreStore;", "getLinkStore", "()Lio/branch/engage/sesame_lite/internal/stores/LinkStore;", "getUsageStore", "()Lio/branch/engage/sesame_lite/internal/stores/UsageStore;", k.O, "sesame-lite_release"}, k = 1, mv = {1, 7, 1}, xi = 48)
/* loaded from: classes4.dex */
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

    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002R\u0011\u0010\u0003\u001a\u00020\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0005\u0010\u0006¨\u0006\u0007"}, d2 = {"Lio/branch/engage/sesame_lite/internal/WriteBack$Companion;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "()V", "NO_OP", "Lio/branch/engage/sesame_lite/internal/WriteBack;", "getNO_OP", "()Lio/branch/engage/sesame_lite/internal/WriteBack;", "sesame-lite_release"}, k = 1, mv = {1, 7, 1}, xi = 48)
    public static final class Companion {
        private Companion() {
        }

        @NotNull
        public final WriteBack getNO_OP() {
            return WriteBack.NO_OP;
        }

        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
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
